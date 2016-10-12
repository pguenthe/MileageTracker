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
              title: 'Fuel Economy',
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
      
      var targetRecord = null;
      
     function deleteRecord() {
    	 	if (targetRecord != null) {
    	 		document.getElementById("form" + targetRecord).submit();
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
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Mileage Tracker</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="mileageform">Enter Mileage</a></li>
      <li class="active"><a href="listmiles">View Mileage</a></li> 
      <li><a href="logout">Log Out</a></li> 
    </ul>
  </div>
</nav>
<br /><br />
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
 						<form action="mileagedelete" method="post" id="form${row.id }">
							<input type="hidden" name="record" value="${row.id }">
							<!-- <button type="submit" class="btn btn-primary">Delete</button>  -->
						</form>
						<button class="btn btn-primary"  
								data-toggle="modal" data-target="#confirm" 
								onClick="targetRecord=${row.id}">Delete</button>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td style="font-weight:bold">Average</td>
					<td style="text-align:right;font-weight:bold"><c:out value="${averages.mileage}" /></td>
					<td style="text-align:right;font-weight:bold"><c:out value="${averages.price}" /></td>
					<td style="text-align:right;font-weight:bold"><c:out value="${averages.gallons}" /></td>
					<td style="text-align:right;font-weight:bold"><c:out value="${averages.total}" /></td>
					<td style="text-align:right;font-weight:bold"><c:out value="${averages.mpg}" /></td>
					<td></td>
					<td></td>	
				</tr>
				<tr>
					<td colspan="8" style="text-align:center">
						<form action="mileageform" method="get">
							<button type="submit" class="btn btn-primary">Enter More Mileage</button>
						</form>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-md-6">
			<div id="curve_chart" 
			style="width: 500px; height: 350px; display: inline-block; margin: 0 auto"></div>
		</div>
	</div>
</div>

  <!-- Modal -->
  <div class="modal fade" id="confirm" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Confirm Deletion</h4>
        </div>
        <div class="modal-body">
          <p>Are you sure you want to delete?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" 
          	onclick="deleteRecord()">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>