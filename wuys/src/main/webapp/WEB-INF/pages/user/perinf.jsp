<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.min.js"></script>
</head>
<body style="padding: 20px">
<div id="uppic" style="display:none;">
    <div class="layui-upload"  style="position: absolute; left: 100px; top: 50px">
        <div class="layui-upload-list">
            <img class="layui-upload-img" id="demo1" style="width: 200px; height: 200px"
                 alt="照片" src="${pageContext.request.contextPath}/imgs/${sessionScope.currUser.picture}">
            <p id="demoText"></p>
        </div>
        <br>
        <button type="button" class="layui-btn" id="test1">上传图片</button>
    </div>
</div>
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
            <label class="layui-form-label">姓名</label>
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
            <a href="javascript:updatePicture();">
                <img src="${pageContext.request.contextPath}/imgs/${sessionScope.currUser.picture}"
                 onmouseover="this.src='${pageContext.request.contextPath}/imgs/updatePicture.png'"
                 onmouseout="this.src='${pageContext.request.contextPath}/imgs/${sessionScope.currUser.picture}'"
                 width="100px" height="100px" style="margin-left: 20px" alt="个人头像">
            </a>
        </div>
    </form>
</div>
<script type="text/javascript">
    function updatePicture(){
        layer.open({
            type: 1,
            skin: 'layui-layer-rim',
            area: ['400px', '500px'],
            title: '更新照片',
            content: $("#uppic"),
            cancel: function () {
                $("#uppic").hide()
            }
        });
    }
    layui.use(['upload', 'layer'], function() {
        var $ = layui.jquery
            , upload = layui.upload
            , layer = layui.layer;

        var uploadInst = upload.render({
            elem: '#test1'
            , url: '${pageContext.request.contextPath}/backstage/user/upload'
            , accept:'images'
            , acceptMime: 'image/*'
            , before: function (obj) {
                //预先回显图片
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result);
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                layer.msg('更新图片中', {icon: 16, time: 1000},function (){
                    $('#demoText').html(''); //置空上传失败的状态
                    window.parent.location.href = "${pageContext.request.contextPath}/backstage/user/updateSession?userId=" + ${sessionScope.currUser.userid}
                });
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    });
</script>
</body>
</html>
