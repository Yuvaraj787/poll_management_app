<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head><%@ include file="navbar.jsp" %>
<body>
<div class="form-container">
<form action="adminLogin" method="post">

<h4>Admin Login</h4>

<label for="name" class="form-elements form-label"><b>Name</b></label>
<br>
<input name="adminName" id="admminName" class="form-elements form-input" type="text"/>
<br>
<label for="password" class="form-elements form-label"><b>Password</b></label>
<br>
<input name="password" id="password" class="form-elements form-input" type="password"/>
<br>
<button type="Submit" class="form-elements form-button">Login</button>
</form>
</div>
</body>
</html>