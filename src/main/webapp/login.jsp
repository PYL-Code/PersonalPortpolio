<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	
	String signupCheck = request.getParameter("signupCheck");
	
	String url = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "select * from users where user_id=? ";
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
		
		rset = pstmt.executeQuery();
		if(rset.next()) {
			user_id = rset.getString("user_id");
			user_pw = rset.getString("user_pw");
			user_nick = rset.getString("user_nick");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(rset != null) {try{rset.close();}catch(Exception e){e.printStackTrace();}}
		if(pstmt != null) {try{pstmt.close();}catch(Exception e){e.printStackTrace();}}
		if(conn != null) {try{conn.close();}catch(Exception e){e.printStackTrace();}}
	}
	
	if (userid.equals(user_id) && password.equals(user_pw)) {
		session.setAttribute("userid", userid);
		session.setAttribute("nickname", user_nick);
		//System.out.println("로그인 성공!");
		
		if (signupCheck.equals("y")) {
			response.sendRedirect("index.jsp");
			
		} else {
		%>
			<script>history.go(-2);</script>
		<%
		}
	} else {
	%>
		<script>alert("잘못된 아이디 혹은 비밀번호입니다.");</script>
	<%
		response.sendRedirect("login_form.jsp"); //다시 로그인하도록
		
	}
%>