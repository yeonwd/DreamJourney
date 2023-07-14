<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>TRAVELER - Free Travel Website Template</title>
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
		width: 250px;
		height: 170px;
	}
	
	.team-item {
		width: 250px;
		height: 300px;
	}
	
	.py-5 {
		padding-bottom: 0 !important;
		padding-top: 0 !important;
	}
   
   
</style>
<body>
   <!-- reservation.jsp > 예약/예매 페이지 -->
   
   <%@ include file="/resources/inc/header.jsp"%>
     <!-- 제목 쓰는곳 -->
    <div class="container-fluid page-header">
        <div class="container">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
                <h3 class="display-4 text-white text-uppercase">예약/예매</h3>
                
            </div>
        </div>
    </div>
    <!-- Header End -->   

   <!-- 내용쓰는곳 -->
    <!-- Team Start > 교통 -->
    <div class="container-fluid py-5" style="margin: 10px;">
        <div class="container pt-5 pb-3">
            <div class="text-center mb-3 pb-3">
                <h1>교통편</h1>
            </div>
            <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-2 box">
                    <div class="team-item bg-white mb-4">
                        <div class="team-img position-relative overflow-hidden">
                            <img src="/dreamjourney/resources/img/reservation/비행기.png" style="height: 200px;">
                           <div class="team-social">
                                <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/airplane">예약하기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <div class="text-truncate"><span class="material-symbols-outlined">flight</span> 비행기</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2 box">
                    <div class="team-item bg-white mb-4">
                        <div class="team-img position-relative overflow-hidden">
                            <img src="/dreamjourney/resources/img/reservation/기차.jpg">
                            <div class="team-social">
                                <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/train">예약하기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <div class="text-truncate"><span class="material-symbols-outlined">train</span> 기차</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2 box" >
                    <div class="team-item bg-white mb-4">
                        <div class="team-img position-relative overflow-hidden">
                            <img src="/dreamjourney/resources/img/reservation/고속버스.jpg">
                            <div class="team-social">
                                <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/transport">예약하기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <div class="text-truncate"><span class="material-symbols-outlined">
directions_bus
</span> 고속버스</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>   <!-- row -->
        </div>
    </div>
    <!-- Team End -->
    
    
    <!-- Team Start > 숙소 -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <div class="text-center mb-3 pb-3">
                <h1><a href="#">숙소</a></h1>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2">
                    <div class="team-item bg-white mb-4">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100 h-100" src="/dreamjourney/resources/img/accommodate/a-2.jpg" alt="">
                            <div class="team-social">
                                <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/accommodate_detail?acco_seq=3">예약하기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <h5 class="text_title" style="padding: 15px; text-weight: bold; font-size: 20px;" >오노마 오토그래프 컬렉션</h5>
                            <p class="m-0">대전 유성구 엑스포로 1 호텔 오노마 대전</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2">
                    <div class="team-item bg-white mb-4">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100 h-100" src="/dreamjourney/resources/img/accommodate/a-1.jpg" alt="">
                            <div class="team-social">
                               <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/accommodate_detail?acco_seq=1">예약하기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <h5 class="text_title" style="padding: 15px; text-weight: bold; font-size: 20px;">제주 미소 게스트하우스</h5>
                            <p class="m-0">제주특별자치도 제주시 관덕로 41 (일도1동)</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2">
                    <div class="team-item bg-white mb-4">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100 h-100" src="/dreamjourney/resources/img/accommodate/a-9.jpg" alt="">
                            <div class="team-social">
                                <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/accommodate_detail?acco_seq=9">예약하기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <h5 class="text_title" style="padding: 15px; text-weight: bold; font-size: 20px;">소피텔 앰배서더 서울 호텔 </h5>
                            <p class="m-0">서울 송파구 잠실로 209</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2">
                    <div class="team-item bg-white mb-4">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100 h-100" src="/dreamjourney/resources/img/accommodate/a-8.jpg" alt="">
                            <div class="team-social">
                               <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/accommodate_detail?acco_seq=8">예약하기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <h5 class="text_title" style="padding: 15px; text-weight: bold; font-size: 20px;">기장빌라드히멜</h5>
                            <p class="m-0">부산광역시 기장군 일광읍 장곡길 89-10</p>
                        </div>
                    </div>
                <div style="float:right; font-size: 20px; font-weight: bold;"> 
               <a href="/dreamjourney/reservation/accommodate">더보기 →</a>                               
                </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->
    
    
    <!-- Team Start > 액티비티 -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
         <div class="text-center mb-3 pb-3">
                <h1><a href="/dreamjourney/reservation/activity">액티비티</a></h1>
            </div>
            <div class="row">
            <c:forEach items="${list }" var="dto" begin="0" end="3">
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2 slide">
                    <div class="team-item bg-white mb-4" onclick="location.href='/dreamjourney/reservation/viewactivity?activity_seq=${dto.activity_seq}';">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100 thumbnail" src="/dreamjourney/resources/img/reservation/${dto.thumbnail }" style="height: 160px;">
                            <div class="team-social">
                            	<a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/viewactivity?activity_seq=${dto.activity_seq}">상세보기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <div class="text-truncate" id="title" style="padding: 15px; text-weight: bold; font-size: 20px;">${dto.title }</div>
                        </div>
                    </div>
                </div>
                    </c:forEach>
                
            </div>
               <a href="/dreamjourney/reservation/activity" style="float: right; font-weight: bold; font-size: 20px;">더보기 →</a>                               
        </div>
    </div>
    <!-- Team End -->
   
   
   <!-- 내용 작성 -->
    <div class="container-fluid py-5" style="height: 100px;">
       
   </div>
                


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="/dreamjourney/resources/lib/easing/easing.min.js"></script>
    <script src="/dreamjourney/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/dreamjourney/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="/dreamjourney/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="/dreamjourney/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="/dreamjourney/resources/mail/jqBootstrapValidation.min.js"></script>
    <script src="/dreamjourney/resources/mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="/dreamjourney/resources/js/main.js"></script>
</body>
<footer>
   <%@ include file="/resources/inc/footer.jsp"%>
</footer>
</html>




