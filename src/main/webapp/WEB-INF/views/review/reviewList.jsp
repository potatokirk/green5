<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.div_page ul {
	display: flex;
	list-style: none;
}
</style>
</head>
<body>
		<c:forEach items="${list}" var="ReviewDto">

	<table width="500" border="1">
		<caption>Review</caption>

		<tr>
			<td width="100" >후기번호</td>
				<td>${ReviewDto.review_id}</td>
		
		</tr>

		<tr>
			<td>아이디</td>
				<td>${ReviewDto.u_id}</td>
		
		</tr>

		<tr>
			<td>작성자 아이디</td>	
			<td>${ReviewDto.review_u_id}</td>
		
		</tr>

		<tr>
			<td>받는 사람 아이디</td>
		<td>${ReviewDto.p_id}</td>
		</tr>

		<tr>
			<td>만족도</td>
			<td>${ReviewDto.review_satisfy}</td>
		</tr>

		<tr>
			<td>내용</td>
				<%-- <td><a href="content_view?review_id=${ReviewDto.review_id}">${ReviewDto.review_content}</a></td> --%>
		<td>
		<a class="move_link" href="${ReviewDto.review_id}">${ReviewDto.review_content}</a>
		</td>
		</tr>

		<tr>
			<td>작성시간</td>
				<%-- <td><fmt:formatDate value="${ReviewDto.review_created}" pattern="yyyy-mm-dd" type="date"/></td> --%>
			 <td>${ReviewDto.review_created}</td> 
						
		</tr>

			<tr>
				<%-- <td><fmt:parseDate var="parseDateData" value="${review_created}" pattern="yyyyMMdd"/></td> --%>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><a href="reviewWrite_view">글작성</a></td>
		</tr>
	</table>

	<div class="div_page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button">
				<a href="${pageMaker.startPage - 1}"> [Previous]</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<%-- 				<li>${num}</li> --%>
				<%-- 				<li ${pageMaker.cri.pageNum == num ? "style='color:red'":""} > --%>

				<li class="paginate_button"
					${pageMaker.cri.pageNum == num ? "style='background-color:yellow'":""}>

					<a href="${num}"> [${num}] </a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next}">
				<li class="paginate_button"><a href="${pageMaker.endPage + 1}">
						[Next] </a></li>
			</c:if>
		</ul>
	</div>

	<form method="get" id="actionForm" action="list">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>



</body>
</html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e) {

		e.preventDefault();

		console.log("@# href ===>" + $(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	$(".move_link").on(	"click",function(e) {
		console.log("000")
						e.preventDefault();
						var targetBno = $(this).attr("href");
						actionForm.append("<input type='hidden' name='review_id' value='"+targetBno+"'>")
						actionForm.attr("action", "content_view").submit();
					});
</script>