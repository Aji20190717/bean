<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>

<body>
	<script type="text/javascript">
		var naver_id_login = new naver_id_login("zjjj7_AqHxAv9Xan5omR", "http://localhost:8787/bean/navercallback.jsp");
		// 접근 토큰 값 출력
		//alert(naver_id_login.oauthParams.access_token);
		var token = naver_id_login.oauthParams.access_token;
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			//alert(naver_id_login.getProfileData('nickname'));
			var name = naver_id_login.getProfileData('name');
			var id = naver_id_login.getProfileData('id');
			var email = naver_id_login.getProfileData('email');
			
			console.log(name);
			console.log(id);
			console.log(email);
			
			var data = {
					"member_name" : name,
					"member_sns" : id,
					"member_email" : email
			}
			
			$.ajax({			// 가맹점 db에 정보 저장
				url : "naverlogin.do",
				type : "POST",
				data : JSON.stringify(data),
				contentType : "application/json",
				dataType : "json",
				success : function(msg){
					console.log(msg);
					if(msg.check == true){
						location.href="index.jsp";
					} else {
						location.href="naverform.do";
					}
				},
				error : function(request,status,error){
					alert("통실 실패");
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			
			});
			
		}

	</script>
</body>
</html>