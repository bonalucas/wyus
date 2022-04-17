<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>五邑大学选课系统首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">五邑大学选课系统</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <li class="layui-nav-item layui-hide-xs">
                <a href="https://www.wyu.edu.cn/" target="_blank">
                    <img src="${pageContext.request.contextPath}/imgs/logo.jpg" style="width: 60px; height: 59px" alt="logo">
                </a>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}/imgs/head.jpg" class="layui-nav-img">
                    用户
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">个人信息</a></dd>
                    <dd><a href="">设置</a></dd>
                    <dd><a href="">注销</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">学生选课</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"><i class="layui-icon layui-icon-username" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;个人信息</a></dd>
                        <dd><a href="javascript:;"><i class="layui-icon layui-icon-read" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;所有课程</a></dd>
                        <dd><a href="javascript:;"><i class="layui-icon layui-icon-edit" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;个人选课</a></dd>
                        <dd><a href="javascript:;"><i class="layui-icon layui-icon-key" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;修改密码</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">管理员选项</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"><i class="layui-icon layui-icon-user" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;学生管理</a></dd>
                        <dd><a href="javascript:;"><i class="layui-icon layui-icon-app" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;课程管理</a></dd>
                        <dd><a href="javascript:;"><i class="layui-icon layui-icon-form" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;专业管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div style="padding: 15px;">五邑大学选课系统！！！</div>
    </div>

    <div class="layui-footer" style="text-align: center; color:#cccccc;">
        五邑大学2020级JavaWeb(必修)
    </div>
</div>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });
    });
</script>
</body>
</html>
