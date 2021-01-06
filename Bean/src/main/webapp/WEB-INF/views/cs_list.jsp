<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chatbotStart(arg1) {

		var url = "chat.do?csname="+arg1;
		var title = "Bean FAQ chatting";
		var prop = "top=300px,left=300px,width=800px,height=820px,resizable=no,fullscreen=no,location=no";

		window.open(url, title, prop);
		
	}
</script>


</head>

<%@ include file="./header.jsp"%>

<body>
	<br />
	<h1>고객센터</h1>
	<br />
	<br />


	<button onclick="chatbotStart('${login.member_name}');">실시간 채팅(팝업)</button>
	<span><input type="button" value="챗봇" onclick=""></span>

	<br />

	<!-- 검색 하기 -->
	<div></div>

	<!-- 게시판 -->
	<div>
		<table border="1">
			<colgroup>
				<col width="4%;">
				<col width="36%;">
				<col width="33%;">
				<col width="13%;">
				<col width="14%;">
			</colgroup>

			<thead>
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>

			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="5">-----작성된 글이 없어요-------</td>
						</tr>

				</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="csdto">
							<tr>
								<td>${csdto.csno }</td>
								<td>${csdto.cscategory }</td>
								<td><a href="csdetail.do?csno=${csdto.csno }">${csdto.cstitle }</a></td>
								<td>${csdto.csname }</td>
								<td><fmt:formatDate value="${csdto.csdate }" pattern="yyyy-MM-dd " /></td>				
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
				<tr>
					<td colspan="5" align="right">
							<input type="button" value="글작성" onclick="location.href='csinsertform.do?csname=${login.member_name}'" />
					</td>
		
		</tr>
				
			</tbody>
		</table>
	</div>

	<!-- 페이징 -->
	<div></div>


</body>
</html>