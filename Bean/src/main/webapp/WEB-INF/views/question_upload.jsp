<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//세션에 값 담아주기
	int member_no = 2;
	String questionboard_name = "zzarbttoo";
	//이거도 선택하도록 제작(dropdown 형식)
	int groupno = 0;
	%>

	<!--  
			
			-->

	<form:form method="post" enctype="multipart/form-data"
		modelAttribute="QuestionDto" action="questionUploadres.do">
		<input type="hidden" name="member_no" value="<%=member_no%>" />
		<input type="hidden" name="questionboard_name"
			value="<%=questionboard_name%>" />
		<input type="hidden" name="questoinbaord_groupno" value="<%=groupno%>" />
		<input type="text" name="questionboard_title" />
		<input type="text" name="questionboard_content" />
		<input type="file" name="question_mpfile" />
		<input type="submit" value="send" />
	</form:form>

</body>
</html>