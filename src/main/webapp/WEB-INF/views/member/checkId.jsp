<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>아이디 중복검사</h1>
	<c:choose>
		<c:when test="${empty member && empty owner}">
			<p>[${checkId }]는 사용 가능합니다.</p>
			<input type="hidden" name="possibleId" value="${checkId }">
			<button class="w3-button w3-yellow" onclick="closeBtn();">닫기</button>
		</c:when>
		
		<c:when test="${empty member }">
			<p>[${checkId }]는 사용 불가능합니다.</p>
			<form action="/idMultipleChk.do" method="post">
				<div class="idChk"></div>
				<input class="w3-input w3-border" type="text" name="idMulti">
				<button class="w3-button w3-yellow">조회</button>
			</form>
		</c:when>
		
		<c:otherwise>
			<p>[${checkId }]는 사용 불가능합니다.</p>
			<form action="/idMultipleChk.do" method="post">
				<div class="idChk"></div>
				<input class="w3-input w3-border" type="text" name="idMulti">
				<button class="w3-button w3-yellow">조회</button>
			</form>
		</c:otherwise>
	</c:choose>
	
	<script type="text/javascript">
		function closeBtn(){
			const possibleId = $("input[name=possibleId]").val();
			console.log(possibleId);
			const inputId = $("[name=memberId]", opener.document);
			inputId.val(possibleId);
			console.log(inputId);
			self.close();
		}
	</script>
</body>
</html>