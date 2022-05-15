<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body style="padding: 20px">
<h1 style="color: #009688">个人信息</h1>
<hr>
<div style="border: #FAFAFA 2px solid;width: 400px;padding:20px">
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" value="${sessionScope.currUser.userid}" disabled="disabled" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" value="${sessionScope.currUser.username}" disabled="disabled" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" value="${sessionScope.currUser.sex == "0" ? "女" : "男"}" disabled="disabled" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">创建时间</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" value="${sessionScope.createtime}" disabled="disabled" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">专业</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" value="${sessionScope.currMajor.majorname}" disabled="disabled" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">总学分</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" value="${sessionScope.currUser.totalcredits}" disabled="disabled" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" value="${sessionScope.currUser.remarks}" disabled="disabled" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">照片</label>
        <img src="${pageContext.request.contextPath}/imgs/${sessionScope.currUser.picture}" width="100px" height="100px" style="margin-left: 20px">
    </div>
</form>
</div>
</body>
</html>