<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TIMELINE</title>
</head>
<body>	
	<form name = "joinFrm" method = "post" action = "joinChk.jsp" onsubmit = "return input_check()">
	<table border = "1">
	<tr>
		<td> 아이디 </td>
		<td> <input type = "text" id = "id" name = "id"/> </td>		
	</tr>
	<tr>
		<td> 비밀번호 </td>
		<td> <input type = "password" id = "passwd" name = "passwd"/> </td>
	</tr>
	<tr>
		<td> 비밀번호 확인 </td>
		<td> <input type = "password" id = "chkPasswd" name = "chkPasswd"/> </td>
	</tr>
	</table>
	<input type = "submit" value = "가입하기"/>
	</form>
	<script>
	
	function input_check(){
		var id = document.getElementById('id').value;
		var passwd = document.getElementById('passwd').value;
		var chkPasswd = document.getElementById('chkPasswd').value;
		
		if(id == null || passwd == null || chkPasswd == null || id == "" || passwd == "" || chkPasswd == ""){
			alert("아이디 또는 비밀번호를 입력하시오.");
			return false;			
		} else if(passwd != chkPasswd){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		} else {			
			return true;
		}
	}
	
	</script>
</body>
</html>