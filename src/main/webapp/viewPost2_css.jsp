<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String userid = (String) session.getAttribute("userid");
String nickname = (String) session.getAttribute("nickname");

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
<style>
	body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #fafafa;
    flex-direction: column;
        
    }
    .header {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    background-color: #fff;
	    padding: 15px 20px;
	    border-bottom: 1px solid #dbdbdb;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    z-index: 1000;
	    box-sizing: border-box;
    	flex-wrap: nowrap; /* 요소가 줄 바꿈되지 않도록 설정 */
	}
	.header div {
	    display: flex;
	    gap: 10px; /* 버튼 사이 간격 추가 */
	}
	.header button {
	    background-color: #0095f6;
	    color: white;
	    border: none;
	    padding: 5px 10px;
	    cursor: pointer;
	    border-radius: 5px;
	}
	.header .logo {
	    font-size: 20px;
	    font-weight: bold;
	    text-decoration: none;
	    color: #262626;
	}
	.header .logout {
	    font-weight: bold;
	    text-decoration: none;
	    color: #0095f6;
	}
	.container {
		display: flex;
		justify-content: center;
		align-items: flex-start;
		margin-top: 120px;
		width: 80%; /* Adjust width to make layout responsive */
	}
	.viewpostimg {
		width: 50%;
		display: flex;
		justify-content: center;
	}
	.viewpostimg img {
		width: 100%;
		max-width: 500px;
		height: auto;
		border-radius: 10px;
	}
	.viewpostdetail {
		width: 50%;
		padding-left: 20px; /* Spacing between image and details */
	}
	.viewuserinfo {
		display: flex;
		align-items: center;
		margin-bottom: 15px;
	}
	.viewuserinfo img {
		width: 40px;
		height: 40px;
		border-radius: 50%;
		margin-right: 10px;
	}
	.viewuserinfo span {
		font-weight: bold;
		color: #262626;
		font-size: 14px;
	}
	.viewpostinfo {
		margin-top: 10px;
	}
	.viewpostinfo span {
		font-size: 14px;
		color: #262626;
		display: block;
	}
	.viewCmnt {
		margin-top: 20px;
		border-top: 1px solid #dbdbdb;
		padding-top: 10px;
	}
	.cmntinfo {
		display: flex;
		align-items: center;
		margin-bottom: 15px;
		padding: 10px 0;
		border-bottom: 1px solid #f1f1f1;
	}
	.cmntinfo img {
		width: 35px;
		height: 35px;
		border-radius: 50%;
		margin-right: 10px;
	}
	.cmntinfo span {
		font-size: 14px;
		color: #262626;
	}
	.writecmnt {
		margin-top: 20px;
		display: flex;
		flex-direction: column;
		align-items: flex-start;
	}
	.writecmnt input[type="text"] {
		width: 100%;
		padding: 10px;
		margin-bottom: 10px;
		border: 1px solid #dbdbdb;
		border-radius: 5px;
		font-size: 14px;
	}
	.writecmnt input[type="submit"] {
		background-color: #0095f6;
		color: white;
		border: none;
		padding: 8px 15px;
		border-radius: 5px;
		cursor: pointer;
		font-size: 14px;
	}
    .footer {
    position: absolute;
    bottom: 10px;
    text-align: center;
    font-size: 12px;
    color: #8e8e8e;
    width: 100%;
    border-top: 1px solid #dbdbdb; /* 상단 border 추가 */
    padding-top: 10px; /* border와 내용 간격 */
	}
	
	.footer a {
	    text-decoration: none;
	    color: #8e8e8e;
	    margin: 0 5px;
	}
	
	.footer p {
	    margin-top: 10px; /* a 태그와 간격 추가 */
	}
</style>

</head>
<body>
<div class="header">
    <a class="logo" href="${pageContext.request.contextPath}/index.jsp">Instagram</a>
    <div>
    <% 
    	if (userid == null) {
    %>
        <a href="login_form.jsp"><button>로그인</button></a>
        <a href="signup_form.jsp"><button>가입하기</button></a>
    <%
    	} else {
    %>
    	<span>안녕하세요, <%=nickname %>님</span>
    	<a class="logout" href="logout.jsp">로그아웃</a>
    <%	
    	}
    %>
    </div>
</div>

<div class="container">
	<div class="viewpostimg">
		<img src="https://placehold.co/750x750" />	
	</div>
	<div class="viewpostdetail">
		<div class="viewuserinfo">
			<img src="https://placehold.co/50x50"/>
			<span>314_lim</span>
			<a href="editPost_form.jsp?post_no=<%=post_no %>"><img src="./img/352548_three dots_icon.png" /></a>
		</div>
		<div class="viewpostinfo">
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
			<div class="cmntinfo">
				<img src="https://placehold.co/50x50" />
				<span><%=cmnt_id %></span>
				<span><%=cmnt_txt %></span>
				<% 
				if(cmnt_like != 0) {
				%>
				<span>좋아요 <%=cmnt_like %>개</span>
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
				<input type="text" name="cmnt_txt" placeholder="댓글 달기..." />
				<input type="hidden" name="post_no" value="<%=post_no%>"/>
				<input type="submit" value="게시" />
			</form>
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