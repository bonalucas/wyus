<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>课程管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>
<body>
<%--表单窗口--%>
<div class="site-text" style="margin: 5%; display: none" id="window"  target="test123">
    <form class="layui-form" id="book" method="post" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label">课程名称</label>
            <div class="layui-input-block">
                <input type="text" id="wcourname" name="wcourname" lay-verify="title" autocomplete="off" placeholder="请输入课程名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属学期</label>
            <div class="layui-input-block">
                <input type="number" id="wsemester" name="wsemester" lay-verify="title" autocomplete="off" placeholder="请输入名称所属学期" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学时</label>
            <div class="layui-input-block">
                <input type="number" id="wperiod" name="wperiod" lay-verify="title" autocomplete="off" placeholder="请输入学时" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学分</label>
            <div class="layui-input-block">
                <input type="number" id="wcredit" name="wcredit" lay-verify="title" autocomplete="off" placeholder="请输入学分" class="layui-input">
            </div>
        </div>
    </form>
</div>

<div class="demoTable">
    搜索课程名字：
    <div class="layui-inline">
        <input class="layui-input" name="courname" id="courname" autocomplete="off" placeholder="请输入课程名称">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add">添加课程信息</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
</script>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'${pageContext.request.contextPath}/backstage/man/showManCourses'
            ,toolbar: '#toolbarDemo'
            ,id: 'getCourse'
            ,defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,where: {
                courname: ''
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
                ,{field:'courid', title:'课程编号', width:120, fixed: 'left', unresize: true, sort: true}
                ,{field:'courname', title:'课程名称', width:150, sort: true}
                ,{field:'semester', title:'所属学期', width:120, sort: true}
                ,{field:'period', title:'学时', width:100, sort: true}
                ,{field:'credit', title:'学分', width:90,  sort: true}
                ,{fixed: 'right', title:'操作', width:150, toolbar: '#barDemo'}
            ]]
            ,page: true
            ,limits:[10,20]
        });

        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#courname');
                //执行重载
                table.reload('getCourse', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        courname: demoReload.val()
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
                case 'add':
                    layer.open({
                        type: 1,
                        skin: 'layui-layer-molv',
                        title:"新增课程信息",
                        area:['50%','50%'],
                        btn: ['提交', '取消'],
                        content: $("#window"),
                        yes:function(index){
                            $.ajax({
                                url: "${pageContext.request.contextPath}/backstage/man/addCourse",
                                type: "post",
                                data: {
                                    'courname': $('#wcourname').val(),
                                    'semester': $('#wsemester').val(),
                                    'period': $('#wperiod').val(),
                                    'credit': $('#wcredit').val()
                                },
                                dataType: "text",
                                success: function (res1){
                                    if (res1 === "1") {
                                        layer.msg("添加成功", {icon: 6})
                                        // 关闭弹出层
                                        layer.close(index);
                                        // 刷新表格
                                        table.reload('getCourse');
                                    }else{
                                        layer.msg("添加失败，系统异常", {icon: 5})
                                    }
                                }
                            });
                        }
                    });
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('确定删除《' + data.courname +'》课程吗', function(index){
                    $.ajax({
                        url: "${pageContext.request.contextPath}/backstage/man/deleteCourse",
                        type: "post",
                        data: {'courid': data.courid},
                        dataType: "text",
                        success: function (res1){
                            if (res1 === "1") {
                                layer.msg("删除成功", {icon: 6})
                                // 刷新表格
                                table.reload('getCourse');
                            }else{
                                layer.msg("删除失败，系统异常", {icon: 5})
                            }
                        }
                    });
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type: 1,
                    skin: 'layui-layer-lan',
                    title:"修改课程信息",
                    area:['50%','50%'],
                    btn: ['提交', '取消'],
                    content: $("#window"),
                    success:function(){
                        $('#wcourname').val(data.courname);
                        $('#wsemester').val(data.semester);
                        $('#wperiod').val(data.period);
                        $('#wcredit').val(data.credit);
                    },
                    yes:function(index){
                        $.ajax({
                            url: "${pageContext.request.contextPath}/backstage/man/updateCourse",
                            type: "post",
                            data: {
                                'courid': data.courid,
                                'courname': $('#wcourname').val(),
                                'semester': $('#wsemester').val(),
                                'period': $('#wperiod').val(),
                                'credit': $('#wcredit').val()
                            },
                            dataType: "text",
                            success: function (res1){
                                if (res1 === "1") {
                                    layer.msg("修改成功", {icon: 6})
                                    // 关闭弹出层
                                    layer.close(index);
                                    // 刷新表格
                                    table.reload('getCourse');
                                }else{
                                    layer.msg("修改失败，系统异常", {icon: 5})
                                }
                            }
                        });
                    },
                    end: function (){
                        $('#wcourname').val('');
                        $('#wsemester').val('');
                        $('#wperiod').val('');
                        $('#wcredit').val('');
                    }
                });
            }
        });
    });
</script>
</body>
</html>
