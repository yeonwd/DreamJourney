<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Dream Journey</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="../asset/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link
	href="/dreamjourney/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="/dreamjourney/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/dreamjourney/resources/css/style.css" rel="stylesheet">
<link href="/dreamjourney/resources/css/wanjin.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<style>
.mypagecontainer {
	display: flex;
	flex-direction: row;
}

#menucontainer {
	border: 1px solid #CCCCCC;
	width: 15%;
	height: 800px;
	margin-left: 100px;
	margin-right: 30px;
	border-radius: 20px;
	padding-left: 30px;
	padding-right: 30px;
}

#mypage_content {
	border: 1px solid #CCCCCC;
	width: 75%;
	height: auto;
	border-radius: 20px;
	margin-right: 100px;
}

#content {
	width: auto;
}

#sidemenu {
	text-align: left;
	width: 100%;
	height: 100%;
}

#mypage_reserve_search {
	margin-top: 30px;
	margin-left: 30px;
}

table.reserve_list {
	border-collapse: collapse;
	border-radius: 20px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #CCC;
}

.table.reserve_list td, .table.reserve_list td {
	padding: 0.3rem;
}

.review-button {
	border: none;
	border-radius: 20px;
	color: white;
}

#btn-transport {
	height: 30px;
	background-color: #A1C2F1;
}

#btn-accommodate {
	background-color: #5A96E3;
}

#btn-activity {
	background-color: #0A6EBD;
}

#btn-detail {
	background-color: #82CD47;
	border: none;
	border-radius: 10px;
	color: white;
	margin-right: 5px;
}

.btn-delete {
	background-color: #dc3545;
	border: none;
	border-radius: 10px;
	color: white;
}

</style>
<body>
	<!-- Topbar Start -->
	<%@ include file="/resources/inc/header.jsp"%>

	<!-- Header Start -->
	<div class="container-fluid page-header">
		<div class="container">
			<div
				class="d-flex flex-column align-items-center justify-content-center"
				style="min-height: 400px">
				<h3 class="display-4 text-white text-uppercase">내 예매내역</h3>

			</div>
		</div>
	</div>
	<!-- Header End -->

	<!-- Blog Start -->

	<div class="container-fluid py-5 mypagecontainer">
		<%@ include file="/resources/inc/mypage_sidemenu.jsp"%>
		<div id="mypage_content">

			<div id="mypage_reserve_search">
				<button type="button" class="review-button m-2"
					id="btn-transport">교통</button>
				<button type="button" class="review-button m-2"
					id="btn-accommodate">숙소</button>
				<button type="button" class="review-button m-2"
					id="btn-activity">액티비티</button>
			</div>

			<div class="container-fluid mt-5">
				<c:forEach items="${tlist}" var="tdto">
				<form method="POST" action="mypage_reservedelok">
					<table
						class="table table-borderless reserve_list table-height table-transport">
						<tr>
							<td style="width: 10%; text-align: center; vertical-align: middle;">
						    	<h4 class="text-primary">예약완료</h4>
							</td>
							<td style="width: 75%;" colspan="3">${tdto.regdate.substring(0, 10)}</td>
							<td rowspan="3"
								style="text-align: center; vertical-align: middle; width: 15%">
								<button type="button" id="btn-detail" onclick="location.href='mypage_reserve_view?pay_seq=${tdto.pay_seq}'">상세보기</button>
								<button type="submit" class="btn-delete" name="pay_seq" value="${tdto.pay_seq}">예매취소</button></td>
						</tr>
						<tr>
							<td rowspan="2"
								style="text-align: center; vertical-align: middle;"><h5 class="text-info">교통</h5></td>
							<td style="width: 30%; vertical-align: middle;" rowspan="2"><h5 class="text-success">${tdto.type}</h5></td>
							<td style="width: 25%;">${tdto.tran_date.substring(0, 10)} ${tdto.begin}</td>
							<td style="width: 10%;">1명</td>

						</tr>
						<tr>
							<td style="width: 25%;">${tdto.departure} > ${tdto.destination}</td>
							<td style="width: 10%;">${tdto.price}원</td>
						</tr>
					</table>
				</form>
				</c:forEach>
				<c:forEach items="${alist}" var="adto">
				<form method="POST" action="mypage_reservedelok">
					<table
						class="table table-borderless reserve_list table-height table-accommodate">
						<tr>
							<td style="width: 10%; text-align: center; vertical-align: middle;">
						    	<h4 class="text-primary">예약완료</h4>
							</td>
							<td colspan="3" style="width: 60%">${adto.regdate.substring(0, 10)}</td>
							<td rowspan="3"
								style="text-align: center; vertical-align: middle; width:30%;">
								<button type="button" id="btn-detail" onclick="location.href='mypage_reserve_view?pay_seq=${adto.pay_seq}'">상세보기</button>
								<button type="submit" class="btn-delete" name="pay_seq" value="${adto.pay_seq}">예매취소</button></td>
						</tr>
						<tr>
							<td rowspan="2"
								style="text-align: center; vertical-align: middle;"><h5 class="text-info">숙소</h5></td>
							<td style="width: 30%;">${adto.type}</td>
							<td style="width: 25%;">${adto.rdate.substring(0, 10)}</td>
							<td style="width: 10%;">${adto.limit}명</td>

						</tr>
						<tr>
							<td style="width: 30%;">${adto.name}</td>
							<td style="width: 25%;">${adto.address}</td>
							<td style="width: 10%;">${adto.price}원</td>
						</tr>
					</table>
				</form>
				</c:forEach>
				<c:forEach items="${aclist}" var="acdto">
				<form method="POST" action="/dreamjourney/mypage/mypage_reservedelok">
					<table
						class="table table-borderless reserve_list table-height table-activity">
						<tr>
							<td style="width: 10%;text-align: center; vertical-align: middle;">
						    	<h4 class="text-primary">예약완료</h4>
							<td style="width: 70%;" colspan="3">${acdto.regdate.substring(0, 10)}</td>
							<td rowspan="3"
								style="text-align: center; vertical-align: middle; width:20%;">
<button type="button" id="btn-detail" onclick="location.href='mypage_reserve_view?pay_seq=${acdto.pay_seq}'">상세보기</button>
								<button type="submit" class="btn-delete" name="pay_seq" value="${acdto.pay_seq}">예매취소</button></td>
						</tr>
						<tr>
							<td rowspan="2"
								style="text-align: center; vertical-align: middle;"><h5 class="text-info">액티비티</h5></td>
							<td style="width: 30%;">${acdto.category}</td>
							<td style="width: 25%;">${acdto.adate.substring(0, 10)}</td>
							<td style="width: 10%;">1명</td>

						</tr>
						<tr>
							<td style="width: 30%;">${acdto.title}</td>
							<td style="width: 25%;">${acdto.address}</td>
							<td style="width: 10%;">${acdto.price}원</td>
						</tr>
					</table>
				</form>
				</c:forEach>
				<!-- <nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav> -->

			</div>

		</div>
	</div>
	<!-- Blog End -->
	<%@ include file="/resources/inc/footer.jsp"%>

	<script>
		$(document).ready(function() {
			// Hide all tables initially
			$(".table-accommodate").hide();
			$(".table-activity").hide();
			$(".table-transport").show();

			$("#btn-accommodate").click(function() {
				$(".table-accommodate").show();
				$(".table-activity").hide();
				$(".table-transport").hide();
			});

			$("#btn-activity").click(function() {
				$(".table-accommodate").hide();
				$(".table-activity").show();
				$(".table-transport").hide();
			});

			$("#btn-transport").click(function() {
				$(".table-accommodate").hide();
				$(".table-activity").hide();
				$(".table-transport").show();
			});

		});
	</script>


</body>

</html>






