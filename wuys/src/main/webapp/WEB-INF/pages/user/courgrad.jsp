<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>课程成绩</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
</head>
<body>
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
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>

<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>

<script>
    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'${pageContext.request.contextPath}/backstage/achievement/showCourGrad'
            ,toolbar: '#toolbarDemo'
            ,id: 'getCourGrad'
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
                ,{field:'courid', title:'课程编号', width:140, fixed: 'left', unresize: true, sort: true}
                ,{field:'courname', title:'课程名字', width:180, sort: true}
                ,{field:'period', title:'学时', width:140, sort: true}
                ,{field:'credit', title:'学分', width:140,  sort: true}
                ,{field:'ach', title:'成绩', width:140,  sort: true}
            ]]
            ,page: true
            ,limits:[10,20]
        });

        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#courname');
                //执行重载
                table.reload('getCourGrad', {
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
    });
</script>
</body>
</html>

