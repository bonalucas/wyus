<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>carousel</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>
<body>

<div class="layui-carousel" id="test1" lay-filter="test1">
    <div carousel-item=""  data-value="hover">
        <div><img src="${pageContext.request.contextPath}/imgs/backgrounds/pic1.jpg"></div>
        <div><img src="${pageContext.request.contextPath}/imgs/backgrounds/pic2.jpg"></div>
        <div><img src="${pageContext.request.contextPath}/imgs/backgrounds/pic3.jpg"></div>
        <div><img src="${pageContext.request.contextPath}/imgs/backgrounds/pic4.png"></div>
    </div>
</div>
<!-- 条目中可以是任意内容，如：<img src=""> -->

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '780px' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            ,height: '350px'
        });
    });
</script>
</body>
</html>
