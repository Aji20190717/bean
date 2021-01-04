<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		var member_no = $("#memberno").val();
		var loginmemberno =$("#loginmemberno").val();
		var member_type=$("#membertype").val();
		var loginmembertype=$("#loginmembertype").val();
		
		console.log("memberno : " +member_no);
		console.log("login.memberno : " +loginmemberno);
		console.log("membertype : "+member_type;
		console.log("login.membertype : " + loginmembertype);
		
	})

</script>
</head>
<body>

	<table border="1">
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
			<input type="text" id="memberno" value="${dto.member_no}">
			<input type="text" id="loginmemberno" value="${login.member_no}">
			<input type="text" id="membertype" value="${login.member_type}">
			<input type="text" id="loginmembertype" value="${login.member_type}">
				
				<c:choose>
					<c:when test="${login.member_no != dto.member_no}">
					<!-- 글쓴이가 member_no와 같다면 수정.삭제.목록 이 떠야되요 -->
						<input type="button" value="목록" onclick="location.href='review_list.do'"/>										
					</c:when>
					<c:when test="${login.member_type =='A'}">
						<input type="button" value="수정" onclick="location.href='review_updateform.do?reviewboard_no=${dto.reviewboard_no}'"/>
						<input type="button" value="삭제" onclick="location.href='review_delete.do?reveiwboard_no=${dto.reviewboard_no}'"/>
						<input type="button" value="목록" onclick="location.href='review_list.do'"/>					
					</c:when>
					
					<c:otherwise>
						<input type="button" value="수정" onclick="location.href='review_updateform.do?reviewboard_no=${dto.reviewboard_no}'"/>
						<input type="button" value="삭제" onclick="location.href='review_delete.do?reveiwboard_no=${dto.reviewboard_no}'"/>
						<input type="button" value="목록" onclick="location.href='review_list.do'"/>					
					</c:otherwise>				
				</c:choose>
				
	</table>



</body>
</html>