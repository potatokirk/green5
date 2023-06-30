<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script type="text/javascript">
	function fn_submit(){
		//form 요소 자체
		var formData = $("#frm").serialize();
		
		$.ajax({
			type:"post"
			,data:formData
			,url:"write"
			,success: function(data){
				alert("저장완료");
				location.href="list";
			}
			,error: function(){
				alert("오류발생");
			}
		});
	}
</script>
</head>
<body>
	<table width="500" border="1">
		<form id="frm" method="post" action="write">
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="u_id" size="50">
				</td>
			</tr>
			<tr>
				<td>누구?</td>
				<td>
					<input type="text" name="review_u_id" size="50">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" name="review_content"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
<!-- 					<input type="submit" value="입력"> -->
					<input type="submit" onclick="fn_submit()" value="입력">
					&nbsp;&nbsp;
					<a href="list">목록보기</a>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>














