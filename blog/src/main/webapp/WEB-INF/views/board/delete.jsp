<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/blog/board/deletePro?num=${num}" method="post">
	<tr>
    <TD>비밀번호</TD>
    <TD>
      <INPUT type=password name="password"></TD></TR>
  <TR>
    <TD>
<%--       <input type="hidden" name="num" value="${dto.num}"> --%>
		<input type="submit" value="삭제"/> <br />
		<input type="button" onclick="location.href='/blog/board/boardList'" value="취소"/> <br />
	</TD>
	</TR>
	</form>
</body>
</html>