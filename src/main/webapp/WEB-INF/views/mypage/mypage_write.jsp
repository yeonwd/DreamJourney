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

.table.write td, .table.write th {
	padding: 0.3rem;
	text-align: center;
	vertical-align: middle;
}

.table.write {
	border-collapse: collapse;
	border-radius: 20px;
	box-shadow: 0 0 0 1px #CCC;
}

#btn-edit {	
background-color: #82CD47;
	border: none;
	border-radius: 20px;
	color: white;
	margin-right: 15px;
}

#btn-delete{
	background-color: #dc3545;
	border: none;
	border-radius: 20px;
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
				<h3 class="display-4 text-white text-uppercase">내 작성글</h3>

			</div>
		</div>
	</div>
	<!-- Header End -->

	<!-- Blog Start -->

	<div class="container-fluid py-5 mypagecontainer">
		<%@ include file="/resources/inc/mypage_sidemenu.jsp"%>
		<div id="mypage_content">




			<div class="m-3">
				<h2>내 작성글</h2>
			</div>

			<div class="container-fluid mt-5 mb-5">
			
			<c:forEach items="${list}" var="dto">
			
			
				<table class="table m-1 write" style="margin-right: 10px;">
					<tr>
						<td style="width: 10%;">${dto.category }</td>
						<td style="width: 40%; text-align:left;">${dto.title }</td>
						<td style="width: 10%;">${dto.regdate.substring(0,10)}</td>
						<td style="width: 10%;"><span class="material-symbols-outlined">favorite</span>${dto.recommend }</td>
						<td style="width: 20%;">
							<button type="button" id="btn-edit" onclick="location.href='#'">수정</button>
							<button type="button" id="btn-delete" onclick="location.href='#'">삭제</button>
						</td>
					</tr>
				</table>
				
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
		
	</script>
</body>

</html>






