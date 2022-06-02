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
            carousel = layui.carousel;

            var chartZhuZhuang = echarts.init(document
                .getElementById('EchartZhuZhuang'));
            var optionchart = {
                title : {
                    text : '热门课程'
                },
                tooltip : {},
                legend : {
                    data : [ '' ]
                },
                xAxis : {
                    data : [
                        '${requestScope.hotCourseList.get(0).courname}',
                        '${requestScope.hotCourseList.get(1).courname}',
                        '${requestScope.hotCourseList.get(2).courname}',
                        '${requestScope.hotCourseList.get(3).courname}',
                        '${requestScope.hotCourseList.get(4).courname}'
                    ]
                },
                yAxis : {
                    type : 'value'
                },
                series : [{
                    name : '选课人数',
                    type : 'bar',
                    data : [
                        '${requestScope.hotCourseList.get(0).count}',
                        '${requestScope.hotCourseList.get(1).count}',
                        '${requestScope.hotCourseList.get(2).count}',
                        '${requestScope.hotCourseList.get(3).count}',
                        '${requestScope.hotCourseList.get(4).count}'
                    ],
                    itemStyle : {
                        normal : {
                            color : 'green'
                        }
                    }
                } ]
            };
            chartZhuZhuang.setOption(optionchart, true);
        });
</script>
</html>
