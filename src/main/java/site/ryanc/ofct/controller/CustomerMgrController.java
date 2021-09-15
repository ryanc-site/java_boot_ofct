package site.ryanc.ofct.controller;

import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import site.ryanc.ofct.model.PersonCustomer;
import site.ryanc.ofct.model.ResCom;
import site.ryanc.ofct.service.P_customerService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * +--------------------------------+ <br>
 * | Even in a galaxy far,far away.  | <br>
 * | 即使是在遥远的星河里也一样  !      |<br>
 * +--------------------------------+ <br>
 *
 * @author Ryan
 * @Desc 客户管理
 * @createTime 2021年09月09日 15:28:00
 */
@Slf4j
@Controller
@RequestMapping("/csr")
public class CustomerMgrController {

    @Resource
    private P_customerService p_customerService;


    /**
     * 查询对应客户类型 - 客户列表
     *
     * @return 返回 客户数据
     */
    @RequestMapping("/query/person")
    @ResponseBody
    public ResCom<PageInfo<PersonCustomer>> QueryCSRPerson(String keyword, Integer page, Integer limit, String starTime, String endTime) {
        Map<String, Object> param = new HashMap<>();
        param.put("keyword", keyword);
        param.put("page", page);
        param.put("limit", limit);
        param.put("starTime", starTime);
        param.put("endTime", endTime);
        PageInfo<PersonCustomer> p_data = p_customerService.selectByKeyWord(param);
        return new ResCom<>("200", "查询成功", p_data);
    }


    /**
     * 对应客户类型 - 客户数据 - 预添加
     *
     * @param csrType 客户类型
     * @return 返回操作结果
     */
    @RequestMapping("/preadd/{csrType}")
    public String preAdd(@PathVariable String csrType) {
        return "csr/person/add";
    }


    /**
     * 保存 - 个人客户 - 数据
     *
     * @param p_customer 带保存数据
     * @return 操作结果
     */
    @RequestMapping("/add/person")
    @ResponseBody
    public ResCom<String> p_add(PersonCustomer p_customer) {
        try {
            p_customerService.save(p_customer);
        } catch (Exception e) {
            log.error("【csr-add】：新增异常！e-msg:{}", e.getMessage());
            return new ResCom<String>("500", "【csr-add】：新增异常！e-msg:{}", null);
        }
        return new ResCom<String>("200", "修改成功", null);
    }


    /**
     * 删除 - 个人客户
     *
     * @param csr_id 客户Id
     * @return 操作结果
     */
    @RequestMapping("/del")
    @ResponseBody
    public ResCom<Object> del(String csr_id) {
        p_customerService.delete(csr_id);
        return new ResCom<>("200", "删除成功", null);
    }


    /**
     * 查看对应 - 客户类型的 - 客户信息
     *
     * @param csrType 客户类型
     * @param csrId   客户id
     * @param model   数据model
     * @return 客户信息view
     */
    @RequestMapping("/info/{csrType}/{csrId}")
    public String csrInfo(@PathVariable String csrType, @PathVariable String csrId, Model model) {
        if ("person".equals(csrType)) {
            PersonCustomer person_info = p_customerService.getById(csrId);
            model.addAttribute("person_info", person_info);
            return "/csr/person/info";
        } else {
            return "/to_be_dev";
        }
    }


    /**
     * 对应客户类型 - 客户数据 - 预修改
     *
     * @param csrType 客户类型
     * @return 返回操作结果
     */
    @RequestMapping("/premodify/{csrType}/{csr_id}")
    public String preModify(@PathVariable String csrType, @PathVariable String csr_id, Model model) {
        if ("person".equals(csrType)) {
            PersonCustomer modify_db_p = p_customerService.getById(csr_id);
            model.addAttribute("db_p", modify_db_p);
            return "csr/person/modify";
        } else {
            return "to_be_dev";
        }
    }


    /**
     * 修改 - 个人客户 - 数据
     *
     * @param p_customer 待修改数据
     * @return 操作结果
     */
    @RequestMapping("/modify/person")
    @ResponseBody
    public ResCom<String> p_modify(PersonCustomer p_customer) {
        try {
            p_customerService.update(p_customer);
        } catch (Exception e) {
            log.error("【csr-modify】：csr_id:{},修改异常！e-msg:{}", p_customer.getId(), e.getMessage());
            return new ResCom<String>("500", "【csr-modify】：csr_id:{" + p_customer.getId() + "},修改异常！", null);
        }
        return new ResCom<String>("200", "修改成功", null);
    }
}
