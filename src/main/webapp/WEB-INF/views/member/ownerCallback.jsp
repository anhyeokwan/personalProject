<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form action="/insertNaverOwner.do" method="post" id="naverFrm">
		<input type="hidden" name="ownerName">
		<input type="hidden" name="ownerPhone">
		<input type="hidden" name="ownerEamil">
	</form>
	
	<script type="text/javascript">
		const naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "1ePCtXckEFpS2a0uKb2H",
					callbackUrl: "http://localhost/naverCallbackOwner.do",
					loginButton: {color: "green", type: 2, height: 40}
				}
			);
	 	naverLogin.init(); // 로그인 설정
	 	
	 	window.addEventListener('load', function () {
			 naverLogin.getLoginStatus(function (status) {
			      if (status) {
			          const nickName=naverLogin.user.getName();
			          const email=naverLogin.user.getEmail();
			          const mobile = naverLogin.user.getMobile();
			          	console.log(mobile);
						console.log(email);
						console.log(naverLogin.user);
						
						$("[name=ownerEamil]").val(email);
						$("[name=ownerName]").val(nickName);
						$("[name=ownerPhone]").val(mobile);
						
						
			        //닉네임을 선택하지 않으면 선택창으로 돌아갑니다.
			          if(nickName===null||nickName===undefined ){ 
			            alert("별명이 필요합니다. 정보제공을 동의해주세요.");
			            naverLogin.reprompt(); 
			            return ;  
			         }else{
			        	 $("#naverFrm").submit();
			         }
			      }
			    });
		 });
	</script>
</body>
</html>