<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel='stylesheet' href='webjars/fullcalendar/3.5.1/dist/fullcalendar.css' />
<script src="webjars/jquery/3.4.1/jquery.min.js"></script>
<script src='webjars/moment/2.19.1/min/moment.min.js'></script>
<script src='webjars/fullcalendar/3.5.1/dist/fullcalendar.js'></script>
<script type="text/javascript">

//TODO : class 시작일, class 마감일을 달력에 표기할 것
  $(document).ready(function() {
    $('#calendar').fullCalendar({
      events: {
    	  
      }
    });
  });
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="./header.jsp"%>
	<div>
		
	 <div id='calendar'></div>
		<div>
			<span>${login.member_name }님 환영합니다</span>
		</div>
		<div><hr/></div>
		<div>
			<span>회원 ID</span><span>${login.member_id}</span><br/>
			<span>회원 email</span><span>${login.member_email}</span><br/>
			<span>회원 연락처</span><span>${login.member_phone}</span><br/>
			<span>회원 주소</span><span>${login.member_post }</span>
						<span>${login.member_addr1 }</span>
						<span>${login.member_addr2 }</span><br/>
			<span>회원 생년월일</span><span>${login.member_birth}</span><br/>
				<span> <c:choose>
					<c:when test="${empty classList}">
						<tr>
							<th colspan="4">--수강 강좌가 없습니다----</th>
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
								<td><button value = "class 탈퇴" onclick = "location.href='studentRun.do?member_no=${login.member_no}&class_no=${classDto.class_no }'"></button></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</span>
		</div>
		<div><hr/></div>
		<div>
			<input type="button" value="정보수정" onclick="location.href='myinfoupdateform.do'" /><br/>
			<input type="button" value="회원탈퇴" onclick="location.href='myinfodelete.do?member_no=${login.member_no}'" />
		</div>
	</div>

</body>
</html>