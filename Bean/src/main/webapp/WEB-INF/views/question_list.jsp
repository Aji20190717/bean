<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	
</head>
<body>
	
<h1>LIST</h1>
<table border = "1">
	
	<col width = "50">
	<col width = "100">
	<col width = "500">
	<col width = "100">

	<tr>	
		<th>번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성일</th>
	</tr>
	
	<c:choose>
		<c:when test="${empty questionlist}">
			<tr>	
			<th colspan = "4">--작성된 글이 없습니다----</th>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${questionlist }" var ="questiondto">
				<tr>
					<td>${questiondto.questionboard_no }</td>
					<td>${questiondto.questionboard_name }</td>
					<td><a href="questionDetail.do?questionboard_no=${questiondto.questionboard_no }">${questiondto.questionboard_title }</a></td>
					<td>${questiondto.questionboard_date }</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr>	
		<td colspan = "4" align = "right">
			<input type = "button" value = "글작성" onclick = "location.href='questionUpload.do'"/>
		</td>
	</tr>
</table>


</body>
	
</body>
</html>