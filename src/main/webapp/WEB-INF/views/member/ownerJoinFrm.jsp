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
<style type="text/css">
	.emailAuthTr>td{
		position: relative;
	}
	
	.emailAuthTr>td>.timeOut{
		position: absolute;
		top: 45px;
		right: 40px;
		text-align: right;
		width: 100px;
	}
	
	.emailAuthTr>td>#authBtn{
		position: absolute;
		top: 40px;
		right: 100px;
	}
	
	.timeOut>span{
		font-size: 18px;
	}
	
	.memberJoin-wrap{
		margin-top: 200px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
	<form action="/idMultipleChk.do" name="idChk">
		<input type="hidden" name="idMulti">
	</form>
	
	<div class="memberJoin-wrap">
        <div class="join-title">
            <h1>일반 사용자 회원가입</h1>
        </div>
		
        <div class="join-content">
            <form action="/insertOwnerMember.do" method="post">
                <table style="width: 500px; margin: 0 auto;">
                    <tr>
                        <th>아이디</th>
                        <td class="idTd">
                            <div class="idChk"></div>
                            <input class="w3-input w3-border" type="text" name="ownerId" style="width: 300px!important;">
                            <span style="font-size: 11px;">영어 소문자 또는 대문자 9-12글자를 입력하세요.</span>
                            <button class="w3-button w3-yellow" type="button" style="width: 100px!important;" onclick="idMultiple();" id="multi">중복확인</button>
                        </td>
                    </tr>

                    <tr>
                        <th>비밀번호</th>
                        <td>
                            <div class="pwComment"></div>
                            <input class="w3-input w3-border" type="password" name="ownerPw">
                            <span>영어 소문자 또는 대문자와 특수문자를 포함한 9-20글자를 입력하세요.</span>
                        </td>
                    </tr>

                    <tr>
                        <th>비번 확인</th>
                        <td>
                            <div class="pwChkComment"></div>
                            <input class="w3-input w3-border" type="password" name="ownerPwRe">
                            <span>영어 소문자 또는 대문자와 특수문자를 포함한 9-20글자를 입력하세요.</span>
                        </td>
                    </tr>

                    <tr>
                        <th style="padding-top: 20px;">이름</th>
                        <td>
                            <div></div>
                            <input class="w3-input w3-border" type="text" name="ownerName">
                        </td>
                    </tr>

                    <tr>
                        <th>전화번호</th>
                        <td>
                            <div class="phoneComment"></div>
                            <input class="w3-input w3-border" type="text" name="ownerPhone">
                            <span>-를 제외하고 입력해주세요. ex)01000000000</span>
                        </td>
                    </tr>

                    <tr>
                        <th style="padding-top: 20px;">Eamil</th>
                        <td class="emailTd">
                            <div class="emailComment"></div>
                            <input class="w3-input w3-border" type="text" name="ownerEamil" style="width: 300px!important;">
                            <button class="w3-button w3-yellow" type="button" style="width: 100px!important;" id="authBtn">인증보내기</button>
                        </td>
                    </tr>

                    <tr class="emailAuthTr" style="display: none;">
                        <th style="padding-top: 20px;">인증하기</th>
                        <td>
                        	<div class="authComment"></div>
                            <input class="w3-input w3-border" type="text" name="memberAuth" style="width:200px;">
               				<div class="timeOut"><span class="min">3</span> : <span class="sec">00</span></div>
               				<button class="w3-button w3-yellow" type="button" style="width: 100px!important;" id="authBtnMan" onclick="authGo();">인증하기</button>
               				
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
		let mailVal;
		$("#authBtn").on("click", function(){
			console.log("열려라!");
			const email = $("[name=memberEmail]").val();
			$.ajax({
				url : "/mailSend.do",
				type : "POST",
				data : {memberEmail : email},
				success : function(data){
					$(".emailAuthTr").slideDown();
					console.log(data);
					mailVal = data;
					authTime();
				}
			});
			
		});
		
		
		let intervalTime;
		function authTime(){
			inttervalTime = window.setInterval(function(){
				timeCount();
			}, 1000);
		}
		
		
		function timeCount(){
			const min = Number($(".min").text());
			const sec = $(".sec").text();
			const authComment = $(".authComment");
			
			if(sec == "00"){
				if(min == 0){
					mailVal = null;
					$(".timeOut")
					authComment.text("느려.");
					authComment.css("color", "red");
				}else{
					$(".min").text(min-1);
					console.log($(".min").text(min-1));
					$(".sec").text(59);
				}
			}else{
				const newSec = Number($(".sec").text())-1; // interval이 될때마다 -1
				
				if(newSec < 10){
					$(".sec").text("0" + newSec);
				}else{
					$(".sec").text(newSec);
				}
			}
		}
		
		let authChk;
		function authGo(){
			const mailAuth = $("input[name=memberAuth]").val();
			
			if(mailVal == mailAuth){
				$(".authComment").text("인증되었습니다.");
				$(".authComment").css("color", "blue");
				clearInterval(intervalTime);
				authChk = true;
			}else{
				$(".authComment").text("인증번호를 다시 확인해주세요.");
				$(".authComment").css("color", "red");
				authChk = false;
			}
		}
	
		let idChk = false;
		$("input[name=memberId]").keyup(function(){
		      // 영어 소/대문자 + 숫자 6~20글자
		    const idReg = /^[a-zA-Z0-9]{9,12}$/;
		    const idVal = $("input[name=memberId]").val();
	
		    if(idReg.test(idVal)){
		        $(".idChk").text("사용가능한 아이디입니다.");
		        $(".idChk").css("color", "blue");
		        idChk = true;
		        $("#multi").attr("onclick", "idMultiple()");
		    }else{
		        $(".idChk").text("ID설명을 확인해주세요.")
		        $(".idChk").css("color", "red");
		        idChk = false;
		        $("#multi").removeAttr("onclick", "idMultiple()");
		    }
		});
		
		function idMultiple(){
			const memberId = $("input[name=memberId]").val();
			
			if(memberId == ""){
				$(".idChk").text("아이디를 입력하세요.");
				$(".idChk").css("color", "red");
				return false;
			}else{
				$("input[name=idMulti]").val(memberId);
				const popUp = window.open("", "idChk", "width=700px, height=800px, menubar=no, scrollbars=no");
				
				// popup으로 값을 넘겨주는 코드 (form의 name과 attr의 value값이 같아야함) (아마 팜업 idChk이부분도 같아야함)
				$("[name=idChk]").attr("target", "idChk");
				$("[name=idChk]").submit();
			}
		}
	
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
		        $("#joinBtn").attr("type", "button");
		    }else if(!pwChk){
		        alert(" 비밀번호를 확인해주세요.");
		        $("#joinBtn").attr("type", "button");
		    }else if(!pwReChk){
		        alert("비밀번호가 일치하는지 확인해주세요.");
		        $("#joinBtn").attr("type", "button");
		    }else if(!phoneChk){
		        alert("전화번호를 확인하세요.");
		        $("#joinBtn").attr("type", "button");
		    }else if(!emailChk){
		        alert("이메일을 확인하세요.");
		        $("#joinBtn").attr("type", "button");
		    }else if(!authChk){
		    	alert("인증번호를 확인하세요.");
		        $("#joinBtn").attr("type", "button");
		    }else{
		        console.log(1);
		        $("#joinBtn").attr("type", "submit");
		    }
		});
		
	</script>
</body>
</html>

























