<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p>오시는 길</p>
	<p>Bean Academy로 오시는 길입니다.</p>


	<table border="1">

		<col width="200">
		<col width="700">



		<tbody>
			<tr>
				<th>주소</th>
				<td>서울특별시 강남구 테헤란로 14길 6 남도빌딩</td>
			</tr>

			<tr>
				<th>버스</th>
				<td>역삼역.포스코P&S타워 정류장 <br /> 
				<img alt="지선" src="./resources/images/sub01_06_busB.jpg"> 
				146 / 740 / 341 / 360 
				<img alt="간선버스" src="./resources/images/sub01_06_busR.jpg">
				1100 / 1700 / 2000 / 7007 / 8001
				</td>
			</tr>

			<tr>
				<th>지하철</th>
				<td>지하철 2호선 역삼역 3번출구 100m</td>
			</tr>

			<tr>
				<td colspan="2">
					<div id="map" style="width: 100%; height: 450px;"></div>
				</td>

			</tr>
		</tbody>

	</table>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19c2ae468f1156e473231ed530385134"></script>

	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

		mapOption = {
			center : new kakao.maps.LatLng(37.498854411970214,
					127.03333265618686), // 지도의 중심좌표
			level : 2
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(37.49900095302427,
				127.03287754168265);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>


</body>
</html>