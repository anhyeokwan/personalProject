<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

	<h1>여기는 회원 추가 페이지</h1>
	<hr>
	
	<table border="1" class="tbl">
			<tr>
				<th>대분류</th>
				<th>서비스</th>
				<th>서비스아이디</th>
				<th>서비스비밀번호</th>
				<th>사용여부</th>
				<td>
					<button type="button" class="addBtn" style="width: 100%;">추가</button>
				</td>
			</tr>
		
			<tr class="contentTr">
				<td>
					<select name="lCategory" class="lCategory">
						<option value="">대분류</option>
						<option value="001">ASSEMBLE</option>
						<option value="002">자동메세지</option>
					</select>
				</td>
				
				<td>
					<select name="sCategory" class="sCategory">
						<option value="">서비스 선택</option>
						<option value="001">Finger Push</option>
						<option value="002">카카오</option>
						<option value="003">기업메세지</option>
						<option value="004">알림톡</option>
						<option value="005">이메일</option>
					</select>
				</td>
				
				<td>
					<input type="text" name="svcId" placeholder="서비스ID" class="svcId">
				</td>
				
				<td>
					<input type="password" name="svcPw" placeholder="서비스Pw" class="svcPw">
				</td>
				
				<td>
					<select name="userChk" class="userChk">
						<option value="">사용여부</option>
						<option value="Y">사용</option>
						<option value="N">미사용</option>
					</select>
				</td>
				
				<td>
					<button type="button" class="deleteBtn">삭제</button>
				</td>
				
			</tr>
	</table>
	
	<div>
		<button type="button" onclick="insertBtn()">등록</button>
	</div>
	
	<script type="text/javascript">
		function insertBtn(){
			const length = $(".contentTr").length;
			console.log("길이 : " + length);
			if(confirm("등록하시겠습니까?")){
				for(let i = 0; i < length; i++){
					console.log("대분류 " + (i + 1) + " : " + $(".lCategory").eq(i).val());
					console.log("서비스 " + (i + 1) + " : " + $(".sCategory").eq(i).val());
					console.log("서비스 아이디 " + (i + 1) + " : " + $(".svcId").eq(i).val());
					console.log("서비스 비밀번호" + (i + 1) + " : " + $(".svcPw").eq(i).val());
					console.log("사용여부" + (i + 1) + " : " + $(".userChk").eq(i).val());
					
					const lCategory = $(".lCategory").eq(i).val(); // 대분류
					const sCategory = $(".sCategory").eq(i).val(); // 서비스
					const svcId = $(".svcId").eq(i).val();
					const svcPw = $(".svcPw").eq(i).val();
					const userChk = $(".userChk").eq(i).val();
					
					$.ajax({
						url : "/admin/addMember.jsp",
						type : "post",
						data : {
							lCategory : lCategory,
							sCategory : sCategory,
							svcId : svcId,
							svcPw : svcPw,
							userChk : userChk
						},
						success : function(data){
							console.log(data);
						}
					})
				}
			}
		}	
	
		$(".addBtn").on("click", function() {
			
			console.log("addBtn 확인");
			const tbody = $("table");
			
			const contentTr = $("<tr class='contentTr'>");
			const lCategory = "<td><select name='lCategory' class='lCategory'>"
									+ "<option value=''>대분류</option>"
									+ "<option value='001'>ASSEMBLE</option>"
									+ "<option value='002'>자동메세지</option>"
									+ "</select>"
								+ "</td>";
								
			const sCategory = "<td><select name='sCategory' class='sCategory'>"
										+ "<option value=''>서비스 선택</option>"
										+ "<option value='001'>Finger Push</option>"
										+ "<option value='002'>카카오</option>"
										+ "<option value='003'>기업메세지</option>"
										+ "<option value='004'>알림톡</option>"
										+ "<option value='005'>이메일</option>"
									+ "</select>"
								+ "</td>";	
			
			const svcId = "<td>"
							+ "<input type='text' name='svcId' class='svcId' placeholder='서비스ID'>"
							+ "</td>";
			
			const svcPw = "<td>"
							+ "<input type='password' name='svcPw' class='svcPw' placeholder='서비스Pw'>"
							+ "</td>";
							
			const userChk = "<td>"
							+ "<select name='userChk' class='userChk'>"
							+ "<option value=''>사용여부</option>"
							+ "<option value='Y'>사용</option>"
							+ "<option value='N'>미사용</option>"
							+ "</select>"
							+ "</td>";
			
			const deleteBtn = "<td>"
							+ "<button type='button' class='deleteBtn' onclick='deleteBtn(this)'>삭제</button>"
							+ "</td>";
			contentTr.append(lCategory).append(sCategory).append(svcId).append(svcPw).append(userChk).append(deleteBtn);
			
			tbody.append(contentTr);
			
			if($(".contentTr").length > 5){
				alert("더이상 추가할 수 없습니다.");
				$(".contentTr").last().remove();
			}
		});
		
		function addCharge(obj) {
			console.log("addCharge 확인");
			
		}
		
		function deleteBtn(obj){
			$(obj).parent().parent().remove();
		}
	</script>

</body>
</html>
















