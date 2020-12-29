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
		<div>
			<span>${login.member_name } 강사님 환영합니다</span>
		</div>
		<div>
			<hr />
		</div>
		<div>
			<span>강사 ID</span><span>${login.member_id}</span><br /> <span>강사
				email</span><span>${login.member_email}</span><br /> <span>강사 연락처</span><span>${login.member_phone}</span><br />
			<span>강사 주소</span><span>${login.member_post }</span> <span>${login.member_addr1 }</span>
			<span>${login.member_addr2 }</span><br /> <span>강사 생년월일</span><span>${login.member_birth}</span><br />
			<span> <c:choose>
					<c:when test="${empty classList}">
						<tr>
							<th colspan="4">--작성된 글이 없습니다----</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${classList }" var="classDto">
							<tr>
								<td>${classDto.class_name}</td>
								<td>${classDto.class_no }</td>
								<td>${classDto.class_max}</td>
								<td>${classDto.class_now}</td>
								<td>${classDto.class_startDate }</td>
								<td>${classDto.class_memberName}</td>
								<td>${classDto.class_delflag}</td>
								<td><button value = "class 삭제" onclick = "location.href='classDelete.do?class_no=${classDto.class_no}'"></button></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</span>
		</div>
		<div>
			<hr />
		</div>
		<div>
			<input type="button" value="정보수정"
				onclick="location.href='mypageupdateform.do'" /><br /> <input
				type="button" value="회원탈퇴"
				onclick="location.href='myinfodelete.do?member_no=${login.member_no}'" />
			<input type="button" value="클래스추가"
				onclick="location.href='insertRes.do?member_no=${login.member_no}'" />
		</div>
</body>
</html>