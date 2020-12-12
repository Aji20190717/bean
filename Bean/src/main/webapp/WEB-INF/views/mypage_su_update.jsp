<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
	//유효성 검사
	function ChkPW() {

		// 비밀번호 확인
		if ($("#pw").val() != $("#pwchk").val()) {
			document.getElementById("passcheck").innerHTML = "비밀번호가 일치하지 않습니다.";
			$("#pwchk").focus();
			return false;
		} else {
			document.getElementById("passcheck").innerHTML = "";
		}

	}

	// 주소
	function DaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							// document.getElementById("sample6_extraAddress").value = extraAddr;

							// } else {
							// document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr
								+ extraAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}

</script>

</head>
<body>

	<div>
		<div>
			<span>${login.member_name }님</span>
		</div>
		<div>
			<hr />
		</div>
		<form action="myinfoupdate.do" method="POST" enctype="multipart/form-data" accept-charset="UTF-8" name="form">
			<input type="text" value="${login.member_no }" name="member_no" readonly="readonly"/>
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" value="${login.member_id }" name="member_id" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="member_pw" id="pw" required="required" /></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="member_pwchk" id="pwchk" onchange="ChkPW();" required="required" />
						<p id="passcheck"></p></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" value="${login.member_name }" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" value="${login.member_email }" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="member_phone" value="${login.member_phone }" required="required" /></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="member_post" id="sample6_postcode" value="${login.member_post }" />
						<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" /><br />
						<input type="text" name="member_addr1" id="sample6_address" value="${login.member_addr1 }" />
						<input type="text" name="member_addr2" id="sample6_detailAddress" value="${login.member_addr2 }" />
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="member_birth" value="${login.member_birth }" /></td>
				</tr>
				<tr>
					<th>프로필</th>
					<td>
						<input multiple="multiple" type="file" name="member_mpfile" />
						<input type="hidden" value="${login.member_imgpath }" name="member_imgpath" />
						<input type="hidden" value="${login.member_imgname }" name="member_imgname" />
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기" />
						<input type="button" value="돌아가기" onclick="location.href='myinfodetail.do'" />
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>