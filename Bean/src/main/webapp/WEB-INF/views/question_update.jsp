<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="./header.jsp"%>
	<h1>UPDATE</h1>
	
	<form action = "questionUpdateres.do" method = "post">
	<table border= "1">
		<input type = "hidden" value = "${questionDto.questionboard_no}" name = "questionboard_no"/>
		<tr>
			<th>제목</th>
			<td>${questionDto.questionboard_title}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${questionDto.questionboard_name }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows = "10" cols= "60" name= "questionboard_content">${questionDto.questionboard_content}</textarea></td>
		</tr>
		<tr>
			<td colspan = "2" align = "right">
				<input type = "submit" value = "수정" />
				<input type = "button" value = "취소" onclick = "location.href='questionList.do'"/>
			</td>
		</tr>
	</table>
	</form>


</body>
</html>