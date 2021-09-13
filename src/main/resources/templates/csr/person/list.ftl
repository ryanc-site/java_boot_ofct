<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>客户管理 - 个人客户</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="/static/css/font.css">
        <link rel="stylesheet" href="/static/css/xadmin.css">
        <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="/static/js/common.js"></script>
        <script type="text/javascript" src="/static/js/jquery.min.js"></script>
        <script type="text/javascript" src="/static/js/xadmin.js"></script>
    </head>
    <body>
        <div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">客户管理</a>
            <a>
              <cite>个人客户</cite></a>
          </span>
          <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5">
                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input date-format"  autocomplete="off" placeholder="开始日" name="s_ctime_start" id="s_ctime_start">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input date-format"  autocomplete="off" placeholder="截止日" name="s_ctime_end" id="s_ctime_end">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="s_p_name" id="s_p_name"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" type="button"  id="s_btn" onclick="csr_search();"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn" onclick="xadmin.open('添加用户','/csr/preadd/person',850,600,false)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form" id="p_customers">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>电话</th>
                                    <th>婚姻情况</th>
                                    <th>创建时间</th>
                                    <th>操作</th></tr>
                                </thead>
                                <tbody id="p_customer_tbody">

                                </tbody>
                            </table>
                            <div id="pages"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
        $(function () {
            //第一次，需要手动调用一下这个函数
            pages(1, 10, "",null,null);
        })

        // 数据列表显示
        function pages(page, limit, keyword,starTime,endTime) {
            //    发起异步请求
            $.ajax({
                url: "/csr/query/person",
                data: {
                    "keyword": keyword,
                    "page": page,
                    "starTime": starTime,
                    "endTime": endTime,
                    "limit": limit
                },
                async: false,
                dataType: "json",
                success: function (data) {
                    if(data.code === "200"){
                        var html = "";
                        if(data.result.list.length !== 0){
                            $.each(data.result.list, function (index, user) {
                                html += "<tr>";
                                html += "<td>" + index+ "</td>";
                                html += "<td>" + user.p_name + "</td>";
                                html += "<td>" + displayGender(user.p_gender) + "</td>";
                                html += "<td>" + user.p_tel + "</td>";
                                html += "<td>" + displayMarital(user.p_marital) + "</td>";
                                html += "<td>" + user.ctime + "</td>";
                                // html += "<td><a class='layui-btn layui-btn-danger layui-btn-xs' lay-event='del' onclick='csr_del(\""+user.id+"\")'>删除</a></td>";
                                html += "<td>" +
                                            "<a title='查看' onclick='xadmin.open(\"客户信息\",\"/csr/info/person/"+user.id+"\",850,600,false)' href='javascript:;'> <i class='layui-icon'>&#xe63c;</i></a>&nbsp;&nbsp;" +
                                            "<a title='修改' onclick='xadmin.open(\"修改客户信息\",\"/csr/premodify/person/"+user.id+"\",850,600,false)' href='javascript:;'> <i class='layui-icon'>&#xe642;</i></a>&nbsp;&nbsp;" +
                                            "<a title='删除' onclick='csr_del(\""+user.id+"\")' href='javascript:;'> <i class='layui-icon'>&#xe640;</i></a>" +
                                        "</td>";
                                html += "</tr>";
                            });
                            //后台需要传递总页数、当前页、一页显示多少条记录数给回调函数
                            laypage(data.result.total, data.result.pageNum, data.result.pageSize);
                            $('#pages').show();
                        }else{
                            html = "<tr><td colspan='7' style='text-align:center;' >暂无数据</td></tr>"
                            $('#pages').hide();
                        }

                        $("#p_customer_tbody").html(html);
                    }else{
                        console.log(data);
                    }
                }
            });
        }

        //这里直接在jquery的函数里面引用，因此不用加：th:inline="none"也是可以的
        function laypage(total, page, limit) {
            //分页回调函数，当每次点击分页组件的时候就会触发这个回调函数执行
            layui.use(['laypage','layer'], function () {
                var laypage = layui.laypage,layer = layui.layer;
                laypage.render({
                    elem: 'pages',//elem属性绑定的是容器的ID属性值，不需要加#
                    count: total,//记录数的总数量
                    curr: page ,//当前页是几，如果是第一次，则为1（因为第一次加载，page的值是没有嘛，所以就选择1），不过这个1写不写都无所谓，反正默认值是1了。这个值必须要有的，不然页码永远都是选中第一页
                    limit: limit,//每次分的页数，默认值也是10条。这个值也要传的，因为切换每页显示的条数的时候需要用它来记录一下，否则永远都是10条展示
                    limits:[5,10,20,30],//每页显示的条数
                    layout:['prev','page','next','limit','skip','count'],//自定义布局:自定义排版。可选值有：count（总条目输区域）、prev（上一页区域）、page（分页区域）、next（下一页区域）、limit（条目选项区域）、refresh（页面刷新区域。注意：layui 2.3.0 新增） 、skip（快捷跳页区域）
                    groups:5,//连续出现的页码的个数
                    jump: function (obj, first) {
                        //判断是否是第一次加载，如果不是，才执行下面的函数回调
                        if (!first) {
                            pages(obj.curr, obj.limit);
                        }
                    }

                })
            })
        }

        // 数据删除
        function csr_del(id){
            layer.open({
                content: '确认删除？',
                btnAlign: 'c',
                title: '提示',
                btn: ['确定', '取消'],
                yes: function() {
                    $.ajax({
                        url: '/csr/del',
                        async: false, //或false,是否异步
                        data: {
                            "csr_id":id
                        },
                        dataType: 'json',
                        success: function(data) {
                            if(data.code === "200"){
                                layer.alert(data.msg);
                                var starTime = $("#s_ctime_start").val();
                                var endTime = $("#s_ctime_end").val();
                                var keyword = $("#s_p_name").val();
                                pages(1, 10 ,keyword,starTime,endTime);
                            }
                        },
                        error: function(data) {
                            layer.alert('系统登录超时或遇到意外错误，请重新登录，或联系系统管理员!');
                        },
                    })
                }
            });
        }


        layui.use('laydate', function(){
            var laydate = layui.laydate;

            //执行一个laydate实例
            lay('.date-format').each(function(){
                laydate.render({
                    elem: this,
                    type: 'datetime'
                    ,trigger: 'click'
                });
            });
        });
        function csr_search(){
            const starTime = $("#s_ctime_start").val();
            const endTime = $("#s_ctime_end").val();
            const keyword = $("#s_p_name").val();
            pages(1, 10 ,keyword,starTime,endTime);
        }

    </script>
</html>