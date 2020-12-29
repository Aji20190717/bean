<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

textarea{
	 resize: none;
}

</style>
</head>
<body>
	<h1>번역기</h1>
	<form action="transres.do" method="post">
		<section>
		
			<article>
			<h2>번역 전</h2>
			<select name="source" size="1">
				<option value="ko">한국어</option>
				<option value="en" selected="selected">영어</option>
			</select>
			<br />
			<textarea rows="10" cols="60" name="text" placeholder="번역할 내용을 입력해주세요.">${text }</textarea>
			<br />
			<input type="submit" value="번역하기">
			</article>
	
			<article>
				<h2>번역 후</h2>
			<select name="target" size="1">
				<option value="en">영어</option>
				<option value="ko" selected="selected">한국어</option>
			</select>
			<br />
			<textarea rows="10" cols="60" readonly="readonly" >${result }</textarea>
			<br />	 	
			</article>
		</section>
	</form>
	

</body>
</html>