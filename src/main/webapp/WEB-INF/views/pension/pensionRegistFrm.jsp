<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/pensionRegist.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="pensionRegistFrm">
        <div class="pension-title">
            <h1 style="text-align: center;">팬션 등록하기</h1>
        </div>

        <div class="pention-content">
            <form action="#" method="post" enctype="multipart/form-data">
                <table id="pensionTbl">
                    <tr>
                        <th style="text-align: center;">편션 사진</th>
                    </tr>

                    <tr>
                        <td>
                            <div class="mainPhoto">
                                <label class="file-label" for="chooseFile">메인사진 등록하기</label>
                                <input class="file" id="chooseFile" type="file" onchange="imageUpload(this);">
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
                                <label class="label" for="pensionName">팬션 명</label>
                                <input class="w3-input" type="text" id="pensionName" name="pensionName" style="width: 500px;">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <div class="pensionInfo">
                                <div class="up"></div>
                                <label class="label" for="pensionAddr">팬션주소</label>
                                <input class="w3-input" type="text" id="pensionAddr" name="pensionAddr"  style="width: 500px;">
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
                                    <input type="checkbox" id="pool" name="pansionService" class="pensionService" value="pool">
                                </div>

                                <div style="text-align: center;">
                                    <label for="pool">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            water
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">계곡인접</p>
                                    <input type="checkbox" id="pool" name="pansionService" class="pensionService" value="pool">
                                </div>

                                <div style="text-align: center;">
                                    <label for="pool">
                                        <span class="material-symbols-outlined" style="font-size: 40px; text-align: center;">
                                            sailing
                                            </span>
                                    </label>

                                    <p style="margin: 0 auto; font-size: 13px; font-weight: bold;">바다인접</p>
                                    <input type="checkbox" id="pool" name="pansionService" class="pensionService" value="pool">
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
                        <th style="text-align: center;">객실 등록</th>
                    </tr>

                    <tr>
                        <td>
                            <div class="count-wrap">
                                <div class="w3-third">
                                    <select class="w3-select" name="roomCnt" id="roomCnt">
                                        <option value="" disabled selected>객실 개수</option>
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

                    <tr>
                        <td>
                            <div class="pensionInfo">
                                <div class="up"></div>
                                <label class="label" for="businessLicenseNo">사업자번호</label>
                                <input class="w3-input" type="text" id="businessLicenseNo" name="businessLicenseNo">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="buttonClass">
                                <button class="w3-button w3-yellow" type="button">등록하기</button>
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
		$(".w3-input").on("click", function(){
		    const index = $(".w3-input").index(this);
		    const text = $(".label").eq(index).text();
		    $(".up").eq(index).text(text);
		    $(".up").eq(index).animate({
		        "font-size" : "16px"
		    }, 10*100);
		    $(".label").eq(index).hide();
		});
	
		// $("#roomCntBtn").on("click", function(){
	//	     const roomCnt = $("#roomCnt").val();
	
	//	     console.log(roomCnt);
	//	     const pensionTbl = $("#pensionTbl");
	//	     for(let i = 0; i < roomCnt; i++){
	//	         const tr = $("<tr></tr>");
	//	     }
		// });
	
		function imageUpload(obj){
		    console.log(obj.files);
		    if(obj.files.length != 0 || obj.files[0] != 0){
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
	</script>
</body>
</html>