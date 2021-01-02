<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="questionUploadres.do" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="member_no" value="${login.member_no}" />
		<input type="hidden" name="questionboard_name" value="${login.member_name }" />
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="questionboard_title" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="questionboard_content"></textarea></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="작성" />
				</td>
			</tr>
		</table>
	</form>

</body>
</html>