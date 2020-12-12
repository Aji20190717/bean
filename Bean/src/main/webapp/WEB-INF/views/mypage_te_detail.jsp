<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<div>
			<span>${login.member_name } 강사님 환영합니다</span>
		</div>
		<div><hr/></div>
		<div>
			<span>강사 ID</span><span>${login.member_id}</span><br/>
			<span>강사 email</span><span>${login.member_email}</span><br/>
			<span>강사 연락처</span><span>${login.member_phone}</span><br/>
			<span>강사 주소</span><span>${login.member_post }</span>
						<span>${login.member_addr1 }</span>
						<span>${login.member_addr2 }</span><br/>
			<span>강사 생년월일</span><span>${login.member_birth}</span><br/>
		</div>
		<div><hr/></div>
		<div>
			<input type="button" value="정보수정" onclick="location.href='mypageupdateform.do'" /><br/>
			<input type="button" value="회원탈퇴" onclick="location.href='myinfodelete.do?member_no=${login.member_no}'" />
		

</body>
</html>