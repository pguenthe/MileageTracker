<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Mileage Record</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Mileage Tracker</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="mileageform">Enter Mileage</a></li>
      <li><a href="listmiles">View Mileage</a></li> 
      <li><a href="logout">Log Out</a></li> 
    </ul>
  </div>
</nav>
<br /><br />
<div class="container">
	<h1 style="text-align: center">Update Mileage:</h1>
	<form:form method="post" modelAttribute="mileage" action="updatemiles">
		<form:input path="id" type="hidden" />
		<form:input path="userid" type="hidden" /> 
		
		<form:label path="date">Date:</form:label>
		<form:input path="date" type="date" class="form-control" /> 
		<form:errors path="date" />
		<br />
		
		<form:label path="mileage">Mileage:</form:label>
		<form:input path="mileage" type="text" class="form-control" /> 
		<form:errors path="mileage" />
		<br />
		
		<form:label path="price">Price:</form:label>
		<form:input path="price" type="text" class="form-control" /> 
		<form:errors path="price" />
		<br />
		
		<form:label path="gallons">Gallons:</form:label>
		<form:input path="gallons" type="text" class="form-control" /> 
		<form:errors path="gallons" />
		<br />
		
		<form:label path="total">Total:</form:label>
		<form:input path="total" type="text" class="form-control" /> 
		<form:errors path="total" />
		<br />
		<button type="submit" class="btn btn-primary"  style="display: block; width: 100%;">Submit</button>
	</form:form>
</div>
</body>
</html>