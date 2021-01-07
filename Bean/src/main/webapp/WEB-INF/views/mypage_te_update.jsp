<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
//id 중복체크
function idChk() {
	var idChecked = /^[0-9a-zA-Z]{5,15}$/; // 아이디 유효성검사(5자리 이상 15자리 이하)
	var doc = document.getElementById("member_id");
	if (doc.value == null || doc.value.trim() == "") {
		// id 입력 안 했을 때
		alert("아이디를 먼저 입력해주세요");
		return false;
	} else if(!idChecked.test($("#member_id").val())) {
		alert("아이디는 5자 ~ 15자리 사이로 만들어주세요.");
		return false;
	} else {
		open("idChk.do?id=" + doc.value, "",
				"width=500, height=500");
	}
}
// id 중복체크 완료 여부 및 유효성 검사
function idChkConfirm() {
	var chk = document.getElementsByName("member_id").title;
	if (chk == "n") {
		alert("아이디 중복체크를 먼저 해주세요.");
		document.getElementsByName("member_id")[0].focus();
	}
	
	// 비밀번호 확인
	if($("#member_pw").val() != $("#member_pwchk").val()) {
		document.getElementById("passcheck").innerHTML = "비밀번호가 일치하지 않습니다.";
		$("#member_pwchk").focus();
		return false;
	} else {
		document.getElementById("passcheck").innerHTML = "";
	}
	
}

// email 중복체크
function emailChk() {
	var doc = document.getElementById("member_email");
	if (doc.value == null || doc.value.trim() == "") {
		// id 입력 안 했을 때
		alert("email을 먼저 입력해주세요");
		return false;
	} else {
		open("emailChk.do?email=" + doc.value, "",
				"width=500, height=500");
	}
}

// 주소
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
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
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                // document.getElementById("sample6_extraAddress").value = extraAddr;
            
            // } else {
                // document.getElementById("sample6_extraAddress").value = '';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            document.getElementById("member_addr1").value = addr + extraAddr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("member_addr2").focus();
        }
    }).open();
}

	
</script>
<style type="text/css">
:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: #007bff;
  background: linear-gradient(to right, #0062E6, #33AEFF);
}

.card-signin {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-img-left {
  width: 45%;
  /* Link to your background image using in the property below! */
  background: scroll center url('https://source.unsplash.com/WEQbe2jBg40/414x512');
  background-size: cover;
}

.card-signin .card-body {
  padding: 2rem;
}

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

.btn-google {
  color: white;
  background-color: #ea4335;
}

.btn-facebook {
  color: white;
  background-color: #3b5998;
}

</style>

</head>
<body>

<%@ include file="./header.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center">${login.member_name }님</h5>

	<form action="myinfoupdate.do" method="POST" enctype="multipart/form-data" accept-charset="UTF-8" name="form">
            <input type="hidden" name="member_type" value="${type }" />
              <div class="form-label-group">
                <input type="text" id="member_id" value="${login.member_id }" name = "member_id" class="form-control" placeholder="member_id" required>
                <label for="member_id">id</label>
			<input type = "button" value = "중복체크" onclick ="idChk()"/>
              </div>
              <div class="form-label-group">
                <input type="password" id="member_pw" name = "member_pw" class="form-control" onclick = "idChkConfirm();" placeholder="member_pw" required>
                <label for="member_pw">password</label>
              </div>
              <div class="form-label-group">
                <input type="password" id="member_pwchk" name = "member_pwchk" onchange="idChkConfirm();" class="form-control" placeholder="member_pwchk" required>
                <label for="member_pwchk">Confirm password</label>
              </div>

			<p id="passcheck"></p>
              <hr>
              <div class="form-label-group">
                <input type="text" id="member_name" name="member_name" value="${login.member_name }" onclick="idChkConfirm();"  class="form-control" placeholder = "member_name" required>
                <label for="member_name">name</label>
              </div>
              
              
			<div class="form-label-group">
                <input type="text" id="member_phone" name="member_phone" value="${login.member_email }" onclick="idChkConfirm();"  class="form-control" placeholder = "member_phone" required>
                <label for="member_phone">Phone Number</label>
              </div>
                    
              <div class="form-label-group">
                <input type="text" id="member_email" name="member_email" value="${login.member_phone }" onclick="idChkConfirm();" class="form-control" placeholder="member_email" required>
                <label for="member_email">email</label>
              <input type="button" value="중복체크" onclick="emailChk();" />
              </div>
                    
              <hr>
              
              <div class="form-label-group">
                <input type="text" id="member_post" name="member_post" value="${login.member_post }" class="form-control"  placeholder="member_post" >
                <label for="member_post">우편번호</label>
               
              </div>
               
              <div class="form-label-group">
                <input type="text" id="member_addr1" name="member_addr1" value="${login.member_addr1 } class="form-control" placeholder="member_addr1" >
                <label for="member_addr1">주소</label>
              </div>
              
			   <div class="form-label-group">
              <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
              </div>
              
              
				<div class="form-label-group">
                <input type="text" id="member_addr2" name="member_addr2" value="${login.member_addr2 }" class="form-control" placeholder="member_addr2" >
                <label for="member_addr2">상세주소</label>
              </div>
              
              <hr>
              
              <div class="form-label-group">
              <input id = "member_birth" name="member_birth" type="date" class="form-control" value="${login.member_birth }" />
              <label for="member_birth">생년월일</label>
              </div>
                                          
			<div class="form-label-group">
              <input id = "member_mpfile" name="member_mpfile" multiple="multiple" type="file"/>
              <label for="member_mpfile">프로필</label>
              						<input type="hidden" value="${login.member_imgpath }" name="member_imgpath" />
						<input type="hidden" value="${login.member_imgname }" name="member_imgname" />
              </div>
              <input class="btn btn-lg btn-primary btn-block text-uppercase" value = "RegistUpdate" type="submit"> 
              <input class="btn btn-lg btn-primary btn-block text-uppercase" value = "Back" type="button" onclick="location.href='mypage.do'">
              </form>
              <a class="d-block text-center mt-2 small" href="loginform.do">Sign In</a>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>

