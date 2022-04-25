<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/supersized.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/supersized.3.2.7.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/supersized-init.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery.md5.js"></script>
<%-- 登录界面样式 --%>
    <style>
        *{
            margin: 0 auto;
            padding: 0;
        }
        #div1{
            width: 450px;
            height: 300px;
            background-color: #FFFFFF;
            position: absolute;
            top: 200px;
            right: 200px;
            border-radius: 10px;
            text-align: center;
        }

        #sp1{
            margin-top: 20px;
            font-size: 25px;
            font-weight: bold;
            color: #0074BB;
        }
        table{
            border-spacing: 5px 20px;
        }
        table tr td input{
            width: 260px;
            height: 35px;
            border: 1px #0074BB solid;
            border-radius: 3px;
        }
        .txt{
            color: #0074BB;
        }
        .sub{
            width: 100px;
            height: 40px;
            color: #FFFFFF;
            font-size: 16px;
            border: none;
            background-color: #0074BB;
            font-weight: bold;
            border-radius: 5px;
        }
        .sub:hover{
            background-color: #0083CB;
        }
        #sp2{
            font-size: 11px;
        }
        #sp2:hover{
            color: #111111;
        }
    </style>
</head>
<body>
<div id="div1">
    <div id="sp1">五邑大学-选课系统-注册</div>
    <form action="${pageContext.request.contextPath}/doRegister" method="post">
        <input type="hidden" name="password" id="pwd">
        <table>
            <tr>
                <td>账号</td>
                <td><input type="text" class="txt" name="username" id="username"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" class="txt" id="currpwd"></td>
            </tr>
            <tr>
                <td>验证码</td>
                <td>
                    <input type="text" style="width: 100px" class="txt" name="code" id="mycode">
                    <img src="${pageContext.request.contextPath}/verificationcodeimg" id="code" onclick="reloadcode()" alt="验证码" style="position:absolute; right: 130px; width: 80px;height: 40px">
                    <a href="javascript:reloadcodeByA();" style="position: absolute; right: 25px; top: 190px; text-decoration: none" id="next">
                        <span id="sp2">看不清，换一张</span>
                    </a>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input class="sub" type="submit" value="注&nbsp;&nbsp;册">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="sub" type="button" id="back" value="返&nbsp;&nbsp;回">
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    function reloadcode() {
        var verify = document.getElementById('code');
        verify.setAttribute("src", "${pageContext.request.contextPath}/verificationcodeimg?it=" + Math.random());
    }
    function reloadcodeByA() {
        var verify = $("#next").prev();
        verify[0].setAttribute("src", "${pageContext.request.contextPath}/verificationcodeimg?it=" + Math.random());
    }
    $("#back").click(function (){
       window.location.href="${pageContext.request.contextPath}/login";
    });
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
    $("#username").blur(function (){
        var usernameVal = $("#username").val();
        if (usernameVal === "") {
            layer.msg('账号不可为空', {
                offset: 't',
                anim: 6,
                area:['200px','50px']
            });
        }
    });
    $("#currpwd").blur(function (){
        var pwdVal = $("#currpwd").val();
        if (pwdVal === "") {
            layer.msg('密码不可为空', {
                offset: 't',
                anim: 6,
                area:['200px','50px']
            });
        }else{
            var pwd = ($.md5($("#currpwd").val()));
            $("#pwd").val(pwd);
        }
    });
    $("#mycode").blur(function (){
        var codeVal = $("#mycode").val();
        if (codeVal === "" || codeVal.length !== 4) {
            layer.msg('请输入正确格式的验证码', {
                offset: 't',
                anim: 6,
                area:['250px','50px']
            });
        }
    });
    var flag = ${errorMessage != null ? true : false};
    if (flag) {
        layer.alert('${errorMessage}', {
            skin: 'layui-layer-lan'
            ,title: '注册失败'
            ,closeBtn: 0
            ,anim: 6
            ,icon: 5
        });
    }
</script>
</body>
</html>
