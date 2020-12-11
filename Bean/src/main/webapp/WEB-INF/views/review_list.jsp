<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>

<body>
	<h1>list</h1>

	<table board="1">
		<col width="50" />
		<col width="100" />
		<col width="100" />
		<col width="100" />
		<col width="100" />
		<col width="100" />
		<col width="100" />
		<col width="100" />
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>내용</th>
			<th>날짜</th>
			<th>선생</th>
			<th>수강과목</th>
			<th>별점</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<th colspan="4">작성된 글이 존재하지 않습니다.</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.reviewboard_no }</td>
						<td>${dto.reviewboard_name }</td>
						<td>${dto.reviewboard_title }</td>
						<td>${dto.reviewboard_content }</td>
						<td><fmt:formatDate value="${dto.reviewboard_date }"
								pattern="yyyy-MM-dd-HH시" /></td>
						<td>${dto.class_name}</td>
						<td>${dto.reviewboard_te }</td>
						<td>${dto.reviewboard_star }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="left"><input type="button" value="글작성"
				onclick="location.href='review_insertform.do'" /></td>
		</tr>
	</table>
</html>