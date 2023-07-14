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
	padding: 50px;
}

#content {
	width: auto;
}

#journey {
	width: 800px;
	margin-right: 20px;
	margin-left: 20px;
}

#visited>div {
	display: flex;
	justify-content: space-evenly;
}

#order {
	display: inline-block;
	background-color: #7487E9;
	color: white;
	border-radius: 20px;
	width: 20px;
	height: 20px;
	text-align: center;
}

#category {
	font-size: 10px;
}

#info-table {
	width: 80%;
	padding: 10px;
}

#info-table td {
	padding-bottom: 10px;
}

.day-buttons {
	background-color: #7C9070;
	color: white;
	border-radius: 20px;
	border: none;
}

#schedule-table-container {
	margin-top: 10px;
}

.schedule-table {
	width: 80%;
	padding: 10px;
}

.schedule-table td {
	padding-bottom: 10px;
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

			<table id="info-table">
				<colgroup>
					<col width="30%">
					<col width="40%">
					<col width="30%">
				</colgroup>
				<tr>
					<td colspan="2">
						<h4>${dto.title}
							<c:if test="${dto.is_shared=='n'}">
								<span class="material-symbols-outlined"> lock </span>
							</c:if>
							<c:if test="${dto.is_shared=='y'}">
								<span class="material-symbols-outlined"> lock_open </span>
							</c:if>
						</h4>
					</td>
					<td style="text-align: right;">작성일: ${dto.regdate}</td>
				</tr>
				<tr>
					<td colspan="2">여행 기간: ${dto.begin} ~ ${dto.end}</td>
					<td style="text-align: right;"><c:if
							test="${dto.is_shared=='y'}">
							<span class="material-symbols-outlined"> recommend </span> ${dto.recommend}
						</c:if></td>
				</tr>
				<tr>
					<td colspan="3">
						<div id="map" style="width: 100%; height: 350px;"></div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div id="day-buttons"></div>
					</td>
				</tr>
			</table>

			<div id="schedule-table-container"></div>

		</div>
	</div>



	<!-- Blog End -->
	<%@ include file="/resources/inc/footer.jsp"%>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=015fae8b95c2d0f2c4d727e44d11a138&libraries=services"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.9.0/dist/js/bootstrap-datepicker.min.js"></script>

	<script>
	
  $(document).ready(function () {
    (async function () {
      try {
        const tripseq = ${dto.trip_seq};
        const response = await $.ajax({
          url: 'getdaybuttons',
          type: 'GET',
          data: {
            seq: tripseq
          }
        });

        createButtons(tripseq, response);
        await new Promise(resolve => setTimeout(resolve, 300));
        $('#day-buttons > button:nth-child(1)').click();
      } catch (error) {
        console.log(error);
      }
    })();
  });

  var mapContainer = document.getElementById('map');
  var mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),
    level: 3
  };

  var map = new kakao.maps.Map(mapContainer, mapOption);

  var markers = [];
  var lines = [];

  function clearMarkers() {
	  
	  console.log('clear');
	  
	  for (var i = 0; i < markers.length; i++) {
	    markers[i].setMap(null);
	  }
	  markers = [];

	  for (var i = 0; i < lines.length; i++) {
	    lines[i].setMap(null);
	  }
	  lines = [];
	  
	  
	   mapContainer = document.getElementById('map');
	   mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667),
	    level: 3
	  };

	   map = new kakao.maps.Map(mapContainer, mapOption);
  }


  function createButtons(seq, days) {
    var place = $('#day-buttons');
    var previousButton = null;

    for (var i = 1; i <= days; i++) {
      (function (day) {
        var button = $('<button class="day-buttons" style="margin-right: 10px;">').text('Day ' + day);
        place.append(button);

        button.click(function () {
          if (previousButton) {
            previousButton.css('background-color', '#7C9070');
          }

          button.css('background-color', '#41644A');
          previousButton = button;
          
          //clearMarkers();

          (async function () {
            try {
              const response = await $.ajax({
                url: 'getschedule',
                type: 'GET',
                data: {
                  seq: seq,
                  day: day
                }
              });

              getScheduleTable(day, response);
            } catch (error) {
              console.log(error);
            }
          })();
        });
      })(i);
    }
  }

  var begindate = new Date('${dto.begin}');

  function getScheduleTable(day, response) {
    clearMarkers();
    
    console.log(markers.length);

    var container = $('#schedule-table-container');
    container.empty();

    var table = $('<table class="schedule-table">');

    var colgroup = $('<colgroup>');
    colgroup.append('<col width="20%">');
    colgroup.append('<col width="40%">');
    colgroup.append('<col width="40%">');
    table.append(colgroup);

    var tbody = $('<tbody>');

    var dayNumber = parseInt(day, 10);
    var date = new Date(begindate.getTime() + (dayNumber - 1) * 24 * 60 * 60 * 1000);
    var formattedDate = date.toISOString().substring(0, 10);

    var firstRow = $('<tr>');
    var dateCell = $('<td colspan="3">').text(formattedDate);
    firstRow.append(dateCell);
    tbody.append(firstRow);


    var geocoder = new kakao.maps.services.Geocoder();

    function geocodeAddress(address, place) {
      return new Promise((resolve, reject) => {
        geocoder.addressSearch(address, function (result, status) {
          if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            var marker = new kakao.maps.Marker({
              map: map,
              position: coords
            });

            createMarkerAndLine(coords, place);

            var infowindow = new kakao.maps.InfoWindow({
              content: '<div style="width:150px;text-align:center;padding:6px 0;">' + place + '</div>'
            });
            infowindow.open(map, marker);

            map.setCenter(coords);
            resolve();
          } else {
            reject(new Error('Geocoder failed: ' + status));
          }
        });
      });
    }

    function createMarkerAndLine(position, title) {
      var marker = new kakao.maps.Marker({
        position: position,
        map: map
      });

      var linePath = [position];

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

    (async function () {
      try {
        for (var i = 0; i < response.length; i++) {
          var sch = response[i];
          await geocodeAddress(sch.address, sch.place);

          var row = $('<tr>');
          row.append('<td>' + '<span id="order">' + (i + 1) + '</span>' + '</td>');
          row.append('<td>' + sch.place + '</td>');
          row.append('<td>' + sch.memo + '</td>');

          tbody.append(row);
        }

        table.append(tbody);
        container.append(table);
      } catch (error) {
        console.log(error);
      }
    })();
  }
</script>


</body>

</html>








