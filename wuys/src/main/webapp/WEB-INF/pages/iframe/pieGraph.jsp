<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>饼状图</title>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
</head>
<body>
    <!-- 饼状图 -->
    <div class="layui-card">
        <div class="layui-card-body">
            <div id="EchartBingTu" style="width: 100%; height: 180px;"></div>
        </div>
    </div>
</body>
<script type="text/javascript">
    layui.use([ 'jquery', 'form', 'layer', 'laydate', 'table', 'layedit',
            'upload', 'element', 'carousel' ],
        function() {
            carousel = layui.carousel;

            var chartBingTu = echarts.init(document
                .getElementById('EchartBingTu'));
            //指定图表配置项和数据
            var optionchartBing = {
                title : {
                    text : '学校男女生比例',
                    // x : 'center' //标题居中
                },
                tooltip : {
                    trigger: 'item' //悬浮显示对比
                },
                legend : {
                    orient : 'vertical', //类型垂直,默认水平
                    right : 'right', //类型区分在左 默认居中
                    data : [ '男生', '女生' ]
                },
                series : [ {
                    type : 'pie', //饼状
                    radius : '70%', //圆的大小
                    center : [ '50%', '50%' ],
                    data : [ {
                        value : ${requestScope.sexInfoList.get(1).count},
                        name : '男生'
                    }, {
                        value : ${requestScope.sexInfoList.get(0).count},
                        name : '女生'
                    }]
                } ]
            };
            chartBingTu.setOption(optionchartBing, true); // 饼状图
        });
</script>
</html>
