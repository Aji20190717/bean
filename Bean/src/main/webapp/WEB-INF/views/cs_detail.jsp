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

<h1>Detail</h1>

	<table border="1">
		<tr>
			<th>작성자</th>
			<td>${csdto.csname }</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td>${csdto.cstitle }</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${csdto.csconment }</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="목록" onclick="location.href='cslist.do'"/>
				<input type="button" value="수정" onclick="location.href='csupdateform.do?csno=${csdto.csno}'"/>
				<input type="button" value="삭제" onclick="location.href='csdelete.do?csno=${csdto.csno}'"/>
			</td>
		</tr>
	
	</table>

</body>
</html>