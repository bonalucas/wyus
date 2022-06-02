<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery.md5.js"></script>
</head>
<body style="padding: 20px">
    <h1 style="color: #009688">修改密码</h1>
    <hr>
    <div style="border: #FAFAFA 2px solid;width: 800px;padding:20px">
        <form class="layui-form layui-form-pane" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">旧密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="old_password" name="old_password" lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux" id="old_msg"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="new_password" name="new_password" lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux" id="new_msg"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认新密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="curr_password" name="curr_password" lay-verify="required" placeholder="请再次确认新密码" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux" id="curr_msg"></div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <button class="layui-btn" lay-submit="" lay-filter="demo">提交</button>
                </div>
            </div>
        </form>
    </div>

<script>
    layui.use(['form','jquery'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,$ = layui.$

        $('#old_password').blur(function () {
            var oldPasswordVal = $('#old_password').val();
            if (oldPasswordVal === "") {
                $('#old_msg').text("旧密码不可为空");
            }else{
                $('#old_msg').text("");
                var md5OldVal = $.md5(oldPasswordVal);
                $.ajax({
                    url: "${pageContext.request.contextPath}/backstage/user/checkPwd",
                    data: {password: md5OldVal},
                    dataType: "text",
                    success: function (data){
                        if (data === "1") {
                            layer.msg("自动校验成功，输入密码与原密码一致", {icon: 6})
                        }else {
                            layer.msg("输入密码与原密码不匹配，请重新输入",{icon: 5})
                            $('#old_password').val("");
                        }
                    }
                })
            }
        });
        $('#new_password').blur(function () {
            var newPasswordVal = $('#new_password').val();
            if (newPasswordVal === "") {
                $('#new_msg').text("新密码不可为空");
            }else{
                $('#new_msg').text("");
            }
        });
        $('#curr_password').blur(function () {
            var newPasswordVal = $('#new_password').val();
            var currPasswordVal = $('#curr_password').val();
            if (newPasswordVal === currPasswordVal) {
                $('#curr_msg').text("");
            }else{
                $('#curr_msg').text("两次密码输入不一致");
            }
        });
        //提交事件
        form.on('submit(demo)', function(){
            var md5NewVal = $.md5($('#new_password').val());
            $.ajax({
                url: "${pageContext.request.contextPath}/backstage/user/updatePwd",
                data: {password: md5NewVal},
                dataType: "text",
                success: function (res){
                    if (res === "1") {
                        alert("修改成功")
                    }else{
                        alert("修改失败")
                    }
                }
            });
        });
    });
</script>
</body>
</html>
