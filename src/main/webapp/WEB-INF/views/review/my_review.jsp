<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>my_review</title>
<style type="text/css">
.head {
	margin: auto;
	width: 20%;
}

th, td {
	text-align: center;
}

.div_page ul {
	display: flex;
	list-style: none;
	justify-content: center;
}

img {
	width: 120;
	height: 50;
}

/* table {
	margin: auto;
}

h3 {
	margin-left: 30%;
}

input {
	margin-left: 20%;
} */
</style>
</head>
<body>

	<c:forEach items="${list}" var="ReviewDto">
		<table width="500" border="1">

			<caption>가입한 파티 목록</caption>
			<!-- u_id 와 비교? -->
			<tr>
				<td>파티장 아이디</td>
				<td>${users.u_id}</td>
			</tr>

			<tr>
				<td>snsID</td>
				<td>${users.u_sns_id}</td>
			</tr>

		</table>
	</c:forEach>



	<table id="tb1" width="500" border="1">
		<caption>가입한 파티 회원 정보</caption>
		<tr>
			<td>회원 닉네임</td>
			<td>${users.u_nickname}</td>

		</tr>

		<tr>
			<td>회원 아이디</td>
			<td>${users.u_id}</td>
		</tr>
		<tr>
			<td>회원 온도</td>
			<td>${users.u_temperature}</td>
		</tr>
	</table>
	<br>


	<input type="button" value="가입한 파티 목록 보기" onclick="review(1)" />
	<input type="button" value="작성한 리뷰 보기" onclick="review(2)" />



	<c:forEach items="${list}" var="ReviewDto">

		<table id="tb2" width="500" border="1">

			<caption>내가 작성한 후기</caption>

			<tr>
				<td width="100">후기번호</td>
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
				<td>${ReviewDto.review_content}</td>
			</tr>

			<tr>
				<td>작성시간</td>
				<td>${ReviewDto.review_created}</td>

			</tr>

			<tr>
			</tr>

			<tr>
				<td colspan="5"><a href="reviewWrite_view">글작성</a></td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	/* var actionForm = $("#actionForm");
	 $(".myReviewView").on(	"click",function(e) {
	 console.log("000")
	 };
	 */
	function review(arg) {
		console.log("000")

		var t1 = document.getElementById("tb1");
		var t2 = document.getElementById("tb2");

		if (arg == 1) {
			t1.style.display = "block";
			t2.style.display = "none";
		} else {
			t2.style.display = "block";
			t1.style.display = "none";
		}
	}
</script>
