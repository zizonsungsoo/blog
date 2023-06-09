<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
</head>
<body>
<table width="500" border="1"cellpadding="0"  align="center">  
<form>
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
</form>
</table> 
 	<div align="center">
	<b>댓글목록(전체 댓글 :${commentcount})</b>
	</div>
		<form action="/blog/board/detailboardPro?num=${dto.num}" align="center" method="post">
			작성자 : <input type="text" name="cwriter" values="${memId }"/> <br />
			내용 : <input type="text" name="content" /> <br />
			<input type="submit" value="댓글쓰기">
		</form>
	<c:if test="${commentcount==0}">
		<table width="700" border="1"cellspacing="0" align="center">
			<tr>
				<td align="center">등록된 댓글이 없습니다.</td>
		</table>
	</c:if>
	
	<c:if test="${commentcount!=0}">
		<table border="1" width="900" cellspacing="0" align="center"> 
    <tr height="30"> 
      <td align="center"  width="70"  >댓글번호</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="300" >내 용</td>
      <td align="center"  width="250" >작성일</td> 
    </tr>
<c:forEach var="cdto" items="${list}">
			<tr height="30">
				<td align="center"  width="70" >${cdto.cno}</td>
				<td align="center"  width="100"> ${cdto.cwriter}</td>
				<td align="center" width="350" >${cdto.content}</td>
				<td align="center"  width="250">
				<fmt:formatDate value="${cdto.reg_date}" pattern="yyyy년 MM월 dd일 a hh시 mm분 " /></td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</body>
</html>