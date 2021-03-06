<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Mileage Entered!</title>

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
</style>
<script> 
     function logout() {
    	 	window.location.href="logout";
     }
    </script>
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
      <li><a href="#" data-toggle="modal" data-target="#logout" >Log Out</a></li> 
    </ul>
  </div>
</nav>
<br /><br />
<div class="container">
<h1 style="text-align:center">
	Mileage Entry Success  
</h1>

<table class="table table-striped table-bordered table-condensed table-responsive">
	<tr>
		<th>Date</th>
		<th>Miles</th>
		<th>Price</th>
		<th>Gallons</th>
		<th>Total</th>
	</tr>
	
	<tr>
		<td>${mileage.getDate() }</td>
		<td style="text-align:right">${mileage.getMileage() }</td>
		<td style="text-align:right">${mileage.getPrice() }</td>
		<td style="text-align:right">${mileage.getGallons() } </td>
		<td style="text-align:right">${mileage.getTotal() }</td>
	</tr>
</table>

	<div class="row">
  		<div class="col-md-6" style="text-align: center">
			<button class="btn btn-primary btn-large" style="display: block; width: 100%;" onclick="window.location.href='mileageform'"  style="display: block; width: 100%;">Enter More Mileage</button>
			<br />
		</div>
		<div class="col-md-6" style="text-align: center">
			<button class="btn btn-primary btn-large" style="display: block; width: 100%;" onclick="window.location.href='listmiles'"  style="display: block; width: 100%;">View Mileage</button>
			<br />
		</div>
	</div></div>
	
	  <!-- Modal -->
  <div class="modal fade" id="logout" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Confirm Logout</h4>
        </div>
        <div class="modal-body">
          <p>Are you sure you want to log out?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" 
          	onclick="logout()">Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        </div>
      </div>
    </div>
  </div>
	
</body>
</html>
