<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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

#mypage_content {
	border: 1px solid #CCCCCC;
	width: 75%;
	height: auto;
	border-radius: 20px;
	margin-right: 100px;
}

#card-area {
	display: flex;
	justify-content: space-evenly;
}

#content {
	width: auto;
}

#card-area {
	display: flex; /* Added */
	flex-wrap: wrap; /* Added */
	justify-content: flex-start; /* 수정된 부분 */
}

.card {
	height: 250px;
	width: 300px;
	border-radius: 15px;
	display: inline-block;
	margin-top: 30px;
	/* 	margin-left: 30px; */
	margin-bottom: 30px;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	overflow: hidden;
}

.card>table {
	margin: 10px;
	width: 100%;
}

#image-cell {
text-align: center;
}

.card img {
	max-height: 130px;
	max-width: 230px;
}

#btn-td {
	text-align: center;
	display: flex;
	justify-content: space-evenly;
}

#btn-edit {
	border: none;
	background-color: #7AB730;
	color: white;
	border-radius: 20px;
}

#btn-delete {
	border: none;
	background-color: #EC4937;
	color: white;
	border-radius: 20px;
}

#btn-share {
	border: none;
	background-color: #FFBF00;
	color: white;
	border-radius: 20px;
}

#btn-add {
	border: none;
	background-color: #5392F9;
	color: white;
	border-radius: 20px;
	margin-left: 25px;
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
				<h3 class="display-4 text-white text-uppercase">내 여행</h3>

			</div>
		</div>
	</div>
	<!-- Header End -->

	<!-- Blog Start -->

	<div class="container-fluid py-5 mypagecontainer">
		<%@ include file="/resources/inc/mypage_sidemenu.jsp"%>
		<div id="mypage_content">

			<div id="card-area">

				<c:forEach items="${list}" var="dto">
				<div class="card m-3 pr-2">
					<table>
						<tr>
							<td id="image-cell" style="margin-bottom: 10px;"><img src="../resources/img/mypage/mypage_gwangan.jpg"></td>
						</tr>
						<tr>
							<td>${dto.title}</td>
						</tr>
						<tr>
							<td>${dto.regdate.substring(0, 10)}</td>
						</tr>
						<tr>
							<td id="btn-td">
								<button id="btn-edit" onclick="goToViewJourney(${dto.trip_seq})">조회</button>
								<form method="POST" action="/dreamjourney/mypage/journeydel">
								<input type="hidden" name="trip_seq" value="${dto.trip_seq}">
								<button id="btn-delete">삭제</button>
								</form>
								<c:if test="${dto.is_shared eq 'n'}">
								<form method="POST" action="/dreamjourney/mypage/journeyshar">
								<input type="hidden" name="trip_seq" value="${dto.trip_seq}">
								<button id="btn-share">공유</button>
								</form>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				</c:forEach>

				
						
		</div>

			<!-- card-area end -->
			<button id="btn-add" onclick="location.href='/dreamjourney/mypage/addjourney';">여행 등록</button>
		</div>

	</div>

	<!-- Blog End -->
	<%@ include file="/resources/inc/footer.jsp"%>
<script>
	
	function goToViewJourney(tripSeq) {
		// tripSeq 값을 사용하여 URL을 동적으로 생성합니다.
		var url = '/dreamjourney/mypage/viewjourney?trip_seq=' + tripSeq;
		
		// 생성된 URL로 이동합니다.
		window.location.href = url;
	}
	
</script>


</body>

</html>






