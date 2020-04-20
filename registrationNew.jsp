<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>FILL THE REGISTRATION</title>
	<meta charset="UTF-8" />
	<link href="style.css" rel="stylesheet" />
</head>

<body>

<%@ page import="les4.DBInserter" %>

<%
String login = request.getParameter("login");
String name = request.getParameter("username");
String password = request.getParameter("password");
String repassword = request.getParameter("re-password");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String comments = request.getParameter("comments");
String amigo = request.getParameter("amigo");
boolean showForm = true;
String result = "";
String errorText = "";

if(login!=null){
	boolean existError = false;
	errorText = "<ul>";
	boolean emailMatches = login.matches("\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*\\.\\w{2,4}");
	boolean passwordValues=password.matches("(?=.*[0-9]{2,})(?=.*[a-z])(?=.*[A-Z]{2,}).{8,}");
	boolean repasswordValues=passwordValues;
	boolean ageValues=age.matches("(?=.*[1-9])(?=.*[2-9]).{2,3}");
	if(login.length() == 0) {
			existError = true;
			errorText += "<li>Empty Login</li>";
	}
	if(emailMatches==false){
		existError=true;
		errorText += "<li>Not Email Address</li>";
	}
	if(name.length()==0){
		existError=true;
		errorText += "<li>Empty Name</li>";
	}
	if(password.length() == 0) {
			existError = true;
			errorText += "<li>Empty Password</li>";
	}
	if(passwordValues==false){
		existError=true;
		errorText += "<li>Password must contain at least TWO digits, ONLY latin symbols and at least TWO letters with upper case</li>";
	}
	if(repassword.length() == 0) {
			existError = true;
			errorText += "<li>Empty Re-Password</li>";
	}
	if(repasswordValues==false&&passwordValues==repasswordValues){
		existError=true;
		errorText += "<li>Password and Re-Password must be the same </li>";
	}
	if(age.length() == 0) {
			existError = true;
			errorText += "<li>Empty Age</li>";
	}
	try{
	if(Integer.valueOf(age)<12 || Integer.valueOf(age)>100){
		existError=true;
		errorText += "<li>Age must be from 12 to 100</li>";
	}
	}
	catch (NumberFormatException e) {
		existError = true;
		errorText += "<li>Age must be a number</li>";
	}
	
	
	
	if(gender == null) {
			existError = true;
			errorText += "<li>Choose Gender</li>";
	}
	if(comments.length() == 0) {
			existError = true;
			errorText += "<li>Write Some Comments</li>";
	}
	
	errorText +="</ul>";
	
	if(existError){
		showForm=true;
	}else{
		showForm=false;
		result="Registration Success";
	}
}
if (showForm){

%>



<div style="float: right"><a href="indexNew.jsp">Autorization</a>&nbsp;&nbsp;</div>

<form action = '' method='post'>



	<div class="field">
		<label>
		Login
		</label>
		<div class="input">
		<input type = 'text', name = 'login' required='required' value="<%=login==null?"":login%>"/>
		</div>
	</div>
	  
	  <div class="field">
		<label>
		Name
		</label>
		<div class="input">
		<input type = 'text', name = 'username' required='required'/>
		</div>
	  </div>
	  
	  <div class="field">
		<label>
		Password
		</label>
		<div class="input">
		<input type = 'password', name = 'password' required='required'/>
		</div>
	  </div>
	  
	  <div class="field">
		<label>
		Re-Password
		</label>
		<div class="input">
		<input type = 'password', name = 're-password' required='required'/>
		</div>
	  </div>
	  
	  <div class="field">
		<label>
		Age
		</label>
		<div class="input">
		<input type = 'text', name = 'age' required='required' value="<%=age==null?"":age%>"/>
		</div>
	  </div>
	  
	  <div class="field">
		<label>
		Gender
		</label>
		<div class="input">
		F<input type = 'radio', name = 'gender' value='F' <%=(gender!=null&&gender.equals("F"))?"checked":""%>/>
		M<input type = 'radio', name = 'gender' value='M' <%=(gender!=null&&gender.equals("M"))?"checked":""%>/>
		</div>
	  </div>
	  
	  	  <div class="field">
		<label>
		Address
		</label>
		<div class="select">
		<select name='address'>
			<option value='1' <%=(address!=null&&address.equals("1"))?"selected":""%>> Kyiv </option>
			<option value='2' <%=(address!=null&&address.equals("2"))?"selected":""%>> Cherkassy </option>
			<option value='3' <%=(address!=null&&address.equals("3"))?"selected":""%>> Crimea </option>
			<option value='4' <%=(address!=null&&address.equals("4"))?"selected":""%>> Odessa </option>
			<option value='5' <%=(address!=null&&address.equals("5"))?"selected":""%>> Dnipro </option>
			<option value='6' <%=(address!=null&&address.equals("6"))?"selected":""%>> Kharkiv </option>
			<option value='7' <%=(address!=null&&address.equals("7"))?"selected":""%>> Lviv </option>
		</select>
		</div>
	  </div>
	  
	  	  <div class="field">
		<label>
		Comments
		</label>
		<div class="textarea">
		<textarea name='comments' cols='20' rows='10'><%=comments==null?"":comments %></textarea>
		</div>
	  </div>
	  
	  	  <div class="field">
		<label>
		Amigo
		</label>
		<div class="input">
		<input type = 'checkbox', name = 'amigo'/>
		</div>
	  </div>
	  
	  <div class="submit">
		<button type="submit">OK</button>
	  </div>
	  

<%
out.write(errorText);
%>
	
</form>	
<%
}
try{
DBInserter inserter=new DBInserter();
inserter.insert(name,password,login,Integer.valueOf(age),gender,comments,address);
}
catch(NumberFormatException e){
	
}
out.write(result);

%>
</body>
</html>