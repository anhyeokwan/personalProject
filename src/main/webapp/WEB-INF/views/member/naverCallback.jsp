<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/naverJoin.do" method="post">
		<input type="hidden" name="memberName">
		<input type="hidden" name="memberEmail">
		<input type="hidden" name="memberPhone">
	</form>
	
	<script type="text/javascript">
	const naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "1ePCtXckEFpS2a0uKb2H",
				callbackUrl: "http://localhost/naverCallback.do",
				callbackHandle : true
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
 						
 						$("[name=memberEmail]").val(email);
 						$("[name=memberName]").val(nickName);
 						$("[name=memberPhone]").val(mobile);
 						
 						
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