<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 천단위 콤마 라이브러리 -->
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>DreamJourney > 예약/예매 > 숙소 > 상세보기</title>
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
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link	href="/dreamjourney/resources/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link	href="/dreamjourney/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/dreamjourney/resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- Google Icon -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<style>

/* #bookmark {
	width: 150px; 
	margin-left: 200px;
	float: left,
}
 */
</style>
<body>



	<%@ include file="/resources/inc/header.jsp"%>

	<!-- 제목 쓰는곳 -->
	<div class="container-fluid page-header">
		<div class="container">
			<div
				class="d-flex flex-column align-items-center justify-content-center"
				style="min-height: 400px">
				<!-- <h3 class="display-4 text-white text-uppercase">제목</h3> -->

			</div>
		</div>
	</div>




	<!-- Header End -->

	<!-- 내용쓰는곳 -->
	<!-- Blog Start -->
<form method="POST" action="/dreamjourney/reservation/pay" id="form">
	<div class="container-fluid py-5">
		<div class="container py-5">
			<div class="row">
				<div class="col-lg-8">
					<!-- Blog Detail Start -->
					<div class="pb-3">
						<div class="blog-item">
							<div class="position-relative">
								<img class="img-fluid w-100"
									src="/dreamjourney/resources/img/accommodate/${dto.acco_img}.jpg"
									alt="">
								<div class="blog-date">
									<!-- <h6 class="font-weight-bold mb-n1">01</h6>
                                    <small class="text-white text-uppercase">Jan</small> -->
								</div>
							</div>
						</div>
						<div class="bg-white mb-3" style="padding: 30px;">
							<div class="d-flex mb-3">
								<a class="text-primary text-uppercase text-decoration-none"
									href="">${dto.type}</a>
								<!-- <span class="text-primary px-2">|</span>
                                <a class="text-primary text-uppercase text-decoration-none" href="">Tours & Travel</a> -->
							</div>
							<h2 class="mb-3">${dto.name}</h2>
							<p>${dto.address}</p>
							<p>${dto.note}</p>
							<hr>
							<c:forEach items="${list}" var="list">
								<h4 class="mb-3">${list.name}</h4>
								<img class="img-fluid w-100"
									src="/dreamjourney/resources/img/accommodate/${list.room_img}.jpg"
									alt="">
								<h5 class="mb-3">
									<br>수용인원 : ${list.limit}인
								</h5>
								<h5 class="mb-3">
									<br>가격 : <fmt:formatNumber value="${list.price}" pattern="#,###" />원
								</h5>
								<h5 class="mb-3">
									<br>상세내용 : 
								</h5>
								<p>${list.note}</p>
								<button class="btn btn-primary btn-block" type="submit"
									style="height: 47px; margin-top: -2px;">예약하기</button>
								<hr>
							</c:forEach>
						</div>
					</div>
					
					<!-- Blog Detail End -->

					<!-- Comment List Start -->
					<div class="bg-white" style="padding: 30px; margin-bottom: 30px;">
						<hr>
						<h3>위치 안내</h3>
						<div id="map"
							style="width: 680px; height: 400px; margin: 20px auto;"></div>
						<div style="text-align: center;">
							<span class="material-symbols-outlined">location_on</span>
							${dto.address }
						</div>
						<hr>
						<div>
							리뷰 (${reviewCount})
							<hr>
							<c:forEach items="${review }" var="rdto">
								<div style="padding: 0 5px; font-weight: bold;">${rdto.nickname }</div>
								<div style="padding: 5px;">
									<span class="score">${rdto.score }</span> <small>${rdto.rdate }</small>
								</div>
								<div style="padding: 5px;">${rdto.content }</div>
								<hr>
							</c:forEach>
						</div>

					</div>
					<!-- Comment List End -->
				</div>

				<div class="col-lg-4 mt-5 mt-lg-0 text-right">
					<div class="d-flex flex-column text-center bg-white mb-5 py-5 px-4">
						<div class="col-md-10">
							<div class="mb-3 mb-md-0">
								<!-- <span class="sub">출발일</span> -->
								<div class="date" id="date1" data-target-input="nearest">
									<input type="text"
										class="form-control p-4 datetimepicker-input"
										placeholder="출발 일" data-target="#date1"
										data-toggle="datetimepicker" />
								</div>
							</div>
						</div>
						<div class="col-md-10">
							<div class="mb-3 mb-md-0">
								<!-- <span class="sub">도착일</span> -->
								<div class="date" id="date2" data-target-input="nearest">
									<input type="text"
										class="form-control p-4 datetimepicker-input"
										placeholder="도착 일" data-target="#date2"
										data-toggle="datetimepicker" />
								</div>
							</div>
						</div>
						<div class="col-md-10">
							<div class="mb-3 mb-md-0">
								<!-- <span class="sub">숙박인원</span> -->
								<input class="form-control  px-4" type="text"
									style="height: 47px;" placeholder="인원 수" name="totalPeople"> </input>
							</div>
						</div>
						<%-- <div class="col-md-10">
							<div class="mb-3 mb-md-0">
								<input class="form-control  px-4" type="text"
									style="height: 47px;" placeholder="총 가격"  id="totalPrice" name="totalPrice"> <fmt:formatNumber value="${list.price }" pattern="#,###" />원</input>
							</div>
						</div> --%>
						
						<div class="col-md-10">
							<div class="mb-3 mb-md-0">
								<select class="form-control  px-4" type="select"
									style="height: 47px;">
									<option value="">방 이름 선택하세요</option>
									<c:forEach items="${list}" var="item">
										<option value="${item.name}">${item.name}</option>
									</c:forEach>

								</select>
							</div>
							<br>
						</div>
						<!-- <button class="btn btn-primary btn-block" type="submit"
							style="height: 47px;">예약하기</button> -->
							<button type="submit" class="btn btn-primary reservation" onclick="/dreamjourney/reservation/pay?acco_seq=${dto.acco_seq}">예약하기</button>
						<button type="submit" class="btn btn-primary btn-block"
							id="bookmark" name="bookmark"
							" style="height: 47px; margin-top: 5px;">
							<i class="bi bi-star"></i> 즐겨찾기 추가
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	<!-- Blog End -->



	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
		class="fa fa-angle-double-up"></i></a>

	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=399d3a29656e06f5e50372ac6e9c718a&libraries=services,clusterer,drawing"></script>
	<!-- 카카오맵.api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=399d3a29656e06f5e50372ac6e9c718a"></script>

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


	<script>
		/* Kakao Maps API & 지오코딩 */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						"${dto.address }",
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">"${dto.name}"</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});

		/* 리뷰 */
		$(document).ready(function() {
							$('.score').each(function() { //each로 각각의 score마다 이벤트 설정해야 함
								var score = $(this).text();
								$(this).empty(); //기존 값은 숨기기
								for (var i = 1; i <= score; i++) {
								$(this).append("<img style='width: 20px;' src='/dreamjourney/resources/img/reservation/평점.png'>");
												}
											});
						});

		/* 즐겨찾기 */
		$('#bookmark').click(function() {
			$.ajax({
				url : "/dreamjourney/reservation/accommodate_detail", //url 이슈 > 왜 /reservation/viewactivity가 아니라 그냥 viewactivity 하니까 됐음(연우 덕)
				type : "POST",
				dataType : "json",
				data : {
					acco_seq : "${dto.acco_seq}"
				},
				success : function(result) {
					console.log('성공');
					location.href = "/dreamjourney/reservation/payok";
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});
		});
	</script>



</body>
<footer>
	<%@ include file="/resources/inc/footer.jsp"%>
</footer>
</html>





