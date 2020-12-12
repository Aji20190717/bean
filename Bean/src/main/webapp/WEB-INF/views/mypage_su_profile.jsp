<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<span>
			<c:choose>
				<c:when test="${login.member_imgpath eq null}">
					<img style="width: 150px; height: 150px;" alt="" src="resources/images/profile/profile.png">
				</c:when>
				<c:otherwise>
					<img style="width: 150px; height: 150px;" alt="" src="profileimg.do">
				</c:otherwise>
			</c:choose>
		</span>
		<span>
			<span>${login.member_name }</span>
						<input type="button" value="개인정보확인" onclick="location.href='myinfodetail.do'">
						<input type="button" value="로그아웃" onclick="location.href='logout.do'"><br/>
			<span>- 이메일</span><span>${login.member_email }</span><br/>
			<span>- 휴대폰</span><span>${login.member_phone }</span><br/>
			<span>- 주소</span><span>${login.member_post }</span>
						<span>${login.member_addr1 }</span>
						<span>${login.member_addr2 }</span><br/>
		</span>
	</div>

</body>
</html>