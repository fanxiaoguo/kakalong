<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <base href="${basePath}">
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="static/css/font.css">
    <link rel="stylesheet" href="static/css/xadmin.css">
    <script src="static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="static/js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
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
                            <select name="cateid">
                                <option>规则分类</option>
                                <option>文章</option>
                                <option>会员</option>
                                <option>权限</option>
                            </select>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <select name="contrller">
                                <option>请控制器</option>
                                <option>Index</option>
                                <option>Goods</option>
                                <option>Cate</option>
                            </select>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <select name="action">
                                <option>请方法</option>
                                <option>add</option>
                                <option>login</option>
                                <option>checklogin</option>
                            </select>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon"></i>增加</button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                    <button type="button" class="layui-btn layui-btn-sm " onclick="xadmin.open('添加用户','power/toEdit.do',600,400)">添加</button>
                </div>

                <table class="layui-table" id="test" lay-filter="infoTable"></table>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/html" id="barDemo">
        <button type="button" class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        <button type="button" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
    </script>

<script>
    layui.use('table', function(){
    var table = layui.table;

    table.render({
    elem: '#test'
    , page:true
    ,url:'power/powerSj.do'
    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
    ,cols: [[
            {type: 'checkbox', fixed: 'left'},
    {field:'id', title: 'ID', sort: true}
    ,{field:'power', title: '权限'} //width 支持：数字、百分比和不填写。你还可以通过 minWidth 参数局部定义当前单元格的最小宽度，layui 2.2.1 新增
    ,{field:'status', title: '状态'}
    ,{field:'createDate', title: '创建时间'}
    ,{field:'createAdmin', title: '创建人'}
    ,{field:'updateDate', title: '修改时间'} //单元格内容水平居中
    ,{field:'updateAdmin', title: '修改人'} //单元格内容水平居中
    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}

        ]]
    });
        table.on('tool(infoTable)',function (data) {
            if (data.event=='del'){

                layer.confirm("确定删除本数据吗",function () {
                    $.ajax({
                        url: 'power/delete.do',
                        data:{
                            id:data.data.id
                        },
                        method:'post',
                        dataType:'json',
                        success:function (res) {
                            layer.alert(res.msg,function (index) {
                                layer.close(index);
                                if (res.code==1){
                                    table.reload('test');/*重载表格*/
                                }
                            });

                        },
                        error:function (e) {
                            console.log(e);
                            layer.alert("与服务器连接失败，请稍后再试");
                        }
                    })
                })
            }
        });
    });





    function delAll (argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</html>