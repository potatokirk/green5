<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet"> 
<style> @import '../resources/css/style.css'</style>
 <!-- <link href="/css/style.css" rel="stylesheet" type="text/css"> -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">
	
		 /***********************게시판 내용 유효성 검사*************************/
	function fn_submit() {
		 var review_content = document.getElementsByName("review_content")
	  //        게시판 내용
	 if(review_content[0].value.length==0){
         alert("게시판 내용을 적어주세요")
	
         return false;
     }else{
             if(review_content[0].value.length > 1500){
                  alert('줄여서 적어주세요.');
                  return false;
           }
      }      
		//form 요소 자체
		var formData = $("#frm").serialize();

		$.ajax({
			type : "post",
			data : formData,
			url : "write",
		
	
			success : function(data) {
				alert("저장완료");
				location.href = "list";
			},
			error : function() {
				alert("오류발생");
			}
		
		});


	}
	
	//리뷰 아이디 중복성 검사********************************
	
	
	 
				
</script>
</head>
<body>
	<form id="frm" method="post" action="write">
		<table width="500" border="1">
	
			<tr>				
				<td >아이디</td>	
				<td><input type="text"  name="u_id" size="50" >			
				<input type="button" class="idck"  value="중복검사" >
				<span id="result"></span>
				</td>
								
			</tr>
			
			<tr>
				<td class="a">누구?</td>
				<td><input type="text" name="review_u_id" size="50"></td>
			</tr>
			
			<tr>
				<td>선택</td>
				<td>
					<!-- <input type="text" name="review_satisfy" size="50"> -->
					 <select name="review_satisfy" class="review_satisfy">
						<option value="T">good</option>
						<option value="F">bad</option>
				</select>

				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols ="90%" name="review_content" id="review_content"></textarea></td>
			</tr>

			<tr>
				<td colspan="2">
					<!-- 					<input type="submit" value="입력"> --> 
					<input type="button" onclick="fn_submit()" value="입력"> &nbsp;&nbsp;
					 <a	href="list">목록보기</a>
				</td>
			</tr>
		</table>
		
		
	</form>
</body>
</html>













