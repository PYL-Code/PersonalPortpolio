<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");

	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "insert into users (user_id, user_pw, user_nick) values (?, ?, ?)";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String user_id = "";
	String user_pw = "";
	String user_nick = "";
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, "root", "1234");
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, password);
		pstmt.setString(3, nickname);
		
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(rset != null) {try{rset.close();}catch(Exception e){e.printStackTrace();}}
		if(pstmt != null) {try{pstmt.close();}catch(Exception e){e.printStackTrace();}}
		if(conn != null) {try{conn.close();}catch(Exception e){e.printStackTrace();}}
	}
	response.sendRedirect("login_form.jsp");
%>