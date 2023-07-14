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

#content {
	width: auto;
}

#button-container {
	display: flex; /* Added */
	flex-direction: row; /* Added */
	justify-content: flex-end;
	margin-top: 25px;
	margin-right: 15px;
}

#btn-edit {
	border: none;
	outline: none;
	border-radius: 10px;
	color: white;
	background-color: #7AB730;
	width: 120px;
	height: 40px;
	margin-right: 15px;
}

#table-container {
	margin-top: 50px;
	margin-right: 15px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#profile-table {
	width: 600px;
	height: 400px;
}

#profile-table td:first-child {
	font-weight: bold;
}

#imgtd {
	text-align: center;
}

#imgtd>img {
	width: 180x;
	height: 180px;
}

input {
	outline: none;
	border: none;
	width: 100%;
	padding-left: 7px;
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
				<h3 class="display-4 text-white text-uppercase">마이페이지</h3>

			</div>
		</div>
	</div>
	<!-- Header End -->

	<!-- Blog Start -->

	<div class="container-fluid py-5 mypagecontainer">
		<%@ include file="/resources/inc/mypage_sidemenu.jsp"%>
		<div id="mypage_content">

			<form action="/dreamjourney/mypage/saveinfo" method="POST">
				<div id="table-container">
					<table id="profile-table">
						<tr>
							<td id="imgtd" colspan="2"><img
								src="../resources/img/마이페이지유저.png"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" value="${dto.name}"></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type="text" name="nickname"
								value="${dto.nickname }"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" value="${dto.email }"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="text" name="pw" value="${dto.pw}"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="tel" value="${dto.tel}"></td>
						</tr>
					</table>
						<input type="hidden" name="member_seq" value="${dto.member_seq}">
				</div>
				<div id="button-container">
					<button id="btn-edit" type="submit">수정하기</button>
				</div>
			</form>
		</div>
	</div>
	<!-- Blog End -->
	<%@ include file="/resources/inc/footer.jsp"%>

	<script>
		
	</script>


</body>

</html>






