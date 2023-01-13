<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/signUp.css">
<style type="text/css">

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="join-wrap" style="margin-top: 250px;">
        <div class="join-title">
            <h1>회원가입 유형</h1>
        </div>

        <div class="user-img-wrap">
            <a href="/memberjoinFrm.do">
                <div>
                    <img src="/resources/img/팬션일반사용자.png" alt="">
                </div>
                <p>일반 회원가입</p>
            </a>

            <a href="/ownerFrm.do">
                <div>
                    <img src="/resources/img/팬션 사장님.png" alt="">
                </div>
                <p>팬션 사장님 회원가입</p>
            </a>
        </div>
    </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>