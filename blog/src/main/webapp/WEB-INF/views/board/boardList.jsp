<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
</head>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="boardList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
<c:if test="${uPTrue == 1 }">
	<script>
		alert("수정 성공.");
	</script>
</c:if>
	<b>글목록(전체 글 :${count})</b>
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
		<form action="/blog/board/insert">
			<input type="submit" value="글쓰기">
			<input type="button" value="글목록" onclick="location.href='/blog/board/boardList'"/>
		</form>
	<c:if test="${count==0}">
		<table width="700" border="1"cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
		</table>
	</c:if>
	
	<c:if test="${count!=0}">
		<table border="1" width="900" cellspacing="0" align="center"> 
    <tr height="30"> 
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="350" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="250" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
    </tr>
<c:forEach var="dto" items="${viewAll}">
			<tr height="30">
				<td align="center"  width="50" >${dto.num}</td>
				<td align="center" width="350" ><a href="detailboard?num=${dto.num }">${dto.subject}</a></td>
				<td align="center"  width="100"> ${dto.writer}</td>
				<%-- <td>${dto.content}</td> --%>
				<td align="center"  width="250">
				<fmt:formatDate value="${dto.reg_date}" pattern="yyyy년 MM월 dd일 a hh시 mm분 " /></td>
				<td align="center"  width="50">${dto.readcount}</td>
			</tr>
		</c:forEach>
</table>
	</c:if>
	<div text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/blog/board/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/blog/board/boardList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/boardList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</body>
</html>