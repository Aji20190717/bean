<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		var dateFormat = "mm/dd/yyyy", class_startDate = $("#class_startDate").datepicker({
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

</head>
	<%@ include file="./header.jsp"%>
<body>
	<form action="insertClass.do" method="post">
		<table border="1">
		<input type = "hidden" value = "${member_no }" name = "member_no"/>
			<tr>
				<th>class_max</th>
				<td><input type = "number" name = "class_max"/></td>
			</tr>
			<tr>
				<th>class_name</th>
				<td><input type = "text" name = "class_name"/></td>
			</tr>
			<tr>
				<td><label for="class_startDate">class_startDate</label> <input type="text" id="class_startDate"
					name="class_startDate"></td>
				<td><label for="class_endDate">class_endDate</label> <input type="text" id="class_endDate"
					name="class_endDate"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="작성" /> <input
					type="button" value="취소" onclick="" /></td>
			</tr>
		</table>
	</form>


</body>
</html>