<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TIMELINE</title>
</head>

<body>
	<form name = "loginFrm" method = "post" action = "login.jsp">	
	<table border = "1">
	<tr>
		<td> 아이디 </td>
		<td> <input type = "text" id = "id" name = "id"/> </td>
		<td rowspan = "2" align = "right"> <input type = "submit" value = "로그인"/> </td>
	</tr>
	<tr>
		<td> 비밀번호 </td>
		<td> <input type = "password" id = "passwd" name = "passwd"/> </td>
	</tr>		
	</table>
	</form>
	<br/>
	<form name = "joinfrm" method = "post" action = "join.jsp">
	<input type = "submit" value = "회원가입"/>
	</form>		
</body>
</html>