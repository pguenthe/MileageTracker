<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Mileage Tracker</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style>
td {
	width:20%;
	text-align:center;
	vertical-align:middle;
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
      <li><a href="listmiles">View Mileage</a></li> 
      <li><a href="logout">Log Out</a></li> 
    </ul>
  </div>
</nav>
<br /><br />
<div class="container">
  	<div class="row">
  		<div class="col-xs-12" style="text-align: center">
			<h1>
				Mileage Tracker
			</h1>
			<h3>${greeting } ${username }</h3>
			<!-- uid ${userid} -->  
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<c:if test="${averages!=null}">
				<table class="table table-striped table-bordered table-condensed table-responsive">
					<tr>
						<th colspan="5" style="text-align:center">
							Average Fill-Up Data
						</th>
					</tr>
					
					<tr>
						<td><b>Miles:</b><br />
							<c:out value="${averages.mileage}" /></td>
						<td><b>Price per Gallon (unweighted):</b><br />
							$<c:out value="${averages.price}" /></td>
						<td><b>Gallons:</b><br />
							<c:out value="${averages.gallons}" /></td>
						<td><b>Total Paid:</b><br />
							$<c:out value="${averages.total}" /></td>
						<td><b>MPG:</b><br />
							<c:out value="${averages.mpg}" /></td>	
					</tr>
				</table>
			</c:if>
			<c:if test="${averages==null}">
				<p style="text-align:center">
					${instructions }
				</p>
			</c:if>
		</div>
	</div>
	<div class="row">
  		<div class="col-md-6" style="text-align: center">
			<button class="btn btn-primary btn-large" style="display: block; width: 100%;" onclick="window.location.href='mileageform'">Enter Mileage</button>
			<br />
		</div>
		<div class="col-md-6" style="text-align: center">
			<button class="btn btn-primary btn-large" style="display: block; width: 100%;" onclick="window.location.href='listmiles'">View Mileage</button>
			<br />
		</div>
	</div>
</div>
</body>
</html>
