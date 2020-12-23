<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeanMain</title>
</head>
<body>

	<c:choose>
		<c:when test="${empty login }">
			<input type="button" value="회원가입/로그인" onclick="location.href='loginform.do'" />
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${login.member_type eq 'S' || login.member_type eq 'SN' || login.member_type eq 'SG' }">
					<span>수강생 <a href="myinfo.do?member_no=${member_no}">${login.member_name }님</a></span>
				</c:when>
				<c:when test="${login.member_type eq 'T' }">
					<span>강사 <a href="mypage.do?member_no=${member_no}">${login.member_name }님</a></span>
				</c:when>
			</c:choose>			
		</c:otherwise>
	</c:choose>
	
	<button onclick = "location.href=''">챗봇</button>
	<button onclick = "location.href=''">관리자 채팅</button>
	<button onclick = "location.href=''">일반 채팅</button>
	<button onclick = "location.href='review_list.do'">리뷰 게시판</button>
	
	
</body>
</html>