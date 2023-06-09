<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<form action="insert" method="post">
	<table border="1">
	<tr>
		<td>
			writer
		</td>
		<td>
			<input type="text" name="writer"/>
		</td>	
	</tr>
	<tr>		
		<td>
			pw
		</td>
		<td>	
			<input type="password" name="pw"/>
		</td>
	</tr>
	<tr>
		<td> 
			content 
		</td>
		<td>
			<textarea name="content" rows="10" cols="60"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="글쓰기" />
		</td>
	</tr>
	</table>
</form>

<hr>
<table width="550"border="1">


<c:forEach var="dto" items="${list}">
	<tr>
		<td align="center">
	${dto.writer} 
		</td>
		<td align="center">
	<fmt:formatDate value="${dto.time}" pattern="yy/MM/dd HH:mm" />
		</td>
	</tr>
	<tr height="110">
		<td colspan="2">
	${dto.content}
		</td>
	</tr>
	<%-- <c:if test="${sessionScope.id != null }"> --%>
		<form>
	<tr>
		<td colspan="2" align="center">
			<textarea name="content" rows="10" cols="65"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="수정" onclick="location='update?num=${dto.num}'">
		
			<input type="button" value="삭제" onclick="location='delete?num=${dto.num}'">
		</td>
	</tr>	
		</form>
	<%-- </c:if> --%>
</c:forEach>

</table>




