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
   margin-left: 15px;
   margin-right: 15px;
}

.text2 {
   margin-left: 15px;
   margin-right: 15px;
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
            <h3 class="display-4 text-white text-uppercase">기차</h3>

         </div>
      </div>
   </div>




   <!-- Header End -->

   <!-- 내용쓰는곳 -->
   <!-- Booking Start 검색 바 -->
   <div class="container-fluid booking mt-5 pb-5">
      <div class="container pb-5">
         <div class="bg-light shadow" style="padding: 30px;">
            <div class="row align-items-center" style="min-height: 60px;">
               <div class="col-md-10">
                  <div class="row">
                     <div class="col-md-5">
                        <div class="mb-3 mb-md-0">
                           <input type="text" class="form-control  px-4"
                              style="height: 47px;" placeholder="출발지">
                        </div>
                     </div>
                     <div class="col-md-5">
                        <div class="mb-3 mb-md-0">
                           <input type="text" class="form-control  px-4"
                              style="height: 47px;" placeholder="도착지">
                        </div>
                     </div>
                     <div class="col-md-5">
                        <div class="mb-3 mb-md-0">
                           <div class="date" id="date1" data-target-input="nearest">
                              <input type="text"
                                 class="form-control p-4 datetimepicker-input"
                                 placeholder="출발 일" data-target="#date1"
                                 data-toggle="datetimepicker" />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-5">
                        <div class="mb-3 mb-md-0">
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
                           <input type="text" class="form-control  px-4"
                              style="height: 47px;" placeholder="인원 수"> </input>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-md-2">
                  <button class="btn btn-primary btn-block" type="submit"
                     style="height: 47px; margin-top: -2px;">
                     검색
                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                        fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path
                           d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                          </svg>
                  </button>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Booking End -->

   <!-- 내용 작성 -->
   <div class="container-fluid py-5" style=" width: 80%;">
      <c:forEach items="${list}" var="dto">
         <div>
            <a
               class="d-flex align-items-center text-decoration-none bg-white mb-3"
               style="padding: 10px;" href=""> <img class="img-fluid"
               style="width: 80px;"
               src="/dreamjourney/resources/img/reservation/train.png" alt="123">
               <div style="width: 100%;">
                  <div class="text-center">
                     <h5 class="m-1">
                        <span class="text">${dto.departure}</span> <span class="text">>></span>
                        <span class="text">${dto.destination}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="text2">운영
                           시간 : ${dto.runtime}분</span> <span class="text2">정원 :
                           ${dto.limit}</span> <span class="text2">가격 : ${dto.price}</span>
                     </h5>
                  </div>
               </div>
               <div class="col-md-2">
                  <form action="/dreamjourney/reservation/train_detail" method="GET">
                     <input type="hidden" name="tran_seq" value="${dto.tran_seq}">
                     <button class="btn btn-primary btn-block" type="submit"
                        style="height: 47px; margin-top: -2px;">예약</button>
                  </form>
               </div>
            </a>
         </div>
      </c:forEach>
      
<!-- 검색 기차데이터 존재시 div태그 생성 및 데이터 생성 -->
<c:if test="${not empty trainResult}">
      <c:forEach items="${trainResult}" var="result">
         <div>
            <a
               class="d-flex align-items-center text-decoration-none bg-white mb-3"
               style="padding: 10px;" href=""> <img class="img-fluid"
               style="width: 80px;"
               src="/dreamjourney/resources/img/reservation/train.png" alt="123">
               <div style="width: 100%;">
                  <div class="text-center">
                     <h5 class="m-1">
                        <span class="text">${result.departure}</span> <span class="text">>></span>
                        <span class="text">${result.destination}</span>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="text2">운영
                           시간 : ${result.runtime}분</span> <span class="text2">정원 :
                           ${result.limit}</span> <span class="text2">가격 : ${result.price}</span>
                     </h5>
                  </div>
               </div>
               <div class="col-md-2">
                  <form action="/dreamjourney/reservation/train_detail" method="GET">
                     <input type="hidden" name="tran_seq" value="${result.tran_seq}">
                     <button class="btn btn-primary btn-block" type="submit"
                        style="height: 47px; margin-top: -2px;">예약</button>
                  </form>
               </div>
            </a>
         </div>
      </c:forEach>
</c:if>
<c:if test="${empty trainResult && train!=null}">
    <!-- 검색 결과가 없는 경우 -->
    <h5 style="margin-bottom:30px; text-align:center;">검색 결과가 없습니다.</h5>
</c:if>
   </div>


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
<footer>
   <%@ include file="/resources/inc/footer.jsp"%>
</footer>
</html>



