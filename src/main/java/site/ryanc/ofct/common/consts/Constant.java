package site.ryanc.ofct.common.consts;


import java.util.HashMap;
import java.util.Map;

/**
 * +--------------------------------+ <br>
 * |Even in a galaxy far,far away.  | <br>
 * |即使是在遥远的星河里也一样  !    |<br>
 * +--------------------------------+ <br>
 *
 * @author Ryan <br>
 * @create 2021年7月18日14:40:03 <br>
 **/
public interface Constant {

    Map<String, String> template_base_Map = new HashMap<String, String>() {{
        put("loan_a.docx", "1档案封面.docx");
        put("loan_b.docx", "2个人借款申请书.docx");
        put("loan_c.docx", "3夫妻双方同意借款意见书.docx");
        put("loan_d.docx", "4夫妻双方同意保证意见书.docx");
        put("loan_e.docx", "5河北沧州农商行运河支行信贷业务审批提案表.docx");
        put("loan_f.docx", "6信贷业务审议会议纪要.docx");
        put("loan_g.docx", "7贷款管理责任状.docx");
        put("loan_h.docx", "8首次检查报告单.docx");
    }};

    Map<String, String> template_loop_mode_loan_map = new HashMap<String, String>() {{
        put("loop_mode_loan_1.docx", "循环借款提款通知书.docx");
        put("loop_mode_loan_2.docx", "循环借款支用申请书.docx");
        put("loop_mode_loan_3.docx", "循环借款支用审核表.docx");
    }};
    Map<String, String> template_special_prod_loan_map = new HashMap<String, String>() {{
        put("special_prod_loan.docx", "河北省农村信用社特色信贷产品业务申请表.docx");
    }};
    Map<String, String> template_self_pay_loan_map = new HashMap<String, String>() {{
        put("self_pay_loan.docx", "自主支付监控联系单.docx");
    }};
    Map<String, String> template_entrust_pay_loan_map = new HashMap<String, String>() {{
        put("entrust_pay_loan_1.docx", "借款人支付委托书.docx");
        put("entrust_pay_loan_2.docx", "委托划扣款授权书.docx");
        put("entrust_pay_loan_3.docx", "资金受托支付审批表.docx");
    }};

    /**
     * 文档处理类型
     */
    interface PoiHandType {

        String EXCEL = "excel";

        String WORD = "word";
    }

    String COMMONATTR = "data-class";

}
