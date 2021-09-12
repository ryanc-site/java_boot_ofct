<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="/static/css/font.css">
        <link rel="stylesheet" href="/static/css/xadmin.css">
        <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="/static/js/xadmin.js"></script>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <blockquote class="layui-elem-quote">欢迎管理员：
                                <span class="x-red">${admin}</span>！当前时间:&nbsp;<span id="p_datetime_text">2018-04-25 20:50:53</span>
                            </blockquote>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">数据统计</div>
                        <div class="layui-card-body ">
                            <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>个人客户</h3>
                                        <p>
                                            <cite>66</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>企业客户</h3>
                                        <p>
                                            <cite>12</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>个人贷款</h3>
                                        <p>
                                            <cite>99</cite></p>
                                    </a>
                                </li>
                                <li class="layui-col-md2 layui-col-xs6">
                                    <a href="javascript:;" class="x-admin-backlog-body">
                                        <h3>企业贷款</h3>
                                        <p>
                                            <cite>67</cite></p>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">系统信息</div>
                        <div class="layui-card-body ">
                            <table class="layui-table">
                                <tbody>
                                    <tr>
                                        <th>ofct版本</th>
                                        <td>${ofct_version}</td></tr>
                                    <tr>
                                        <th>服务器地址</th>
                                        <td>${server_port}</td></tr>
                                    <tr>
                                        <th>操作系统</th>
                                        <td>${os}</td></tr>
                                    <tr>
                                        <th>运行环境</th>
                                        <td>${jdk}</td></tr>
                                    <tr>
                                        <th>Sqlite版本</th>
                                        <td>${sqlite_version}</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">开发团队</div>
                        <div class="layui-card-body ">
                            <table class="layui-table">
                                <tbody>
                                    <tr>
                                        <th>版权所有</th>
                                        <td>© 沧州银行
                                            <a href="http://www.czrxcb.com" target="_blank">访问官网</a></td>
                                    </tr>
                                    <tr>
                                        <th>开发者</th>
                                        <td>Ryan丶关照 & 愚心坊</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <style id="welcome_style"></style>
            </div>
        </div>
        </div>
    </body>
    <script type="text/javascript">
        var setTime = setInterval(function (){
            // 设置时间bar
            const day2 = new Date();
            day2.setTime(day2.getTime());
            const s2 = day2.getFullYear() + "年" + (day2.getMonth() + 1) + "月" + day2.getDate() + "日" + (day2.getHours()) + ":"+ (day2.getMinutes()) + ":"+ (day2.getSeconds()) ;
            document.getElementById("p_datetime_text").innerHTML=s2;
        }, 1000);
    </script>
</html>