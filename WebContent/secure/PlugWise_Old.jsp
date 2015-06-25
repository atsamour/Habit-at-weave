<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="json" uri="http://www.atg.com/taglibs/json" %>

<!DOCTYPE html>
<html>
    
<head>
    <title>PlugWise Sensor</title>

    <script src="resources/js/jquery.js" ></script>
    <script src="resources/js/highcharts.js" ></script>
    <script src="http://code.highcharts.com/modules/exporting.js"></script>
    <script src="resources/bootstrap/js/bootstrap.min.js"></script> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Optional theme -->
    <link rel="stylesheet" href="resources/bootstrap/css/bootstrap-theme.min.css">


<script type="text/javascript">	
  $(function () {
    $('#chart1').highcharts({
        chart: {
            zoomType: 'x'
        },
        title: {
            text: 'Total Power consumption for April 2014'
        },
        subtitle: {
            text: document.ontouchstart === undefined ?
                    'Click and drag in the plot area to zoom in' :
                    'Pinch the chart to zoom in'
        },
        xAxis: {
            type: 'datetime',
            minRange: 3600000 // 1 hour
        },
        yAxis: {
            title: {
                text: 'Watts'
            }
        },
        legend: {
            enabled: false
        },
        plotOptions: {
         area: {
                fillColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
                    stops: [
                        [0, Highcharts.getOptions().colors[0]],
                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                    ]
                },
                marker: {
                    radius: 2
                },
                lineWidth: 1,
                states: {
                    hover: {
                        lineWidth: 1
                    }
                },
                threshold: null
            }
        },

        series: [{
            type: 'area',
            name: 'Power sensor ${requestScope.sensor}',
            pointInterval: 3600000,
            pointStart: Date.UTC(2014, 4, 1),
            data: <json:array var="probe" items="${sessionScope.sensorObj.watts}">
        <json:property value="${probe}"/>
</json:array>   }]
    });
});
</script>

</head>


<body>
<div class="container">
<div class="page-header">
  <h1>Assisted Living Control Center <small>App name</small></h1>
<h2>    
This page is only visible to registered users. You are ${currentEmail}.
</h2>
</div>
<ul class="nav nav-pills">
  <li role="presentation"><a href="${pageContext.request.contextPath}">Home</a></li>
  <li role="presentation" class="active"><a href="${requestScope["javax.servlet.forward.request_uri"]}?menu=PlugWise&tab=Charts">PlugWise</a></li>
  <li role="presentation"><a href="#">UP24</a></li>
  <li role="presentation"><a href="#">Messages</a></li>
</ul>

</br>

    <ul class="nav nav-tabs">
        <li class="nav active"><a href="#tab1" data-toggle="tab">PlugWise Charts</a></li>
        <li class="nav"><a href="#tab2" data-toggle="tab">PlugWise Schedules</a></li>
        <li class="nav"><a href="#tab3" data-toggle="tab">PlugWise Options</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
        	<div class="row">
                    <div class="col-md-3">			
		       	<div class="list-group">
                            <c:forEach var="current" items="${sessionScope.sensorIDs}">
                                <a href="${pageContext.request.contextPath}/PlugServer?menu=PlugWise&tab=Charts&sensor=${current}" class="list-group-item">PlugWise Adapter <c:out value="${current}"></c:out></a>
                            </c:forEach>
                                
			</div>
                    </div>
                    <div id="chart1" class="col-md-9">Select an available sensor to display chart</div> <%--add style="min-width: 310px; height: 400px; margin: 0 auto"--%>
		</div>
        </div>
        <div class="tab-pane fade" id="tab2">Schedules</div>
        <div class="tab-pane fade" id="tab3">Options</div>
    </div>

</div>
</body>
</html>


