<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>公告管理</title>
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
            <label class="layui-form-label">公告内容</label>
            <div class="layui-input-block">
                <textarea id="notContent" required lay-verify="required" placeholder="请输入公告内容" class="layui-textarea" style="height: 210px"></textarea>
            </div>
        </div>
    </form>
</div>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add">添加公告信息</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-radius layui-btn-normal" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
</script>


<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<script>
    layui.use(['table','jquery'], function(){
        var table = layui.table
            ,$ = layui.$;

        table.render({
            elem: '#test'
            ,url:'${pageContext.request.contextPath}/backstage/man/showManNotice'
            ,toolbar: '#toolbarDemo'
            ,id: 'getNotice'
            ,defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,height: 680
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
                ,{field:'noticeid', title:'公告编号', width:120, fixed: 'left', unresize: true, sort: true}
                ,{field:'content', title:'公告内容', width:300, sort: true}
                ,{field:'formatTime', title:'生成时间', width:200, sort: true}
                ,{fixed: 'right', title:'操作', width:120, toolbar: '#barDemo'}
            ]]
            ,page: true
            ,limits:[10,20]
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            switch(obj.event){
                case 'add':
                    layer.open({
                        type: 1,
                        skin: 'layui-layer-molv',
                        title:"新增公告信息",
                        area:['50%','50%'],
                        btn: ['提交', '取消'],
                        content: $("#window"),
                        yes:function(index){
                            $.ajax({
                                url: "${pageContext.request.contextPath}/backstage/man/addNotice",
                                type: "post",
                                data: {
                                    'content': $('#notContent').val()
                                },
                                dataType: "text",
                                success: function (res1){
                                    if (res1 === "1") {
                                        layer.msg("添加成功", {icon: 6})
                                        // 关闭弹出层
                                        layer.close(index);
                                        // 刷新表格
                                        table.reload('getNotice');
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
                layer.confirm('确定删除这条公告吗', function(){
                    $.ajax({
                        url: "${pageContext.request.contextPath}/backstage/man/deleteNotice",
                        type: "post",
                        data: {'noticeid': data.noticeid},
                        dataType: "text",
                        success: function (res1){
                            if (res1 === "1") {
                                layer.msg("删除成功", {icon: 6})
                                // 刷新表格
                                table.reload('getNotice');
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
                    title:"修改专业信息",
                    area:['50%','50%'],
                    btn: ['提交', '取消'],
                    content: $("#window"),
                    success:function(){
                        $('#notContent').val(data.content);
                    },
                    yes:function(index){
                        $.ajax({
                            url: "${pageContext.request.contextPath}/backstage/man/updateNotice",
                            type: "post",
                            data: {
                                'noticeid': data.noticeid,
                                'content': $('#notContent').val()
                            },
                            dataType: "text",
                            success: function (res1){
                                if (res1 === "1") {
                                    layer.msg("修改成功", {icon: 6})
                                    // 关闭弹出层
                                    layer.close(index);
                                    // 刷新表格
                                    table.reload('getNotice');
                                }else{
                                    layer.msg("修改失败，系统异常", {icon: 5})
                                }
                            }
                        });
                    },
                    end: function (){
                        $('#notContent').val('');
                    }
                });
            }
        });
    });
</script>
</body>
</html>
