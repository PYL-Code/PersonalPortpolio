<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String post_txt = request.getParameter("post_txt");
String post_img = request.getParameter("post_img");

String url = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "insert into post (post_img, post_txt, post_date) values (null, '"+ post_txt +"', current_date())";
Connection conn = null;
Statement stmt = null;
ResultSet rset = null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	stmt.executeUpdate(sql);
} catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("index.jsp");
%>