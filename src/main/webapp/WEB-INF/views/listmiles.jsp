<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.guenther.mileage.MileageRecord" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mileage</title>

<!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
    	  google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart);

          function drawChart() {
            var data = google.visualization.arrayToDataTable([
				['Date', 'MPG'],
<c:forEach var="row" items="${mileList}" varStatus="loop">
<c:if test="${!loop.first}">
["<c:out value="${row.dateString}" />",
    		<c:out value="${row.mpg}" />] <c:if test="${!loop.last}">,</c:if>
</c:if>
</c:forEach>
              ]);

            var options = {
              title: 'Fuel Ecomony',
              //curveType: 'function',
              legend: { position: 'bottom' },
        			vAxis: { 
        				maxValue: ${chartMax },
        				minValue: ${chartMin }	
        			},
              chartArea: { left: 30, top:30, right: 30, bottom: 30 }
            };

            var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

            chart.draw(data, options);
          }
      }
    </script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style>
th {
	text-align: center;
}
td.center {
	text-align: center;
}
</style>
</head>
<body>
<div class="container">
  	<div class="row">
  		<div class="col-xs-12" style="text-align: center">
			<h1>${title }</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<table class="table table-striped table-bordered table-condensed table-responsive">
				<tr>
					<th>Date</th>
					<th>Miles</th>
					<th>Price</th>
					<th>Gallons</th>
					<th>Total</th>
					<th>MPG</th>
					<th></th>
					<th></th>
				</tr>
				
				<c:forEach var="row" items="${mileList}" varStatus="loop">
				<tr>
					<td><c:out value="${row.dateString}" /></td>
					<td style="text-align:right"><c:out value="${row.mileage}" /></td>
					<td style="text-align:right"><c:out value="${row.price}" /></td>
					<td style="text-align:right"><c:out value="${row.gallons}" /></td>
					<td style="text-align:right"><c:out value="${row.total}" /></td>
					<td style="text-align:right"><c:out value="${loop.first ? 'N/A' : row.mpg}" /></td>
					<td class="center">
						<form action="mileageform" method="post">
							<input type="hidden" name="record" value="${row.id }">
							<button type="submit" class="btn btn-primary">Edit</button>
						</form>
					</td>
					<td class="center">
						<form action="mileagedelete" method="post">
							<input type="hidden" name="record" value="${row.id }">
							<button type="submit" class="btn btn-primary">Delete</button>
						</form>
					</td>
				</tr>
				</c:forEach>
				<tr>
				<td colspan="8" style="text-align:center">
				<form action="mileageform" method="get">
					<button type="submit" class="btn btn-primary">Enter More Mileage</button>
				</form>
				</td>
			</table>
		</div>
		<div class="col-md-6">
			<div id="curve_chart" 
			style="width: 500px; height: 350px; display: inline-block; margin: 0 auto"></div>
		</div>
	</div>
</div>
</body>
</html>