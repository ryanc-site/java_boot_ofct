<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>个人客户 - 信息</title>
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
                    姓名：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_name}
                </label>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    性别：
                </label>
                <label class="layui-form-label" style="text-align: left;">
                    ${(person_info.p_gender!= 1)?string('男', '女')}
                </label>
            </div>
            <div class="layui-form-item">
                <div class="layui-form-item">
                    <label class="layui-form-label">
                       婚姻情况：
                    </label>
                    <label class="layui-form-label" style="text-align: left;">
                        ${(person_info.p_marital!= 1)?string('已婚', '未婚')}
                    </label>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="p_tel" class="layui-form-label">
                    电话：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_tel}
                </label>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    身份证：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_id}
                </label>
            </div>


            <div class="info_title">
                <label>地址信息</label>
                <hr>
            </div>
            <div class="layui-form-item">
                <label for="p_id_add" class="layui-form-label">
                    身份证地址：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_id_add}
                </label>
            </div>
            <div class="layui-form-item">
                <label for="p_hukou_add" class="layui-form-label">
                    户籍地址：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_hukou_add}
                </label>
            </div>
            <div class="layui-form-item">
                <label for="p_dwell_add" class="layui-form-label">
                    居住地址：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_dwell_add}
                </label>
            </div>
            <div class="layui-form-item">
                <label for="p_work_add" class="layui-form-label">
                    工作地址：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_work_add}
                </label>
            </div>


            <div class="info_title">
                <label>收入信息</label>
                <hr>
            </div>
            <div class="layui-form-item">
                <label for="p_job" class="layui-form-label">
                    职业（行业）：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_job}
                </label>
            </div>
            <div class="layui-form-item">
                <label for="p_m_in" class="layui-form-label">
                    月收入(元)：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_m_in}
                </label>
            </div>
            <div class="layui-form-item">
                <label for="p_y_in" class="layui-form-label">
                    年收入(元)：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_y_in}
                </label>
            </div>
            <div class="layui-form-item">
                <label for="p_total_asset" class="layui-form-label">
                    总资产(元)：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_total_asset}
                </label>
            </div>
            <div class="layui-form-item">
                <label for="p_total_debt" class="layui-form-label">
                    总负债(元)：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_total_debt}
                </label>
            </div>
            <div class="layui-form-item">
                <label for="p_net_asset" class="layui-form-label">
                    净资产(元)：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_net_asset}
                </label>
            </div>
            <div class="layui-form-item">
                <label for="p_last_year_family_net_asset" class="layui-form-label" style="width: 120px;">
                    上年家庭净收入(元)：
                </label>
                <label for="p_name" class="layui-form-label" style="text-align: left;">
                    ${person_info.p_last_year_family_net_asset}
                </label>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 250px;">
                    <button class="layui-btn" lay-submit="" lay-filter="add">确  定</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>layui.use(['form', 'layer','jquery'],
        function() {
            $ = layui.jquery;
            var form = layui.form, layer = layui.layer;

            //监听提交
            form.on('submit(add)',
                function(data) {
                    xadmin.close(); // 关闭当前frame
                });

        });
</script>
</body>

</html>