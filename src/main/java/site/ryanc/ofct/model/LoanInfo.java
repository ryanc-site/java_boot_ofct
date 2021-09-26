package site.ryanc.ofct.model;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.HexUtil;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 贷款信息
 * @author Ryan
 * @Date 2021年8月28日18:32:09
 */
@Data
public class LoanInfo {

    /** 主键id  */
    private String id ;

    /** 客户类型 : 1 - 个人；0 - 公司； */
    private Integer loan_customer_type;
    /** 保证方式 ：1 - 抵押；2 - 保证； 3 - 信用；4 - 质押； */
    private Integer loan_assure_type;
    /** 贷款方式 ：1 - 一次性；2 - 循环； 3 - 特色产品； */
    private Integer loan_mode;
    /** 支付方式 ：1 - 自主支付；2 - 委托支付； */
    private Integer loan_pay_mode;

    /** 还款方式 ： 1 - 等额本息；2 - 等额本金； 3 - 按月结息；4 - 到期还本、计划还款；*/
    private Integer loan_repay_mode;
    /** 还款人 */
    private String loan_repay_person;
    /** 借款人卡号 */
    private String loan_person_carno;
    /** 放款账户开户行 */
    private String loan_account_open_bank;
    /** 借款用途 */
    private String loan_for_use;
    /** 还款来源 */
    private String loan_repay_src;
    /** 贷款金额大写 */
    private String loan_amount_upcase;
    /** 贷款金额小写 */
    private String loan_amount_lowcase;
    /** 总授信金额 */
    private String loan_total_credit_amount;
    /** LPR利率加点 */
    private String loan_rate_plus_point;
    /** 贷款期限 */
    private Integer loan_term;
    /** 贷款起始日期 */
    private String loan_start_date;
    /** 贷款终止日期 */
    private String loan_end_date;
    /** 贷款月利率 */
    private String loan_m_rate;
    /** 主合同号 */
    private String Loan_main_contractno;
    /** 从合同号 */
    private String loan_sub_contractno;

    /** 保证人姓名 */
    private String loan_assure_person;
    /** 保证人性别 */
    private String loan_assure_person_gender;
    /** 保证人住址 */
    private String loan_person_address;
    /** 保证人身份证 */
    private String loan_person_id;

    // 贷款方式：循环方式 ==> 附加项
    /** 本次借款起始日期 */
    private String loan_this_start_date;
    /** 本次借款终止日期 */
    private String loan_this_end_date;
    /** 本次借款月数 */
    private String loan_this_months;

    // 贷款方式：特色产品 ==> 附加项
    /** 特色产品种类 : 1 - 商贷宝；2 - 消贷宝；3 - 农贸宝
     * □农贷宝□消贷宝 □商贷宝*/
    private Integer loan_special_prod_type;
    /** 借款人类型 : 1 - 农户；2 - 自然人；3 - 个体工商户
     * □农户   □个体工商户   □自然人*/
    private Integer loan_borrower_type;

    // 支付方式：委托 ==> 附加项
    /** 委托支付日期 */
    private String loan_entrust_pay_date;
    /** 委托支付金额 */
    private String loan_entrust_pay_amount;
    /** 委托支付收款单位 */
    private String loan_entrust_pay_payee;
    /** 委托支付收款账号 */
    private String loan_entrust_pay_receipt_account;
    /** 委托支付收款开户行 */
    private String loan_entrust_pay_receipt_deposit;

    /** 申请贷款时间 */
    private String loan_apply_time;
    /** 贷审会成员数量 */
    private Integer loan_review_person_num;
    /** 审批贷款时间 */
    private String loan_approve_time;
    /** 合同日期 */
    private String loan_contract_date;
    /** 管户责任人 */
    private String loan_steward_responsible;
    /** 风险主责人 */
    private String loan_risk_responsible;
    /**  创建时间 */
    private String ctime ;
}

