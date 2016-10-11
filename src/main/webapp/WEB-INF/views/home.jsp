<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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

</head>
<body>
<div class="container">
<h1 style="text-align:center">
	Mileage Tracker  
</h1>

<P style="text-align:center">${greeting }</P>
<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
 		<h2 class="panel-title">
 		<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
 		Log In
		</a>
 		</h2>
 	</div>
    <div id="collapse1" class="panel-collapse collapse in">
    	  <div class="panel-body">
 	<form:form method="post" modelAttribute="user" action="login">
 	<div class="form-group">		
		<form:label path="email">Email:</form:label>
		<form:input path="email" type="text" class="form-control" /> 
		<form:errors path="email" />
		<br />
		
		<form:label path="password">Password:</form:label>
		<form:input path="password" type="password" class="form-control" /> 
		<form:errors path="password" />
		<br />
		
		<button type="submit" class="btn btn-primary">Log In</button>
	</div>
	</form:form>
    	  
    	  </div>
    	</div>
  	<div class="panel-heading">
 		<h2 class="panel-title">
 		<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
 		Create Account
 		</a>
 		</h2>
 	</div>
    <div id="collapse2" class="panel-collapse collapse">
    		<div class="panel-body">
	 		<form:form method="post" modelAttribute="user" action="createAccount">
	 		<div class="form-group">			
				<form:label path="email">Email:</form:label>
				<form:input path="email" type="text" class="form-control" /> 
				<form:errors path="email" />
				<br />
				
				<form:label path="password">Password:</form:label>
				<form:input path="password" type="password" class="form-control" /> 
				<form:errors path="password" />
				<br />
				
				<form:label path="firstname">First Name:</form:label>
				<form:input path="firstname" type="text" class="form-control" /> 
				<form:errors path="firstname" />
				<br />
				<button type="submit" class="btn btn-primary">Create Account</button>
			</div>
			</form:form>
		</div>
	</div>

   </div>
</div>

</div>
</body>
</html>
