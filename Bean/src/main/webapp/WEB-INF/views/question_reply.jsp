<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="./header.jsp"%>
	<h1>UPDATE</h1>

	<form action="questionReplyRes.do" method="post">
		<table border="1">
			<input type="hidden" value="${questionDto.questionboard_no}" name="questionboard_no" />
			<tr>
				<th>제목</th>
				<td>${questionDto.questionboard_title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${questionDto.questionboard_name}</td>
			</tr>
			<tr>
				<th>이미지 출력</th>
				<td><img
					src="${pageContext.request.contextPath}/resources/storage/${questionDto.questionboard_imgname}" />
			</tr>
			<tr>
				<th>글</th>
				<td><textarea rows="10" cols="60" readonly="readonly">${questionDto.questionboard_content }</textarea></td>
			</tr>
			<tr>
				<!-- TODO: ocr 내용을 넣을 수 있을 지 없을지 여부, ocr 내용이 있는지 없는지 여부 -->
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="questionboard_reply">${questionboard_ocr }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정" />
					<input type="button" value="취소" onclick="location.href='questionList.do'" /></td>
			</tr>
		</table>
	</form>

</body>
</html>