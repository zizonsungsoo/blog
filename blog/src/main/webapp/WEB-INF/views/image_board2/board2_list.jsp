<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board2 list</title>
</head>
<body>
	<h1>board2 list</h1>

		<table border="1">
			<thead>
				<tr>
					<td width="50">번호</td>
					<td width="200">제목</td>
					<td width="100">작성자</td>
					<td width="150">작성일</td>
					<td width="50">조회수</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dtoo" items="${list}">
					<tr>
						<td>${dtoo.num}</td>
						<td><a href="board2_content?num=${dtoo.num }">${dtoo.title}</a></td>
						<td>${dtoo.id}</td>
						<td><fmt:formatDate value = "${dtoo.time}" pattern = "yyyy-MM-dd HH : mm" /></td>
						<td>${dtoo.readcount}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<form action="/blog/image_board2/board2_write_form">
			<input type="submit" value="글쓰기">
		</form>
</body>

</html>