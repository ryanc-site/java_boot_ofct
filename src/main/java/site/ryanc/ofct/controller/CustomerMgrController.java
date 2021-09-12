package site.ryanc.ofct.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    public ResCom<PageInfo<PersonCustomer>> QueryCSRPerson(String keyword, Integer page, Integer limit,String starTime, String endTime) {
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
        return "csr/add_person";
    }


    /**
     * 保存 - 个人客户 - 数据
     *
     * @param p_customer 带保存数据
     * @return 操作结果
     */
    @RequestMapping("/add/person")
    @ResponseBody
    public String add(PersonCustomer p_customer) {
        p_customerService.save(p_customer);
        return "0";
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


}
