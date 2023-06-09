<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정페이지</title>
</head>
<body>
	<form action="/blog/board/updatePro" method="post">
		<table width="400" border="1" cellspacing="0" align="center">
			<tr>
				<td width="70" align="center">제 목</td>
				<td align="left" width="330"><input type="text" size="40"
					maxlength="50" name="subject" value="${dto.subject}">
				<input type="hidden" name="num" value="${dto.num}">
				</td>
			</tr>
			<tr>
				<td width="70" align="center">내 용</td>
				<td align="left" width="330"><textarea name="content" rows="13"
						cols="40">${dto.content}</textarea></td>
			</tr>
			<tr>
				<td width="70" align="center">비밀번호</td>
				<td align="left" width="330"><input type="password" size="8"
					maxlength="12" name="password"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="글수정">
					<input type="reset" value="다시작성"> <input type="button"
					value="글목록" onclick="location.href='/blog/board/boardList'" /></td>
			</tr>
		</table>
	</form>
</body>
</html>