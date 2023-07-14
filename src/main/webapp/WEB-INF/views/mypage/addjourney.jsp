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

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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

.journey-table {
	margin: 30px;
	width: 100%;
}

input {
	border: none;
	width: 70%;
}

button {
	border: none;
}

.btn-search {
	background-color: #5392F9;
	color: white;
	border-radius: 20px;
}

.btn-add {
	border: 1px solid #CCCCCC;
	border-radius: 20px;
}

#btn-submit {
	background-color: #5392F9;
	color: white;
	border-radius: 20px;
}

#btn-cancel {
	background-color: #CED4DA;
	color: white;
	border-radius: 20px;
}

.clickable {
	cursor: pointer;
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



			<table class="journey-table">

				<tr>
					<td colspan="2"><input id="title" type="text"
						placeholder="여행 제목"></td>
				</tr>


				<!-- 여행 날짜 지정 -->
				<tr>
				    <td id="trip-begin">여행 시작일<span id="journey-begin" class="clickable material-symbols-outlined">calendar_month</span></td>
				    <td id="trip-end" style="display: none;">여행 종료일<span id="journey-end" class="clickable material-symbols-outlined">calendar_month</span></td>
				</tr>

				<!-- 지도 영역 -->
				<tr>
					<td colspan="2"><p style="margin-top: -12px"></p>
						<div id="map" style="width: 80%; height: 350px;"></div></td>
				</tr>
			</table>

			<div id="new-tables">

			</div>

			<div id="buttons-container">
				<table id="buttons">
					<tr>
						<td colspan="2">
							<button id="btn-submit" type="button">등록하기</button>
							<button id="btn-cancel">취소하기</button>
						</td>
					</tr>
				</table>
			</div>


		</div>
	</div>

	<%@ include file="/resources/inc/footer.jsp"%>




	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=015fae8b95c2d0f2c4d727e44d11a138&libraries=services"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>

	<script>
	
	
// 지도 관련 코드

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

mapOption = {
	center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	level : 3
// 지도의 확대 레벨
};

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커와 선을 담을 배열
var markers = [];
var lines = [];

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

function createMarkerAndLine(position, title) {
 		var marker = new kakao.maps.Marker({
    	position: position,
    	map: map
});
	 	
var linePath = [position];
		
// 이전 마커가 있을 경우 이전 마커와 현재 마커 사이에 선을 생성합니다
if (markers.length > 0) {
	    var prevMarker = markers[markers.length - 1];
	    var prevPosition = prevMarker.getPosition();
	    linePath.unshift(prevPosition);

	    var line = new kakao.maps.Polyline({
	      path: linePath,
	      strokeWeight: 3,
	      strokeColor: '#ff0000',
	      strokeOpacity: 0.7,
	      strokeStyle: 'solid'
	    });

	    line.setMap(map);
	    lines.push(line);
	  }

	  markers.push(marker);
}


//클릭 이벤트로 map팝업을 열어서 장소 선택
function openPopup(button) {
	window.open("mapmap.do", "Map Popup", "width=800,height=500");

	// 클릭한 값을 가져온다.
	window.clickedButton = button;
}

function receiveValues(placeName, address) {
	var placeInput = window.clickedButton.parentElement.getElementsByClassName('placeInput')[0];
	placeInput.value = placeName + '_' + address;
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	    if (status === kakao.maps.services.Status.OK) {
	      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	      // 결과값으로 받은 위치를 마커로 표시합니다
	      var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });

	    createMarkerAndLine(coords, placeName);
	      
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">' + placeName + '</div>'
	    });
	    infowindow.open(map, marker);

	      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	      map.setCenter(coords);
	    }
	  });
}
		
		
		// '+' 버튼 클릭 시 새 열 삽입
		
		function addTableRow() {
			
			  var currentRow = $(this).closest('tr'); // Find the closest parent row
			  var newPlaceRow = $('<tr class="place-tr">');
			  
			  var newPlaceRowContent = `
			    <td>
			      <input type="text" class="placeInput" placeholder="장소 추가">
			      <button type="button" class="btn-search" onclick="openPopup(this)">
			        검색<span class="material-symbols-outlined"> search </span>
			      </button>
			    </td>
			    <td>
			      <input type="text" class="memoInput" placeholder="메모 추가">
			      <button type="button" class="btn-add" onclick="addTableRow()">
			        <span class="material-symbols-outlined">add</span>
			      </button>
			    </td>
			  `;
			  newPlaceRow.html(newPlaceRowContent);

			  // 현재 열 아래에 새 열 삽입
			  currentRow.after(newPlaceRow);
			}

			$(document).ready(function() {
			  // Delegate the click event to dynamically generated "Add" buttons
			  $(document).on('click', '.btn-add', addTableRow);

			  
			});
			
			
			
			var startdate;
			var enddate;
			
			
				
				// 여행 시작 날짜 클릭 이벤트
				$('#journey-begin').one('click', function() {
				    $(this).datepicker({
				      format: 'yyyy-mm-dd',
				      language: "ko",
				      autoclose: true
				    }).on('changeDate', function(e) {
				      var selectedDate = e.format('yyyy-mm-dd');
				      startdate = new Date(selectedDate);
				
				    
				    $('.date-td:eq(0) .selected-date').text(selectedDate); // 첫 번째 선택된 날짜를 업데이트하여 출력
				    createTable(1, selectedDate); // selectedDate를 "yyyy-mm-dd" 형식으로 전달
				
				    
				    $('#trip-end').css('display', '');
				    
				    $('#journey-begin').off('click');
				    
				  // 등록하기 버튼 있는 테이블 보여주기
				  }).focus(function() {
				    $(this).blur();
				  });
				
				  // 캘린더가 다른 요소들을 밀어내는 것을 방지
				  $(".datepicker").css("position", "absolute");
				
				  // 캘린더 외부를 클릭하면 캘린더를 닫음
				  $(document).on("mousedown", function(event) {
				    if (!$(event.target).closest(".datepicker").length && !$(event.target).is("#journey-start")) {
				      $("#journey-start").datepicker("hide");
				    }
				  });
				});

			
			
				// 여행 종료 날짜 클릭 이벤트

				$('#journey-end').one('click', function() {
				    $(this).datepicker({
				      format: 'yyyy-mm-dd',
				      language: "ko",
				      autoclose: true
				    }).on('changeDate', function(e) {
				      var selectedDate = e.format('yyyy-mm-dd');
				      enddate = new Date(selectedDate);
				     	calculateDate();
				     	
				     	$('#journey-end').off('click');
				    }).focus(function() {
				      $(this).blur();
				    });

				    // 캘린더가 다른 요소들을 밀어내는 것 방지
				    $(".datepicker").css("position", "absolute");

				    // 캘린더 외부를 클릭하면 캘린더를 닫음
				    $(document).on("mousedown", function(event) {
				      if (!$(event.target).closest(".datepicker").length && !$(event.target).is("#journey-start")) {
				        $("#journey-start").datepicker("hide");
				      }
				    });
				  });
			
			
				  
				
				function calculateDate() {
					  console.log(startdate + " ^^ " + enddate);

					  // Calculate the difference in milliseconds between the two dates
					  var timeDiff = Math.abs(enddate.getTime() - startdate.getTime());

					  // Convert the time difference to days
					  var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));

					  for (var i = 2; i <= diffDays + 1; i++) {
					    var nextdate = new Date(startdate);
					    nextdate.setDate(startdate.getDate() + (i - 1));

					    var year = nextdate.getFullYear();
					    var month = (nextdate.getMonth() + 1).toString().padStart(2, '0');
					    var day = nextdate.getDate().toString().padStart(2, '0');
					    var formattedDate = year + '-' + month + '-' + day;

					    createTable(i, formattedDate);
					  }
					};

				
			
					function createTable(nth, date) {
						  var newTable = $('<table class="journey-table my-table">');

						  // Add the table content
						  var tableContent = '<tr>' +
						    '<td class="date-td">' +
						    '<div><b>DAY ' + nth + '</b></div>' +
						    '<div class="selected-date">' + date + '</div>' +
						    '</td>' +
						    '<td></td>' +
						    '</tr>' +
						    '<tr>' +
						    '<td>' +
						    '<input type="text" class="placeInput" placeholder="장소 추가">' +
						    '<button type="button" class="btn-search" onclick="openPopup(this)">' +
						    '검색<span class="material-symbols-outlined"> search </span>' +
						    '</button>' +
						    '</td>' +
						    '<td>' +
						    '<input type="text" class="memoInput" placeholder="메모 추가">' +
						    '<button type="button" class="btn-add" onclick="addTableRow()">' +
						    '<span class="material-symbols-outlined">add</span>' +
						    '</button>' +
						    '</td>' +
						    '</tr>';

						  newTable.html(tableContent);

						  // Append the new table to the #new-tables div
						  $('#new-tables').append(newTable);
						}



				 

		
		
		

		$(document).ready(function() {

			$('#btn-submit').click(function() {
				
				var placeInputs = $('.placeInput'); // Get all placeInput fields
				var memoInputs = $('.memoInput');
				var title = $('#title').val();
				
				var placeInputValues = []; // Array to store the values
				var memoInputValues = [];
				var firstDivValues = []; // 배열 선언
				

				$('.date-td').each(function() {
				    var firstDivValue = $(this).find('div:first').text(); // 각 요소의 첫 번째 div 값 가져오기
				    firstDivValues.push(firstDivValue); // 배열에 추가
				});

				placeInputs.each(function() {
					placeInputValues.push($(this).val()); // Add the value to the array
					console.log($(this).val());
				});

				memoInputs.each(function() {
					  var memoValue = $(this).val(); // memoInput 필드의 값을 가져옴
					  var firstDivValue = $(this).closest('.journey-table').find('.date-td div:first').text();
					  var combinedValue = memoValue + '_' + firstDivValue;
					  memoInputValues.push(combinedValue); // 값을 배열에 추가
					  console.log(combinedValue);
					});
				
				

				console.log(placeInputValues);
				console.log(memoInputValues);

				// Send the data to the server
				$.ajax({
					type : "POST",
					url : "/dreamjourney/mypage/addjourneyok",
					traditional : true,
					data : {
						placeInputValues : placeInputValues,
						memoInputValues : memoInputValues,
						title : title,
						nthValues: firstDivValues,
						startdate: startdate,
						enddate: enddate
					},
					success : function(response) {
						console.log(response);
						// Handle the success response here
						window.location.href = "/dreamjourney/mypage/journey";
					},
					error : function(error) {
						console.log(error);
						// Handle the error response here
					},
					complete : function() {
						// This block will be executed regardless of success or error
					}
				});
			});
		});


	</script>


</body>

</html>






