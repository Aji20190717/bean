<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>The CKEditor initialized Property &mdash; CKEditor Sample</title>
<script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
</head>
<body>
	<form action="review_insertres.do" method="post">

		<div class="container">
			<div class="content" style="width: 70%">

				<div class="row justify-content-md-center">
					<div class="col-sm-9">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text">제목</label>
							</div>
							<input type="text" class="form-control">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group mb-3">
							<select class="custom-select" id="inputGroupSelect03">
								<option selected>수강과목</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select> <select class="custom-select" id="inputGroupSelect03">
								<option selected>별점</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>

						</div>
					</div>
				</div>

				<hr>

				<div class="row justify-content-md-center">
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<textarea class="form-control" id="p_content"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('p_content', {
									height : 500
								});
							</script>
						</div>
					</div>
				</div>

				<div class="row justify-content-md-center">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon01">썸네일</span>
						</div>
						<div class="custom-file">
							&nbsp;<input type="file" class="form-control-file"
								id="exampleFormControlFile1">
						</div>
					</div>
				</div>




				<div class="row justify-content-md-center">
					<button type="submit" class="btn btn-outline-secondary">등 록</button>
					<button type="submit" class="btn btn-outline-secondary">취소</button>
				</div>




			</div>
		</div>
		<script>
			CKEDITOR.replace('contents');
		</script>


	</form>


</body>
</html>