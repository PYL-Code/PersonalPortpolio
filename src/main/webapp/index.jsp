<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String userid = (String) session.getAttribute("userid");
String nickname = (String) session.getAttribute("nickname");

String url = "jdbc:mysql://localhost:3306/spring5fs";
String sql_post = "select * from post";
String sql_postnum = "select count(post_no) from post";

Connection conn = null;
Statement stmt = null;
ResultSet rset = null;

String postcount = "";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, "root", "1234");
    
    stmt = conn.createStatement();
    rset = stmt.executeQuery(sql_postnum);
    if(rset.next()) {
    	postcount = rset.getString("count(post_no)");
    }
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if(rset != null){try{rset.close();}catch(Exception e){e.printStackTrace();}}
	if(stmt != null){try{stmt.close();}catch(Exception e){e.printStackTrace();}}
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박예림(@314_lim)</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
<div class="header">
    <a class="logo" href="${pageContext.request.contextPath}/index.jsp">Instagram</a>
    <div>
    <% 
    	if (userid == null) {
    %>
        <a href="login/login_form.jsp"><button>로그인</button></a>
        <a href="login/signup_form.jsp"><button>가입하기</button></a>
    <%
    	} else {
    %>
    	<span>안녕하세요, <%=nickname %>님</span>
    	<a class="logout" href="login/logout.jsp">로그아웃</a>
    <%	
    	}
    %>
    </div>
</div>
<div class="info">
    <img alt="profile_picture" src="https://placehold.co/200x200"/>
    <div class="details">
        <div class="username">
            <span>314_lim</span>
            <a href="https://www.instagram.com/314_lim/"><button>팔로우</button></a>
            <a href="javascript:void(0)" onclick="uploadPost('<%=userid%>')"><button>게시물 업로드</button></a>
            <%//System.out.println(userid); %>
            
            <!-- 게시물 업로드 버튼 클릭 시 -->
            <script>
            	function uploadPost(userid) {
            		if ( userid === 'admin' ) {
            			location.href = 'uploadPost_form.jsp';
            		} else {
            			alert("접근 권한이 없습니다.");
            			if (!userid || userid === 'null') {
            				location.href = 'login/login_form.jsp'
            			}
            		}
            	}
            </script>
        </div>
        <div class="stats">
            <span>게시물 <%=postcount %></span><span>팔로워 3.14천</span><span>팔로우 314</span>
        </div>
        <div>
            <span>박예림</span><br>
            <span>개발자</span>
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
    <a href="https://blog.naver.com/314lim">블로그</a>
    <a href="#">개인정보처리방침</a>
    <a href="#">약관</a>
    <p>ⓒ 2025. 박예림 All rights reserved</p>
</div>
</body>
</html>
