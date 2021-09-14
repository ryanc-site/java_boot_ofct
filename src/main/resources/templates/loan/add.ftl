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
    <link rel="stylesheet" type="text/css" href="/static/css/crcb_app.css">
    <link rel="stylesheet" type="text/css" href="/static/css/crcb_app_loan_mgr.css">
    <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
</head>
<body>
<div class="layui-fluid" >
    <div id="loan_mgr_Form" class="modal layui-form" align="center" >
        <form method="post" class="smart-green">
                <!--<editor-fold desc="贷款管理 - 个人 -> 保证 -> 一次性 -> 自主支付">-->
                <!--<editor-fold desc="贷款管理 - 类别筛选">-->
                <div class="info_title">
                    <label>类别筛选</label>
                    <hr>
                </div>
                <div data_type="input" class="loan_customer_type_div" style="width:165px" >
                    <label>客户类型 :</label>
                    <select id="loan_customer_type" name="loan_customer_type" lay-verify="required" >
                        <option value="">--请选择--</option>
                        <option value="1" selected >个人</option>
                        <option value="0">公司</option>
                    </select>
                </div>
                <div data_type="input" class="loan_assure_type_div" style="width:165px" >
                    <label>保证方式 :</label>
                    <select id="loan_assure_type" name="loan_assure_type" lay-verify="required" >
                        <option value="">--请选择--</option>
                        <option value="1" >抵押</option>
                        <option value="2" selected>保证</option>
                        <option value="3">信用</option>
                        <option value="4">质押</option>
                    </select>
                </div>
                <div data_type="input" class="loan_mode_div" style="width:165px" >
                    <label>贷款方式 :</label>
                    <select id="loan_mode" name="loan_mode" lay-verify="required"  >
                        <option value="">--请选择--</option>
                        <option value="1" selected>一次性</option>
                        <option value="2">循环</option>
                        <option value="3">特色产品</option>
                    </select>
                </div>
                <div data_type="input" class="loan_pay_mode_div" style="width:165px" >
                    <label>支付方式 :</label>
                    <select id="loan_pay_mode" name="loan_pay_mode" lay-verify="required"  >
                        <option value="">--请选择--</option>
                        <option value="1" selected>自主支付</option>
                        <option value="2">委托支付</option>
                    </select>
                </div>
                <div style="width: 660px;height: 50px;margin-top:35px">
                    <label><input type="button" class="button" onclick="javascript:loan_type_sure()" value="确定"/></label>
                </div>
                <!--</editor-fold>-->

                <div id="loan_form_info" style="display: none;margin-top:-20px">
                    <br/>
                    <!--<editor-fold desc="贷款管理 - 贷款信息">-->
                    <div class="info_title">
                        <label>贷款信息</label>
                        <hr>
                    </div>
                    <div data_type="input" class="loan_repay_mode_div" style="width:165px" >
                        <label>还款方式 :</label>
                        <select id="loan_repay_mode" name="loan_repay_mode" lay-verify="required"  >
                            <option value="">--请选择--</option>
                            <option value="1" selected>等额本息</option>
                            <option value="2">等额本金</option>
                            <option value="3">按月结息</option>
                            <option value="4">到期还本、计划还款</option>
                        </select>
                    </div>
                    <div data_type="input" class="loan_repay_person_div" style="width:200px;margin: -15px 0px 0px -100px;">
                        <label>借款人 :</label>
                        <input id="loan_repay_person" lay-verify="required" lay-verify="required"  type="text" name="loan_repay_person" value="贾斯汀" />
                    </div>
                    <div data_type="input" class="loan_person_carno_div" style="width:340px;">
                        <label>借款人卡号 :</label>
                        <input id="loan_person_carno" lay-verify="required"  type="text" name="loan_person_carno" value="6228888888888888888" />
                    </div>
                    <div data_type="input" class="loan_account_open_bank_div" style="width:460px;">
                        <label>放款账户开户行 :</label>
                        <input id="loan_account_open_bank" lay-verify="required"  type="text" name="loan_account_open_bank" value="沧州农商行" />
                    </div>
                    <div data_type="input" class="loan_for_use_div" style="width:200px;">
                        <label>借款用途 :</label>
                        <input id="loan_for_use" lay-verify="required"  type="text" name="loan_for_use" value="买iphone13" />
                    </div>
                    <div data_type="input" class="loan_repay_src_div" style="width:200px;">
                        <label>还款来源 :</label>
                        <input id="loan_repay_src" lay-verify="required"  type="text" name="loan_repay_src" value="经营收入" />
                    </div>
                    <div data_type="input" class="loan_amount_upcase_div" style="width:340px;">
                        <label>贷款金额大写 :</label>
                        <input id="loan_amount_upcase" lay-verify="required"  type="text" name="loan_amount_upcase" value="壹万伍仟元" />
                    </div>
                    <div data_type="input" class="loan_amount_lowcase_div" style="width:215px;">
                        <label>贷款金额小写 :</label>
                        <input id="loan_amount_lowcase" lay-verify="required"  type="text" name="loan_amount_lowcase" value="15000" />
                    </div>
                    <div data_type="input" class="loan_total_credit_amount_div" style="width:215px;">
                        <label>总授信金额 :</label>
                        <input id="loan_total_credit_amount" lay-verify="required"  type="text" name="loan_total_credit_amount" value="15000" />
                        <span>元</span>
                    </div>
                    <div data_type="input" class="loan_rate_plus_point_div" style="width:215px;">
                        <label>贷款利率加点 :</label>
                        <input id="loan_rate_plus_point" lay-verify="required"  type="text" name="loan_rate_plus_point" value="300" />
                    </div>
                    <div data_type="input" class="loan_term_div" style="width:215px;">
                        <label>贷款期限 :</label>
                        <input id="loan_term" type="text"  lay-verify="required" name="loan_term" value="24" />
                        <span>个月</span>
                    </div>
                    <div data_type="input" class="loan_start_date_div" style="width:245px;">
                        <label>贷款起始日期 :</label>
                        <input id="loan_start_date" lay-verify="required"  class="date-format" type="text" name="loan_start_date" value="2021年10月28日" />
                    </div>
                    <div data_type="input" class="loan_end_date_div" style="width:245px;">
                        <label>贷款终止日期 :</label>
                        <input id="loan_end_date" lay-verify="required"  class="date-format" type="text" name="loan_end_date" value="2023年10月28日" />
                    </div>
                    <div data_type="input" class="loan_m_rate_div" style="width:215px;">
                        <label>贷款月利率 :</label>
                        <input id="loan_m_rate" lay-verify="required"  type="text" name="loan_m_rate" value="5.708" />
                        <span>‰</span>
                    </div>
                    <div data_type="input" class="loan_main_contractno_div" style="width:215px;">
                        <label>主合同号 :</label>
                        <input id="loan_main_contractno" lay-verify="required"  type="text" name="loan_main_contractno" value="ht-202108281" />
                    </div>
                    <div data_type="input" class="loan_sub_contractno_div" style="width:215px;">
                        <label>从合同号 :</label>
                        <input id="loan_sub_contractno" lay-verify="required"  type="text" name="loan_sub_contractno" value="20210828202031" />
                    </div>
                    <!--</editor-fold>-->
                    <br/>
                    <!--<editor-fold desc="贷款管理 - 保证信息">-->
                    <div class="info_title">
                        <label>保证信息</label>
                        <hr>
                    </div>
                    <div data_type="input" class="loan_assure_person_gender_div" style="width:165px" >
                        <label>保证人性别 :</label>
                        <select id="loan_assure_person_gender" name="loan_assure_person_gender" >
                            <option value="-1" >--请选择--</option>
                            <option value="1" selected >男</option>
                            <option value="0">女</option>
                        </select>
                    </div>

                    <div data_type="input" class="loan_assure_person_div" style="width:200px;">
                        <label>保证人姓名 :</label>
                        <input id="loan_assure_person" type="text" name="loan_assure_person" value="比伯" />
                    </div>
                    <div data_type="input" class="loan_person_address_div" style="width:340px;">
                        <label>保证人住址 :</label>
                        <input id="loan_person_address" type="text" name="loan_person_address" value="北京簋街" />
                    </div>
                    <div data_type="input" class="loan_person_id_div" style="width:460px;">
                        <label>保证人身份证 :</label>
                        <input id="loan_person_id" type="text" name="loan_person_id" value="652222222222222222" />
                    </div>
                    <!--</editor-fold>-->
                    <br/>
                    <!--<editor-fold desc="贷款管理 - 其他信息">-->
                    <div id="loan_other_info" style="display:none;" >
                        <div class="info_title">
                            <label>其他信息</label>
                            <hr>
                        </div>
                        <!--<editor-fold desc="贷款方式：循环方式 => 附加项">-->
                        <div id="other_loan_mode_2" style="display:none;">
                            <div data_type="input" class="loan_this_start_date_div" style="width:225px;">
                                <label>本次借款起始日期 :</label>
                                <input id="loan_this_start_date" class="date-format" type="text" name="loan_this_start_date" value="2021年10月28日" />
                            </div>
                            <div data_type="input" class="loan_this_end_date_div" style="width:225px;">
                                <label>本次借款终止日期 :</label>
                                <input id="loan_this_end_date" class="date-format" type="text" name="loan_this_end_date" value="2022年10月28日" />
                            </div>
                            <div data_type="input" class="loan_this_months_div" style="width:215px;">
                                <label>本次借款月数 :</label>
                                <input id="loan_this_months" type="text" name="loan_this_months" value="12" />
                                <span>个月</span>
                            </div>
                        </div>
                        <!--</editor-fold>-->
                        <!--<editor-fold desc="贷款方式：特色产品 => 附加项">-->
                        <div id="other_loan_mode_3" style="display:none;">
                            <div data_type="input" class="loan_special_prod_type_div" style="width:235px" >
                                <label>特色产品种类 :</label>
                                <select id="loan_special_prod_type" name="loan_special_prod_type" >
                                    <option value="-1">--请选择--</option>
                                    <option value="1" selected>商贷宝</option>
                                    <option value="2">消贷宝</option>
                                    <option value="3">农贸宝</option>
                                </select>
                            </div>
                            <div data_type="input" class="loan_borrower_type_div" style="width:235px;margin: -40px 0px 0px 85px;" >
                                <label>借款人类型 :</label>
                                <select id="loan_borrower_type" name="loan_borrower_type" >
                                    <option value="-1">--请选择--</option>
                                    <option value="1" selected>农户</option>
                                    <option value="2">自然人</option>
                                    <option value="3">个体工商户</option>
                                </select>
                            </div>
                        </div>
                        <!--</editor-fold>-->
                        <!--<editor-fold desc="支付方式：委托支付 => 附加项">-->
                        <div id="other_loan_pay_mode_2" style="display:none;">
                            <div data_type="input" class="loan_entrust_pay_date_div" style="width:223px;margin-top: 20px;">
                                <label>委托支付日期 :</label>
                                <input id="loan_entrust_pay_date" type="text" name="loan_entrust_pay_date" value="2021/10/28" />
                            </div>
                            <div data_type="input" class="loan_entrust_pay_amount_div" style="width:225px;">
                                <label>委托支付金额 :</label>
                                <input id="loan_entrust_pay_amount" type="text" name="loan_entrust_pay_amount" value="15000" />
                                <span>元</span>
                            </div>
                            <div data_type="input" class="loan_entrust_pay_payee_div" style="width:460px;">
                                <label>委托支付收款单位 :</label>
                                <input id="loan_entrust_pay_payee" type="text" name="loan_entrust_pay_payee" value="上海有限公司" />
                            </div>
                            <div data_type="input" class="loan_entrust_pay_receipt_account_div" style="width:460px;">
                                <label>委托支付收款账号 :</label>
                                <input id="loan_entrust_pay_receipt_account" type="text" name="loan_entrust_pay_receipt_account" value="622848071823386666" />
                            </div>
                            <div data_type="input" class="loan_entrust_pay_receipt_deposit_div" style="width:460px;">
                                <label>委托支付收款开户行 :</label>
                                <input id="loan_entrust_pay_receipt_deposit" type="text" name="loan_entrust_pay_receipt_deposit" value="农业银行" />
                            </div>
                        </div>
                        <!--</editor-fold>-->
                    </div>

                    <!--</editor-fold>-->
                    <br/>
                    <!--<editor-fold desc="贷款管理 - 审批信息">-->
                    <div class="info_title">
                        <label>审批信息</label>
                        <hr>
                    </div>
                    <div data_type="input" class="loan_apply_time_div" style="width:305px;">
                        <label>申请贷款时间 :</label>
                        <input id="loan_apply_time"  lay-verify="required" class="date-format" type="text" name="loan_apply_time" value="2021年10月20日" />
                    </div>
                    <div data_type="input" class="loan_review_person_num_div" style="width:340px;">
                        <label>贷审会成员数量 :</label>
                        <input id="loan_review_person_num" lay-verify="required"  type="text" name="loan_review_person_num" value="5" />
                    </div>
                    <div data_type="input" class="loan_approve_time_div" style="width:305px;">
                        <label>审批贷款时间 :</label>
                        <input id="loan_approve_time" lay-verify="required"  class="date-format" type="text" name="loan_approve_time" value="2021年10月25日" />
                    </div>
                    <div data_type="input" class="loan_contract_date_div" style="width:340px;">
                        <label>合同日期 :</label>
                        <input id="loan_contract_date" lay-verify="required"  class="date-format" type="text" name="loan_contract_date" value="2021年10月28日" />
                    </div>
                    <div data_type="input" class="loan_steward_responsible_div" style="width:305px;">
                        <label>管户责任人 :</label>
                        <input id="loan_steward_responsible"  lay-verify="required" type="text" name="loan_steward_responsible" value="刑经理" />
                    </div>
                    <div data_type="input" class="loan_risk_responsible_div" style="width:340px;">
                        <label>风险主责人 :</label>
                        <input id="loan_risk_responsible" lay-verify="required"  type="text" name="loan_risk_responsible" value="李主任" />
                    </div>
                    <!--</editor-fold>-->
                    <div style="width: 660px;height: 50px;margin-top:10px">
                        <label><input type="button" class="button" lay-submit="" lay-filter="add" value="提交"/></label>
                    </div>
                </div>
                <!--</editor-fold>-->
                <div id="loan_to_be_dev" class="to_be_dev" >
                    <span class="to_be_dev_text" >当前类型开发中，敬请期待...</span>
                    <br>
                    <span class="to_be_dev_text" >建议演示类型：个人 -> 保证 -> 一次性 -> 自主支付</span>
                </div>
            </form>
    </div>
</div>
<script>layui.use(['form', 'laydate','layer','jquery'],
        function() {
            $ = layui.jquery;
            var form = layui.form,laydate = layui.laydate,layer = layui.layer;

            //执行一个laydate实例
            lay('.date-format').each(function(){
                laydate.render({
                    elem: this,
                    type: 'datetime',
                    format: 'yyyy年MM月dd日',
                    trigger: 'click'
                });
            });

            //自定义验证规则
            form.verify({
                // nikename: function(value) {
                //     if (value.length < 5) {
                //         return '昵称至少得5个字符啊';
                //     }
                // },
                // pass: [/(.+){6,12}$/, '密码必须6到12位'],
                // repass: function(value) {
                //     if ($('#L_pass').val() != $('#L_repass').val()) {
                //         return '两次密码不一致';
                //     }
                // }
            });

            //监听提交
            form.on('submit(add)',
                function(data) {
                    var isOk;
                    $.ajax({
                        url:'/loan/add',
                        method:'post',
                        data:data.field,
                        async: false,
                        dataType:'JSON',
                        success:function(res){
                            if(res === 0){
                                isOk = true;
                            }else{
                                isOk = false;
                            }
                        },
                        error:function (data) {

                        }
                    });

                    if(isOk){
                        layer.alert("添加成功", {
                            icon: 6
                        },
                        function() {
                            xadmin.close(); // 关闭当前frame
                            xadmin.father_reload(); // 可以对父窗口进行刷新
                        });
                        return false;
                    }
                });

        });

    /* call 类型筛选确认 */
    function loan_type_sure(){
        var loan_customer_type_ele = document.getElementById("loan_customer_type");
        var loan_assure_type_ele = document.getElementById("loan_assure_type");
        var loan_mode_ele = document.getElementById("loan_mode");
        var loan_pay_mode_ele = document.getElementById("loan_pay_mode");

        if(loan_customer_type_ele.value === '-1'
            || loan_assure_type_ele.value === '-1'
            || loan_mode_ele.value === '-1'
            || loan_pay_mode_ele.value === '-1'){
            $('.tips').html('请选择类型！').addClass('tips-warn').fadeIn().delay(1500).fadeOut();
        }else if(loan_customer_type_ele.value === '1'
            && loan_assure_type_ele.value === '2'
            && loan_mode_ele.value === '1'
            && loan_pay_mode_ele.value === '1'){
            $('#loan_form_info').show();
            $('#loan_to_be_dev').hide();

            $('#loan_other_info').hide();
            $('#other_loan_mode_2').hide();
            $('#other_loan_mode_3').hide();
            $('#other_loan_pay_mode_2').hide();
        }else if(loan_customer_type_ele.value === '1'
            && loan_assure_type_ele.value === '2'){
            display_other_loan_mode(loan_mode_ele.value)
            display_other_loan_pay_mode(loan_pay_mode_ele.value)
            $('#loan_other_info').show();
            $('#loan_form_info').show();
        }else{
            $('#loan_other_info').hide();
            $('#loan_form_info').hide();
            $('#loan_to_be_dev').show();
        }
    }
    // 显示 - 其他信息 - 贷款方式
    function display_other_loan_mode(type){
        var isOk = false;
        switch (type) {
            case '1': {
                $('#other_loan_mode_2').hide()
                $('#other_loan_mode_3').hide()
                clean_other_loan_mode_value("2");
                clean_other_loan_mode_value("3");
                isOk = true;
                break;
            }
            case '2': {
                $('#other_loan_mode_2').show()
                $('#other_loan_mode_3').hide()
                clean_other_loan_mode_value("3");
                isOk = true;
                break;
            }
            case '3': {
                $('#other_loan_mode_2').hide()
                $('#other_loan_mode_3').show()
                clean_other_loan_mode_value("2");
                isOk = true;
                break;
            }
        }
        return isOk;
    }

    // 显示 - 其他信息 - 支付方式
    function display_other_loan_pay_mode(type){
        var isOk = false;
        switch (type) {
            case '1': {
                $('#other_loan_pay_mode_2').hide();
                clean_other_loan_pay_mode_value("2");
                isOk = true;
                break;
            }
            case '2': {
                $('#other_loan_pay_mode_2').show();
                isOk = true;
                break;
            }
        }
        return isOk;
    }

    // 清除 — 贷款方式对应的值
    function clean_other_loan_mode_value(type){
        switch (type) {
            case '2': {
                $('#loan_this_start_date').val("")
                $('#loan_this_end_date').val("")
                $('#loan_this_months').val("")
                break;
            }
            case '3': {
                $('#loan_special_prod_type').val("-1")
                $('#loan_borrower_type').val("-1")
                break;
            }
        }
    }

    // 清除 — 支付方式对应的值
    function clean_other_loan_pay_mode_value(type){
        switch (type) {
            case '2': {
                $('#loan_entrust_pay_date').val("")
                $('#loan_entrust_pay_amount').val("")
                $('#loan_entrust_pay_payee').val("")
                $('#loan_entrust_pay_receipt_account').val("")
                $('#loan_entrust_pay_receipt_deposit').val("")
                break;
            }
        }
    }

</script>
</body>

</html>