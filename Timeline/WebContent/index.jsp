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
	<% 
		String id = (String)session.getAttribute("id");				
	%>
	<div align = "right">
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
		<% if(id == null){ %>
		<form name = "joinfrm" method = "post" action = "join.jsp">
		<input type = "submit" value = "회원가입"/>
		</form>
		<% } %>
	</div>


	
	<div align = "right">
	<% 
		if(id != null){
			String welcome = id + "님 반갑습니다 !";	
			out.println(welcome);				
	%>
		<form name = "logoutFrm" method = "post" action = "logout.jsp">
		<input type = "submit" value = "로그아웃"/>
		</form>
	</div>
	
	<div align = "center">
	<form name = "writeFrm" method = "post" action = "writeContent.jsp">
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
	</form>
	</div>
	<%
		}	
	%>
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
						
			String contentNumber = rs.getString("content_number");
			String user = rs.getString("content_user");
			String text = rs.getString("content_text");
			String date = rs.getString("wrote_date");
			
			String existReply1 = rs.getString("reply_exist1");
			String existReply2 = rs.getString("reply_exist2");
			
			String replyUser = rs.getString("reply_user1");
			String replyText = rs.getString("reply_text1");
			String replyNumber = rs.getString("reply_number");
			String replyUser2 = rs.getString("reply_user2");
			String replyText2 = rs.getString("reply_text2");
									
		%>
			<table border = "1" width = "500" height = "600">
				<tr height = "100">
					<td> <% out.print(user); %> </td>
					<td align = "right" colspan = "2"><% out.print(date); %></td>
				</tr>
				<tr>
					<td colspan = "3" align = "center" height = "300"><% out.print(text); %></td>
				</tr>
				<%
				if(existReply1.equals("Y")){
										
					String[] userArray = replyUser.split(", ");
					String[] replyArray = replyText.split(", ");
					
					for(int i = 0; i < userArray.length; i++){
					
						if(existReply2.equals("Y")){
							
							String[] numberArray = replyNumber.split(", ");
							String[] userArray2 = replyUser2.split(", ");
							String[] replyArray2 = replyText2.split(", ");
							int countNumber = 0;
							
							for(int j = 0; j < numberArray.length; j++){
								if(numberArray[j].equals(Integer.toString(i)))
									countNumber++;								
							}							
							
							if(id != null){
						%>									
								<tr>
									<td rowspan = "<%=countNumber + 2%>>" width = "50"> <% out.print(userArray[i]); %> </td>
									<td colspan = "2"> <% out.print(replyArray[i]); %> </td>
							<% }else{ %>
									<td rowspan = "<%=countNumber + 1%>"> <% out.print(userArray[i]); %> </td>
									<td colspan = "2"> <% out.print(replyArray[i]); %> </td>					
								</tr>
						<% 	}
						
							for(int j = 0; j < numberArray.length; j++){
								if(numberArray[j].equals(Integer.toString(i))){ %>
									<tr>
										<td width = "50"> <% out.print(userArray2[j]); %> </td>
										<td> <% out.print(replyArray2[j]);%></td>
									</tr>									
								<%}								
							}							
						} else {
							if(id != null){%>
								<tr>
									<td rowspan = "2" width = "50"> <% out.print(userArray[i]); %> </td>
									<td colspan = "2"> <% out.print(replyArray[i]); %> </td>
								<% }else{ %>
									<td> <% out.print(userArray[i]); %> </td>
									<td colspan = "2"> <% out.print(replyArray[i]); %> </td>					
								</tr>					
							<%}
						}
							if(id != null){%>
							<tr>
								<td colspan = "2">
									<% out.print(id);  %>
									<form name = "replyFrm2" method = "post" action = "writeReply2.jsp">
										<input type = "text" id = "reply2" name = "reply2" style = "width:300px;"/>
										<input type = "hidden" name = "numberValue" value = "<%=contentNumber%>"/> 
										<input type = "hidden" name = "replyValue" value = "<%=i%>"/>
										<input type = "submit" value = "댓글쓰기"/>
									</form>
								</td>
							</tr>
							<%} 		
					} %>
				<% } %>
				<% if(id != null){ %>
				<tr>
					<td> <% out.print(id); %> </td>
					<td colspan = "2">						
						<form name = "replyFrm1" method = "post" action = "writeReply1.jsp">
							<input type = "text" id = "reply1" name = "reply1" style = "width:300px;"/>
							<input type = "hidden" name = "numberValue" value = "<%=contentNumber%>"/>
							<input type = "submit" value = "댓글쓰기"/>							
						</form>
					</td>
				</tr>
				<% } %>
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