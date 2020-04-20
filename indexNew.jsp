
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
	<div style="float: right"><a href="registrationNew.jsp">Registration</a>&nbsp;&nbsp;</div>
	<meta charset="UTF-8" />
	<link href="style.css" rel="stylesheet" />
</head>

<body>


<%@ page import="les4.CheckerLPBase" %>

<%
	String login = request.getParameter("login");
	String password = request.getParameter("password");
	boolean showForm = true;
	String result = "";
 

	if(login!=null){
    CheckerLPBase checker = new CheckerLPBase(login, password);
    showForm=!checker.show();
	result = checker.message();
  }
	if(showForm){
	%>

<form id="loginForm" action='' method="post">

	<div class="field">
		<label>Enter your login:</label>
		<div class="input"><input type="text" name="login" value="" id="login" /></div>
	</div>

	<div class="field">
		<a href="#" id="forgot">Forgot your password?</a>
		<label>Enter your password:</label>
		<div class="input"><input type="password" name="password" value="" id="pass" /></div>
	</div>

	<div class="submit">
		<button type="submit">Enter</button>
		<label id="remember"><input name="" type="checkbox" value="" /> Remember me</label>
	</div>

</form>
	
<%	
}
	out.write(result);
	%>
</body>
</html>