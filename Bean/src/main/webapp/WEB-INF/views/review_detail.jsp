<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>

</head>
<body>

	<table barder="1">
		<tr>
			<th>작성자</th>
			<th>${dto.reviewboard_name }</th>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.reviewboard_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${dto.reviewboard_content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="수정" onclick="location.href='review_updateform.do?reviewboard_no=${dto.reviewboard_no}'"/>
				<input type="button" value="삭제" onclick="location.href='review_delete.do?reveiwboard_no=${dto.reveiwboard_no}'"/>
				<input type="button" value="목록" onclick="location.href='review_list.do'"/>
	</table>




</body>
</html>