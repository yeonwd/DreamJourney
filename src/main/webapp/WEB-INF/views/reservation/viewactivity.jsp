<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 천단위 콤마 라이브러리 -->
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>DreamJourney > 예약/예매 > 액티비티 > 상세보기</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- datePicker -->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- Favicon -->
<link href="../asset/img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
   href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
   rel="stylesheet">

<!-- Font Awesome -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"   rel="stylesheet">

<!-- Libraries Stylesheet -->
<link   href="/dreamjourney/resources/lib/owlcarousel/assets/owl.carousel.min.css"
   rel="stylesheet">
<link   href="/dreamjourney/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
   rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="/dreamjourney/resources/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- Google Icon -->
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />



</head>
<style>
html{
   scroll-behavior: smooth;
}

/* body {
   padding-bottom: 50px;
}
 */
.img-container {
   max-height: 500px;
   overflow: hidden;
}

#showbtn {
   width: 300px;
   height: 60px;
   background-color: white;
   border: 1px solid #AAA;
   margin: 20px auto;
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

#addReview {
   border: 1px solid #AAA;
   width: 100%;
   height: 50px;
   margin-bottom: 40px;
   text-align: center;
}

#comment {
   width: 100%;
   margin: 30px auto;
   padding: 100px;
}

.comment {
   background-color: #DFDFDF;
   font-weight: bold;
   border: none;
   height: 40px;
   width: 100px;
   border-radius: 10%;
   
}

#regicom {
   width: 150px;
   padding: auto 10px;
}

#eotrmf {
   width: 100px;
   font-weight: bold;
   background-color: #DDD;
   border-right: 1px solid #AAA;
}

.full {
   float: left;
   width: 90%;
   height: 40px;
   margin: 10px;
   border: 1px solid #AAA;
   padding-left: 10px;
   outline: none;
}


.img {
   width: 800px;
}

footer {
   margin: 0;
   width: 100%:
}

#bookmark {
   width: 150px; 
}

#star:hover {
   text-decoration:none;
   
}

.select{
    letter-spacing: -.2px;
    font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,맑은 고딕,Roboto,Helvetica,Arial,sans-serif;
    box-sizing: border-box;
    outline: none;
    cursor: pointer;
    touch-action: manipulation;
    background-color: #FFF;
    background-position: left 14px top 16px;
    background-repeat: no-repeat;
    background-size: 16px 16px;
    border-radius: 4px;
    color: #343a40;
    display: inline-block;
    font-size: 18px;
    font-weight: 500;
    height: 48px;
    line-height: 1;
    overflow: hidden;
    text-align: center;
    text-overflow: ellipsis;
    transition: all .1s ease-out;
    vertical-align: middle;
    white-space: nowrap;
    width: 200px;
    padding: 16px 14px;
    border: 1px solid #DDD;
    }
    
    .select:hover {
       cursor:pointer;
       outline: 1px solid #AAA;
       box-shadow: 1px 1px 20px #ddd;
    }
    
    .selectors{
    color: #373a3c;
    font-size: 10px;
    letter-spacing: -.2px;
    font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,맑은 고딕,Roboto,Helvetica,Arial,sans-serif;
    line-height: 1.5;
    box-sizing: border-box;
    outline: none;
    border-radius: 4px;
    margin: 15px 8px 15px 0px;
    position: relative;
    width: 100%;
    display: inline-block;
    }
    
    .btn1 {
    letter-spacing: -.2px;
    font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,맑은 고딕,Roboto,Helvetica,Arial,sans-serif;
    box-sizing: border-box;
    outline: none;
    background-color: #7AB730;
    background-position: left 14px top 16px;
    background-repeat: no-repeat;
    background-size: 16px 16px;
    border-radius: 4px;
    color: #FFF;
    display: inline-block;
    font-size: 20px;
    font-weight: bold;
    height: 48px;
    line-height: 1;
    text-align: center;
    text-overflow: ellipsis;
    transition: all .1s ease-out;
    vertical-align: middle;
    white-space: nowrap;
    width: 80px;
    padding: 13px 14px;
    border: 1px solid #DDD;
    pointer-events: none;
    margin-right: 5px;
    }
    

</style>
<body>
   <%@ include file="/resources/inc/header.jsp"%>
   <!-- 본문 -->
<div style="display:flex;justify-content: center;">
      <form method="POST" action="/dreamjourney/reservation/pay" id="form">
   <div style="margin-top: 100px; margin-bottom:100px;">
         <div style="width: 780px; margin-right: 20px;">
            <div style="text-align: center;">
               <h1>[${address}] ${adetail.title }</h1>
            </div>
            <div style="text-align: right;">
            </div>
            <hr>
            <div style="font-weight: bold;">
            <img style='width: 20px;' src='/dreamjourney/resources/img/reservation/평점.png'>
            <img style='width: 20px;' src='/dreamjourney/resources/img/reservation/평점.png'>
            <img style='width: 20px;' src='/dreamjourney/resources/img/reservation/평점.png'>
            <img style='width: 20px;' src='/dreamjourney/resources/img/reservation/평점.png'>
            <img style='width: 20px;' src='/dreamjourney/resources/img/reservation/평점.png'>
             <c:if test="${!empty avgScore }">
             ${avgScore }
             </c:if>
             <c:if test="${empty avgScore }">
             0
             </c:if>
            <a href="#review" id="star" style="margin-left: 10px;">후기(${reviewCount }) > </a>
            <div id="price" style="float: right;">
                  ${adetail.category }
               </div>
            </div>
            <hr>
            <div class="img-container">
               <img class="img" src="/dreamjourney/resources/img/reservation/${adetail.image1 }" alt="">
               <img class="img" src="/dreamjourney/resources/img/reservation/${adetail.image2 }" alt="">
               <img class="img" src="/dreamjourney/resources/img/reservation/${adetail.image3 }" alt="">
               <div style="margin: 20px;">${adetail.content }</div>
            </div>
            <button id="showbtn" type="button">상품 설명 더 보기 <span class="material-symbols-outlined">stat_minus_2</span></button>
            <hr>
         <h3>옵션 선택</h3>
         <div class="selectors">
               <span class="btn1 btn-primary">날짜</span> <input type="text" name="dates" id="datepicker" class="select" style="margin-right: 20px; width: 300px;" placeholder="날짜를 선택해주세요";>
            <span class="btn1 btn-primary">인원</span> <input type="number" id="numberInput" class="select" min="1" max="${adetail.limit }" oninput="displayNumber()" name="totalPeople" style="text-align: center;">
            </div>
            <hr>
            <h3>위치 안내</h3>
            <div id="map" style="width: 780px; height: 400px; margin: 30px auto;"></div>
            <div style="text-align: center; border: 1px solid #DDD; background-color: #DDD; height: 55px;  margin: 30px 0; padding: 10px;"><span class="material-symbols-outlined">location_on</span> ${adetail.address }</div>
            <hr>
            <div id="review">
               <span style="font-weight: bold;">리뷰 (${reviewCount})</span>
               <hr>
               <c:forEach items="${review }" var="rdto">
                  <div style="padding: 0 5px; font-weight: bold;">${rdto.nickname }
                  <span class="score">${rdto.score }</span> <small style="float:right; padding-right: 10px;">${rdto.rdate }</small></div>
                  <div style="padding: 5px;">${rdto.content }</div>
                  <hr>
               </c:forEach>
            </div>

         </div>
</div>
<!-- 티켓 -->
         <div id="myDiv"
            style="border: 1px solid #DDD; background-color: #FFF;display: inline-block; width: 300px; padding: 20px; text-align: center; margin: 0 10px; position: absolute; top:500px; left:75%;">
            
            <div style="font-weight: bold; margin-bottom: 10px; font-size: 25px; color: black;">
               총 가격 <span id="totalPrice" name="totalPrice"><fmt:formatNumber value="${adetail.price }" pattern="#,###" /></span>원
            </div>
            <div>
               (
               <fmt:formatNumber value="${adetail.price }" pattern="#,###" />
               원 * <span id="numberDisplay">1 명</span>)
            </div>
            <br>
            
            <div>
               <button type="submit" class="btn btn-primary reservation" style="width: 200px; font-weight: bold; margin: 5px 30px;" onclick="/dreamjourney/reservation/pay?activity_seq=${adetail.activity_seq}">예약하기</button>
			   <button type="button" class="btn btn-secondary" style="width: 200px; color: #656565; font-weight: bold; margin: 5px 30px; border: 1px solid #7AB730;" id="bookmark" name="bookmark""><i class="bi bi-star"></i> 즐겨찾기 추가</button>
               <input type="hidden" value="${adetail.activity_seq }" name="activity_seq">
               
            </div>
            
         </div>
         <input type="hidden" name="totalPrice"> 
         <input type="hidden" name="totalPeople"> 
      </form>
   </div>





   <!-- services와 clusterer, drawing 라이브러리 불러오기 -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=399d3a29656e06f5e50372ac6e9c718a&libraries=services,clusterer,drawing"></script>
   <!-- 카카오맵.api -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=399d3a29656e06f5e50372ac6e9c718a"></script>
   
<%@ include file="/resources/inc/footer.jsp"%>
</body>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

   /* 즐겨찾기 */
   $('#bookmark').click(function() {
      $.ajax({
         url: "/dreamjourney/reservation/viewactivity",      
         type: "POST",
         dataType: "json",
         data: {
            activity_seq : "${adetail.activity_seq}"
         },
         success: function(result) {
               console.log('성공');
            },
         error: function(a, b, c) {
            console.log(a, b, c);
         }
      });
   });
   
   /* 리뷰 */
   $(document).ready(function() {
        $('.score').each(function() {   //each로 각각의 score마다 이벤트 설정해야 함
          var score = $(this).text();
          $(this).empty();               //기존 값은 숨기기
          for (var i = 1; i <= score; i++) {
            $(this).append("<img style='width: 20px;' src='/dreamjourney/resources/img/reservation/평점.png'>");
          }
        });
      });


   /* 캘린더 */
  $('#datepicker').datepicker({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년',
    minDate: 0,
    beforeShowDay: disableSomeDay
  });
   //선택 가능 날짜
   var disabledDays = ${cal};
   
   //날짜 나타내기 전에 (beforeShowDay) 실행할 함수
   function disableSomeDay(date) {
      
      var month = date.getMonth() + 1;
      var dates = date.getDate();
      var year = date.getFullYear();
      
      //배열에 해당하는 날짜는 0번째 index에 true를 담아 리턴해준다.
      for (i=0; i<disabledDays.length; i++) {
         let temp = disabledDays[i].split('-');
         if (year == parseInt(temp[0]) && month == parseInt(temp[1]) && dates == parseInt(temp[2])) {
            return [true];
         }
      }
      //해당하지 않는 날짜는 활성화
      return [false];
   }

   
   document.querySelector("input[name=totalPrice]").value = ${adetail.price};
   document.querySelector("input[name=totalPeople]").value = 1;

   /* 인원 수 */
   function displayNumber() {
      var input = document.getElementById("numberInput");
      var display = document.getElementById("numberDisplay");

      var number = event.target.value;
      display.textContent = number + "명";

      /* 총 가격 */
      var price = ${adetail.price};
      var totalPrice = price * number;
      
      document.getElementById("totalPrice").innerText = totalPrice.toLocaleString();
      
      document.querySelector("input[name=totalPrice]").value = totalPrice;
      document.querySelector("input[name=totalPeople]").value = number;
   }

   /* Kakao Maps API & 지오코딩 */
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

   // 지도를 생성합니다    
   var map = new kakao.maps.Map(mapContainer, mapOption); 

   // 주소-좌표 변환 객체를 생성합니다
   var geocoder = new kakao.maps.services.Geocoder();

   // 주소로 좌표를 검색합니다
   geocoder.addressSearch("${adetail.address }", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">"${adetail.title}"</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});  
   
   /* 이미지 더보기 */
   $(document).ready(function() {
      
      var container = $('.img-container');
      var button = $('#showbtn');
      
      button.click(function() {
         container.css('max-height', 'none');   //최대 높이 해제
         button.hide();
      });
   });
   
   

   /* 버튼 활성화 */
   $(document).ready(function() {
      $('.reservation').prop('disabled', true);

      $('#datepicker').change(function() {
         var checked = true; //인풋 상태 확인 전에 초기화
         if ($(this).val() == 0) { //체크박스가 체크 안된게 있으면
            checked = false;
            return false; //반복문 종료
         }
      if(checked) {      //모두 체크됐으면
         $('.reservation').prop('disabled', false);   //버튼 활성화
      } else {
         $('.reservation').prop('disabled', true);
      }
      });
   });
   

   window.addEventListener("scroll", function() {
      var myDiv = document.getElementById("myDiv");
      var scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
      var targetPosition = 1000; // 고정할 스크롤 위치

      if (scrollPosition >= targetPosition) {
        myDiv.style.position = "fixed";
        myDiv.style.top = targetPosition + "px";
      } else {
        myDiv.style.position = "absolute";
        myDiv.style.top = (500 + scrollPosition) + "px";
      }
    });
   
</script>
</html>

