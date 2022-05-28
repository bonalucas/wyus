<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>学生管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>
<body>
<%--表单窗口--%>
<div class="site-text" style="margin: 5%; display: none" id="window"  target="test123">
    <form class="layui-form" id="form" method="post" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label">学生编号</label>
            <div class="layui-input-block">
                <input type="text" id="wuserid" name="wuserid" lay-verify="title" autocomplete="off" class="layui-input" disabled="disabled">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学生名称</label>
            <div class="layui-input-block">
                <input type="text" id="wusername" name="wusername" lay-verify="title" autocomplete="off" class="layui-input" disabled="disabled">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="wsex" value="1" title="男">
                <input type="radio" name="wsex" value="0" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">专业名称</label>
            <div class="layui-input-block">
                <select name="wmajorname" id="wmajorname" lay-filter="wmajorname" lay-search>
                    <c:forEach var="major" items="${requestScope.majorList}">
                        <option value="${major.majorid}">${major.majorname}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">总学分</label>
            <div class="layui-input-block">
                <input type="number" id="wtotalcredits" name="wtotalcredits" lay-verify="title" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
</div>

<div class="demoTable">
    搜索学生名字：
    <div class="layui-inline">
        <input class="layui-input" name="username" id="username" autocomplete="off" placeholder="请输入学生名称">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
</script>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<script>
    layui.use(['table','form'], function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'${pageContext.request.contextPath}/backstage/man/showManStudent'
            ,toolbar: '#toolbarDemo'
            ,id: 'getStudent'
            ,defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,where: {
                username: ''
            }
            ,height: 650
            ,parseData:function(res) {
                return {
                    "code" : 0,
                    "msg" : "",
                    "count" : res.total,
                    "data": res.list
                }
            }
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'userid', title:'学生编号', width:120, fixed: 'left', unresize: true, sort: true}
                ,{field:'username', title:'学生名称', width:120, sort: true}
                ,{field:'sex', title:'性别', width:80, sort: true, templet: '<div>{{d.sex == 1 ? "男" : "女"}}</div>'}
                ,{field:'majorname', title:'专业名称', width:160, sort: true}
                ,{field:'totalcredits', title:'总学分', width:100, sort: true}
                ,{fixed: 'right', title:'操作', width:150, toolbar: '#barDemo'}
            ]]
            ,page: true
            ,limits:[10,20]
        });

        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#username');
                //执行重载
                table.reload('getStudent', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        username: demoReload.val()
                    }
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            var form = layui.form;
            if(obj.event === 'edit'){
                layer.open({
                    type: 1,
                    skin: 'layui-layer-molv',
                    title:"修改学生信息",
                    area:['50%','50%'],
                    btn: ['提交', '取消'],
                    content: $("#window"),
                    success:function(){
                        form.val("example",{
                            "wuserid": data.userid,
                            "wusername": data.username,
                            "wsex": data.sex,
                            "wmajorname": data.majorid,
                            "wtotalcredits": data.totalcredits
                        });
                    },
                    yes:function(index){
                        $.ajax({
                            url: "${pageContext.request.contextPath}/backstage/man/updateUser",
                            type: "post",
                            data: {
                                'userid': data.userid,
                                'sex': $('input[name="wsex"]:checked').val(),
                                'majorid': $('#wmajorname option:selected').val(),
                                'totalcredits': $('#wtotalcredits').val()
                            },
                            dataType: "text",
                            success: function (res1){
                                if (res1 === "1") {
                                    layer.msg("修改成功", {icon: 6})
                                    // 关闭弹出层
                                    layer.close(index);
                                    // 刷新表格
                                    table.reload('getStudent');
                                }else{
                                    layer.msg("修改失败，系统异常", {icon: 5})
                                }
                            }
                        });
                    }
                });
            }
        });
    });
</script>
</body>
</html>
