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

	<form action="csinsertres.do" method="post">

		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="csname" value="${login.member_name }" readonly="readonly"></td>
			</tr>
			
			<tr>
				<th>분류</th>
				<td>
					<select name="cscategory" >
						<option>학습문의</option>
						<option>교재 관련 문의</option>
						<option>이용 문의</option>
					</select>
				</td>
			</tr>

			<tr>
				<th>제목</th>
				<td><input type="text" name="cstitle" /></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="csconment"></textarea></td>
			</tr>

			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="완료" />
					<input type="button" value="취소" onclick="location.href='cslist.do'" />
				</td>
			</tr>

		</table>
	</form>
</body>
</html>