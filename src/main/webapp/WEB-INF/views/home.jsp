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

<script>
function validateLogin(){
    var email= document.login.email.value;
    var password = document.login.password.value;
    
	return validateEmail(email) && validatePassword(password);
  }

function validateCreate(){
    var email= document.create.email.value;
    var password1 = document.create.password.value;
    var password2 = document.create.password2.value;
	var firstname = document.create.firstname.value;
    
    return validateEmail(email) 
    		&& validatePassword(password1)
    		&& validatePWmatch (password1, password2)
    		&& validateName (firstname);
  }  	
  
	//validateEmail--true if valid, false otherwise
  function validateEmail(email)
  {
  	//isn't null & isn't empty
    if (email === null || email ===""){
      alert ("Email cannot be blank");
      return false; 
    }
  	//trim()
    email = email.trim();
    //has an @ not in first space
    if (email.indexOf("@") <= 0) {
      alert ("Email must contain an @");
      return false;
    }
  	//has a . at least 3rd char from end
    if (email.lastIndexOf(".") >= email.length  - 2) {
      alert ("Email must have a .");
      return false;
  	}
  	//has . after the at
    if (email.lastIndexOf(".") <= email.indexOf("@") + 1) {
      alert ("Email . must be after @ + character");
      return false;
    }
    return true;
  }
  
  //validatePassword--true if valid, false otherwise
  function validatePassword(pass)
  {
      //has at least 8 char
    if (pass === null || pass.length < 8) {
      alert("Password must be at least 8 characters");
      return false;
    }
    
    //has at least 1 uppercase
    if (pass.toLowerCase() === pass) {
      alert("Password must contain at least one uppercase letter");
      return false;
    }
  	
    return true; 
  }
  
  function validatePWmatch(password1, password2) {
  	if (password1 !== password2) {
  		alert ("Passwords don't match");
  		return false;
  	}
  	return true;
  }
  
  
  function validateName(name)
  {
      //has at least 8 char
    if (name === null || name.length < 2) {
      alert("First name must be at least 2 characters");
      return false;
    }   
    return true;
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
    </ul>
  </div>
</nav>
<br /><br />
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
 	<form:form name="login" method="post" modelAttribute="user" action="login">
 	<div class="form-group">		
		<form:label path="email">Email:</form:label>
		<form:input path="email" name="email" type="text" class="form-control" /> 
		<form:errors path="email" />
		<br />
		
		<form:label path="password">Password:</form:label>
		<form:input path="password" name="password" type="password" class="form-control" /> 
		<form:errors path="password" />
		<br />
		
		<button type="submit" 
			class="btn btn-primary" 
			onclick="return validateLogin()">
			Log In</button>
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
	 		<form:form name="create" method="post" modelAttribute="user" action="createAccount">
	 		<div class="form-group">			
				<form:label path="email">Email:</form:label>
				<form:input path="email" type="text" class="form-control" name="email"/> 
				<form:errors path="email" />
				<br />
				
				<form:label path="password">Password:</form:label>
				<form:input path="password" type="password" class="form-control" name="password"/> 
				<form:errors path="password" />
				<br />
				
				<label for="password2">Repeat Password:</label>
				<input type="password" class="form-control" name="password2"/> 
				<br />
				
				<form:label path="firstname">First Name:</form:label>
				<form:input path="firstname" type="text" class="form-control" name="firstname"/> 
				<form:errors path="firstname" />
				<br />
				<button type="submit" 
					class="btn btn-primary" 
					onclick="return validateCreate()">
					Create Account</button>
			</div>
			</form:form>
		</div>
	</div>

   </div>
</div>

</div>
</body>
</html>
