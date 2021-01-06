<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="resources/css/boardcss.css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<script src="resources/js/boardjq.js"></script>
<script src="resources/js/boardjq2.js"></script>
<script src="resources/js/boardjs.js"></script>


</head>
<%@ include file="./header.jsp"%>
<body>
	<form action="insertClass.do" method="post">
		<input type="hidden" name="member_no" value="${login.member_no}" /> <input
			type="hidden" name="questionboard_name" value="${login.member_name }" />
		<div class="page-wrapper bg-gra-02 p-t-100 p-b-50">
			<div class="wrapper wrapper--w900">
				<div class="cardboard cardboard-6">
					<div class="cardboard-heading">
						<h2 class="title">Upload Question</h2>
					</div>
					<div class="cardboard-body">
						<div class="formboard-row">
							<div class="name">Class Name</div>
							<div class="value">
								<input class="input--style-6" type="text"
									name="class_name">
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">Class Content</div>
							<div class="value">
								<div class="input-group">
									<textarea class="form-control" id="p_content"
										name="class_content"></textarea>
									<script type="text/javascript">
										CKEDITOR.replace('p_content', {
											height : 500
										});
									</script>
								</div>
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">Class Number</div>
							<div class="value">
								<input class="input--style-6" type="number"
									name="class_max">
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">Class Start Date</div>
							<div class="value">
							<td><label for="class_startDate">click here and select start Date</label> <input type="text" id="class_startDate"
					name="class_startDate"></td>
							
							</div>
						</div>
						<div class="formboard-row">
							<div class="name">click here</div>
							<div class="value">
						<label for="class_endDate">click here and select end Date</label> <input type="text" id="class_endDate"
					name="class_endDate">
							</div>
						</div>


					</div>
					<div class="cardboard-footer">
						<div>
							<input type="submit" value="제출" />
						</div>
						<div>
							<br /> <input type="button" value="취소"
								onclick="location.href='questionList.do'" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
			var dateFormat = "mm/dd/yyyy", class_startDate = $(
					"#class_startDate").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1
			}).on("change", function() {
				class_endDate.datepicker("option", "minDate", getDate(this));
			}), class_endDate = $("#class_endDate").datepicker({
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1
			}).on("change", function() {
				class_startDate.datepicker("option", "maxDate", getDate(this));
			});
			function getDate(element) {
				var date;
				try {
					date = $.datepicker.parseDate(dateFormat, element.value);
				} catch (error) {
					date = null;
				}
				return date;
			}
		});
	</script>


	<script>
		CKEDITOR.replace('contents');
	</script>

</body>
</html>