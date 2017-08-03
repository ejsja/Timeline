<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>TIMELINE</title>
</head>
<body>
	<form name = "writeFrm" method = "post" action = "write.jsp">
	<div align = "right">
	<% 
		String id = (String)session.getAttribute("id");
		String welcome = id + "님 반갑습니다 !";	
		out.println(welcome);		
	%>
	</div>
	
	<div align = "center">
	<table>
	<tr>
		<td> <% out.print(id); %> </td>
	</tr>
	<tr>
		<td> <input type = "text" id = "content" name = "content" style = "width:300px; height:300px;"/> </td>
	</tr>
	<tr align = "right">
		<td> <input type = "submit" value = "글쓰기"/> </td>		
	</tr>
	</table>
	</div>
	</form>
</body>
</html>