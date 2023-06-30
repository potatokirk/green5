<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		.div_page ul{
			display: flex;
			list-style: none;
		}
	</style>
</head>
<body>

	<table width="800" border="1">
		<tr>
			<td>후기 번호</td>
			<td>후기 작성자</td>
			<td>칭찬하는 사람</td>
			<td>내용</td>
			<td>작성 시간</td>
		</tr>

		<c:forEach items="${list}" var="ReviewDto">
		<tr>
				<td>${ReviewDto.review_id}</td>
				<td>${ReviewDto.u_id}"아이디값 받아오기"</td>
				<td>${ReviewDto.review_u_id}"아이디값 받아오기"</td>
				<td>${ReviewDto.review_content}</td>
				<%-- <td><fmt:parseDate var="parseDateData" value="${review_created}" pattern="yyyyMMdd"/></td> --%>
				<%-- <td><fmt:formatDate value="${ReviewDto.review_created}" pattern="a h:mm" type="date"/></td> --%>
				<td>${ReviewDto.review_created}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				<a href="reviewWrite_view">글작성</a>
			</td>
		</tr>
	</table>

	<div class="div_page">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button">
				
					<a href="${pageMaker.startPage - 1}"> [Previous] </a>
				</li>
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
				<li class="paginate_button">
					<a href="${pageMaker.endPage + 1}"> [Next] </a>
				</li>
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

	$(".move_link")
			.on(
					"click",
					function(e) {
						e.preventDefault();
						var targetBno = $(this).attr("href");
						actionForm
								.append("<input type='hidden' name='bid' value='"+targetBno+"'>")
						actionForm.attr("action", "content_view").submit();
					});
</script>