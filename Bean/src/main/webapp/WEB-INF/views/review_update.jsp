<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<h1>update</h1>
<title>The CKEditor initialized Property &mdash; CKEditor Sample</title>
<script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
</head>
<body>
	<form action="review_updateres.do" method="post">
		<input type="hidden" name="member_no" value="${login.member_no }">
		<input type="hidden" name="reviewboard_name"
			value="${login.member_name }">
		<input type="hidden" name="reviewboard_no" value="${dto.reviewboard_no }"/>
		<div class="container">
			<div class="content" style="width: 70%">

				<div class="row justify-content-md-center">
					<div class="col-sm-9">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text">제목</label>
							</div>
							<input type="text" class="form-control" name="reviewboard_title" value="${dto.reviewboard_title }">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group mb-3">
							<select name="class_name" class="custom-select" id="inputGroupSelect03">
								<option selected>수강과목</option>
								<option value="생활영어">생활영어</option>
								<option value="토익">토익</option>
								<option value="토플">토플</option>
							</select>
							<select name="reviewboard_te" class="custom-select" id="inputGroupSelect03">
								<option selected>선생</option>
								<option value="김선아">김선아</option>
								<option value="배유진">배유진</option>
								<option value="성아름">성아름</option>
								<option value="조용승">조용승</option>
							</select> <select name="reviewboard_star" class="custom-select" id="inputGroupSelect03">
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

				<div class="row justify-content-md-center"
					name="reviewboard_content">
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<textarea class="form-control" id="p_content"
								name="reviewboard_content">${dto.reviewboard_content }</textarea>
							<script type="text/javascript">
								CKEDITOR.replace('p_content', {
									height : 500
								});
							</script>
						</div>
					</div>
				</div>



				<div class="row justify-content-md-center">
					<input type="submit" value="수정" /> 
					<input type="button" value="취소" onclick="location.href='review_detail.do?reveiwboard_no=${dto.reviewboard_no}'" /> 
				</div>


			</div>
		</div>
		<script>
			CKEDITOR.replace('contents');
		</script>


	</form>


</body>
</html>