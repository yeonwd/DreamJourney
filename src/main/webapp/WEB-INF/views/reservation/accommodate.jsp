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

<!-- Google Icon -->
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<style>
.categoryAll {
   display: flex;
   width: 100%;
   justify-content: center;
}

.category {
   display: flex;
   /* border: 1px solid black; */
   padding: 20px;
   margin: 0 10px;
}

.categoryname {
   font-weight: bold;
   font-size: 25px;
   /*       margin: 0px 0px 15px 0px; */
   margin: 10px;
}

.sub {
   font-weight: bold;
}

.p1-4, .px-4, .p-4 {
   padding-left: none;
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
   text-decoration: none;
}

.row {
   justify-content: center;
}

.team-img {
   width: 255px;
   height: 210px;
}
</style>
<body>
   <!-- accommodate.jsp > 액티비티 페이지 -->

   <!-- http://localhost/dreamjourney/reservation/accommodate -->

<%@ include file="/resources/inc/header.jsp"%>

   <!-- 제목 쓰는곳 -->
   <div class="container-fluid page-header">
      <div class="container">
         <div
            class="d-flex flex-column align-items-center justify-content-center"
            style="min-height: 400px">
            <h3 class="display-4 text-white text-uppercase">숙소</h3>

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
                  <div class="row">
                     <div class="col-md-4">
                        <div class="mb-3 mb-md-0">
                           <span class="sub">여행지</span> <input type="text"
                              class="form-control  px-4" style="height: 47px;"
                              placeholder="어디로 떠나시나요?">
                        </div>
                     </div>
                     <div class="col-md-3">
                        <div class="mb-3 mb-md-0">
                           <span class="sub">체크인</span>
                           <div class="date" id="date1" data-target-input="nearest">
                              <input type="text"
                                 class="form-control p-4 datetimepicker-input"
                                 placeholder="체크인" data-target="#date1"
                                 data-toggle="datetimepicker" />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-3">
                        <div class="mb-3 mb-md-0">
                           <span class="sub">체크아웃</span>
                           <div class="date" id="date2" data-target-input="nearest">
                              <input type="text"
                                 class="form-control p-4 datetimepicker-input"
                                 placeholder="체크아웃" data-target="#date2"
                                 data-toggle="datetimepicker" />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="mb-3 mb-md-0">
                           <span class="sub">숙박인원</span> <input class="form-control  px-4"
                              type="text" style="height: 47px;" placeholder="인원 수">
                           </input>
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


   <!-- 카테고리 버튼 -->
   <div class="categoryAll">
   <a class="d-flex align-items-center text-decoration-none bg-white mb-3">
      <div class="categoryname">지역별 인기숙소 보기</div>
      </a>
      <a class="d-flex align-items-center text-decoration-none bg-white mb-3" href="">
       <div class="category">서울</div>
      </a>
      <a class="d-flex align-items-center text-decoration-none bg-white mb-3" href="">
      <div class="category">제주</div>
      </a>
      <a class="d-flex align-items-center text-decoration-none bg-white mb-3" href="">
      <div class="category">강릉</div>
      </a>
      <a class="d-flex align-items-center text-decoration-none bg-white mb-3" href="">
      <div class="category">부산</div>
      </a>
      <a class="d-flex align-items-center text-decoration-none bg-white mb-3" href="">
      <div class="category">속초</div>
      </a>
      <a class="d-flex align-items-center text-decoration-none bg-white mb-3" href="">
      <div class="category">경주</div>
      </a>
      <a class="d-flex align-items-center text-decoration-none bg-white mb-3" href="">
      <div class="category">그 외 다른 지역</div>
      </a>


   </div>




   <!-- 내용쓰는곳 -->

   <!-- Blog Start -->
   <div class="container-fluid py-5">
      <div class="container py-5">
         <div class="row">
            <div class="col-lg-8">
               <div class="row pb-3">
                  <c:forEach items="${list}" var="dto">
                     <div class="col-md-6 mb-4 pb-2" >
                        <div class="blog-item">
                           <div class="position-relative">

                              <img class="img-fluid w-100" src="/dreamjourney/resources/img/accommodate/${dto.acco_img}.jpg">

                              <%-- <c:forEach items="${imagePaths}" var="i">
                                 <img class="img-fluid w-100" src="${imagePath}" />
                              </c:forEach>  DB에 넣어보기--%>

                              <div class="blog-date">
                                 <h6 class="font-weight-bold mb-n1">최저가</h6>
                              </div>
                           </div>
                           <div class="bg-white p-4">
                              <div class="d-flex mb-2">
                                 <span class="text-primary px-2">|</span> <a
                                    class="text-primary text-uppercase text-decoration-none"
                                    href="/dreamjourney/reservation/accommodate_detail?acco_seq=${dto.acco_seq}">${dto.type}</a> <span class="text-primary px-2">|</span>
                              </div>
                              <a class="h5 m-0 text-decoration-none" href="/dreamjourney/reservation/accommodate_detail?acco_seq=${dto.acco_seq}">${dto.name}</a>
                              <a class="text-primary text-uppercase text-decoration-none"
                                 href="/dreamjourney/reservation/accommodate_detail?acco_seq=${dto.acco_seq}"><br>${dto.address}</a>
                           </div>
                        </div>
                     </div>
                  </c:forEach>
<c:if test="${not empty accResult}">
    <!-- 검색 결과가 있는 경우 -->
    <c:forEach items="${accResult}" var="result">
<div class="col-md-6 mb-4 pb-2" >
                        <div class="blog-item">
                           <div class="position-relative">

                              <img class="img-fluid w-100" src="/dreamjourney/resources/img/accommodate/${result.acco_img}.jpg">
                              <div class="blog-date">
                                 <h6 class="font-weight-bold mb-n1">최저가</h6>
                              </div>
                           </div>
                           <div class="bg-white p-4">
                              <div class="d-flex mb-2">
                                 <span class="text-primary px-2">|</span> <a
                                    class="text-primary text-uppercase text-decoration-none"
                                    href="/dreamjourney/reservation/accommodate_detail?acco_seq=${result.acco_seq}">${result.type}</a> <span class="text-primary px-2">|</span>
                              </div>
                              <a class="h5 m-0 text-decoration-none" href="/dreamjourney/reservation/accommodate_detail?acco_seq=${result.acco_seq}">${result.name}</a>
                              <a class="text-primary text-uppercase text-decoration-none"
                                 href="/dreamjourney/reservation/accommodate_detail?acco_seq=${result.acco_seq}"><br>${dto.result}</a>
                           </div>
                        </div>
                     </div>     
    </c:forEach>
</c:if>
<c:if test="${empty accResult && accommodate!=null}">
    <!-- 검색 결과가 없는 경우 -->
    <h5 style="margin-bottom:30px;">검색 결과가 없습니다.</h5>
</c:if>
                  <div class="col-12">
                     <nav aria-label="Page navigation">
                        <ul
                           class="pagination pagination-lg justify-content-center bg-white mb-0"
                           style="padding: 30px;">
                           <li class="page-item disabled"><a class="page-link"
                              href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                 <span class="sr-only">Previous</span>
                           </a></li>
                           <li class="page-item active"><a class="page-link" href="#">1</a></li>
                           <li class="page-item"><a class="page-link" href="#">2</a></li>
                           <li class="page-item"><a class="page-link" href="#">3</a></li>
                           <li class="page-item"><a class="page-link" href="#"
                              aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                 <span class="sr-only">Next</span>
                           </a></li>
                        </ul>
                     </nav>
                  </div>
               </div>
            </div>

            <div class="col-lg-4 mt-5 mt-lg-0">

               <!-- Best Post -->
               <div class="mb-5">
                  <h4 class="text-uppercase mb-4" style="letter-spacing: 5px;">Best
                     </h4>
                  <a
                     class="d-flex align-items-center text-decoration-none bg-white mb-3"
                     href=""> <!-- <img class="img-fluid" src="img/blog-100x100.jpg"
                     alt=""> -->
                     <div class="pl-3">
                        <h6 class="m-1">시그니엘 부산</h6>
                        <small>부산 해운대구 달맞이길 30</small>
                     </div>
                  </a> <a
                     class="d-flex align-items-center text-decoration-none bg-white mb-3"
                     href=""> <!-- <img class="img-fluid" src="img/blog-100x100.jpg"
                     alt=""> -->
                     <div class="pl-3">
                        <h6 class="m-1">제주 미소 게스트하우스</h6>
                        <small>제주특별자치도 제주시 관덕로 41 (일도1동)</small>
                     </div>
                  </a> <a
                     class="d-flex align-items-center text-decoration-none bg-white mb-3"
                     href=""> <!-- <img class="img-fluid" src="img/blog-100x100.jpg"
                     alt=""> -->
                     <div class="pl-3">
                        <h6 class="m-1">메리어트 호텔</h6>
                        <small>대구 동구 동부로 26길 6</small>
                     </div>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Blog End -->






   <!-- 내용 작성 -->
   <div class="container-fluid py-5" style="height: 100px;"></div>



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


   <script>
      /* API 시도 흔적 */
      /*  let result = ${result};
       
       let temp = '';
       
       $(result.response.body.items).each((index, item) => {
          
          //console.log(item.romsNm);
          temp += `
             <div></div>          
             <div class="col-md-6 mb-4 pb-2">
               <div class="blog-item">
                   <div class="position-relative">
                       <img class="img-fluid w-100" src="img/blog-1.jpg" alt="">
                       <div class="blog-date">
                           <h6 class="font-weight-bold mb-n1">01</h6>
                           <small class="text-white text-uppercase">Jan</small>
                       </div>
                   </div>
                   <div class="bg-white p-4">
                       <div class="d-flex mb-2">
                           <a class="text-primary text-uppercase text-decoration-none" href="">\${item.romsNm}</a>
                           <span class="text-primary px-2">|</span>
                           <a class="text-primary text-uppercase text-decoration-none" href="">Tours & Travel</a>
                       </div>
                       <a class="h5 m-0 text-decoration-none" href="">Dolor justo sea kasd lorem clita justo diam amet</a>
                   </div>
               </div>
           </div>
          `;
          
       });
       
       $('.row.pb-3').html(temp); */
   </script>
</body>
<footer>
   <%@ include file="/resources/inc/footer.jsp"%>
</footer>
</html>




