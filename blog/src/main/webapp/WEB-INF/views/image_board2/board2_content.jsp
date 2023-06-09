<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board2 content</title>
</head>
<body>
<table>
	<tr>
		<td> 글 번호</td>
		<td> ${content.num}</td>
	</tr>
	<tr>
		<td> 작성자 </td>
		<td> ${content.id }</td>
		<td> 제 목 </td>
		<td> ${content.title } </td>
		<td> 작성일 </td>
		<td> ${content.time } </td>
	</tr>
	<tr>
		<td> 조회수 </td>
		<td> ${content.readcount } </td>
	</tr>
	<tr>
		<td> 내 용 </td>
		<td> ${content.content } </td>
		<td> 이미지 </td>
		<td>
			<img src = "/blog/resources/upload2/${content.image }" />
		</td>
	</tr>
</table>
</body>
</html>