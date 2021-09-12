<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>个人客户 - 添加</title>
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
<div class="layui-fluid" style="margin-left: 135px;">
    <div class="layui-row">
        <form class="layui-form">
            <div class="info_title">
                <label>基本信息</label>
                <hr>
            </div>
            <div class="layui-form-item">
                <label for="p_name" class="layui-form-label">
                    <span class="x-red">*</span>姓名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="p_name" name="p_name" value="贾斯汀" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>性别
                </label>
                <div class="layui-input-inline">
                    <select id="p_gender" name="p_gender" class="valid" lay-verify="required">
                        <option value="">--请选择--</option>
                        <option value="1" selected>男</option>
                        <option value="0">女</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>婚姻情况
                    </label>
                    <div class="layui-input-inline">
                        <select id="p_marital" name="p_marital" class="valid" lay-verify="required">
                            <option value="">--请选择--</option>
                            <option value="1" selected>已婚</option>
                            <option value="2">未婚</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_tel" class="layui-form-label">
                    <span class="x-red">*</span>电话
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="p_tel" name="p_tel" value="13788888888" required="" lay-verify="required|number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>身份证</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_id" name="p_id" value="652201199304014515" required="" lay-verify="required|identity" autocomplete="off" class="layui-input">
                </div>
            </div>


            <div class="info_title">
                <label>地址信息</label>
                <hr>
            </div>
            <div class="layui-form-item">
                <label for="p_id_add" class="layui-form-label">
                    <span class="x-red">*</span>身份证地址</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_id_add" name="p_id_add" value="北京" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_hukou_add" class="layui-form-label">
                    <span class="x-red">*</span>户籍地址</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_hukou_add" name="p_hukou_add" value="上海" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_dwell_add" class="layui-form-label">
                    <span class="x-red">*</span>居住地址</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_dwell_add" name="p_dwell_add" value="广州" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_work_add" class="layui-form-label">
                    <span class="x-red">*</span>工作地址</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_work_add" name="p_work_add" value="深圳" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>


            <div class="info_title">
                <label>收入信息</label>
                <hr>
            </div>
            <div class="layui-form-item">
                <label for="p_job" class="layui-form-label">
                    <span class="x-red">*</span>职业（行业）</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_job" name="p_job" value="造纸业" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_m_in" class="layui-form-label">
                    <span class="x-red">*</span>月收入(元)</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_m_in" name="p_m_in" value="100" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_y_in" class="layui-form-label">
                    <span class="x-red">*</span>年收入(元)</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_y_in" name="p_y_in" value="1200" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_total_asset" class="layui-form-label">
                    <span class="x-red">*</span>总资产(元)</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_total_asset" value="2000" name="p_total_asset" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_total_debt" class="layui-form-label">
                    <span class="x-red">*</span>总负债(元)</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_total_debt" value="1000" name="p_total_debt" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_net_asset" class="layui-form-label">
                    <span class="x-red">*</span>净资产(元)</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_net_asset" value="1000" name="p_net_asset" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_last_year_family_net_asset" class="layui-form-label">
                    <span class="x-red">*</span>上年家庭净收入(元)</label>
                <div class="layui-input-inline">
                    <input type="text" id="p_last_year_family_net_asset" name="p_last_year_family_net_asset" value="2000" required="" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="add">提  交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>layui.use(['form', 'layer','jquery'],
        function() {
            $ = layui.jquery;
            var form = layui.form,
                layer = layui.layer;

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
                        url:'/csr/add/person',
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
</script>
</body>

</html>