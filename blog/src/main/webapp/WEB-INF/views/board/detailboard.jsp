<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
</head>
<body>
<form>
<table width="500" border="1"cellpadding="0"  align="center">  
  <tr height="30">
    <td align="center" width="125">글번호</td>
    <td align="center" width="125" align="center">
	     ${dto.num}</td>
    <td align="center" width="125">조회수</td>
    <td align="center" width="125" align="center">
	     ${dto.readcount}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125">작성자</td>
    <td align="center" width="125" align="center">
	    ${dto.writer}</td>
    <td align="center" width="125">작성일</td>
    <td align="center" width="125" align="center">
	     <fmt:formatDate value="${dto.reg_date}"
						pattern="yyyy/MM/dd HH:mm:ss" /></td>
  </tr>
  <tr height="30">
    <td align="center" width="125">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     ${dto.subject}</td>
  </tr>
  <tr>
    <td align="center" width="125">글내용</td>
    <td align="left" width="375" colspan="3"><pre>${dto.content}</pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4" align="right" > 
	  <input type="button" value="글수정" 
       onclick="document.location.href='update?num=${dto.num}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='delete?num=${dto.num}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" onclick="location.href='/blog/board/boardList'"/>
    </td>
  </tr>
</table>  
</form>
</body>
</html>