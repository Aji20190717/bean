<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<!-- 
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "review_list.do?nowPage=${paging.nowPage}&cntPerPage=" + sel;
	}
</script>
-->
<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

a {
	text-decoration: none;
}
</style>

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "/bean/review_list.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>


<c:url var="getBoardListURL" value="/board/getBoardList"></c:url>

<script>

   // 생략	

	$(document).on('click', '#btnSearch', function(e){

		e.preventDefault();

		var url = "${pageContext.request.contextPath}/bean/review_list.do";

		url = url + "?searchType=" + $('#searchType').val();

		url = url + "&keyword=" + $('#keyword').val();

		location.href = url;

		console.log(url);

	});	

</script>




<body>

	<h1>list</h1>
	<div>
			<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right:10px">

				<select class="form-control form-control-sm" name="searchType" id="searchType">

					<option value="reviewboard_title">제목</option>

					<option value="reviewboard_content">본문</option>

					<option value="reviewboard_name">작성자</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px">

				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">

			</div>

			<div>

				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>

			</div>

		</div>



		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
					보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
					보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
					보기</option>
			</select>
		</div>
		<!-- 옵션선택 끝 -->

		<table border="1">
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>
				<th>선생</th>
				<th>수강과목</th>
				<th>별점</th>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<th colspan="4">작성된 글이 존재하지 않습니다.</th>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.reviewboard_no }</td>
							<td>${dto.reviewboard_name }</td>
							<td><a
								href="review_detail.do?reviewboard_no=${dto.reviewboard_no }">${dto.reviewboard_title }</a></td>
							<td>${dto.reviewboard_content }</td>
							<td><fmt:formatDate value="${dto.reviewboard_date }"
									pattern="yyyy-MM-dd-HH시" /></td>
							<td>${dto.class_name}</td>
							<td>${dto.reviewboard_te }</td>
							<td>${dto.reviewboard_star }</td>

						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="4" align="left"><input type="button" value="글작성"
					onclick="location.href='review_insertform.do'" /></td>
			</tr>

		</table>
		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="/bean/review_list.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a
							href="/bean/review_list.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="/bean/review_list.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
	</div>
</body>
</html>