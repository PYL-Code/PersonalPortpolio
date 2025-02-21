<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String url = "jdbc:mysql://localhost:3306/spring5fs";
String sql_post = "select * from post";

Connection conn = null;
Statement stmt = null;
ResultSet rset = null;
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
        background-color: #fafafa;
    }
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #fff;
        padding: 15px 20px;
        border-bottom: 1px solid #dbdbdb;
    }
    .header a {
        font-size: 20px;
        font-weight: bold;
        text-decoration: none;
        color: #262626;
    }
    .header div {
        display: flex;
        gap: 10px;
    }
    .header button {
        background-color: #0095f6;
        color: white;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 5px;
    }
    .info {
        display: flex;
        align-items: center;
        max-width: 935px;
        margin: 40px auto;
        gap: 30px;
        justify-content: center;
    }
    .info button {
        background-color: #dbdbdb;
        color: black;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 5px;
    }
    .info img {
        border-radius: 50%;
        width: 150px;
        height: 150px;
    }
    .info .details {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
    .info .username {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .info h1 {
        font-size: 24px;
        margin: 0;
    }
    .info .stats {
        display: flex;
        gap: 15px;
    }
    .highlight {
        max-width: 935px;
        margin: 20px auto;
        display: flex;
        gap: 10px;
        justify-content: flex-start;
    }
    .highlight img {
        border-radius: 50%;
    }
    .posts {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 10px;
        justify-content: center;
        max-width: 935px;
        margin: 20px auto;
    }
    .posts img {
        width: 100%;
        border-radius: 5px;
    }
    .footer {
        text-align: center;
        padding: 20px;
        border-top: 1px solid #dbdbdb;
    }
</style>
</head>
<body>
<div class="header">
    <a href="index.jsp">Instagram</a>
    <div>
        <a href="login_form.jsp"><button>로그인</button></a>
        <a href="signup_form.jsp"><button>가입하기</button></a>
    </div>
</div>
<div class="info">
    <img alt="profile_picture" src="https://placehold.co/200x200"/>
    <div class="details">
        <div class="username">
            <h1>314_lim</h1>
            <button>팔로우</button>
            <a href="uploadPost_form.jsp"><button>게시물 업로드</button></a>
        </div>
        <div class="stats">
            <span>게시물 "게시물 숫자"</span><span>팔로워 3.14천</span><span>팔로우 314</span>
        </div>
        <div>
            <h3>박예림</h3>
            <p>개발자</p>
        </div>
    </div>
</div>
<div class="highlight">
    <img alt="highlight1" src="https://placehold.co/100x100"/>
    <img alt="highlight2" src="https://placehold.co/100x100"/>
    <img alt="highlight3" src="https://placehold.co/100x100"/>
</div>
<div class="posts">
<%
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, "root", "1234");
        stmt = conn.createStatement();
        rset = stmt.executeQuery(sql_post);
        
        while(rset.next()){
            %>
            <div>
              <a href="viewPost.jsp?post_no=<%=rset.getInt("post_no") %>">
                <img src="https://placehold.co/250x250"/>
              </a>
            </div>
            <%
        }
    }catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(rset != null) {try {rset.close(); } catch(SQLException e) {e.printStackTrace();}}
        if(stmt != null) {try {stmt.close(); } catch(SQLException e) {e.printStackTrace();}}
        if(conn != null) {try {conn.close(); } catch(SQLException e) {e.printStackTrace();}}
    }
%>
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
