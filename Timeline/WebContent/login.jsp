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
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
	
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";							 			
			Class.forName(driver);
			
			String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
			String db_id = "c##ejsja";
			String db_pw = "test";
			
			Connection conn = DriverManager.getConnection(url, db_id, db_pw);
			Statement st = conn.createStatement();
			String sql = "select * from user_info where id = '" + id + "' and passwd = '" + passwd + "'";
			st.executeUpdate(sql);
			ResultSet rs = st.executeQuery(sql);
			
			Boolean isLogin = false;
			
			while(rs.next()){
				isLogin = true;
			}
			
			if(isLogin){
				session.setAttribute("id", id);
				session.setAttribute("passwd", passwd);
				response.sendRedirect("main.jsp");
			} else {				
				%> <script> alert("로그인 실패"); history.go(-1);</script> <%
			}			
			
			
		} catch (Exception e) {
			out.println(e);
		}
	
	%>
</body>
</html>