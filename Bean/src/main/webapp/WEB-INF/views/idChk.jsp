<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idChk</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">

	$(function(){
		
		var id = opener.document.getElementsByName("member_id")[0].value;
        document.getElementsByName("member_id")[0].value = id;
		
	});
	
	 function idConfirm(bool){
	        if(bool == "true") {
	            opener.document.getElementsByName("member_id")[0].title = 'y'
	            opener.document.getElementsByName("member_pw")[0].focus();
	        } else {
	            opener.document.getElementsByName("member_id")[0].focus();
	        }
	        self.close();
	    }


</script>

</head>
<body>

	<table border="1">
		<tr>
			<td><input type="text" name="member_id" readonly="readonly" /></td>
		</tr>
		<tr>
			<td>
				<c:choose>
					<c:when test="${idChk eq true}">
						<input type="text" value="아이디 생성 가능" />
					</c:when>
					<c:otherwise>
						<input type="text" value="중복된 아이디 존재" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td><input type="button" value="확인"
				onclick="idConfirm('${idChk}')"></td>
		</tr>
	</table>

</body>
</html>