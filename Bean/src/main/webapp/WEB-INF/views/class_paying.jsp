<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		IMP.init("imp43617146");

	});

	function payfunc() {

		var remainData = new Object();
		var obj = ${json};
		var classObj = ${classJson};
		//alert(classObj["class_no"]);

		if (obj['value'] == "true") {

			var jsonData;
			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'kakaoPay',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:결제테스트',
				// TODO : 가격에 대한 부분 협의 필요
				amount : 34000,
				//buyer_email : 'iamport@siot.do',
				//buyer_tel : '010-1234-5678',
				//buyer_addr : '서울특별시 강남구 삼성동',
				//buyer_postcode : '123-456'
				buyer_name : obj["userName"]

			}, function(rsp) {
				if (rsp.success) {

					//필요한 값을 object 객체에 추가해 줄 것
					remainData.usernum = obj["usernum"]; //buyer 회원 번호

					jsonData = JSON.stringify(remainData);

					//Dto 에 포함되는 값은 object에 포함하지 않고 보낼 것
					$.ajax({
						url : "insertPaying.do",
						method : "POST",
						data : {

							// TODO : classDTO의 payment_price로 추가할 것

							"jsonData" : jsonData,
							"member_no" : obj["usernum"],
							"class_no" : classObj["class_no"],
							"payment_price" : 34000,
							"payment_method" : 'KaKaoPay',
							"payment_impuid" : rsp.imp_uid

						},
						dataType : "json",
						success : function(returnData) {

							if (returnData["check"]) {

								var msg = "결제에 성공했습니다";
								alert(msg);

							} else {

								var msg = '결제에 실패하였습니다.';
								msg += '결제가 취소되었습니다'

							}
						}
					})

				} else {

					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;

				}
				alert(msg);
			});
		}else{
			
			alert("로그인 해주세요");
			
		}
	}
</script>

<body>

	<h1>${json }</h1>
	<%@ include file="./header.jsp"%>
	<button onclick="payfunc()">결제하기</button>


</body>
</html>