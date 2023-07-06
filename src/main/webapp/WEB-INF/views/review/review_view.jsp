<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>review_view</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script type="text/javascript">
	function(){
		
	}
	</script>
</head>
<body>
<a href="review/reviewList">리뷰 페이지 이동</a><br>
<h1></h1>
<a href="review/my_review?u_id=${users.u_id}">내가 작성한 후기페이지 이동</a>



<body onload=my_init()>
    <table width="500" border="1">
	<!-- u_id 와 비교? -->
        <tr>
        <td>파티장 아이디</td>
        <td>${users.u_id}</td>
        </tr>
        
         <tr>
        <td>snsID</td>
        <td>${users.u_sns_id}</td>
        </tr>
       
       <%-- 
        <tr>
        <td>파티명</td>
        <td>${p_title}</td>
        </tr>
        
        <!-- //a_id에 아이디 받아오기 -->
        <tr>
        <td>파티원 수</td>
        <td>${p_max}</td>
        </tr>
        
        <tr>
        <td>파티장 아이디</td>
        <td>${p_id}</td>
        </tr> --%>
        
        </table>
</body>
</html>