<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
</head>
<body>
    <!-- 饼状图 -->
    <div class="layui-card" style="margin-left: 35px">
        <div class="layui-card-header">图表统计</div>
        <div class="layui-card-body">
            <div id="EchartBingTu" style="width: 350px; height: 220px;"></div>
        </div>
    </div>
</body>
<script type="text/javascript">
    layui.use([ 'jquery', 'form', 'layer', 'laydate', 'table', 'layedit',
            'upload', 'element', 'carousel' ],
        function() {

            var $ = layui.jquery;
            var element = layui.element;
            carousel = layui.carousel;
            var form = layui.form;
            var layer = layui.layer;
            var laydate = layui.laydate;
            var table = layui.table;
            var layedit = layui.layedit;
            var upload = layui.upload;

            var chartBingTu = echarts.init(document
                .getElementById('EchartBingTu'));
            //指定图表配置项和数据
            var optionchartBing = {
                // title : {
                //     text : '数据分析',
                //     subtext : '纯属虚构', //副标题
                //     x : 'center' //标题居中
                // },
                tooltip : {
                    // trigger: 'item' //悬浮显示对比
                },
                legend : {
                    orient : 'vertical', //类型垂直,默认水平
                    left : 'left', //类型区分在左 默认居中
                    data : [ '单价', '总价', '销量', '产量' ]
                },
                series : [ {
                    type : 'pie', //饼状
                    radius : '60%', //圆的大小
                    center : [ '50%', '50%' ], //居中
                    data : [ {
                        value : 335,
                        name : '单价'
                    }, {
                        value : 310,
                        name : '总价'
                    }, {
                        value : 234,
                        name : '销量'
                    }, {
                        value : 135,
                        name : '产量'
                    } ]
                } ]
            };
            chartBingTu.setOption(optionchartBing, true); // 饼状图

        });
</script>
</html>
