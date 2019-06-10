<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <base href="${basePath}">
        <meta charset="UTF-8">
        <title>用户编辑页-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="stylesheet" href="static/css/font.css">
        <link rel="stylesheet" href="static/css/xadmin.css">
        <script src="static/jQuery/jquery-3.4.0.js"></script>
        <script src="static/lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="static/js/xadmin.js"></script>
        <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
        <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                  <div class="layui-form-item">
                      <label for="power" class="layui-form-label">
                          <span class="x-red">*</span>权限
                      </label>
                      <div class="layui-input-inline">
                          <input type="text" id="power" name="power" required="" lay-verify="power" autocomplete="off" class="layui-input">
                      </div>
                      <div class="layui-form-mid layui-word-aux">
                          <span class="x-red">*</span>将会成为您唯一的登入名
                      </div>
                  </div>

                  <div class="layui-form-item">

                      <button  class="layui-btn" lay-filter="add" lay-submit="">
                          增加
                      </button>
                  </div>
              </form>
            </div>
        </div>
        <script>layui.use(['form', 'layer'],
            function() {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    power: function(value) {
                        if (value.length < 2||value.length>16) {
                            return '长度在2-16之间';
                        }
                    },




                    // power:function (value) {
                    //     var ok=false;
                    //     $.ajax({
                    //         url:'power/checkPower.do',
                    //         data:{
                    //             username:value
                    //         },
                    //         method:'get',
                    //         dataType:'json',
                    //         async :false,/*设置同步请求*/
                    //         success:function (res) {
                    //             ok=res.code==1;
                    //         },
                    //         error:function (e) {
                    //          console.log(e);
                    //             layer.msg("与服务器链接失败",{icon: 5})
                    //         }
                    //     });
                    //     if (ok){
                    //         return '用户名已存在';
                    //     }
                    // }
                });

                //监听提交
                form.on('submit(add)',
                function(data) {
                    //发异步，把数据提交给php
                    $.ajax({
                        url:'power/doEdit.do',
                        data:data.field,
                        method: 'post',
                        dataType:'json',
                        success:function (res) {
                            layer.alert(res.msg,{icon:6},function () {
                                if (res.code==1){
                                    //关闭当前frame
                                    xadmin.close();

                                    // 可以对父窗口进行刷新
                                    xadmin.father_reload();
                                }
                            });

                        },
                        error:function (e) {
                            layer.alert("与服务器连接失败，请稍后再试");
                            console.log(e);
                        }
                    });
                    return false;
                });

            });</script>

    </body>

</html>
