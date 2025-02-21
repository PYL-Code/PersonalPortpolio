<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String post_no = request.getParameter("post_no");

String url = "jdbc:mysql://localhost:3306/spring5fs";
String sql_post = "select * from post where post_no=" + post_no;
String sql_cmnt = "select * from cmnt where post_no=" + post_no;
Connection conn = null;
Statement stmt = null;
ResultSet rset = null;

String post_txt = "";
String post_date = "";
int post_like=0;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, "root", "1234");
	stmt = conn.createStatement();
	rset = stmt.executeQuery(sql_post);
	//ResultSet rset_comnt = stmt.executeQuery(sql_cmnt); //동시에 사용 불가능
	
	if(rset.next()){
		//img 파일 불러오기
		post_txt = rset.getString("post_txt");
		post_date = rset.getString("post_date");
		//post_like = rset_post.getInt("post_like"); //db에 null로 되어 있어서 주석처리함
	}
} catch(Exception e){
	e.printStackTrace();
} finally {
	if(rset != null) {try {rset.close(); } catch(SQLException e) {e.printStackTrace();}}
	if(stmt != null) {try {stmt.close(); } catch(SQLException e) {e.printStackTrace();}}
}

String cmnt_no = "";
String cmnt_id = "";
String cmnt_txt = "";
String cmnt_date = "";
int cmnt_like=0;

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
	<a href="login_form.jsp"><button>로그인</button></a>
	<a href="signup_form.jsp"><button>가입하기</button></a>
</div>
<div class="viewpost">
	<div>
	<img src="https://placehold.co/50x50"/>
	<span>314_lim</span>
	<a href="editPost_form.jsp?post_no=<%=post_no %>"><img src="./img/352548_three dots_icon.png" /></a>
	</div>
	<div class="post">
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
	<div class="viewCmnt">
<%
try{
	stmt = conn.createStatement();
	rset = stmt.executeQuery(sql_cmnt);
	
	while(rset.next()){
		cmnt_no = rset.getString("cmnt_no");
		cmnt_id = rset.getString("cmnt_id");
		cmnt_txt = rset.getString("cmnt_txt");
		cmnt_date = rset.getString("cmnt_date");
		cmnt_like = rset.getInt("cmnt_like");
%>		
		<div>
			<img src="https://placehold.co/50x50" />
			<span><%=cmnt_id %></span>
			<span><%=cmnt_txt %></span>
			<% 
			if(cmnt_like != 0) {
			%>
			<span><%=cmnt_like %></span>
		  <%}%>
		  	<a href="addlikeCmnt.jsp?cmnt_no=<%=cmnt_no %>&post_no=<%=post_no %>"><img alt="like" src="./img/3643770_favorite_heart_like_likes_love_icon.png" /></a>
			<span><%=cmnt_date %></span>
			<a href="delCmnt.jsp?cmnt_no=<%=cmnt_no %>&post_no=<%=post_no %>"><img src="./img/352548_three dots_icon.png"/></a>
		</div>
<%
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if(rset != null) {try {rset.close(); } catch(SQLException e) {e.printStackTrace();}}
	if(stmt != null) {try {stmt.close(); } catch(SQLException e) {e.printStackTrace();}}
	if(conn != null) {try {conn.close(); } catch(SQLException e) {e.printStackTrace();}}
}
%>
	</div>
	<div class="writecmnt">
		<form action="uploadCmnt.jsp">
			<input type="text" name="cmnt_txt" />
			<input type="hidden" name="post_no" value="<%=post_no%>"/>
			<input type="submit" />
		</form>
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