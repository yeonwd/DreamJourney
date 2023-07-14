<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	border: 1px solid #CCCCCC;
	border-radius: 20px;
}

.table.reserve_list td, .table.reserve_list td {
	padding: 0.3rem;
}

.table-container {
	display: flex; /* Added */
	flex-wrap: wrap; /* Added */
}

.table.bookmark {
	display: inline-block;
	width: 25%;
}

.table.bookmark td, .table.bookmark th {
	padding: 0.3rem;
}

#btn-all {
	background-color: #B1D0E0;
	border: none;
	border-radius: 10px;
	color: white;
}
#btn-food {
	background-color: #6998AB;
	border: none;
	border-radius: 10px;
	color: white;
}
#btn-accommodate {
	background-color: #406882;
	border: none;
	border-radius: 10px;
	color: white;
}
#btn-activity {
	background-color: #22577E;
border: none;
	border-radius: 10px;
	color: white;
}

#btn-area {
	background-color: #1A374D;
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
				<h3 class="display-4 text-white text-uppercase">즐겨찾기</h3>

			</div>
		</div>
	</div>
	<!-- Header End -->

	<!-- Blog Start -->

	<div class="container-fluid py-5 mypagecontainer">
		<%@ include file="/resources/inc/mypage_sidemenu.jsp"%>
		<div id="mypage_content">



			<div id="mypage_reserve_search">
				<button type="button" class="m-2" id="btn-all">전체</button>
				<button type="button" class="m-2" id="btn-food">맛집</button>
				<button type="button" class="m-2" id="btn-accommodate">숙소</button>
				<button type="button" class="m-2" id="btn-activity">액티비티</button>
				<button type="button" class="m-2" id="btn-area">관광지</button>
			</div>

			<div class="table-container">
			<c:forEach items="${list}" var="dto">
				<c:if test="${not empty dto.accommodate_name}">
					<table class="table table-borderless bookmark table-accommodate" onclick="location.href = '/dreamjourney/reservation/accommodate_detail?acco_seq=${dto.acco_seq}'">
						<tr>
							<td colspan="2"><img src="../resources/img/mypage/호텔.jpg"
								width="300" height="200"></td>
						</tr>
						<tr>
							<td>${dto.accommodate_name}</td>
							<td></td>
						</tr>
						<tr>
							<td>호텔</td>
							<td></td>
						</tr>
					</table>
				</c:if>
				<c:if test="${not empty dto.activity_name}">
					<table class="table table-borderless bookmark table-activity" onclick="location.href = '/dreamjourney/reservation/viewactivity?activity_seq=${dto.activity_seq}'">
						<tr>
							<td colspan="2"><img src="../resources/img/mypage/액티비티.jpg"
								width="300" height="200"></td>
						</tr>
						<tr>
							<td>${dto.activity_name}</td>
							<td></td>
						</tr>
						<tr>
							<td>${dto.activity_category}</td>
							<td></td>
						</tr>
					</table>
				</c:if>
				<c:if test="${not empty dto.food_name}">
					<table class="table table-borderless bookmark table-food" onclick="redirectToLink('#')">
						<tr>
							<td colspan="2"><img src="../resources/img/mypage/맛집.jpg"
								width="300" height="200"></td>
						</tr>
						<tr>
							<td>${dto.food_name}</td>
							<td></td>
						</tr>
						<tr>
							<td>맛집</td>
							<td></td>
						</tr>
					</table>
				</c:if>
				<c:if test="${not empty dto.area_name}">
					<table class="table table-borderless bookmark table-area" onclick="redirectToLink('#')">
						<tr>
							<td colspan="2"><img src="../resources/img/mypage/관광지.jpg"
								width="300" height="200"></td>
						</tr>
						<tr>
							<td>${dto.area_name}</td>
							<td></td>
						</tr>
						<tr>
							<td>관광지</td>
							<td></td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
			</div>



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
	<!-- Blog End -->
	<%@ include file="/resources/inc/footer.jsp"%>

<script>

function redirectToLink(link) {
    window.location.href = link;
}

$(document).ready(function() {
    // Hide all tables initially
    $(".table-accommodate").show();
    $(".table-activity").show();
    $(".table-food").show();
    $(".table-area").show();

    // Show/hide tables based on button clicks
    $("#btn-all").click(function() {
        $(".table-accommodate").show();
        $(".table-activity").show();
        $(".table-food").show();
        $(".table-area").show();
    });

    $("#btn-food").click(function() {
        $(".table-accommodate").hide();
        $(".table-activity").hide();
        $(".table-food").show();
        $(".table-area").hide();
    });

    $("#btn-accommodate").click(function() {
        $(".table-accommodate").show();
        $(".table-activity").hide();
        $(".table-food").hide();
        $(".table-area").hide();
    });

    $("#btn-activity").click(function() {
        $(".table-accommodate").hide();
        $(".table-activity").show();
        $(".table-food").hide();
        $(".table-area").hide();
    });
    
    $("#btn-area").click(function() {
        $(".table-accommodate").hide();
        $(".table-activity").hide();
        $(".table-food").hide();
        $(".table-area").show();
    });
    
});

</script>


</body>

</html>






