<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>practice 목록이다!</h1>
	<hr>
	<p>깃허브 잔디심는 용</p>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>좋아하는 것</th>
			<th>좋아하는 음식</th>
			<th>좋아하는 프로그램</th>
			<th>좋아하는 연예인</th>
		</tr>
	
		<c:forEach items="${list }" var="list">
			<tr>
				<td>
					${list.practiceNo }
				</td>
				
				<td>
					${list.practiceFav }
				</td>
				
				<td>
					${list.practiceFood }
				</td>
				
				<td>
					${list.practiceProgram }
				</td>
				
				<td>
					${list.parcticeTalent }
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>