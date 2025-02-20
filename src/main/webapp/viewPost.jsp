<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String post_no = request.getParameter("post_no");

String url = "jdbc:mysql://localhost:3306/spring5fs";
String sql_post = "select * from post where post_no=" + post_no;
String sql_cmnt = "select * from cmnt where post_no=" + post_no;

String post_txt = "";
String post_date = "";
int post_like=0;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, "root", "1234");
	Statement stmt = conn.createStatement();
	ResultSet rset_post = stmt.executeQuery(sql_post);
	//ResultSet rset_comnt = stmt.executeQuery(sql_cmnt); //동시에 사용 불가능
	
	if(rset_post.next()){
		//img 파일 불러오기
		post_txt = rset_post.getString("post_txt");
		post_date = rset_post.getString("post_date");
		//post_like = rset_post.getInt("post_like"); //db에 null로 되어 있어서 주석처리함
	}
} catch(Exception e){
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박예림(@314_lim)</title>
</head>
<body>
<div class="header">
	<a href="index.jsp">Instagram</a>
	<a href="login.jsp"><button>로그인</button></a>
	<a href="signup.jsp"><button>가입하기</button></a>
</div>
<div class="viewpost">
	<div>
	<img src="https://placehold.co/50x50"/>
	<span>314_lim</span>
	<a href="editPost_form.jsp?post_no=<%=post_no %>">+</a>
	</div>
	<div>
		<img src="https://placehold.co/750x750" />
		<div>
			<span><%=post_txt %></span>
		</div>
		<div>
		<% 
			if(post_like != 0) {
			%>
			<span><%=post_like %>명이 좋아합니다.</span>
			<%
			}
		%>
			<span><%=post_date %></span>
		</div>
	</div>
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