<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TIMELINE</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		String reply = request.getParameter("reply2");
		String contentNumber = request.getParameter("numberValue");
		String numberValue = request.getParameter("replyValue");
				
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";							 			
			Class.forName(driver);
			
			String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
			String db_id = "c##ejsja";
			String db_pw = "test";
			
			Connection conn = DriverManager.getConnection(url, db_id, db_pw);
			//conn.setAutoCommit(false);
			Statement st = conn.createStatement();
			String findSql = "select * from content where content_number = " + contentNumber;
			ResultSet rs = st.executeQuery(findSql);
			rs.next();
			
			String replyUser = rs.getString("reply_user2");
			String replyText = rs.getString("reply_text2");
			String replyNumber = rs.getString("reply_number");
			
			
			if(replyUser == null){
				replyUser = id;
			} else {
				replyUser += ", " + id;
			}
			
			if(replyText == null){
				replyText = reply;
			} else {
				replyText += ", " + reply;
			}			
			
			if(replyNumber == null){
				replyNumber = numberValue;
			} else {
				replyNumber += ", " + numberValue;
			}
			
			String sql = "update content set reply_exist2 = 'Y', reply_user2 = '" + replyUser + "', reply_text2 ='" + replyText + "', reply_number = '" + replyNumber + "' where content_number = " + contentNumber ;
			st.executeUpdate(sql);
			
			
			//st.executeQuery("commit");
			st.close();
			rs.close();
			conn.close();
			
			response.sendRedirect("index.jsp");			
			
		} catch (Exception e) {
			out.println(e);
		}
	
	%>
</body>
</html>