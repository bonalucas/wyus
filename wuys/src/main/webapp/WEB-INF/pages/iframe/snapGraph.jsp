<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>折线图</title>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
</head>
<body>
    <!-- 折线图-->
    <div class="layui-card">
        <div class="layui-card-body">
            <div id="EchartZheXian" style="width: 100%; height: 100%;"></div>
        </div>
    </div>
</body>
<script type="text/javascript">
    layui.use([ 'jquery', 'form', 'layer', 'laydate', 'table', 'layedit',
            'upload', 'element', 'carousel' ],
        function() {
            carousel = layui.carousel;

            var chartZheXian = echarts.init(document
                .getElementById('EchartZheXian'));
            var optionchartZhe = {
                title : {
                    text : '近五年热门专业趋势',
                },
                tooltip : {},
                legend : {
                    orient : 'vertical',
                    right : 'right',
                    data : [ '${requestScope.hotMajorList.get(0).majorname}',
                             '${requestScope.hotMajorList.get(1).majorname}',
                             '${requestScope.hotMajorList.get(2).majorname}'
                    ]
                },
                xAxis : {
                    data : ['1987', '1988', '1989', '1990', '1991']
                },
                yAxis : {
                    type : 'value'
                },
                series : [ {
                    smooth : true,
                    name : '${requestScope.hotMajorList.get(0).majorname}',
                    type : 'line',
                    data : [
                        '${requestScope.firstHot.get(0).count}',
                        '${requestScope.firstHot.get(1).count}',
                        '${requestScope.firstHot.get(2).count}',
                        '${requestScope.firstHot.get(3).count}',
                        '${requestScope.firstHot.get(4).count}'
                    ],
                }, {
                    smooth : true,
                    name : '${requestScope.hotMajorList.get(1).majorname}',
                    type : 'line',
                    data : [
                        '${requestScope.secondHot.get(0).count}',
                        '${requestScope.secondHot.get(1).count}',
                        '${requestScope.secondHot.get(2).count}',
                        '${requestScope.secondHot.get(3).count}',
                        '${requestScope.secondHot.get(4).count}'
                    ],
                }, {
                    smooth : true,
                    name : '${requestScope.hotMajorList.get(2).majorname}',
                    type : 'line',
                    data : [
                        '${requestScope.thirdHot.get(0).count}',
                        '${requestScope.thirdHot.get(1).count}',
                        '${requestScope.thirdHot.get(2).count}',
                        '${requestScope.thirdHot.get(3).count}',
                        '${requestScope.thirdHot.get(4).count}'
                    ],
                }]
            };
            chartZheXian.setOption(optionchartZhe, true);
        });
</script>
</html>
