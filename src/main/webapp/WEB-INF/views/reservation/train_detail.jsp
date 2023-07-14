<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>DreamJourney > 예약/예매 > 기차 > 상세보기</title>
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



</head>
<style>
.text-center {
	text-align: center;
}

.text {
	/* margin-left: 15px;
	margin-right: 15px; */
	margin: 15px;
	padding: 5px;
}



</style>
<body>


<%@ include file="/resources/inc/header.jsp"%>


	<!-- 제목 쓰는곳 -->
	<div class="container-fluid page-header">
		<div class="container">
			<div
				class="d-flex flex-column align-items-center justify-content-center"
				style="min-height: 400px">
				<h3 class="display-4 text-white text-uppercase">버스</h3>
			</div>
		</div>
	</div>




	<!-- Header End -->

	<!-- 내용쓰는곳 -->
	

	<!-- 내용 작성 -->
	<div class="container-fluid py-5" style="height: 1000px; width: 80%;">
		<c:forEach items="${list}" var="list">
			<div>
				<a
					class="d-flex align-items-center text-decoration-none bg-white mb-3"
					style="padding: 10px;" href=""> <img class="img-fluid"
					style="width: 80px;"
					src="/dreamjourney/resources/img/reservation/train.png" alt="123">
					<div style="width: 100%;">
						<div class="text-center">
							<h5 class="m-1">
								<span class="text">${dto.departure}</span> 
								<span class="text">>></span>
								<span class="text">${dto.destination}</span>
								<br><span class="text">출발 날짜 : ${list.tran_date}</span> 
								<span>출발 시간 : ${list.begin }</span> 
									<br><span class="text">신청 상황 : ${list.sold }</span> 
									<span class="text">가격 : ${dto.price}</span>
							</h5>
						</div>
					</div>
					<div class="col-md-2">
						<button class="btn btn-primary btn-block" type="submit"
							style="height: 47px; margin-top: -2px;">예약</button>
					</div>
				</a>
			</div>
		</c:forEach>
	</div>




	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="/dreamjourney/resources/lib/easing/easing.min.js"></script>
	<script
		src="/dreamjourney/resources/lib/owlcarousel/owl.carousel.min.js"></script>
	<script
		src="/dreamjourney/resources/lib/tempusdominus/js/moment.min.js"></script>
	<script
		src="/dreamjourney/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
	<script
		src="/dreamjourney/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="/dreamjourney/resources/mail/jqBootstrapValidation.min.js"></script>
	<script src="/dreamjourney/resources/mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="/dreamjourney/resources/js/main.js"></script>

	
</body>

<footer> 	<%@ include file="/resources/inc/footer.jsp"%>		</footer>
</html>





