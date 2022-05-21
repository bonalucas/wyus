<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/supersized.css">
    <link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/imgs/logo.png">
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
            height: 350px;
            background-color: rgba(255,255,255,0.5);
            position: absolute;
            top: 175px;
            right: 200px;
            border-radius: 10px;
            text-align: center;
        }

        #sp1{
            margin-top: 20px;
            font-size: 25px;
            font-weight: bold;
            color: rgba(0,0,0,.7);
        }
        table{
            border-spacing: 5px 20px;
        }
        table tr td input{
            width: 260px;
            height: 35px;
            border: 1px rgba(0,0,0,.5) solid;
            border-radius: 7px;
            background-color: rgba(255,255,255,0.5);
        }
        .txt{
            color: rgba(0,0,0,.8);
        }
        .sub{
            width: 100px;
            height: 40px;
            color: rgba(0,0,0,.8);
            font-size: 16px;
            border: 2px rgba(0,0,0,.5) solid;
            background-color: rgba(255,255,255,0.5);
            font-weight: bold;
            border-radius: 5px;
        }
        .sub:hover{
            background-color: rgba(255,255,255,0.5);
        }
        #sp2{
            font-size: 11px;
            color: rgba(0,0,0,.8);
            text-shadow:  0 0 10px black;
        }
        #sp2:hover{
            color: rgba(0,0,0,.5);
        }
        input::-ms-input-placeholder{
            text-align: center;
        }
        input::-webkit-input-placeholder{
            text-align: center;
        }
    </style>
</head>
<body>
<div id="div1">
    <div id="sp1">注册</div>
    <form action="${pageContext.request.contextPath}/reception/user/doRegister" method="post">
        <input type="hidden" name="password" id="pwd">
        <table>
            <tr>
                <td><svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
                    <path d="M12 0c6.623 0 12 5.377 12 12s-5.377 12-12 12-12-5.377-12-12 5.377-12 12-12zm8.127 19.41c-.282-.401-.772-.654-1.624-.85-3.848-.906-4.097-1.501-4.352-2.059-.259-.565-.19-1.23.205-1.977 1.726-3.257 2.09-6.024 1.027-7.79-.674-1.119-1.875-1.734-3.383-1.734-1.521 0-2.732.626-3.409 1.763-1.066 1.789-.693 4.544 1.049 7.757.402.742.476 1.406.22 1.974-.265.586-.611 1.19-4.365 2.066-.852.196-1.342.449-1.623.848 2.012 2.207 4.91 3.592 8.128 3.592s6.115-1.385 8.127-3.59zm.65-.782c1.395-1.844 2.223-4.14 2.223-6.628 0-6.071-4.929-11-11-11s-11 4.929-11 11c0 2.487.827 4.783 2.222 6.626.409-.452 1.049-.81 2.049-1.041 2.025-.462 3.376-.836 3.678-1.502.122-.272.061-.628-.188-1.087-1.917-3.535-2.282-6.641-1.03-8.745.853-1.431 2.408-2.251 4.269-2.251 1.845 0 3.391.808 4.24 2.218 1.251 2.079.896 5.195-1 8.774-.245.463-.304.821-.179 1.094.305.668 1.644 1.038 3.667 1.499 1 .23 1.64.59 2.049 1.043z"></path>
                </svg></td>
                <td><input type="text" class="txt" name="userid" id="userid" placeholder="请输入账号"></td>
            </tr>
            <tr>
                <td><svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
                    <path d="M4.323 9.699c-.127-.144-.235-.295-.323-.454v-3.021l-3-1.537 10.956-4.687 10.044 5.502h-.001.001v3.498l1 2h-3l1-2v-3.097l-2 .802v2.49c-.08.163-.188.318-.318.466.347.95.398 2.083.404 2.635 1.36-.482 2.645.822 2.364 3.108-.203 1.66-1.147 2.94-2.526 3.431-2.417 4.773-6.285 5.144-7.415 5.144-1.129 0-4.998-.372-7.414-5.144-1.38-.491-2.324-1.771-2.527-3.431-.296-2.433 1.141-3.583 2.364-3.104.007-.551.057-1.66.391-2.601zm13.53.639c-1.668 1.039-4.56 1.557-6.5 1.557-2.112 0-4.655-.498-6.202-1.5-.156.619-.24 1.293-.24 2.024 0 .528-.425.917-.898.917-.121 0-.244-.025-.365-.08-.061-.028-.153-.05-.257-.05-.112 0-.236.026-.345.099-.899.594-.805 3.834 1.395 4.594.22.076.405.238.511.45 2.162 4.296 5.565 4.63 6.557 4.63s4.396-.334 6.557-4.63c.107-.212.291-.374.511-.45 2.199-.76 2.294-4 1.396-4.594-.367-.245-.636.031-.968.031-.472 0-.898-.387-.898-.917 0-.753-.088-1.447-.254-2.081zm.147-1.418c-.82 1.107-4.19 1.975-6.647 1.975-2.762 0-5.512-.857-6.353-1.946v-2.214l6.114 3.133 6.886-2.761v1.813zm-6.097-7.81l7.76 4.251-8.499 3.41-7.812-4.002 8.551-3.659z"></path>
                </svg></td>
                <td><input type="text" class="txt" name="username" id="username" placeholder="请输入姓名"></td>
            </tr>
            <tr>
                <td><svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
                    <path d="M16 1c-4.418 0-8 3.582-8 8 0 .585.063 1.155.182 1.704l-8.182 7.296v5h6v-2h2v-2h2l3.066-2.556c.909.359 1.898.556 2.934.556 4.418 0 8-3.582 8-8s-3.582-8-8-8zm-6.362 17l3.244-2.703c.417.164 1.513.703 3.118.703 3.859 0 7-3.14 7-7s-3.141-7-7-7c-3.86 0-7 3.14-7 7 0 .853.139 1.398.283 2.062l-8.283 7.386v3.552h4v-2h2v-2h2.638zm.168-4l-.667-.745-7.139 6.402v1.343l7.806-7zm10.194-7c0-1.104-.896-2-2-2s-2 .896-2 2 .896 2 2 2 2-.896 2-2zm-1 0c0-.552-.448-1-1-1s-1 .448-1 1 .448 1 1 1 1-.448 1-1z"></path>
                </svg></td>
                <td><input type="password" class="txt" id="currpwd" placeholder="请输入密码"></td>
            </tr>
            <tr>
                <td><svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
                    <path d="M12 0c-3.371 2.866-5.484 3-9 3v11.535c0 4.603 3.203 5.804 9 9.465 5.797-3.661 9-4.862 9-9.465v-11.535c-3.516 0-5.629-.134-9-3zm0 1.292c2.942 2.31 5.12 2.655 8 2.701v10.542c0 3.891-2.638 4.943-8 8.284-5.375-3.35-8-4.414-8-8.284v-10.542c2.88-.046 5.058-.391 8-2.701zm5 7.739l-5.992 6.623-3.672-3.931.701-.683 3.008 3.184 5.227-5.878.728.685z"></path>
                </svg></td>
                <td>
                    <input type="text" style="width: 120px" class="txt" name="code" id="mycode" placeholder="请输入验证码">
                    <a href="javascript:void(0)"><img src="${pageContext.request.contextPath}/reception/verificationcodeimg" id="code" onclick="reloadcode()" alt="验证码" style="position:absolute; right: 130px; width: 80px;height: 33px; border: 1px rgba(0,0,0,.5) solid"></a>
                    <a href="javascript:reloadcodeByA();" style="position: absolute; right: 40px; top: 255px; text-decoration: none" id="next">
                        <span id="sp2">看不清，换一张</span>
                    </a>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input class="sub" type="submit" id="regist" value="注&nbsp;&nbsp;册">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="sub" type="button" id="back" value="返&nbsp;&nbsp;回">
                </td>
            </tr>
        </table>
    </form>
</div>
<script type="text/javascript">
    function reloadcode() {
        var verify = document.getElementById('code');
        verify.setAttribute("src", "${pageContext.request.contextPath}/reception/verificationcodeimg?it=" + Math.random());
    }
    function reloadcodeByA() {
        var verify = $("#next").prev().children();
        verify[0].setAttribute("src", "${pageContext.request.contextPath}/reception/verificationcodeimg?it=" + Math.random());
    }
    $("#back").click(function (){
       window.location.href="${pageContext.request.contextPath}/reception/toLogin";
    });
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
    // 正则检测当前账号是否存在字母
    var regString = /[a-zA-Z]+/;
    $("#userid").blur(function (){
        var useridVal = $("#userid").val();
        if (useridVal === "") {
            layer.msg('账号不可为空', {
                offset: 't',
                anim: 6,
                area:['200px','50px']
            });
        }else{
            if (regString.test(useridVal)) {
                layer.msg('账号不可出现字母', {
                    offset: 't',
                    anim: 6,
                    area:['200px','50px']
                });
                document.getElementById('regist').setAttribute("disabled", "disabled");
            }else{
                $.ajax({
                    url: "${pageContext.request.contextPath}/reception/user/checkUser",
                    data:{userid:useridVal},
                    dataType:"text",
                    success:function (data){
                        layer.msg(data, {
                            offset: 't',
                            anim: 2,
                            area:['200px','50px']
                        });
                        document.getElementById('regist').removeAttribute("disabled");
                    }
                });
            }
        }
    });
    $("#username").blur(function (){
        var usernameVal = $("#username").val();
        if (usernameVal === "") {
            layer.msg('名字不可为空', {
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
                area:['220px','50px']
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
