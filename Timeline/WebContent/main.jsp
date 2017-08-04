<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
    
<%
    request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TIMELINE</title>
</head>
<body>
	<form name = "writeFrm" method = "post" action = "writeContent.jsp">
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
		<td> <input type = "text" id = "content" name = "content" style = "width:500px; height:100px;"/> </td>
	</tr>
	<tr align = "right">
		<td> <input type = "submit" value = "글쓰기"/> </td>		
	</tr>
	</table>
	</div>
	</form>
	
	<br/><br/>
	
	<div align = "center">
	
	<%
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";							 			
		Class.forName(driver);
		
		String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
		String db_id = "c##ejsja";
		String db_pw = "test";
		
		Connection conn = DriverManager.getConnection(url, db_id, db_pw);
		//conn.setAutoCommit(false);
		Statement st = conn.createStatement();
		String sql = "select * from content order by content_number desc";
		ResultSet rs = st.executeQuery(sql);
				
		while(rs.next()){
			String content_number = rs.getString("content_number");
			String text = rs.getString("text");
			String date = rs.getString("wrote_date");
								
			%>
			<table border = "1" width = "500" height = "300">
				<tr>
					<td>USER_NAME</td>
					<td align = "right"><% out.print(date); %></td>
				</tr>
				<tr>
					<td colspan = "2" align = "center"><% out.print(text); %></td>
				</tr>
				<tr>
					<td> <% out.print(id); %> </td>
					<td><input type = "text" id = "reply" name = "reply" style = "width:300px;"/> <input type = "submit" value = "댓글쓰기"/></td>
				</tr>
			</table>
			<br/><br/>
			<%
		}
		
		//st.executeQuery("commit");
		st.close();		
		rs.close();
		conn.close();
		
	} catch(Exception e){
		out.println(e);
	}
	
	%>	
	
	</div>
</body>
</html>