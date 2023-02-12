<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insert 연습이다ㅠㅠ</h1>
	<hr>
	
	<form action="/insertPractice.do" method="post">
		<p>내가 좋아하는 거 : </p>
		<p>
			<input type="text" name="practiceFav">
		</p>
		
		<p>내가 좋아하는 음식 : </p>
		<p>
			<input type="text" name="practiceFood">
		</p>
		
		<p>내가 좋아하는 프로그램 : </p>
		<p>
			<input type="text" name="practiceProgram">
		</p>
		
		<p>내가 좋아하는 연예인 : </p>
		<p>
			<input type="text" name="parcticeTalent">
		</p>
		<input type="submit" value="등록">
		<a href="/">취소</a>
	</form>
</body>
</html>