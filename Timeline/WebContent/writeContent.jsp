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
		String content = request.getParameter("content");
		
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";							 			
			Class.forName(driver);
			
			String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
			String db_id = "c##ejsja";
			String db_pw = "test";
			
			Connection conn = DriverManager.getConnection(url, db_id, db_pw);
			//conn.setAutoCommit(false);
			Statement st = conn.createStatement();
			String countSql = "select count(*) from content";
			ResultSet rs = st.executeQuery(countSql);
			rs.next();
			int contentCount = rs.getInt("COUNT(*)") + 1;
						
			String sql = "insert into content values (" + contentCount + ", '" + content + "', sysdate, 'N', '')";
			st.executeUpdate(sql);
									
			//st.executeQuery("commit");
			st.close();
			rs.close();
			conn.close();
			
			response.sendRedirect("main.jsp");			
			
		} catch (Exception e) {
			out.println(e);
		}
	
	%>
</body>
</html>