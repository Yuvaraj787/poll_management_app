<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome User!</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<%@ include file="navbar.jsp" %>
<body>

<div class="form-container" id="votingform">
<form action="Vote" method="post">

<label for="voterID" class="form-elements form-label">Enter your Voter ID</label>
<br>
<input id="voterID" name="voterID" class="form-elements form-input" type="text"/>
<br>

<label for="candidate" class="form-elements form-label">Choose Your Candidate</label>
<br>

<select name="candidate" class="form-elements form-input">
<option value="Aam Aadmi Party">Aam Aadmi Party</option>
<option value="Bhartiya Janta Party">Bhartiya Janta Party</option>
<option value="Congress">Congress</option>
<option value="CPI">CPI</option>
<option value="BSP">BSP</option>
</select>

<button type="Submit" class="form-elements form-button">Submit</button>

</form>
</div>
</body>
</html>