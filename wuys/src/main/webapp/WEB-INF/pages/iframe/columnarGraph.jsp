<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>柱状图</title>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
</head>
<body>
    <!-- 柱状图-->
    <div class="layui-card">
        <div class="layui-card-body">
            <div id="EchartZhuZhuang" style="width: 100%; height: 100%;"></div>
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

            var chartZhuZhuang = echarts.init(document
                .getElementById('EchartZhuZhuang'));
            //指定图表配置项和数据
            var optionchart = {
                // title : {
                //     text : '数据分析'
                // },
                tooltip : {},
                legend : {
                    data : [ '数据量' ]
                },
                xAxis : {
                    data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周天' ]
                },
                yAxis : {
                    type : 'value'
                },
                series : [ {
                    name : '销量',
                    type : 'bar', //柱状
                    data : [ 100, 200, 300, 400, 500, 600, 700 ],
                    itemStyle : {
                        normal : { //柱子颜色
                            color : 'red'
                        }
                    },
                }, {
                    name : '产量',
                    type : 'bar',
                    data : [ 120, 210, 340, 430, 550, 680, 720 ],
                    itemStyle : {
                        normal : {
                            color : 'blue'
                        }
                    }
                } ]
            };
            chartZhuZhuang.setOption(optionchart, true); // 柱状图
        });
</script>
</html>
