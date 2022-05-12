<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>轮播图</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>
<body>

<div class="layui-carousel" id="test1" lay-filter="test1">
    <div carousel-item=""  data-value="hover">
        <div><img src="${pageContext.request.contextPath}/imgs/backgrounds/pic01.jpg" style="height: 350px; width: 800px" alt=""></div>
        <div><img src="${pageContext.request.contextPath}/imgs/backgrounds/pic02.jpg" style="height: 350px; width: 800px" alt=""></div>
        <div><img src="${pageContext.request.contextPath}/imgs/backgrounds/pic03.jpg" style="height: 350px; width: 800px" alt=""></div>
        <div><img src="${pageContext.request.contextPath}/imgs/backgrounds/pic04.jpg" style="height: 350px; width: 800px" alt=""></div>
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
            ,width: '800px' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            ,height: '350px'
        });
    });
</script>
</body>
</html>
