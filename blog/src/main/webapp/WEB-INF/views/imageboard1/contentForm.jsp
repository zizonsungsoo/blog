<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>게시판</title>
</head>

		<script language = "javascript" >
			function checkIn() {
				var content = document.chat.content.value;
				if(!content) {
					alert("댓글을 입력해주세요");
					document.chat.content.focus();
					return false;
				}
				if('${memId} == null || ${memId} == ""') {
					alert("로그인후 다시 작성하시기바랍니다.");
					return false;
				}
			}
		</script>

<center><b>글내용 보기</b>
<br>
	<table width = "500" border = "1" cellspacing = "0" cellpadding = "0" align  ="center">
		<tr height = "30">
			<td align = "center" width = "125" >글번호</td>
			<td align = "center" width = "125" align = "center" >
				${dto.num}</td>
			<td align = "center" width = "125" >조회수</td>
			<td align = "center" width = "125" align = "center" >
				${dto.readcount}</td>
		</tr>
		<tr height = "30" >
			<td align = "center" width = "125" >작성자</td>
			<td align = "center" width = "125" align = "center" >
				${dto.writer}</td>
			<td align = "center" width = "125" >작성일</td>
			<td align = "center" width = "125" align = "center">
				${sdf.format(dto.reg_date)}</td>
		</tr>
		<tr height = "30">
			<td align = "center" width ="125" >글제목</td>
			<td align = "center" width = "375" align = "center" colspan = "3">
				${dto.subject}</td>
		</tr>
		<tr>
			<td align = "center" width = "125" colspan = "4">글내용</td>
		</tr>
		<tr>
			<td align = "left" width = "375" colspan = "4">
				<img src = "/blog/resources/upload/${dto.image}" width = "200"	/>
				<pre>${dto.content}</pre>
			</td>
		</tr>
		<tr height = "30">
			<td colspan = "4" align = "right" >

			<c:if test="${memId != null}">
				<c:if test="${memId.equals(dto.writer)}">
					<input type = "button" value = "글수정"
					onclick = "document.location.href='updateForm?num=${dto.num}&pageNum=${pageNum}'">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type = "button" value = "글삭제"
					onclick = "document.location.href='contentDelete?num=${dto.num}&pageNum=${pageNum}'">
					&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:if test="${memId.equals('admin')}">
					<input type = "button" value = "답글쓰기"
					onclick = "document.location.href='writeForm?num=${dto.num}&ref=${dto.ref}&re_step=${dto.re_step}&re_level=${dto.re_level}'">
					&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
			</c:if>
			<input type = "button" value = "글목록"
			onclick="document.location.href='list?pageNum=${pageNum}'">
			</td>
		</tr>
<!-- ---------------------------------------------------------------------------------------------- -->
		
		
		<form name = "chat" action = "contentPro" method = "post" onSubmit = "return checkIn()" >
		<tr>
			<td align = "center" >
				${memId}
				<input type = "hidden" name = "writer" value = "${memId}" >
				<input type = "hidden" name = "num" value = "${dto.num}" >
				<input type = "hidden" name = "pageNum" value = "${pageNum}" >
				<input type = "hidden" name = "pr_pageNum" value = "${pr_pageNum}" >
			</td>
			<td colspan = "2" align = "left" >
				<input type = "text" name = "content" >
				<input type = "submit" value = "댓글" align = "right" >
			</td>
			<td align = "center" >
				<input type = "radio" name = "pick" value = "" >
			</td>
		</tr>
		<tr>
			<td colspan = "4" align = "center" >
				댓글 목록
			</td>
		</tr>
		<c:if test="${count == 0}" >
		</c:if>
		<c:if test="${count != 0}" >
			<c:if test="${memId != null}" >
				<c:forEach var = "contentBoard" items = "${contentBoard}" >
					<c:if test="${contentBoard.ref == contentBoard.num}" >
						<tr rowspan = "2" >	
							<td colspan = "4" align = "left" width = "400" >
								&nbsp;&nbsp;
								<b>${contentBoard.writer}</b>
								<font size = "1px"> ${contentBoard.reg_date} </font>
								<c:if test="${memId.equals(contentBoard.writer)}" >
									<input type = "button" value = "글삭제"
									onclick = "document.location.href='subDelete?num=${dto.num}&contentnum=${contentBoard.num}&pageNum=${pageNum}&pr_pageNum=${pr_pageNum}'">
								</c:if>
								<input type = "radio" name = "pick" value = "${contentBoard.num}" style="width:10px;height:10px;border:1px;">
								<br />
								&nbsp;&nbsp;
								${contentBoard.content}
							</td>
						</tr>
					</c:if>
					<c:if test="${contentBoard.ref != contentBoard.num}" >
						<tr rowspan = "2" >	
							<td colspan = "4" align = "left" width = "400" >
								<c:forEach var="i" begin="1" end="${contentBoard.re_level}" step="1" >
									&nbsp;&nbsp;&nbsp;
								</c:forEach>
								&nbsp;&nbsp;
								<img src = "/blog/resources/images/re.gif">
								<b>${contentBoard.writer}</b>
								<font size = "1px"> ${contentBoard.reg_date} </font>
								<c:if test="${memId.equals(contentBoard.writer)}" >
									<input type = "button" value = "글삭제"
									onclick = "document.location.href='subDelete?num=${dto.num}&contentnum=${contentBoard.num}&pageNum=${pageNum}&pr_pageNum=${pr_pageNum}'">
								</c:if>
								<input type = "radio" name = "pick" value = "${contentBoard.num}" style="width:10px;height:10px;border:1px;">
								<br />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								${contentBoard.content}
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${memId == null}" >
				<c:forEach var = "contentBoard" items = "${contentBoard}" >
					<c:if test="${contentBoard.ref == contentBoard.num}" >
						<tr rowspan = "2" >	
							<td colspan = "4" align = "left" width = "400" >
								&nbsp;&nbsp;
								<b>${contentBoard.writer}</b>
								<font size = "1px"> ${contentBoard.reg_date} </font>
								<br />
								&nbsp;&nbsp;
								${contentBoard.content}>
							</td>
						</tr>
					</c:if>
					<c:if test="${contentBoard.ref != contentBoard.num}" >
						<tr rowspan = "2" >	
							<td colspan = "4" align = "left" width = "400" >
								<c:forEach var="i" begin="1" end="${contentBoard.re_level}" step="1" >
									&nbsp;&nbsp;&nbsp;
								</c:forEach>
								&nbsp;&nbsp;
								<img src = "/blog/resources/images/re.gif">
								<b>${contentBoard.writer}</b>
								<font size = "1px"> ${contentBoard.reg_date} </font>
								<br />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								${contentBoard.content}
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</c:if>
		</form>
		<tr>
			<td colspan = "4" align = "center" >
				<c:if test="${count > 0}" >
					<c:if test="${startPage > 10}" >
						<a href = "/blog/imageboard1/contentForm?num=${dto.num}&pageNum=${pageNum}&pr_pageNum=${startPage - 10}">[이전]</a>
					</c:if>	
					<c:forEach var = "i" items = "${page}" >
						<a href = "/blog/imageboard1/contentForm?num=${dto.num}&pageNum=${pageNum}&pr_pageNum=${i}">[${i}]</a>
					</c:forEach>
					<c:if test="${endPage < pageCount}" >
						<a href = "/blog/imageboard1/contentForm?num=${dto.num}&pageNum=${pageNum}&pr_pageNum=${startPage + 10}">[다음]</a>
					</c:if>
				</c:if>
			</td>
		</tr>		
	</table>
</body>
</html>