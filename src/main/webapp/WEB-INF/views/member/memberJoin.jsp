<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/memberJoin.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<div class="memberJoin-wrap">
        <div class="join-title">
            <h1>일반 사용자 회원가입</h1>
        </div>

        <div class="join-content">
            <form action="">
                <table style="width: 500px; margin: 0 auto;">
                    <tr>
                        <th>아이디</th>
                        <td class="idTd">
                            <div class="idChk"></div>
                            <input class="w3-input w3-border" type="text" name="memberId" style="width: 300px!important;">
                            <span style="font-size: 11px;">영어 소문자 또는 대문자 9-12글자를 입력하세요.</span>
                            <button class="w3-button w3-yellow" type="button" style="width: 100px!important;">중복확인</button>
                        </td>
                    </tr>

                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <div class="pwComment"></div>
                            <input class="w3-input w3-border" type="password" name="memberPw">
                            <span>영어 소문자 또는 대문자와 특수문자를 포함한 9-20글자를 입력하세요.</span>
                        </td>
                    </tr>

                    <tr>
                        <th>비번 확인</th>
                        <td>
                            <div class="pwChkComment"></div>
                            <input class="w3-input w3-border" type="password" name="memberPwRe">
                            <span>영어 소문자 또는 대문자와 특수문자를 포함한 9-20글자를 입력하세요.</span>
                        </td>
                    </tr>

                    <tr>
                        <th style="padding-top: 20px;">이름</th>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   px;">이름</th>
                        <td>
                            <div></div>
                            <input class="w3-input w3-border" type="text" name="memberName">
                        </td>
                    </tr>

                    <tr>
                        <th>전화번호</th>
                        <td>
                            <div class="phoneComment"></div>
                            <input class="w3-input w3-border" type="text" name="memberPhone">
                            <span>-를 제외하고 입력해주세요. ex)010-0000-0000</span>
                        </td>
                    </tr>

                    <tr>
                        <th style="padding-top: 20px;">Eamil</th>
                        <td class="emailTd">
                            <div class="emailComment"></div>
                            <input class="w3-input w3-border" type="text" name="memberEmail" style="width: 300px!important;">
                            <button class="w3-button w3-yellow" type="button" style="width: 100px!important;">인증보내기</button>
                        </td>
                    </tr>

                    <tr style="display: none;">
                        <th>인증번호</th>
                        <td>
                            <input class="w3-input w3-border" type="text" name="memberAuth">
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <button class="w3-button w3-yellow" type="button" id="joinBtn">회원가입</button>
                            <button class="w3-button w3-white w3-border" type="button">메인으로</button>
                        </td>
                    </tr>

                    
                </table>
            </form>
        </div>
    </div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		let idChk = false;
		$("input[name=memberId]").keyup(function(){
		      // 영어 소/대문자 + 숫자 6~20글자
		    const idReg = /^[a-zA-Z0-9]{9,12}$/;
		    const idVal = $("input[name=memberId]").val();
	
		    if(idReg.test(idVal)){
		        $(".idChk").text("사용가능한 아이디입니다.");
		        $(".idChk").css("color", "blue");
		        idChk = true;
		    }else{
		        $(".idChk").text("ID설명을 확인해주세요.")
		        $(".idChk").css("color", "red");
		        idChk = false;
		    }
		});
	
		let pwChk = false;
		$("input[name=memberPw]").keyup(function(){
		    //최소 1개의 숫자 혹은 특수 문자를 포함해야 함(9-20)
		    const pwReg = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*]).{9,20}$/;
		    const pwVal = $("input[name=memberPw]").val();
	
		    if(pwReg.test(pwVal)){
		        $(".pwComment").text("사용가능한 비밀번호입니다.");
		        $(".pwComment").css("color", "blue");
		        pwChk = true;
		    }else{
		        $(".pwComment").text("비밀번호 설명을 확인해주세요.");
		        $(".pwComment").css("color", "red");
		        pwChk = false;
		    }
		});
	
		let pwReChk = false;
		$("input[name=memberPwRe]").keyup(function(){
		    const pw = $("input[name=memberPw]").val();
		    const pwRe = $("input[name=memberPwRe]").val();
	
		    if(pw == pwRe){
		        $(".pwChkComment").text("비밀번호가 일치합니다.");
		        $(".pwChkComment").css("color", "blue");
		        pwReChk = true;
		    }else{
		        $(".pwChkComment").text("비밀번호가 일치하지 않습니다.");
		        $(".pwChkComment").css("color", "red");
		        pwReChk = false;
		    }
		})
	
		let phoneChk = false;
		$("input[name=memberPhone]").keyup(function(){
		    const phoneReg =  /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
		    const phoneVal = $("input[name=memberPhone]").val();
	
		    if(phoneReg.test(phoneVal)){
		        $(".phoneComment").text("사용가능한 전화번호입니다.");
		        $(".phoneComment").css("color", "blue");
		        phoneChk = true;
		    }else{
		        $(".phoneComment").text("전화번호 설명을 확인해주세요.");
		        $(".phoneComment").css("color", "red");
		        phoneChk = false;
		    }
		});
	
		let emailChk = false;
		$("input[name=memberEmail]").keyup(function(){
		    const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		    const emailVal = $("input[name=memberEmail]").val();
	
		    if(emailReg.test(emailVal)){
		        $(".emailComment").text("알맞은 이메일입니다.");
		        $(".emailComment").css("color", "blue");
		        emailChk = true;
		    }else{
		        $(".emailComment").text("알맞지 않은 이메일입니다.");
		        $(".emailComment").css("color", "red");
		        emailChk = false;
		    }
		});
	
		$("#joinBtn").on("click", function(){
		    
		    if(!idChk){
		        alert("아이디를 확인해주세요.");
		        $(".joinBtn").attr("type", "button");
		    }else if(!pwChk){
		        alert(" 비밀번호를 확인해주세요.");
		        $(".joinBtn").attr("type", "button");
		    }else if(!pwReChk){
		        alert("비밀번호가 일치하는지 확인해주세요.");
		        $(".joinBtn").attr("type", "button");
		    }else if(!phoneChk){
		        alert("전화번호를 확인하세요.");
		        $(".joinBtn").attr("type", "button");
		    }else if(!emailChk){
		        alert("이메일을 확인하세요.");
		        $(".joinBtn").attr("type", "button");
		    }else{
		        console.log(1);
		        $(".joinBtn").attr("type", "button");
		    }
		});
	</script>
</body>
</html>

























