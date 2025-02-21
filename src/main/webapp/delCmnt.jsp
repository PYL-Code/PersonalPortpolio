<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String post_no = request.getParameter("post_no");
String cmnt_no = request.getParameter("cmnt_no");

String url = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "delete from cmnt where cmnt_no=" + cmnt_no;
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
} finally {
	if(rset != null) {try {rset.close(); } catch(SQLException e) {e.printStackTrace();}}
	if(stmt != null) {try {stmt.close(); } catch(SQLException e) {e.printStackTrace();}}
	if(conn != null) {try {conn.close(); } catch(SQLException e) {e.printStackTrace();}}
}
response.sendRedirect("viewPost.jsp?post_no=" + post_no);
%>