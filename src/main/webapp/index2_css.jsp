<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    .profile {
        display: flex;
        align-items: center;
        max-width: 935px;
        margin: 40px auto;
        gap: 30px;
        justify-content: center;
    }
    .profile img {
        border-radius: 50%;
        width: 150px;
        height: 150px;
    }
    .profile-info {
        display: flex;
        flex-direction: column;
    }
    .profile-header {
        display: flex;
        align-items: center;
        gap: 15px;
    }
    .profile-header h1 {
        font-size: 24px;
        margin: 0;
    }
    .profile-actions {
        display: flex;
        gap: 10px;
    }
    .profile-actions button {
        background-color: #dbdbdb;
        color: black;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 5px;
    }
    .profile-stats {
        display: flex;
        gap: 20px;
        margin-top: 10px;
    }
    .highlight-container {
        max-width: 935px;
        margin: 20px auto;
    }
    .highlight {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
        justify-content: flex-start;
    }
    .highlight img {
        border-radius: 5px;
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
        text-align: left;
        padding: 20px;
        border-top: 1px solid #dbdbdb;
    }
</style>
</head>
<body>
    <div class="header">
        <a href="${pageContext.request.contextPath}/index.jsp">Instagram</a>
        <div>
            <button>로그인</button>
            <button>가입하기</button>
        </div>
    </div>
    <div class="profile">
        <img alt="profile_picture" src="https://placehold.co/150x150"/>
        <div class="profile-info">
            <div class="profile-header">
                <h1>314_lim</h1>
                <div class="profile-actions">
                    <button>팔로우</button>
                    <button>게시물 업로드</button>
                </div>
            </div>
            <div class="profile-stats">
                <span>게시물 10</span>
                <span>팔로워 3.14천</span>
                <span>팔로우 314</span>
            </div>
        </div>
    </div>
    <div class="highlight-container">
        <div class="highlight">
            <img alt="highlight1" src="https://placehold.co/70x70"/>
            <img alt="highlight2" src="https://placehold.co/70x70"/>
            <img alt="highlight3" src="https://placehold.co/70x70"/>
        </div>
    </div>
    <div class="posts">
        <img alt="post1" src="https://placehold.co/250x250"/>
        <img alt="post2" src="https://placehold.co/250x250"/>
        <img alt="post3" src="https://placehold.co/250x250"/>
        <img alt="post4" src="https://placehold.co/250x250"/>
        <img alt="post5" src="https://placehold.co/250x250"/>
        <img alt="post6" src="https://placehold.co/250x250"/>
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
