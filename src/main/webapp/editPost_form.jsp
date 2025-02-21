<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String post_no = request.getParameter("post_no");

String url = "jdbc:mysql://localhost:3306/spring5fs";
String sql_post = "select * from post where post_no=" + post_no;

String post_txt = "";

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, "root", "1234");
	Statement stmt = conn.createStatement();
	ResultSet rset_post = stmt.executeQuery(sql_post);
	
	if(rset_post.next()){
		//img 파일 불러오기
		post_txt = rset_post.getString("post_txt");
	}
} catch(Exception e){
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header">
	<!-- 로그인 정보 -->
</div>
<div class="post">
	<form action="editPost.jsp">
	<div>
		<span>게시물 수정</span>
		<input type="submit" value="완료" />
	</div>
		<input type="text" name="post_txt" value="<%=post_txt %>" />
		<input type="hidden" name="post_no" value="<%=post_no %>" />
	</form>
</div>
<div class="footer">
	<a href="#">소개</a>
	<a href="#">블로그</a>
	<a href="#">개인정보처리방침</a>
	<a href="#">약관</a>
	<p>ⓒ 2025. 박예림 All rights reserved</p>
</div>
</body>
</html>