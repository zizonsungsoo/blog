<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="${pageContext.request.contextPath}/resources/static/css/style.css" rel="stylesheet" type="text/css">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
    body {
        background-color: #F0EDCC;
        font-family: 'Nanum Gothic', sans-serif;
    }
    .container{
        width: 1200px;
        height: auto;
        margin: 0 auto;
        background-color: #02343F;
    }
    .main_area{
        background-color: #F0EDCC;
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <div class="top">
        <ul class="main_menu_list">
            <li>
                <a href="allNote.jsp">게시판</a>
                <ul class="depth_1">
                    <li><a href="freeNote.jsp">전체게시판</a></li>
                    <li><a href="ceoMain.jsp">사진게시판</a></li>
                    <li><a href="typeMain.jsp">자유게시판</a></li>
                </ul>
            </li>
            <li>
                <a href="adminNote.jsp">공지사항</a>
            </li>
            <li>
                <a href="freeNote.jsp">방명록</a>
            </li>
        </ul>
    </div>
    <div class="main_area">
        <div>
            <h2>테스트용</h2>
        </div>
    </div>
</div>
</body>
