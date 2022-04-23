<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
    <script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
</head>
<body>
    <!-- 折线图-->
    <div class="layui-card" style="margin-left: 100px">
        <div class="layui-card-header">图表统计</div>
        <div class="layui-card-body">
            <div id="EchartZheXian" style="width: 200px; height: 180px;"></div>
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

            var chartZheXian = echarts.init(document
                .getElementById('EchartZheXian'));
            //指定图表配置项和数据
            var optionchartZhe = {
                title : {
                    text : '数据分析'
                },
                tooltip : {},
                legend : { //顶部显示 与series中的数据类型的name一致
                    data : [ '销量', '产量', '营业额', '单价' ]
                },
                xAxis : {
                    // type: 'category',
                    // boundaryGap: false, //从起点开始
                    data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
                },
                yAxis : {
                    type : 'value'
                },
                series : [ {
                    name : '销量',
                    type : 'line', //线性
                    data : [ 145, 230, 701, 734, 1090, 1130, 1120 ],
                }, {
                    name : '产量',
                    type : 'line', //线性
                    data : [ 720, 832, 801, 834, 1190, 1230, 1220 ],
                }, {
                    smooth : true, //曲线 默认折线
                    name : '营业额',
                    type : 'line', //线性
                    data : [ 820, 932, 901, 934, 1290, 1330, 1320 ],
                }, {
                    smooth : true, //曲线
                    name : '单价',
                    type : 'line', //线性
                    data : [ 220, 332, 401, 534, 690, 730, 820 ],
                } ]
            };
            chartZheXian.setOption(optionchartZhe, true); // 折线图

        });
</script>
</html>
