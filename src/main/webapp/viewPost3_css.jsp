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
		post_like = rset.getInt("post_like");
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
    gap: 20px; /* 게시물과 댓글 사이 간격 */
}
	.viewpost {
    width: 500px;
    background: white;
    border: 1px solid #dbdbdb;
    border-radius: 10px;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    margin-top: 120px;
}

.userinfo {
    display: flex;
    align-items: center;
    padding: 10px;
    gap: 10px;
    border-bottom: 1px solid #dbdbdb;
}

.userinfo img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
}

.userinfo a img {
    width: 20px;
    height: 20px;
    margin-left: auto;
}

.post img {
    width: 100%;
    object-fit: cover;
}

.post {
    padding: 10px;
}

.post span {
    display: block;
    font-size: 14px;
    margin-top: 5px;
}

.viewCmnt {
    padding: 10px;
}

.viewCmnt div {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 10px;
    padding-bottom: 5px;
}

.viewCmnt img {
    width: 30px;
    height: 30px;
    border-radius: 50%;
}

.writecmnt {
    display: flex;
    padding: 10px;
    border-top: 1px solid #dbdbdb;
}

.writecmnt input[type="text"] {
    flex: 1;
    padding: 8px;
    border: 1px solid #dbdbdb;
    border-radius: 20px;
    padding-left: 15px;
}

.writecmnt input[type="submit"] {
    background-color: #0095f6;
    color: white;
    border: none;
    padding: 8px 15px;
    cursor: pointer;
    border-radius: 20px;
    margin-left: 5px;
}
    .footer {
        bottom: 0;
        text-align: center;
        font-size: 12px;
        color: #8e8e8e;
        width: 100%;
        border-top: 1px solid #dbdbdb;
        padding-top: 10px;
        margin-top: 30px;
    }
    .footer a {
        text-decoration: none;
        color: #8e8e8e;
        margin: 0 5px;
    }
    .footer p {
        margin-top: 10px;
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
<div class="container">
	<div class="viewpost">
		<div class="userinfo">
		<img src="https://placehold.co/50x50"/>
		<span>314_lim</span>
		<a href="javascript:void(0)" onclick="updatePost(<%=post_no%>, '<%=userid%>')"><img src="./img/352548_three dots_icon.png" /></a>
		<script>
			function updatePost(post_no, userid) {
				if (userid == 'admin') {
					location.href = 'editPost_form.jsp?post_no=' + post_no;
				} else {
					alert('접근 권한이 없습니다.')
					if (!userid || userid === "null") { //userid가 null이거나 "null"일때
						location.herf = 'login/login_form.jsp';
					}
				}
			}
		</script>
		</div>
		<div class="post">
			<img src="https://placehold.co/750x750" />
			<div>
				<span><%=post_txt %></span>
			</div>
			<div>
				<a href="addlikePost.jsp?post_no=<%=post_no %>">
					<img src="./img/3643770_favorite_heart_like_likes_love_icon.png"/>
				</a>
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
			  	<a href="addlikeCmnt.jsp?cmnt_no=<%=cmnt_no %>&post_no=<%=post_no %>">
			  		<img alt="like" src="./img/3643770_favorite_heart_like_likes_love_icon.png" />
			  	</a>
				<span><%=cmnt_date %></span>
				<a href="javascript:void(0)" class="delete-btn" data-userid="<%=userid%>" data-cmnt_id="<%=cmnt_id%>" data-cmnt_no="<%=cmnt_no%>" data-post_no="<%=post_no%>">
				    <img src="./img/352548_three dots_icon.png"/>
				</a>
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
		<script>
		    document.querySelectorAll('.delete-btn').forEach(btn => {
		        btn.addEventListener('click', function() {
		            let userid = this.getAttribute('data-userid');
		            let cmnt_id = this.getAttribute('data-cmnt_id');
		            let cmnt_no = this.getAttribute('data-cmnt_no');
		            let post_no = this.getAttribute('data-post_no');
		
		            deletePost(userid, cmnt_id, cmnt_no, post_no);
		        });
		    });
		
		    function deletePost(userid, cmnt_id, cmnt_no, post_no) {
		        if (confirm('이 댓글을 삭제하시겠습니까?')) {
		            if (userid == cmnt_id) {
		                location.href = 'delCmnt.jsp?cmnt_no=' + cmnt_no + '&post_no=' + post_no;
		            } else {
		                alert("삭제 권한이 없습니다.");
		            }
		        }
		    }
		</script>
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