<%
// login (email) type: text    (errors emty or not email)
// name type: text     (errors not empty)
// age type: text  12~100
// address select  (check address)
// gender radiobutton (errors not empty)
// comments textarea (not empty)(check not null)
// i agree to install AmigoBrowser (no DB) checkbox
// password password  min:8char(2-numbers,2-Headletters Latin only)(errors pass not ???)
// repeat password  (no DB) password


// rigthside Error text
%>
<table>
<tr>
<td width = '50' align = 'center'>
<form action = ''>
	<table border = '1'>
	<tr>
		<td width = '50' align = 'center'>
		Login
		</td>
		<td width = '50' align = 'center'>
		<input type = 'text', name = 'login'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
		Name
		</td>
		<td width = '50' align = 'center'>
		<input type = 'text', name = 'name1'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
		Password
		</td>
		<td width = '50' align = 'center'>
		<input type = 'password', name = 'password'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
		Re-Password
		</td>
		<td width = '50' align = 'center'>
		<input type = 'password', name = 're-password'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
		Age
		</td>
		<td width = '50' align = 'center'>
		<input type = 'text', name = 'age'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
		Gender
		</td>
		<td width = '50' align = 'center'>
		F<input type = 'radio', name = 'gender' value='F'/>
		M<input type = 'radio', name = 'gender' value='M'/>
		</td>
	  </tr>
	  
	  	  <tr>
		<td width = '50' align = 'center'>
		Address
		</td>
		<td width = '50' align = 'center'>
		<select name='address'>
			<option value='1'> Kyiv </option>
			<option value='2'> Cherkassy </option>
			<option value='3'> Crimea </option>
			<option value='4'> Odessa </option>
			<option value='5'> Dnipro </option>
			<option value='6'> Kharkiv </option>
			<option value='7'> Lviv </option>
		</select>
		</td>
	  </tr>
	  
	  	  <tr>
		<td width = '50' align = 'center'>
		Comments
		</td>
		<td width = '50' align = 'center'>
		<textarea name='comments' cols='20' rows='10'></textarea>
		</td>
	  </tr>
	  
	  	  <tr>
		<td width = '50' align = 'center'>
		Amigo
		</td>
		<td width = '50' align = 'center'>
		<input type = 'checkbox', name = 'amigo'/>
		</td>
	  </tr>
	  
	  <tr>
		<td width = '50' align = 'center'>
		</td>
		<td width = '50' align = 'center'>
		<input type = 'submit', value = 'OK'/>
		</td>
	  </tr>
	  
	</table>
</form>	
</td>
<td width = '50' align = 'center'>
<%
String login = request.getParameter("login");
String name = request.getParameter("name1");
String password = request.getParameter("password");
String repassword = request.getParameter("re-password");
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
String comments = request.getParameter("comments");
String amigo = request.getParameter("amigo");

if(login!=null){
	boolean existError = false;
	String errorText = "<ul>";
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
	if(Integer.valueOf(age)<12 || Integer.valueOf(age)>100){
		existError=true;
		errorText += "<li>Age must be from 12 to 100</li>";
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
		out.write(errorText);
	}else{
		out.write("Registration Success");
	}
}

%>
<td width = '50' align = 'center'>
</tr>
</table>
