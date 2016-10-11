<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- marked for deletion -->
<html>
<head>
	<title>Mileage Tracker</title>
</head>
<body>
<h1>
	Login Failed <br />
	How did you get this page?<br />
	This page should be unreachable. 
</h1>

<P>Welcome to Mileage Tracker.</P>

 <h2>Create Account:</h2>
 	<form:form method="post" modelAttribute="user" action="createAccount">		
		<form:label path="email">Email:</form:label>
		<form:input path="email" type="text" /> 
		<form:errors path="email" />
		<br />
		
		<form:label path="password">Password:</form:label>
		<form:input path="password" type="password" /> 
		<form:errors path="password" />
		<br />
		
		<form:label path="firstname">First Name:</form:label>
		<form:input path="firstname" type="text" /> 
		<form:errors path="firstname" />
		<br />
		<button type="submit">Submit</button>
	</form:form>

 <h2>Log In:</h2>
 	<form:form method="post" modelAttribute="user" action="login">		
		<form:label path="email">Email:</form:label>
		<form:input path="email" type="text" /> 
		<form:errors path="email" />
		<br />
		
		<form:label path="password">Password:</form:label>
		<form:input path="password" type="password" /> 
		<form:errors path="password" />
		<br />
		
		<button type="submit">Submit</button>
	</form:form>
</body>
</html>
