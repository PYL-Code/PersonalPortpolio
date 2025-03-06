<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String userid = (String) session.getAttribute("userid");
String nickname = (String) session.getAttribute("nickname");

String post_no = request.getParameter("post_no");

String url = "jdbc:mysql://localhost:3306/spring5fs";
String sql_post = "select * from post where post_no=" + post_no;
String sql_cmnt = "select c.cmnt_no, c.cmnt_txt, c.cmnt_date, c.cmnt_like, c.user_id, u.user_nick " +
				"from cmnt c left join users u using (user_id) " +
				"where c.post_no=" + post_no;
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
String cmnt_txt = "";
String cmnt_date = "";
String cmnt_userid = "";
String cmnt_usernick = "";
int cmnt_like=0;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박예림(@314_lim)</title>
<link rel="stylesheet" href="css/viewPost.css" />
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
            			if (!userid || userid === 'null') {
            				location.href = 'login/login_form.jsp'
            			}
				}
			}
		</script>
	</div>
	<div class="view-wrapper">
		<div class="viewpost">
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
		</div>
		
		<div class="viewcmnt">
			<div class="cmntlist">
		<%
		try{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql_cmnt);
			
			while(rset.next()){
				cmnt_no = rset.getString("c.cmnt_no");
				cmnt_txt = rset.getString("c.cmnt_txt");
				cmnt_date = rset.getString("c.cmnt_date");
				cmnt_userid = rset.getString("c.user_id");
				cmnt_usernick = rset.getString("u.user_nick");
				cmnt_like = rset.getInt("c.cmnt_like");
		%>		
				<div class="cmntinfo">
					<div class="cmntuser">
						<img src="https://placehold.co/50x50" />
						<span><%=cmnt_usernick %></span>
						<span>(<%=cmnt_userid %>)</span>
					</div>
					
					<div class="cmnttxt">
						<span><%=cmnt_txt %></span>
					</div>
					<div class="cmnt-txtbtn-container">
						<div class="cmntbuttons">
						  	<a class="like-btn" href="addlikeCmnt.jsp?cmnt_no=<%=cmnt_no %>&post_no=<%=post_no %>">
						  		<img alt="like" src="./img/3643770_favorite_heart_like_likes_love_icon.png" />
						  	</a>
							<a class="delete-btn" href="javascript:void(0)" class="delete-btn" data-userid="<%=userid%>" data-cmnt_id="<%=cmnt_userid%>" data-cmnt_no="<%=cmnt_no%>" data-post_no="<%=post_no%>">
							    <img src="./img/352548_three dots_icon.png"/>
							</a>
						</div>
					</div>
					<div class="cmntdatelike">
						<span><%=cmnt_date %></span>
						<% 
						if(cmnt_like != 0) {
						%>
						<span>좋아요 <%=cmnt_like %>개</span>
					  <%}%>
				 	</div>
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
			                if (!userid || userid === 'null') {
			                	location.href = 'login/login_form.jsp';
			                }
			            }
			        }
			    }
			</script>
			</div>
			<div class="writecmnt">
				<form action="uploadCmnt.jsp" onsubmit="return cmntLogincheck();">
					<input type="text" name="cmnt_txt" placeholder="댓글 달기..." />
					<input type="hidden" name="post_no" value="<%=post_no%>"/>
					<input type="hidden" name="userid" value="<%=userid%>" />
					<input type="submit" value="게시" />
				</form>
				<script>
					let userid = "<%=userid%>";
					
					function cmntLogincheck() {
						if (!userid || userid == 'null') {
							alert("로그인이 필요합니다.");
							location.href = 'login/login_form.jsp';
							return false;
						}
						return true;
					}
				</script>
			</div>
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