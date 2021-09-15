<!DOCTYPE html>
<html class="x-admin-sm">
    <head>
        <meta charset="UTF-8">
        <title>贷款管理</title>
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
            <a>
              <cite>贷款管理</cite></a>
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
                                    <input type="text" name="repay_person" id="repay_person"  placeholder="还款人" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn" type="button"  id="s_btn" onclick="Loan_search();"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn" onclick="xadmin.open('新增贷款','/loan/preadd',850,600,false)"><i class="layui-icon"></i>添加</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form" id="loans">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>客户类型</th>
                                    <th>保证方式</th>
                                    <th>贷款方式</th>
                                    <th>支付方式</th>
                                    <th>金额</th>
                                    <th>利率</th>
                                    <th>期限（月）</th>
                                    <th>时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="loan_tbody">

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
            pages(1, 10, "","");
        })

        // 数据列表显示
        function pages(page, limit, csr_type,keyword) {
            //    发起异步请求
            $.ajax({
                url: "/loan/query",
                data: {
                    "keyword": keyword,
                    "page": page,
                    "csr_type": csr_type,
                    "limit": limit
                },
                async: false,
                dataType: "json",
                success: function (data) {
                    if(data.code === "200"){
                        var html = "";
                        if(data.result.list.length !== 0){
                            $.each(data.result.list, function (index, loan) {
                                html += "<tr>";
                                html += "<td>" + index+ "</td>";
                                html += "<td>" + loan.loan_repay_person + "</td>";
                                html += "<td>" + display_customer(loan.loan_customer_type)+ "</td>";
                                html += "<td>" + display_Loan_assure_type(loan.loan_assure_type) + "</td>";
                                html += "<td>" + display_loan_mode(loan.loan_mode) + "</td>";
                                html += "<td>" + display_Loan_pay_mode(loan.loan_pay_mode) + "</td>";
                                html += "<td>" + loan.loan_amount_lowcase + "</td>";
                                html += "<td>" + loan.loan_m_rate + "</td>";
                                html += "<td>" + loan.loan_term + "</td>";
                                html += "<td>" + loan.ctime + "</td>";
                                // html += "<td><a class='layui-btn layui-btn-danger layui-btn-xs' lay-event='del' onclick='loan_del(\""+loan.id+"\")'>删除</a></td>";
                                html += "<td>" +
                                            "<a title='查看' onclick='xadmin.open(\"贷款信息\",\"/loan/info/"+loan.id+"\",850,600,false)' href='javascript:;'> <i class='layui-icon'>&#xe63c;</i></a>&nbsp;" +
                                            "<a title='修改' onclick='xadmin.open(\"修改贷款信息\",\"/loan/premodify/"+loan.id+"\",850,600,false)' href='javascript:;'> <i class='layui-icon'>&#xe642;</i></a>&nbsp;" +
                                            "<a title='导出' onclick='loan_export(\""+loan.id+"\")' href='javascript:;'> <i class='layui-icon'>&#xe601;</i></a>&nbsp;" +
                                            "<a title='删除' onclick='loan_del(\""+loan.id+"\")' href='javascript:;'> <i class='layui-icon'>&#xe640;</i></a>" +
                                        "</td>";
                                html += "</tr>";
                            });
                            //后台需要传递总页数、当前页、一页显示多少条记录数给回调函数
                            laypage(data.result.total, data.result.pageNum, data.result.pageSize);
                            $('#pages').show();
                        }else{
                            html = "<tr><td colspan='11' style='text-align:center;' >暂无数据</td></tr>"
                            $('#pages').hide();
                        }

                        $("#loan_tbody").html(html);
                    }else{
                        console.log(data);
                    }
                }
            });
        }

        // 分页渲染
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


        function loan_export(loan_id){
            layui.use(['layer'], function () {
                const layer = layui.layer;
                layer.open({
                    id: 1,
                    type: 1,
                    title: '文件导出路径',
                    area: ['600px', '200px'],
                    content: "<div class='layui-input-inline' style='margin: 7% 0px 0px 25%;'><input style='width: 300px;' type='text' id='export_dir' name='export_dir' placeholder='例如：D:/ofc_tool/export_data' autocomplete='off' class='layui-input'></div>",
                    btn: ['确定', '取消'],
                    yes: function (index, layero) {
                        //获取输入框里面的值
                        const export_dir = $("#export_dir").val();

                        //    发起异步请求
                        $.ajax({
                            url: "/loan/export",
                            data: {
                                "loanId": loan_id,
                                "exportDir": export_dir
                            },
                            async: false,
                            dataType: "json",
                            success: function (data) {
                                layer.alert(data.msg, {
                                    icon: 6
                                });
                                return false;
                            }
                        });
                        layer.close(index);
                    },
                    no: function (index, layero) {
                        layer.close(index);
                    }
                });
            });
        }

        // 数据删除
        function loan_del(id){
            layer.open({
                content: '确认删除？',
                btnAlign: 'c',
                title: '提示',
                btn: ['确定', '取消'],
                yes: function() {
                    $.ajax({
                        url: '/loan/del',
                        async: false, //或false,是否异步
                        data: {
                            "loan_id":id
                        },
                        dataType: 'json',
                        success: function(data) {
                            if(data.code === "200"){
                                layer.alert(data.msg);
                                const csr_type = $("#csr_type").val();
                                const keyword = $("#repay_person").val();
                                pages(1, 10 ,csr_type,keyword);
                            }
                        },
                        error: function(data) {
                            layer.alert('系统登录超时或遇到意外错误，请重新登录，或联系系统管理员!');
                        },
                    })
                }
            });
        }

        function Loan_search(){
            const csr_type = $("#csr_type").val();
            const keyword = $("#repay_person").val();
            pages(1, 10 ,csr_type,keyword);
        }

    </script>
</html>