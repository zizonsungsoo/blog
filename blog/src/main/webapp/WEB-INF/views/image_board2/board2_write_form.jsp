<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wirte Form</title>
</head>
<body>
	<table>
		<form action="/blog/image_board2/board2_write_pro" enctype = "multipart/form-data" method="post">
			<input type="text" name="title" placeholder="Title">
			<textarea name="content" rows="10" cols="50" placeholder="Content"></textarea>
			<input type="file" name="image"> 
			<input type="reset" value="다시 작성">
			<input type="submit" value="등 록">
			<input type="button" value="목록 보기" OnClick="window.location='board2list.jsp'">
		</form>
	</table>
</body>
</html>
