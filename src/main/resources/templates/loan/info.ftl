<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>贷款 - 添加</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <link rel="stylesheet" type="text/css" href="/static/css/index.css">
    <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
</head>
<body>
<div class="layui-fluid" >
    <div class="layui-row">
        <form class="layui-form" >
            <!--<editor-fold desc="贷款管理 - 个人 -> 保证 -> 一次性 -> 自主支付">-->
            <!--<editor-fold desc="贷款管理 - 类别筛选">-->
            <div class="info_title" style="margin: 5px 0px 0px 10px;">
                <label>类别筛选</label>
                <hr>
            </div>
            <div style="margin-left: 200px">
                <div class="layui-form-item" >
                    <label class="layui-form-label">客户类型 :</label>
                    <label class="layui-form-label"  style="text-align: left;">${(loan_info.loan_customer_type!= 1)?string('个人', '公司')}</label>
                </div>
                <div class="layui-form-item" >
                    <label class="layui-form-label">保证方式 :</label>
                    <label class="layui-form-label" style="text-align: left;">
                        <#if loan_info.loan_assure_type == 1>抵押</#if>
                        <#if loan_info.loan_assure_type == 2>保证</#if>
                        <#if loan_info.loan_assure_type == 3>信用</#if>
                        <#if loan_info.loan_assure_type == 4>质押</#if>
                    </label>
                </div>
                <div class="layui-form-item" >
                    <label class="layui-form-label">贷款方式 :</label>
                    <label class="layui-form-label" style="text-align: left;">
                        <#if loan_info.loan_mode == 1>一次性</#if>
                        <#if loan_info.loan_mode == 2>循环</#if>
                        <#if loan_info.loan_mode == 3>特色产品</#if>
                    </label>
                </div>
                <div class="layui-form-item" >
                    <label class="layui-form-label">支付方式 :</label>
                    <label class="layui-form-label"  style="text-align: left;">${(loan_info.loan_pay_mode!= 1)?string('自主支付', '委托支付')}</label>
                </div>
            </div>
            <!--</editor-fold>-->

            </br>

            <div id="loan_form_info" style="margin-top:-20px">
                <br/>
                <!--<editor-fold desc="贷款管理 - 贷款信息">-->
                <div class="info_title" style="margin: 5px 0px 0px 10px;">
                    <label>贷款信息</label>
                    <hr>
                </div>
                <div style="margin-left: 200px">
                    <div class="layui-form-item" >
                        <label class="layui-form-label">还款方式 :</label>
                        <label class="layui-form-label" style="text-align: left;">
                            <#if loan_info.loan_repay_mode == 1>等额本息</#if>
                            <#if loan_info.loan_repay_mode == 2>等额本金</#if>
                            <#if loan_info.loan_repay_mode == 3>按月结息</#if>
                            <#if loan_info.loan_repay_mode == 4>到期还本、计划还款</#if>
                        </label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">借款人 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_repay_person}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">借款人卡号 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_person_carno}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">放款账户开户行 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_account_open_bank}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">借款用途 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_for_use}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">还款来源 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_repay_src}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">贷款金额大写 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_amount_upcase}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">贷款金额小写 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_amount_lowcase}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">总授信金额 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_total_credit_amount} &nbsp;元</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">贷款利率加点 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_rate_plus_point}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">贷款期限 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_term} &nbsp;个月</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">贷款起始日期 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_start_date}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">贷款终止日期 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_end_date}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">贷款月利率 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_m_rate} &nbsp;‰</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">主合同号 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_main_contractno}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">从合同号 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_sub_contractno}</label>
                    </div>
                </div>
                <!--</editor-fold>-->
                <br/>

                <#if loan_info.loan_assure_type == 2>
                <!--<editor-fold desc="贷款管理 - 保证信息">-->
                <div class="info_title" style="margin: 5px 0px 0px 10px;">
                    <label>保证信息</label>
                    <hr>
                </div>
                <div style="margin-left: 200px">
                    <div class="layui-form-item" >
                        <label class="layui-form-label">保证人性别 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${(loan_info.loan_assure_person_gender == 1)?string('男', '女')}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">保证人姓名 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_assure_person}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">保证人住址 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_person_address}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">保证人身份证 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_person_id}</label>
                    </div>
                </div>
                <!--</editor-fold>-->
                </#if>
                <br/>
                <!--<editor-fold desc="贷款管理 - 其他信息">-->
                <div id="loan_other_info" style="display:none;" >
                    <div class="info_title" style="margin: 5px 0px 0px 10px;">
                        <label>其他信息</label>
                        <hr>
                    </div>
                    <div style="margin-left: 200px">
                        <#if loan_info.loan_mode == 2>
                        <!--<editor-fold desc="贷款方式：循环方式 => 附加项">-->
                        <div id="other_loan_mode_2" >
                            <div class="layui-form-item">
                                <label class="layui-form-label">本次借款起始日期 :</label>
                                <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_this_start_date}</label>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">本次借款终止日期 :</label>
                                <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_this_end_date}</label>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">本次借款月数 :</label>
                                <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_this_months}</label>
                                <span>个月</span>
                            </div>
                        </div>
                        <!--</editor-fold>-->
                        </#if>

                        <#if loan_info.loan_mode == 3>
                        <!--<editor-fold desc="贷款方式：特色产品 => 附加项">-->
                        <div id="other_loan_mode_3" >
                            <div class="layui-form-item" >
                                <label class="layui-form-label">特色产品种类 :</label>
                                <label class="layui-form-label">
                                    <#if loan_info.loan_special_prod_type == 1>商贷宝</</#if>
                                    <#if loan_info.loan_special_prod_type == 2>消贷宝</</#if>
                                    <#if loan_info.loan_special_prod_type == 3>农贸宝</#if>
                                </label>
                            </div>
                            <div class="layui-form-item" >
                                <label class="layui-form-label">借款人类型 :</label>
                                <label class="layui-form-label">
                                    <#if loan_info.loan_borrower_type == 1>农户</</#if>
                                    <#if loan_info.loan_borrower_type == 2>自然人</</#if>
                                    <#if loan_info.loan_borrower_type == 3>个体工商户</#if>
                                </label>
                            </div>
                        </div>
                        <!--</editor-fold>-->
                        </#if>

                        <#if loan_info.loan_pay_mode == 2>
                        <!--<editor-fold desc="支付方式：委托支付 => 附加项">-->
                        <div id="other_loan_pay_mode_2" >
                            <div class="layui-form-item">
                                <label class="layui-form-label">委托支付日期 :</label>
                                <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_entrust_pay_date}</label>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">委托支付金额 :</label>
                                <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_entrust_pay_amount}</label>
                                <span>元</span>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">委托支付收款单位 :</label>
                                <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_entrust_pay_payee}</label>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">委托支付收款账号 :</label>
                                <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_entrust_pay_receipt_account}</label>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">委托支付收款开户行 :</label>
                                <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_entrust_pay_receipt_deposit}</label>
                            </div>
                        </div>
                        <!--</editor-fold>-->
                        </#if>
                    </div>
                </div>

                <!--</editor-fold>-->
                <br/>
                <!--<editor-fold desc="贷款管理 - 审批信息">-->
                <div class="info_title" style="margin: 5px 0px 0px 10px;">
                    <label>审批信息</label>
                    <hr>
                </div>
                <div style="margin-left: 200px">
                    <div class="layui-form-item">
                        <label class="layui-form-label">申请贷款时间 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_apply_time}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">贷审会成员数量 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_review_person_num}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">审批贷款时间 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_approve_time}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">合同日期 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_contract_date}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">管户责任人 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_steward_responsible}</label>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">风险主责人 :</label>
                        <label class="layui-form-label"  style="text-align: left;">${loan_info.loan_risk_responsible}</label>
                    </div>
                    <!--</editor-fold>-->
                    <div class="layui-form-item">
                        <div class="layui-input-block" style="margin-left: 160px;">
                            <button class="layui-btn" lay-submit="" lay-filter="add">确  定</button>
                        </div>
                    </div>
                </div>
            </div>
            <!--</editor-fold>-->
        </form>
    </div>
</div>
<script>layui.use(['form'],
        function() {
            $ = layui.jquery;
            var form = layui.form,laydate = layui.laydate,layer = layui.layer;
            //监听提交
            form.on('submit(add)',
                function(data) {
                    xadmin.close(); // 关闭当前frame
                });

        });





</script>
</body>

</html>