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
                        <dd><a href="javascript:;"
                               data-url="${pageContext.request.contextPath}/main/grxx"
                               data-id="grxx"
                               data-title="<i class='layui-icon layui-icon-username'
                            style='font-size: 14px; font-weight: bold; color: #009688;'></i>&nbsp;&nbsp;个人信息"
                               class="site-demo-active"
                               data-type="tabAdd"
                        ><i class="layui-icon layui-icon-username" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;个人信息</a></dd>
                        <dd><a href="javascript:;"
                               data-url="${pageContext.request.contextPath}/main/grxx"
                               data-id="grxx"
                               data-title="<i class='layui-icon layui-icon-read'
                            style='font-size: 14px; font-weight: bold; color: #009688;'></i>&nbsp;&nbsp;所有课程"
                               class="site-demo-active"
                               data-type="tabAdd"
                        ><i class="layui-icon layui-icon-read" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;所有课程</a></dd>
                        <dd><a href="javascript:;"
                               data-url="${pageContext.request.contextPath}/main/grxx"
                               data-id="grxx"
                               data-title="<i class='layui-icon layui-icon-edit'
                            style='font-size: 14px; font-weight: bold; color: #009688;'></i>&nbsp;&nbsp;个人选课"
                               class="site-demo-active"
                               data-type="tabAdd"
                        ><i class="layui-icon layui-icon-edit" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;个人选课</a></dd>
                        <dd><a href="javascript:;"
                               data-url="${pageContext.request.contextPath}/main/grxx"
                               data-id="grxx"
                               data-title="<i class='layui-icon layui-icon-key'
                            style='font-size: 14px; font-weight: bold; color: #009688;'></i>&nbsp;&nbsp;修改密码"
                               class="site-demo-active"
                               data-type="tabAdd"
                        ><i class="layui-icon layui-icon-key" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;修改密码</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">管理员选项</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;"
                               data-url="${pageContext.request.contextPath}/main/grxx"
                               data-id="grxx"
                               data-title="<i class='layui-icon layui-icon-user'
                            style='font-size: 14px; font-weight: bold; color: #009688;'></i>&nbsp;&nbsp;学生管理"
                               class="site-demo-active"
                               data-type="tabAdd"
                        ><i class="layui-icon layui-icon-user" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;学生管理</a></dd>
                        <dd><a href="javascript:;"
                               data-url="${pageContext.request.contextPath}/main/grxx"
                               data-id="grxx"
                               data-title="<i class='layui-icon layui-icon-app'
                            style='font-size: 14px; font-weight: bold; color: #009688;'></i>&nbsp;&nbsp;课程管理"
                               class="site-demo-active"
                               data-type="tabAdd"
                        ><i class="layui-icon layui-icon-app" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;课程管理</a></dd>
                        <dd><a href="javascript:;"
                               data-url="${pageContext.request.contextPath}/main/grxx"
                               data-id="grxx"
                               data-title="<i class='layui-icon layui-icon-form'
                            style='font-size: 14px; font-weight: bold; color: #009688;'></i>&nbsp;&nbsp;专业管理"
                               class="site-demo-active"
                               data-type="tabAdd"
                        ><i class="layui-icon layui-icon-form" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;&nbsp;专业管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div style="padding: 15px">


            <div class="layui-bg-gray" style="padding: 30px;">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md8">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <div class="layui-tab layui-tab-card layui-tab-brief" lay-allowclose="true" lay-filter="demo" style="width: 100%; height: 780px">
                                    <ul class="layui-tab-title">
                                        <li class="layui-this"><i class="layui-icon layui-icon-home" style="font-size: 14px; font-weight: bold; color: #009688;"></i>&nbsp;&nbsp;学校首页</li>
                                    </ul>
                                    <div class="layui-tab-content" style="height: 630px;">
                                        <div class="layui-tab-item layui-show">
                                            <iframe src="${pageContext.request.contextPath}/main/carousel" width="780px" height="350px"></iframe>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md4">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <iframe style="border: 0; width: 400px; height: 260px" src="${pageContext.request.contextPath}/main/zhexian"></iframe>
                                <iframe style="border: 0; width: 400px; height: 260px" src="${pageContext.request.contextPath}/main/bingtu"></iframe>
                                <iframe style="border: 0; width: 400px; height: 260px" src="${pageContext.request.contextPath}/main/zhuzhuang"></iframe>
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

        //触发事件
        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, title) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: title,
                    content: '<iframe data-frameid="' + id
                        + '" scrolling="auto" frameborder="0" src="'
                        + url + '" style="width:100%;height: 730px"></iframe>',
                    id: id
                    //规定好的id
                })
                element.render('tab');

            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            },
            tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i, item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };
        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on(
            'click',
            function () {
                var dataid = $(this);

                //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
                if ($(".layui-tab-title li[lay-id]").length <= 0) {
                    //如果比零小，则直接打开新的tab项
                    active
                        .tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                } else {
                    //否则判断该tab项是否以及存在

                    var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                    $.each($(".layui-tab-title li[lay-id]"),
                        function () {
                            //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                            if ($(this).attr("lay-id") === dataid
                                .attr("data-id")) {
                                isData = true;
                            }
                        })
                    if (isData === false) {
                        //标志为false 新增一个tab项
                        active.tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                    }
                }
                //最后不管是否新增tab，最后都转到要打开的选项页面上
                active.tabChange(dataid.attr("data-id"));
            });
    });
</script>
</body>
</html>
