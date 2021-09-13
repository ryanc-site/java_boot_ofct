package site.ryanc.ofct.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import site.ryanc.ofct.model.LoanInfo;
import site.ryanc.ofct.model.PersonCustomer;
import site.ryanc.ofct.model.ResCom;
import site.ryanc.ofct.service.LoanService;

import java.util.HashMap;
import java.util.Map;

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
@Controller
@RequestMapping("/loan")
public class LoanMgrController {

    @Autowired
    private LoanService loanService;

    /** 常量
     * 查询对应客户类型 - 客户列表
     *
     * @return 返回 客户数据
     */
    @RequestMapping("/query")
    @ResponseBody
    public ResCom<PageInfo<LoanInfo>> queryLoan(String keyword, Integer page, Integer limit,String csr_type) {
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
        return "loan/add_loan";
    }


    /**
     * 保存 - 贷款 - 数据
     *
     * @param loanInfo 待保存数据
     * @return 操作结果
     */
    @RequestMapping("/add")
    @ResponseBody
    public String add(LoanInfo loanInfo) {
        loanService.save(loanInfo);
        return "0";
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

}
