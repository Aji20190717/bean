<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@ include file="./header.jsp"%>

<body>

	<form action="csupdateres.do" method="post">
		<input type="hidden" name="csno" value="${dto.csno }" />
		<table border="1">
			<tr>
				<th>작성자</th>
				<td>${login.member_name }</td>
			</tr>

			<tr>
				<th>제목</th>
				<td><input type="text" name="cstitle" value="${dto.cstitle }" /></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="csconment">${dto.csconment }</textarea></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="수정" /> 
				<input type="button" value="취소" onclick="location.href='cslist.do'" /></td>
			</tr>

		</table>

	</form>


</body>
</html>