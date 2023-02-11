<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/pensionRegist.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> <!-- w3c school -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" /> <!-- 구글폰트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음주소 api -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jquery -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="pensionRegistFrm">
        <div class="pension-title">
            <h1 style="text-align: center;">팬션 등록하기</h1>
        </div>

        <div class="pention-content">
            <form action="/insertPension.do" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="ownerNo" value="${sessionScope.owner.ownerNo }">
                <table id="pensionTbl">
                    <tr>
                        <th style="text-align: center;">편션 사진<span style="color:red;">*</span></th>
                    </tr>

                    <tr>
                        <td>
                            <div class="mainPhoto">
                                <label class="file-label" for="chooseFile">메인사진 등록하기</label>
                                <input class="file" id="chooseFile" type="file" name="pensionImg" onchange="imageUpload(this);">
                            </div>
                        </td>
                    </tr>

                    <tr id="imgTr" style="display: none;">
                        <td>
                            <div class="imageView">
                                <img id="img-view" style="width: 250px; height: 250px;">
                            </div>
                        </td>
                    </tr>

                    <tr>

                        <td colspan="2">
                            <div class="pensionInfo">
                                <div class="up"></div>
                                <label class="label" for="pensionName">팬션 명<span style="color:red;">*</span></label>
                                <input class="w3-input" type="text" id="pensionName" name="pensionName" style="width: 500px;">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <div class="pensionInfo">
                                <div class="up"></div>
                                <label class="label" for="pensionAddr">팬션주소<span style="color:red;">*</span></label>
                                <input class="w3-input" type="text" id="pensionAddr" name="pensionAddr" style="width: 400px;" readonly>
                                <button class="w3-button w3-yellow" type="button" onclick="searchAddr(this);">주소검색</button>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th colspan="2" style="text-align: center;">
                            인기시설 및 서비스
                        </th>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <div  style="display: flex; justify-content: center;" class="service-wrap">
                                <div style="text-align: center;" class="service">
                                    <label for="spa">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            bathtub
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">스파/욕조</p>
                                    <input type="checkbox" id="spa" name="pansionService" class="pensionService" value="spa">
                                </div>

                                <div style="text-align: center;">
                                    <label for="parking">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            local_parking
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">주차</p>
                                    <input type="checkbox" id="parking" name="pansionService" class="pensionService" value="parking">
                                </div>

                                <div style="text-align: center;">
                                    <label for="barbecue">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            outdoor_grill
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">야외바베규</p>
                                    <input type="checkbox" id="barbecue" name="pansionService" class="pensionService" value="barbecue">
                                </div>

                                <div style="text-align: center;">
                                    <label for="pool">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            pool
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">실내수영장</p>
                                    <input type="checkbox" id="pool" name="pansionService" class="pensionService" value="poolIn">
                                </div>

                                <div style="text-align: center;">
                                    <label for="valley">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            water
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">계곡인접</p>
                                    <input type="checkbox" id="valley" name="pansionService" class="pensionService" value="valley">
                                </div>

                                <div style="text-align: center;">
                                    <label for="beach">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            sailing
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">바다인접</p>
                                    <input type="checkbox" id="beach" name="pansionService" class="pensionService" value="beach">
                                </div>

                                <div style="text-align: center;">
                                    <label for="kids">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            child_care
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">키즈</p>
                                    <input type="checkbox" id="kids" name="pansionService" class="pensionService" value="kids">
                                </div>

                                <div style="text-align: center;">
                                    <label for="wifi">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            wifi
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">와이파이</p>
                                    <input type="checkbox" id="wifi" name="pansionService" class="pensionService" value="wifi">
                                </div>

                                <div style="text-align: center;">
                                    <label for="stairs">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            stairs
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">복층구조</p>
                                    <input type="checkbox" id="stairs" name="pansionService" class="pensionService" value="stairs">
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th style="text-align: center;">객실 등록<span style="color:red;">*</span></th>
                    </tr>

                    <tr>
                        <td>
                            <div class="count-wrap">
                                <div class="w3-third">
                                    <select class="w3-select" name="roomCnt" id="roomCnt">
                                        <option value="0" disabled selected>객실 개수</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>
                        </td>
                    </tr>
					
                    <c:if test="${sessionScope.owner.ownerType eq 'o' }">
                    	<tr>
	                        <td>
	                            <div class="pensionInfo">
	                                <div class="up"></div>
	                                <label class="label" for="businessLicenseNo">사업자번호<span style="color:red;">*</span></label>
	                                <input class="w3-input" type="text" id="businessLicenseNo" name="businessLicenseNo" style="width: 500px;">
	                            </div>
	                        </td>
	                    </tr>
                    </c:if>

                    <tr>
                        <td>
                            <div class="buttonClass">
                                <button class="w3-button w3-yellow" type="button" id="submitBtn">등록하기</button>
                                <button class="w3-button w3-light-gray" type="button" onclick="goMain();">메인으로</button>
                            </div>
                        </td>
                    </tr>       
                </table>
            </form>
        </div>
    </div>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
	
		$(".pensionService").prev().prev().on("click", function(){
			const index = $(".pensionService").prev().prev().index(this);
			//console.log($(".pensionService").eq(index).val());
			if($(".pensionService").eq(index).is(":checked") == false){
				$(this).eq(index).css("color", "#000000");
				$(this).next().eq(index).css("color", "#000000");
				console.log($(".pensionService").eq(index).val());
				console.log($(".pensionService").eq(index).is(":checked"));
				console.log("클린된 인덱스 : " + index);
			}else{
				console.log($(".pensionService").eq(index).val());
				console.log($(".pensionService").eq(index).is(":checked"));
				console.log("클린된 인덱스 : " + index);
				
				$(this).eq(index).css("color", "#FBC252");
				$(this).next().eq(index).css("color", "#FBC252");
				
			}
		})
		
		function searchAddr(obj){
			const text = $("label[for=pensionAddr]").text();
			$(obj).prev().prev().prev().text(text);
			$(obj).prev().prev().hide();
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            $("input[name=pensionAddr]").val(data.address);
		            $("input[name=pensionAddr]").focus();
		        }
		    }).open();
		}
	
		$(".w3-input").on("click", function(){
		    const index = $(".w3-input").index(this);
		    if(index != 1){
		    	const text = $(".label").eq(index).text();
			    $(".up").eq(index).text(text);
			    $(".up").eq(index).animate({
			        "font-size" : "16px"
			    }, 10*100);
			    $(".label").eq(index).hide();
		    }
		    
		});
	
		// $("#roomCntBtn").on("click", function(){
	//	     const roomCnt = $("#roomCnt").val();
	
	//	     console.log(roomCnt);
	//	     const pensionTbl = $("#pensionTbl");
	//	     for(let i = 0; i < roomCnt; i++){
	//	         const tr = $("<tr></tr>");
	//	     }
		// });
		
		let fileLength = 0;
		function imageUpload(obj){
		    console.log(obj.files);
		    if(obj.files.length != 0 || obj.files[0] != 0){
		    	fileLength = obj.files.length;
		    	console.log(fileLength);
		        $("#imgTr").slideDown();
		        const reader = new FileReader(); // 파일의 정보를 읽어옴
		        reader.readAsDataURL(obj.files[0]); // 
		        // 파일리더가 다 읽어오면 실행할 객체
		        reader.onload = function(e){
		            $("#img-view").attr("src", e.target.result);
		        }
	
		    }else{
		        $("#img-view").attr("src", "");
		    }
		}
	
		function goMain(){
		    location.href = "/";
		}
		
		$("#submitBtn").on("click", function(){
			if(fileLength == 0){
				alert("사진을 등록하세요..!");
				$(this).attr("type", "button");
			}else if($("input[name=pensionName]").val() == ""){
				alert("팬션이름을 입력하세요..!");
				$(this).attr("type", "button");
			}else if($("input[name=pensionAddr]").val() == ""){
				alert("주소를 입력하세요..!");
				$(this).attr("type", "button");
			}else if(Number($("[name=roomCnt]").val()) == 0){
				alert("방의 개수를 입력하세요..!");
				$(this).attr("type", "button");
			}else if($("#businessLicenseNo").val() == ""){
				alert("사업자번호를 입력하세요..!");
				$(this).attr("type", "button");
			}else{
				console.log(1);
				$(this).attr("type", "button");
			}
		})
	</script>
</body>
</html>




























