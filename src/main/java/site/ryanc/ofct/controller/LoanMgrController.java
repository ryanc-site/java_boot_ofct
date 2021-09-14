package site.ryanc.ofct.controller;

import cn.hutool.core.util.ReUtil;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import site.ryanc.ofct.model.LoanInfo;
import site.ryanc.ofct.model.PersonCustomer;
import site.ryanc.ofct.model.ResCom;
import site.ryanc.ofct.service.LoanService;
import site.ryanc.ofct.service.P_customerService;

import javax.annotation.Resource;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * +--------------------------------+ <br>
 * | Even in a galaxy far,far away.  | <br>
 * | 即使是在遥远的星河里也一样  !      |<br>
 * +--------------------------------+ <br>
 *
 * @author Ryan
 * @Desc 贷款管理
 * @createTime 2021年09月09日 15:30:00
 */
@Slf4j
@Controller
@RequestMapping("/loan")
public class LoanMgrController {

    @Autowired
    private LoanService loanService;
    @Resource
    private P_customerService p_customerService;

    /**
     * 查询对应条件 - 贷款数据
     *
     * @return 返回 贷款数据
     */
    @RequestMapping("/query")
    @ResponseBody
    public ResCom<PageInfo<LoanInfo>> queryLoan(String keyword, Integer page, Integer limit, String csr_type) {
        Map<String, Object> param = new HashMap<>();
        param.put("keyword", keyword);
        param.put("page", page);
        param.put("limit", limit);
        param.put("csr_type", csr_type);
        PageInfo<LoanInfo> data = loanService.selectByKeyWord(param);
        return new ResCom<>("200", "查询成功", data);
    }


    /**
     * 贷款数据 - 预添加
     *
     * @return view
     */
    @RequestMapping("/preadd")
    public String preAdd() {
        return "loan/add";
    }


    /**
     * 保存 - 贷款 - 数据
     *
     * @param loanInfo 待保存数据
     * @return 操作结果
     */
    @RequestMapping("/add")
    @ResponseBody
    public ResCom<String> add(LoanInfo loanInfo) {
        try {
            loanService.save(loanInfo);
        } catch (Exception e) {
            log.error("【loan-add】：新增异常！e-msg:{}", e.getMessage());
            return new ResCom<String>("500", "【loan-add】：新增异常！e-msg:{}", null);
        }
        return new ResCom<String>("200", "修改成功", null);
    }

    /**
     * 删除 - 贷款数据
     *
     * @param loan_id 客户Id
     * @return 操作结果
     */
    @RequestMapping("/del")
    @ResponseBody
    public ResCom<Object> del(String loan_id) {
        loanService.delete(loan_id);
        return new ResCom<>("200", "删除成功", null);
    }


    /**
     * 导出 - 贷款 - 数据
     */
    @RequestMapping("/export")
    @ResponseBody
    public ResCom<String> export(String exportDir, String loanId) {
        try {
            // 参数校验

            if (!ReUtil.isMatch("[a-zA-Z]:(?:[/\\\\][^/\\\\:*?\"<>|]{1,255})+", exportDir)) {
                log.error("【loan-export】：导出失败！e-msg:导出目录{}不合法！", exportDir);
                return new ResCom<String>("500", "【loan-export】：导出失败！e-msg:导出目录{" + exportDir + "}不合法！", null);
            }

            // 贷款信息查询
            LoanInfo loan_db = loanService.getById(loanId);
            if (null == loan_db) {
                log.error("【loan-export】：导出失败！e-msg:贷款信息（id：{}）不存在", loanId);
                return new ResCom<String>("500", "【loan-export】：导出失败！e-msg:贷款信息（id：{" + loanId + "}）不存在", null);
            }

            // 贷款对应客户信息查询
            String csr_name = loan_db.getLoan_repay_person();
            PersonCustomer csrForLoanFromDb = p_customerService.getByCsrName(csr_name);
            if (null == csrForLoanFromDb) {
                log.error("【loan-export】：导出失败！e-msg:贷款对应客户（{}）不存在", csr_name);
                return new ResCom<String>("500", "【loan-export】：导出失败！e-msg:贷款对应客户（{" + csr_name + "}）不存在", null);
            }

            // 导出数据
            loanService.export(csrForLoanFromDb, loan_db, exportDir);
        } catch (Exception e) {
            log.error("【loan-export】：导出异常！e-msg:{}", e.getMessage());
            return new ResCom<String>("500", "【loan-export】：导出异常！e-msg:{" + e.getMessage() + "}", null);
        }
        return new ResCom<String>("200", "导出成功！详见：" + exportDir, null);
    }
}
