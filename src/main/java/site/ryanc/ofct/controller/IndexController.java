package site.ryanc.ofct.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * +--------------------------------+ <br>
 * | Even in a galaxy far,far away.  | <br>
 * | 即使是在遥远的星河里也一样  !      |<br>
 * +--------------------------------+ <br>
 *
 * @author Ryan
 * @Desc 首页
 * @createTime 2021年09月09日 15:25:00
 */
@Controller
@Slf4j
public class IndexController {


    // ofct 系统信息
    private static final Map<String,String> SysInfo = new HashMap<String,String>(){{
        put("ofct_version","2.0.1");
        put("server_port","127.0.0.1:8080");
        put("os",String.valueOf(System.getProperties().get("os.name")));
        put("jdk",String.valueOf(System.getProperties().get("java.version")));
        put("sqlite_version","3.32.3.6");
        put("admin",String.valueOf(System.getProperties().get("user.name")));
    }};

    /**
     * 首页
     * @return view
     */
    @RequestMapping("/")
    public String index(){
        return "index";
    }

    /**
     * 欢迎页
     * @return view
     */
    @RequestMapping("/welcome")
    public String welcome(ModelMap modelMap){
        modelMap.putAll(SysInfo);
        return "index/welcome";
    }



    /**
     * 服务路由
     *      csr_person   - 个人客户管理
     *      csr_ent      - 企业客户管理
     *      loan_mgr     - 贷款管理
     *      loan_process - 贷款流程
     *      report       - 报表优化
     *
     * @return view
     */
    @RequestMapping("/serviceRouting/{serviceType}")
    public ModelAndView serviceRouting(@PathVariable String serviceType){
        ModelAndView mav = new ModelAndView("to_be_dev");
        switch (serviceType){
            case "csr_person":{
                mav = new ModelAndView("csr/person/list");
                break;
            }
            case "loan_mgr":{
                mav = new ModelAndView("/loan/loan");
                break;
            }
        }
        return mav;
    }
}
