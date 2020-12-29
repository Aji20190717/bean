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
<!-- TODO : img가 없을 경우 예외처리를 할 것 -->
	<table border="1">
		<tr>
			<th>question_no</th>
			<td>${questionDto.questionboard_no }</td>
		</tr>
		<tr>
			<th>member_no</th>
			<td>${questionDto.member_no}</td>
		</tr>
		<tr>
			<th>questionboard_name</th>
			<td>${questionDto.questionboard_name }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${questionDto.questionboard_title }</td>
		</tr>
		<tr>
			<th>글</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${questionDto.questionboard_content }</textarea></td>
		</tr>
		<tr>
			<th>date</th>
			<td>${questionDto.questionboard_date}</td>
		</tr>
		<tr>
			<th>readcount</th>
			<td>${questionDto.questionboard_readcount}</td>
		</tr>
		<tr>
			<!-- step 이름으로 바꿀 것 -->
			<!-- 0 일 경우 비어있게, 답변이 됐을 경우 이름으로 -->
			<th>step</th>
			<td>${questionDto.questionboard_step}</td>
		</tr>
		<tr>
			<!-- 질문의 유형으로 if 1. 문제풀이 2.작문 -->
			<th>groupno</th>
			<td>${questionDto.questionboard_groupno }</td>
		</tr>
		<tr> 	
			<th>question reply</th>
			<td>${questionDto.questionboard_reply}</td>
		</tr>
		<tr>
			<th>question reply date</th>
			<td>${questionDto.questionboard_date}</td>
			
		</tr>
		<tr>
			<th>이미지 출력</th>
			<td><img src = "${pageContext.request.contextPath}/resources/storage/${questionDto.questionboard_imgname}"/>
		</tr>
		<tr>
			<th>OCR</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${questionDto.questionboard_ocr }</textarea></td>
		</tr>


		<tr>
			<td colspan="2" align="right">
				<!-- TODO : 작성자의 경우 수정, 강사의 경우 답변 -->
				<c:choose>
				<c:when test= "${login.member_no  eq questionDto.member_no }">
				<input type="button" value="수정" onclick="location.href='questionUpdate.do?questionboard_no=${questionDto.questionboard_no}'"/>
				</c:when>
				<c:when test= "${login.member_type  eq 'T'}">
				<input type ="button" value = "답변" onclick ="location.href='questionReply.do?questionboard_no=${questionDto.questionboard_no}'"/>
				</c:when>
				</c:choose>
				<!-- TODO : 삭제할 때 유효성 처리(session과 비교) -->
				<input type="button" value="삭제" onclick="location.href='questionDelete.do?questionboard_no=${questionDto.questionboard_no}'" /> 
				<input type="button" value="목록" onclick="location.href='questionList.do'" /></td>
		</tr>
	</table>
		<script>
			CKEDITOR.replace('contents');
		</script>


</body>
</html>