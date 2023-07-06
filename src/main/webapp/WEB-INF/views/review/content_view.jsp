<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
 <link rel="stylesheet"> 
<style> @import '../resources/css/style.css'</style>
<title>Insert title here</title>

</head>
<body>
	<table width="500" border="1">
		<form method="post" action="modify">
			<input type="hidden" name="pageNum" value="${pageMaker.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.amount}">
			<input type="hidden" name="review_id" value="${pageMaker.review_id}">
			<tr>
				<td class ="b">후기번호</td>
				<td>${content_view.review_id}</td>
			</tr>
			<tr>
				<td class ="b"> 아이디</td>
				<td>${content_view.u_id}</td>
			</tr>
			<tr>
				<td class ="b">작성자 아이디</td>
				<td>
					<input type="text" name="review_u_id" value="${content_view.review_u_id}">
				</td>
			</tr>
			
			<tr>
				<td class ="b">받는 사람 아이디</td>
				<td>
					<input type="text" name="p_id" value="${content_view.p_id}">
				</td>
			</tr>
			
			<tr>
				<td class ="b">만족도</td>
				
			
				<td> 
				 <select name="review_satisfy" class="review_satisfy">
						<option value="T">good</option>
						<option value="F">bad</option>
				</select>
				</td>
				
			</tr>
			<tr>
				<td class ="b">내용</td>
				<td>
					<textarea type="text" rows="20" cols ="60%" name="review_content"  id="review_content" value="${content_view.review_content}"></textarea>
				
				</td>
			</tr>
			
			<tr>
				<td>작성시간</td>
				<td>
					${content_view.review_created}
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="button" onclick="fn_modify()" value="수정">
					&nbsp;&nbsp;<input type="submit" value="목록보기" formaction="list" />
					&nbsp;&nbsp;<input type="button" value="삭제" formaction="delete"  />
				</td>
			</tr>
		</form>
	</table>
</body>
</html>

<script type="text/javascript">

function fn_modify(){
  
	 var review_content = document.getElementsByName("review_content")
	  //        게시판 내용
	 if(review_content[0].value.length==0){
        alert("리뷰 내용을 적어주세요")
	// console.log("0000000000000")
        return false;
    }
    	
    if(review_content[0].value.length > 500){
	 console.log(i)
    alert('줄여서 적어주세요.');
    return false;
          }
         
 //  유효성 문제 없을 시 폼에 submit
document.querySelector("form").submit();
 
    }
    
    
</script>











