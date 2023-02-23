<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h1>지아센 실험</h1>
	<hr>
	통계연도 : <input type="text" name="statsYr">
	서비스기관ID : <input type="text" name="srvInstId">
	<button type="button" id="ji-button">기관이용확인</button>
	<div class="ji-wrap">
		<table>
			<tr>
				<th>
					지아센1
				</th>
				<td>
					<input type="text" name="jiacen1">
				</td>
			</tr>
			
			<tr>
				<th>
					지아센2
				</th>
				<td>
					<input type="text" name="jiacen2">
				</td>
			</tr>
			
			<tr>
				<th>
					지아센3
				</th>
				<td>
					<input type="text" name="jiacen3">
				</td>
			</tr>
			
			<tr>
				<th>
					지아센4
				</th>
				<td>
					<input type="text" name="jiacen4">
				</td>
			</tr>
			
			<tr>
				<th>
					지아센5
				</th>
				<td>
					<input type="text" name="jiacen5">
				</td>
			</tr>
		</table>
		<br>
		<button type="button" onclick="insertJiacen();">저장</button>
	</div>
	
	<script type="text/javascript">
		function insertJiacen(){
			const statsYr = $("[name=statsYr]").val();
			const srvInstId = $("[name=srvInstId]").val();
			const jiacen1 = $("[name=jiacen1]").val();
			const jiacen2 = $("[name=jiacen2]").val();
			const jiacen3 = $("[name=jiacen3]").val();
			const jiacen4 = $("[name=jiacen4]").val();
			const jiacen5 = $("[name=jiacen5]").val();
			
			if(confirm("저장하시겠습니까??")){
				$.ajax({
					url : "insertJiacen.do",
					type : "post",
					data : 
						{
						  statsYr : statsYr
						  , srvInstId : srvInstId
						  , jiacen1 : jiacen1
						  , jiacen2 : jiacen2
						  , jiacen3 : jiacen3
						  , jiacen4 : jiacen4
						  , jiacen5 : jiacen5
						},
					success : function(data){
						alert("저장되었습니다.");
					}
				});
			}
			
		}	
	
		$("#ji-button").on("click", function(){
			
			const statsYr = $("[name=statsYr]").val();
			const srvInstId = $("[name=srvInstId]").val();
			
			$.ajax({
				url : "/selectJiacen.do",
				data : {statsYr : statsYr
						, srvInstId : srvInstId},
				method : "post",
				success : function(data){
					console.log("조회성공");
					console.log(data.jiacen1);
					$("[name=jiacen1]").attr("value", data.jiacen1);
					$("[name=jiacen2]").val(data.jiacen2);
					$("[name=jiacen3]").val(data.jiacen3);
					$("[name=jiacen4]").val(data.jiacen4);
					$("[name=jiacen5]").val(data.jiacen5);
				}
			})
		});
	</script>
</body>
</html>