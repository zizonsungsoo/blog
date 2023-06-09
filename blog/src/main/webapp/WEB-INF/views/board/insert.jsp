<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h1>insert</h1>
	<form action="/blog/board/insertPro" method="post">
		작성자 : <input type="text" name="writer" values="${memId }"/> <br />
		이메일 : <input type="text" name="email" values="${email }"/> <br />
		제목 : <input type="text" name="subject"/> <br />
		내용 : <input type="text" name="content"/> <br />
		비밀번호 : <input type="password" name="password"/> <br />
			<input type="submit" value="작성"/> <br />
			<input type="button" value="메인" onclick="location.href='/bloh/board/boardList'"/>
	</form>
</body>
</html>