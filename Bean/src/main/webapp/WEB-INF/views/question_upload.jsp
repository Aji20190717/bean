<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
</head>
<body>
	<%
	//이거도 선택하도록 제작(dropdown 형식)
	int groupno = 0;
	%>

	<%@ include file="./header.jsp"%>
	
	

	

	<form:form method="post" enctype="multipart/form-data"
		modelAttribute="QuestionDto" action="questionUploadres.do">
		<input type="hidden" name="member_no" value="${login.member_no}" />
		<input type="hidden" name="questionboard_name"
			value="${login.member_name }" />
			
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<textarea class="form-control" id="p_content" name="questionboard_content"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('p_content', {
									height : 500
								});
							</script>
						</div>
					</div>
		<input type="hidden" name="questoinbaord_groupno" value="<%=groupno%>" />
		<input type="text" name="questionboard_title" />
		<input type="file" name="question_mpfile" />
		
		<c:choose>
		<c:when test= "${empty login}">
		<input type = "button" onclick ="alert('login 해주세요');" value = "제출"/>
		</c:when>
		<c:otherwise>
		<input type="submit" value="send" />
		</c:otherwise>
		</c:choose>
	</form:form>

</body>
</html>