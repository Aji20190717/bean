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


<body>

<%@ include file="./header.jsp"%>

	<div>
			<div class="form-group row">
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
				<th>리뷰 제목</th>
				<th>리뷰 내용</th>
				<th>날짜</th>
				<th>수업명</th>
				<th>선생님</th>
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
				<c:choose>
				<c:when test="${empty login }">
				<td colspan="4" align="left"><input type="button" value="글작성"
					onclick="alertLogin();" /></td>
				</c:when>
				<c:otherwise>
					<td colspan="4" align="left"><input type="button" value="글작성"
					onclick="location.href='review_insertform.do'" /></td>
				</c:otherwise>
				</c:choose>
			</tr>

		</table>
		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a href="/bean/review_list.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchType=${searchType}&keyword=${keyword}">&lt;</a>
					
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a
							href="/bean/review_list.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchType=${searchType}&keyword=${keyword}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="/bean/review_list.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchType=${searchType}&keyword=${keyword}">&gt;</a>
			</c:if>
		</div>
	</div>
	
<script>
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
		var url = "/bean/review_list.do";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
	});	
   
   function alertLogin(){
	   
	   alert('login 해주세요');
	   window.location.href = 'loginform.do';
	   
   }
   
	function selChange() {
		
		
		var searchJson = ${searchjson};
		var sel = document.getElementById('cntPerPage').value;
		
		if(searchJson != null){
		var searchType = searchJson['searchType'];
		var keyword = searchJson['keyword'];
		
		location.href = "/bean/review_list.do?nowPage=${paging.nowPage}&cntPerPage="+ sel + "&searchType=" + searchType + "&keyword=" + keyword;
		
		}else{
		
		location.href = "/bean/review_list.do?nowPage=${paging.nowPage}&cntPerPage="+ sel;
			
		}
	}
</script>
	
</body>
</html>