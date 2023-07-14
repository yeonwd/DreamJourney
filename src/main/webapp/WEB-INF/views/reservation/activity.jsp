<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<style>



#showbtn {
   width: 300px;
   height: 60px;
   background-color: white;
   border: 1px solid #AAA;
   margin: 20px auto;
   margin-bottom: 100px;
   font-weight: bold;
   font-size: 20px;
   border-radius: 3px;
   color: #656565;
   display: flex;
   align-items: center;
   padding-left: 60px;
}

#showbtn:hover {
box-shadow: 1px 1px 20px #ddd;
}


.pb-5 {
   padding-bottom: 0px !important;
}

   .thumbnail {
      width: 250px;
      height: 170px;
   }

   .categoryAll {
      display: inline-block;
      width: 100%;
      text-align:center;
   }
   
   .categoryAll button:hover {
      box-shadow: 1px 1px 20px #ddd;
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
	
	.team-img {
		width: 250px;
		height: 170px;
	}
	
	.team-item {
		width: 250px;
		height: 300px;
	}
	
	.team-item:hover {
		cursor: pointer;
	}
	
</style>
<body>
   <!-- activity.jsp > 액티비티 페이지 -->
   <%@ include file="/resources/inc/header.jsp"%>
    

    
     <!-- 제목 쓰는곳 -->
    <div class="container-fluid page-header">
        <div class="container">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
                <h3 class="display-4 text-white text-uppercase">액티비티</h3>
                
            </div>
        </div>
    </div>
    <!-- Header End -->   
    
    
    <!-- Booking Start 검색 바 -->
    <div class="container-fluid booking mt-5 pb-5">
        <div class="container pb-5">
            <div class="bg-light shadow" style="padding: 30px;">
                <div class="row align-items-center" style="min-height: 60px;">
                    <div class="col-md-10">
                        <div class="row" >
                            <div class="col-md-4">
                                <div class="mb-3 mb-md-0"><span class="sub">여행지</span>
                                    <input type="text" class="form-control  px-4" style="height: 47px;" placeholder="어디로 떠나시나요?">
                                </div>
                            </div>
                            <div class="col-md-3"><span class="sub">일정</span>
                                <div class="mb-3 mb-md-0">
                                    <div class="date" id="date1" data-target-input="nearest">
                                        <input type="text" class="form-control p-4 datetimepicker-input" placeholder="언제 떠나시나요?" data-target="#date1" data-toggle="datetimepicker"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                 <div class="mb-3 mb-md-0"><span class="sub">액티비티</span>
                                    <input type="text" class="form-control  px-4" style="height: 47px; width: 350px;" placeholder="어떤 액티비티를 원하시나요?">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">　
                        <button class="btn btn-primary btn-block" type="submit" style="height: 47px; margin-top: -2px;">검색 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                          </svg></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Booking End -->
    
    
    

   <!-- 내용쓰는곳 -->
    <!-- Team Start > 액티비티 -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <div class="row">
            <c:forEach items="${list }" var="dto">
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2 slide">
                    <div class="team-item bg-white mb-4" onclick="location.href='/dreamjourney/reservation/viewactivity?activity_seq=${dto.activity_seq}';">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100 thumbnail" src="/dreamjourney/resources/img/reservation/${dto.thumbnail }"alt="">
                            <div class="team-social">
                               <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/viewactivity?activity_seq=${dto.activity_seq}">상세보기</a>
                            </div>
                        </div>
                        <div class="text-center py-4" style="padding: 20px;">
                           <div style="margin: 0; text-align: left;">${dto.category }</div>
                            <div class="text-truncate" id="title" style="text-weight: bold; font-size: 20px; text-align: justify;">${dto.title }</div>
                            <%-- <div><img style="width: 60px; float: left;" src="/dreamjourney/resources/img/reservation/파란별.jpg">${dto.avgScore }</div><br> --%>
                            <div class="m-0" id="content" style="float: right; text-align: justify; padding: 0 5px;"><small>${dto.price }원 / 1인</small></div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
                <!-- 주소만 검색 -->
<c:if test="${not empty actResultadr}">
                <c:forEach items="${actResultadr }" var="result" >
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2 slide">
                    <div class="team-item bg-white mb-4">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100 thumbnail" src="/dreamjourney/resources/img/reservation/${dto.thumbnail }"alt="">
                            <div class="team-social">
                               <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/viewactivity?activity_seq=${result.activity_seq}">상세보기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <div class="text-truncate" id="title" style="padding: 15px; text-weight: bold; font-size: 20px;">${result.title }</div>
                            <div class="m-0" id="content" style="text-align: justify; padding: 0 15px;">${result.content }</div>
                            
                        </div>
                    </div>
                </div>
                </c:forEach>
              </c:if>
              <!-- (주소로만)검색결과가 없는경우 -->
              <c:if test="${actResultadr!=null && empty actResultadr}}">
    <!-- 검색 결과가 없는 경우 -->
    <h5 style="margin-bottom:30px;">검색 결과가 없습니다.</h5>
</c:if>

<!-- 액티비티 명으로만 검색 -->
<c:if test="${not empty actResulttitle}">
                <c:forEach items="${actResulttitle }" var="result">
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2 slide">
                    <div class="team-item bg-white mb-4">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100 thumbnail" src="/dreamjourney/resources/img/reservation/${result.thumbnail }"alt="">
                            <div class="team-social">
                               <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/viewactivity?activity_seq=${result.activity_seq}">상세보기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <div class="text-truncate" id="title" style="padding: 15px; text-weight: bold; font-size: 20px;">${result.title }</div>
                            <div class="m-0" id="content" style="text-align: justify; padding: 0 15px;">${result.content }</div>
                        </div>
                    </div>
                </div>
                </c:forEach>
              </c:if>
              <!-- (주소로만)검색결과가 없는경우 -->
<c:if test="${actResulttitle != null && empty actResulttitle}">
    <!-- 검색 결과가 없는 경우 -->
    <h5 style="margin-bottom:30px;">검색 결과가 없습니다.</h5>
</c:if>


<!-- 둘다 검색 -->
<c:if test="${not empty actResult}">
                <c:forEach items="${actResult }" var="result">
                <div class="col-lg-3 col-md-4 col-sm-6 pb-2 slide">
                    <div class="team-item bg-white mb-4">
                        <div class="team-img position-relative overflow-hidden">
                            <img class="img-fluid w-100 thumbnail" src="/dreamjourney/resources/img/reservation/${result.image1 }"alt="">
                            <div class="team-social">
                               <a class="btn btn-outline-primary btn-square" href="/dreamjourney/reservation/viewactivity?activity_seq=${result.activity_seq}">상세보기</a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <div class="text-truncate" id="title" style="padding: 15px; text-weight: bold; font-size: 20px;">${result.title }</div>
                            <div class="m-0" id="content" style="text-align: justify; padding: 0 15px;">${result.content }</div>
                        </div>
                    </div>
                </div>
                </c:forEach>
              </c:if>
              <!-- (주소로만)검색결과가 없는경우
              <!-- c:if test는 참일때만 실행하는데, actResult는 존재하므로 거짓이기 떄문에 "검색 결과가 없습니다." 라는 문구가 등장하지 않는다, empty 조건은 무조건적으로 실행한다, 또한 값이 존재하지 않거나 비어있을때 실행해야 한다. -->
<c:if test="${actResult != null && empty actResult}">
    <!-- 검색 결과가 없는 경우 -->
    <h5 style="margin-bottom:30px;">검색 결과가 없습니다.</h5>
</c:if>

            </div>
        </div>
    </div>
    <!-- Team End -->
    
   <button id="showbtn" type="button">액티비티 더 보기 <span class="material-symbols-outlined">stat_minus_2</span></button>


    <%@ include file="/resources/inc/footer.jsp"%>
    


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
<script>
<<<<<<< HEAD
   $(document).ready(function() {
      $('.m-0').each(function() {
         var contentDiv = $(this);
         var contentText = contentDiv.text();
         if (contentText.length > 50) {
            var content = contentText.substr(0, 50) + '...';
            contentDiv.text(content);
         }
      });
   });
   
=======
	$(document).ready(function() {
		$('.m-0').each(function() {
			var contentDiv = $(this);
			var contentText = contentDiv.text();
			if (contentText.length > 50) {
				var content = contentText.substr(0, 50) + '...';
				contentDiv.text(content);
			}
		});
	});
	
>>>>>>> 4223c81a39de6c327d9d91fedfe5a7a124eddd9a


</script>
</html>



