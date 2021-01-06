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

<%@ include file="./header.jsp"%>
	<form action="review_insertres.do" method="post">

	<input type="hidden" name="member_no" value="${login.member_no }">
	<input type="hidden" name="reviewboard_name" value="${login.member_name }">
		
		<div class="container">
			<div class="content" style="width: 70%">

				<div class="row justify-content-md-center">
					<div class="col-sm-9">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text">제목</label>
							</div>
							<input type="text" class="form-control" name="reviewboard_title" required>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="input-group mb-3">
							
							<select id="class_name" class="form-control" name="class_name">
								<c:forEach items="${classList}" var="dept">
									<option value="${dept.class_name}">  
									${dept.class_name }
									<input type = "hidden" name = "class_no" value = "${dept.class_no }"/>
									</option>
								</c:forEach>
							</select> 
							
							
							<select name="reviewboard_star" class="custom-select"
								id="inputGroupSelect03">
								<option value="0">별점없음</option>
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
								name="reviewboard_content" required></textarea>
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
		</div>
	</form>


</body>
</html>