<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/loginFrm.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="login-wrap">
        <div class="login-title">
            <h1>로그인</h1>
        </div>

        <div class="login-content">
            <div class="selectType">
                <div>
                    <input class="w3-radio" type="radio" name="loginType" id="member" value="male" checked>
                    <label for="member">일반회원</label>
                </div>

                <div>
                    <input class="w3-radio" type="radio" name="loginType" id="owner" value="female">
                    <label for="owner">팬션사장님 회원</label>
                </div>
            </div>

            <div class="loginFrm">
                <div class="memberFrm">
                    <div style="margin-bottom: 30px;">
                        <h3 style="text-align: center;">일반회원</h3>
                    </div>
                    <form action="/memberLogin.do" method="post">
                        <label for="memberId">아이디</label>
                        <input class="w3-input w3-border-0" type="text" id="memberId" name="memberId">
                        <br>
                        <label for="memberPw">비밀번호</label>
                        <input class="w3-input w3-border-0" type="password" id="memberPw" name="memberPw">
                        <br>
                        <button class="w3-button w3-yellow" style="width: 500px;">로그인</button>
                    </form>
                </div>

                <div class="ownerFrm" style="display: none;">
                    <div style="margin-bottom: 30px;">
                        <h3 style="text-align: center;">편션사장님회원</h3>
                    </div>
                    <form action="/ownerLogin.do" method="post">
                        <label for="memberId">아이디</label>
                        <input class="w3-input w3-border-0" type="text" id="memberId" name="memberId">
                        <br>
                        <label for="memberPw">비밀번호</label>
                        <input class="w3-input w3-border-0" type="password" id="memberPw" name="memberPw">
                        <br>
                        <button class="w3-button w3-yellow" style="width: 500px;">로그인</button>
                    </form>
                </div>
            </div>
            
            <div class="errorMsg" style="text-align: center; margin-top: 30px;">
            	<p style="color: red;">${msg }</p>
            </div>
        </div>
    </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script>
        $("#member").on("click", function(){
            console.log("memberLogin");
            $(".ownerFrm").hide();
            $(".memberFrm").show();
        });

        $("#owner").on("click", function(){
            console.log("ownerLogin");
            $(".ownerFrm").show();
            $(".memberFrm").hide();
        });
    </script>
</body>
</html>