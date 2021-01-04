<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>The CKEditor initialized Property &mdash; CKEditor Sample</title>
<script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
</head>
<body>
	<form action="review_insertres.do" method="post">

		<input type="text" name="member_no" value="${login.member_no }">
		<input type="text" name="reviewboard_name"
			value="${login.member_name}">
		<!-- 
		
		<input type="text" name="class_name" value="${class_name[4].class_name }">
		
		<input type="text" name="class_name" value="hello">
		
		<input type="text" name="trainer_name" value="${member_no[4].member_no }">
		
		<div class="container">

		
	
		<select id="class_name" class="form-control">
			<option selected>강좌 이름</option>
			<c:forEach items="${class_name}" var="dept">
				<option >${dept.class_name }</option>
			</c:forEach>
		</select>
		<select id="member_name" class="form-control">
			<option selected>선생님 이름</option>
			<c:forEach items="${member_no}" var="dept">
				<option >${dept.member_no }</option>
			</c:forEach>
		</select>
			-->
		<div class="content" style="width: 70%">

			<div class="row justify-content-md-center">
				<div class="col-sm-9">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text">제목</label>
						</div>
						<input type="text" class="form-control" name="reviewboard_title">
					</div>
				</div>
				<div class="col-sm-3">
					<div class="input-group mb-3">
						<select name="class_name" class="custom-select"
							id="inputGroupSelect03">
							<option selected>수강과목</option>
							<option value="생활영어">생활영어</option>
							<option value="토익">토익</option>
							<option value="토플">토플</option>
						</select> <select name="reviewboard_te" class="custom-select"
							id="inputGroupSelect03">
							<option selected>선생</option>
							<option value="김선아">김선아</option>
							<option value="배유진">배유진</option>
							<option value="성아름">성아름</option>
							<option value="조용승">조용승</option>
						</select> <select name="reviewboard_star" class="custom-select"
							id="inputGroupSelect03">
							<option selected>별점</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>

					</div>
				</div>
			</div>

			<hr>

			<div class="row justify-content-md-center" name="reviewboard_content">
				<div class="col_c" style="margin-bottom: 30px">
					<div class="input-group">
						<textarea class="form-control" id="p_content"
							name="reviewboard_content"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('p_content', {
								height : 500
							});
						</script>
					</div>
				</div>
			</div>



			<div class="row justify-content-md-center">
				<input type="submit" class="btn btn-outline-secondary" value="등록" />
				<input type="button" class="btn btn-outline-secondary"
					onclick="location.href='review_list.do'" value="취소" />
			</div>


		</div>
		<script>
			CKEDITOR.replace('contents');
		</script>


	</form>


</body>
</html>