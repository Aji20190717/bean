<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    var dateFormat = "mm/dd/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 3
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 3
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>
<body>
	<form action="insertClass.do" method="post">
		<table border="1">
				<input type="hidden" name="member_no" value = "${member_no }"/>
			<tr>
				<th>class_max</th>
				<td><input type="number" name="class_max"/></td>
			</tr>
			<tr>
				<th>class_name</th>
				<td><input type="text" name="class_name" /></td>
			</tr>
			<tr>
				<th>class_startDate</th>
				<td><input type="text" name="class_startDate" /></td>
				<label for="from">From</label>
<input type="text" id="from" name="from">
				

			</tr>
			<tr>
				<th>class_endDate</th>
				<td><input type="text" name="class_endDate" /></td>
				<label for="to">to</label>
<input type="text" id="to" name="to">
 
			</tr>
			
		<button type = "button" value = "제출"></button>
		</table>
	</form>


</body>
</html>