<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DreamJourney > 예약/예매 > 액티비티</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="../asset/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/dreamjourney/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/dreamjourney/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/dreamjourney/resources/css/style.css" rel="stylesheet">
    
    <!-- Google Icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
</head>
<style>

	.categoryAll {
		display: inline-block;
		width: 100%;
		justify-content:center;
	}

	.category {
		display: inline-block;
		border: 1px solid black;
		padding: 20px;
		margin: 0 10px;
	}

	.sub {
		font-weight: bold;
	}

	.p1-4, .px-4, .p-4 {
		padding-left : none;
	}

	.text-truncate {
		font-weight: bold;
		font-size: 25px;
	}
	
	.btn-square {
		width: 100px;
	}
	
	.text-truncate {
		font-weight: bold;
	}
	
	img {
		width: 500px;
	}
	
	a:hover {
		text-decoration:none;
	}
	
	.row {
		justify-content:center;
	}
	
	.team-img {
		width: 255px;
		height: 210px;
	}
	
	.pay-container {
		display: inline-block;
		width: 1000px;
		height: 450px;
		text-align: center;
		border: 1px solid #DDD;
		margin: 0 auto;
		padding: 70px;
		background-color: white;
	}
	
	.py-5 {
		text-align: center;
	}
	
	.btn {
		width: 150px;
		height: 45px;
		margin: 0 15px;
		font-weight: bold;
		border-radius: 5px;
	}
	
	.btn-secondary {
		background-color: white;
		border: 1px solid #7AB730;
	}
	
</style>
<body>
   <!-- payok.jsp > 결제완료 페이지 -->
      <%@ include file="/resources/inc/header.jsp"%>
    
    <!-- 제목 쓰는곳 -->
    <div class="container-fluid page-header">
        <div class="container">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
                <h3 class="display-4 text-white text-uppercase">결제 완료</h3>
                
            </div>
        </div>
    </div>
    <!-- Header End -->   
    
   
   <!-- 본문 -->
    <div class="container-fluid py-5" >
    	<div class="pay-container">
    	
    	<div>
		<img alt="" src="/dreamjourney/resources/img/reservation/check.png" style="width: 80px;">
    	<h2 style="font-weight: bold; margin: 30px;">결제가 성공적으로 완료되었습니다. ${aa }</h2>
    	<p>
    	<div style="font-weight: bold; font-size: 20px;"></div>
    	<%-- <div style="text-align: left; padding-left: 180px;">
    		<div>주문 번호 : ${merchant_uid }</div> 
    		<div>주문명 : ${pdto.title }</div>
    		<div>결제 수단 : ${pdto.paymethod }</div>
    		<div>결제 금액 : ${pdto.totalPrice }</div>
    	</div> --%>
    	<div style="font-size: 17px";>기타 궁금하신 사항은 채팅 또는 전화문의로 연락주시면 성심껏 답변드리겠습니다.</div>
    	<div style="font-size: 17px";>신청하신 정보는 <span style="font-weight: bold;">예약내역(마이페이지 - 내 예매내역)</span>에서 확인 가능합니다.</div> 
    	</p>
    	</div>
    	<br>
    	<div>
    	<button type="button" class="btn btn-secondary" onclick="location.href='/dreamjourney/mypage/mypage_reserve';">결제내역 확인</button>
    	<button type="button" class="btn btn-primary" onclick="location.href='/dreamjourney/index';">메인으로</button>
    	</div>
    	
    	</div>
       
   </div>
                


    <%@ include file="/resources/inc/footer.jsp"%>
</body>
<script>
</script>

</html>





