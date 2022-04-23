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
            <div style="text-align: center;padding-bottom: 15px;padding-top: 15px;padding-right: 25px">
                <a href="javascript:;" style="text-align: center">
                    <img src="${pageContext.request.contextPath}/imgs/head.jpg" class="layui-nav-img" style="width:110px; height: 110px">
                    <p style="color: #FFFFFF">
                        欢迎，用户
                    </p>
                </a>
            </div>
            <hr>
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
        <div style="padding: 15px">
            <div class="layui-tab layui-tab-card layui-tab-brief" lay-allowclose="true" style="width: 70%">
                <ul class="layui-tab-title">
                    <li class="layui-this"><i class="layui-icon layui-icon-home" style="font-size: 14px; font-weight: bold; color: #009688;"></i>&nbsp;&nbsp;学校首页</li>
                    <li>用户基本管理</li>
                    <li>权限分配</li>
                    <li>商品管理</li>
                    <li>订单管理</li>
                </ul>
                <div class="layui-tab-content" style="height: 630px;">
                    <div class="layui-tab-item layui-show">
                        <iframe src="${pageContext.request.contextPath}/main/carousel" width="800px" height="350px"></iframe>
                    </div>
                    <div class="layui-tab-item">2</div>
                    <div class="layui-tab-item">3</div>
                    <div class="layui-tab-item">4</div>
                    <div class="layui-tab-item">5</div>
                    <div class="layui-tab-item">6</div>
                </div>
            </div>

            <div class="layui-bg-gray" style="padding: 30px;">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md8">
                        <div class="layui-card">
                            <div class="layui-card-header">卡片面板</div>
                            <div class="layui-card-body">
                                <iframe frameborder="0" src="${pageContext.request.contextPath}/main/carousel"></iframe>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <div class="layui-card">
                            <div class="layui-card-header">卡片面板</div>
                            <div class="layui-card-body">
                                <iframe style="border: 0; width: 500px; height: 180px " src="${pageContext.request.contextPath}/main/zhexian"></iframe>
                            </div>
                            <div class="layui-card-body">
                                <iframe style="border: 0" src="${pageContext.request.contextPath}/main/bingtu"></iframe>
                            </div>
                            <div class="layui-card-body">
                                <iframe style="border: 0" scrolling="no" src="${pageContext.request.contextPath}/main/zhuzhuang"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                    title:'学校简介'
                    ,type: 1
                    ,content: '<iframe src="${pageContext.request.contextPath}/main/jianjie" width="260px" height="100%"></iframe>'
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
