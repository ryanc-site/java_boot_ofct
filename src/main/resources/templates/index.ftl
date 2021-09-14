<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>沧州银行-ofct 2.0</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
</head>

<body class="index">
<!--<editor-fold desc="顶部">-->
<div class="container">
    <div class="logo">
        <a href="index.ftl">ofc_tool 2.0.0</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.open('最大化','http://www.baidu.com','','',true)">
                        <i class="iconfont">&#xe6a2;</i>弹出最大化</a></dd>
                <dd>
                    <a onclick="xadmin.open('弹出自动宽高','http://www.baidu.com')">
                        <i class="iconfont">&#xe6a8;</i>弹出自动宽高</a></dd>
                <dd>
                    <a onclick="xadmin.open('弹出指定宽高','http://www.baidu.com',500,300)">
                        <i class="iconfont">&#xe6a8;</i>弹出指定宽高</a></dd>
                <dd>
                    <a onclick="xadmin.add_tab('在tab打开','info.ftl')">
                        <i class="iconfont">&#xe6b8;</i>在tab打开</a></dd>
                <dd>
                    <a onclick="xadmin.add_tab('在tab打开刷新','member-del.html',true)">
                        <i class="iconfont">&#xe6b8;</i>在tab打开刷新</a></dd>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:none;">© 2021 沧州银行</a>
        </li>
        <li class="layui-nav-item to-index">
            <a href="javascript:none;" id="div_date_text">xxxx年x月xx日</a></li>
    </ul>
</div>
<!--</editor-fold>-->

<!--<editor-fold desc="中部">-->

<!--<editor-fold desc="左侧菜单">-->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="客户管理">&#xe6b8;</i>
                    <cite>客户管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('个人客户','/serviceRouting/csr_person')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>个人客户</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('企业客户','/serviceRouting/csr_ent')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>企业客户</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a onclick="xadmin.add_tab('贷款管理','/serviceRouting/loan_mgr')">
                    <i class="iconfont left-nav-li" lay-tips="贷款管理">&#xe723;</i>
                    <cite>贷款管理</cite></a>
            </li>
            <li>
                <a onclick="xadmin.add_tab('贷款管理','/serviceRouting/report')">
                    <i class="iconfont left-nav-li" lay-tips="报表优化">&#xe6b4;</i>
                    <cite>报表优化</cite></a>
            </li>
            <li>
                <a onclick="xadmin.add_tab('贷款管理','/serviceRouting/loan_process')">
                    <i class="iconfont left-nav-li" lay-tips="贷款流程">&#xe6ce;</i>
                    <cite>贷款流程</cite></a>
            </li>
        </ul>
    </div>
</div>
<!--</editor-fold>-->

<!--<editor-fold desc="右侧主体">-->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='/welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>
<!--</editor-fold>-->

<!--</editor-fold>-->

</body>
<script type="text/javascript">
    // 设置时间bar
    const day2 = new Date();
    day2.setTime(day2.getTime());
    const s2 = day2.getFullYear() + "年" + (day2.getMonth() + 1) + "月" + day2.getDate() + "日";
    document.getElementById("div_date_text").innerHTML=s2;
</script>

</html>