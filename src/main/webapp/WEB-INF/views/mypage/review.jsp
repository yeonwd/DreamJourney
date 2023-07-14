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
	padding: 15px;
}

#content {
	width: auto;
}

#unwritten-reviews {
	margin-top: 20px;
	border: 1px solid #27374D;
	border-radius: 10px;
	padding: 10px;
	margin-bottom: 20px;
}

#unwritten-reviews>table {
	width: 100%;
}

#reviews-container {
	margin-top: 20px;
}

.review-box {
	border: 1px solid #CCCCCC;
	border-radius: 20px;
	margin-right: 30px;
	margin-left: 30px;
	margin-top: 15px;
}

.review-box>table {
	width: 100%;
	height: 80px;
	margin: 15px;
}

.review-box>table>tr>td {
	padding: 30px;
}

.btn-edit {
	background-color: #82CD47;
	border: none;
	border-radius: 10px;
	color: white;
	margin-right: 5px;
}

.btn-confirm {
	background-color: #379237;
	border: none;
	border-radius: 10px;
	color: white;
	margin-right: 5px;
}

.btn-delete {
	background-color: #dc3545;
	border: none;
	border-radius: 10px;
	color: white;
}

.btn-cancel {
	background-color: #757575;
	border: none;
	border-radius: 10px;
	color: white;
}

.write-review {
	background-color: #FFBF00;
	border: none;
	border-radius: 10px;
	color: white;
}

textarea {
	border: none;
	resize: none;
}

.reply {
	background-color: #D9D9D9;
}

.review-button {
	border: none;
	border-radius: 20px;
	color: white;
}

#btn-accommodate {
	width: 45px;
	height: 30px;
	background-color: #A1C2F1;
}

#btn-activity {
	background-color: #5A96E3;
}

#btn-restaurant {
	background-color: #0A6EBD;
}

.table-container {
	border: 1px solid #CCCCCC;
	border-radius: 10px;
	padding: 10px;
	margin-bottom: 20px;
}

.review-table {
	width: 100%;
}

.rating {
   width: 180px;
}

.rating__star {
   cursor: pointer;
   color: #dabd18b2;
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
				<h3 class="display-4 text-white text-uppercase">내 리뷰</h3>

			</div>
		</div>
	</div>
	<!-- Header End -->

	<!-- Blog Start -->

	<div class="container-fluid py-5 mypagecontainer">
		<%@ include file="/resources/inc/mypage_sidemenu.jsp"%>
		<div id="mypage_content">

			<div>
				<button class="review-button m-2" id="btn-accommodate">숙박</button>
				<button class="review-button m-2" id="btn-activity">액티비티</button>
				<button class="review-button m-2" id="btn-restaurant">맛집</button>
			</div>


			<div id="unwritten-container"></div>

			<div id="reviews-container"></div>

		</div>
	</div>

	<%@ include file="/resources/inc/footer.jsp"%>

	<script>
	
	
		// default
		$(document).ready(function() {
			updateData('accommodate');
			getUnwritten('accommodate');
		});

	    var uwcontainer = $('#unwritten-container');
		var rcontainer = $('#reviews-container');
		
		// 버튼 핸들링
		$("#btn-accommodate").click(function() {
			uwcontainer.empty();
			updateData('accommodate');
			getUnwritten('accommodate');
		});
		$("#btn-restaurant").click(function() {
			uwcontainer.empty();
			updateData('restaurant');
		});
		$("#btn-activity").click(function() {
			uwcontainer.empty();
			updateData('activity');
			getUnwritten('activity');
		});
		
		
		// 미작성 리뷰 리스트 불러오기
		function getUnwritten(selected) {
			
			uwcontainer.empty();
						
			$.ajax({
				  url: 'unwrittenreview',
				  type: 'GET',
				  dataType: 'json',
				  data: {
				    selected: selected
				  },
				  success: function(response) {
				    if (response !== null && Object.keys(response).length > 0) {
				      unwrittenboxhandling(selected, response);
				    }
				  },
				  error: function(a, b, c) {
				    console.log(a, b, c);
				  }
				});

		} //getUnwritten()
		
		
		
		// 미작성 리뷰 리스트 출력
		function unwrittenboxhandling(selected, result) {
		
		    uwcontainer.empty();
		
		    var tbldiv = $('<div id="unwritten-reviews">');
		    var table = $('<table>');
		
		    // column 너비 조정
		    var colgroup = $('<colgroup>');
		    colgroup.append('<col width="40%">');
		    colgroup.append('<col width="35%">');
		    colgroup.append('<col width="15%">');
		    table.append(colgroup);
		
		    var tbody = $('<tbody>');
		    
		    var firstRow = $('<tr>');
		    var length = result.length;
		    firstRow.append('<div style="margin-bottom: 10px;"><td colspan="3"><b>' + length + '건</b>의 작성되지 않은 리뷰가 있습니다.</td></div>');
		    tbody.append(firstRow);
		
		    for (var i = 0; i < result.length; i++) {
		
		        (function () {
		
		            var unwri = result[i];
		            var row = $('<tr>');
		
		            row.append('<td>' + unwri.name + '</td>'); //장소명
		            row.append('<td style="text-align: center;">' + unwri.begindate + '</td>'); //예약일
		
		            var writeButton = $('<button class="write-review" style="margin-bottom: 5px;">작성하기</button>');
		            row.append($('<td style="text-align: right; padding-right: 60px;">').append(writeButton));

		
		            var seq = unwri.pay_seq;
		
		            writeButton.click(function () {
		                onwrite(seq, selected);
		            });
		
		            tbody.append(row);
		            
		        })();
		
		    }
		
		    table.append(tbody);
		    tbldiv.append(table);
		    uwcontainer.append(tbldiv);
}
		
		
		// 리뷰 작성 버튼 클릭 시 모달창 출력
		function onwrite(seq, selected) {
			  var modal = $('<div class="modal" tabindex="-1" role="dialog">');
			  var modalDialog = $('<div class="modal-dialog modal-dialog-centered" role="document">');
			  var modalContent = $('<div class="modal-content" style="border-radius: 10px;">');
			  var modalBody = $('<div class="modal-body" style="margin: 10px 0;">');
			  var modalTitle = $('<h6 class="modal-title" style="margin-bottom: 10px;">리뷰 작성</h6>');
			  var ratingStars = $('<div class="rating" style="margin: 10px 0;"></div>');
			  var textarea = $('<textarea class="form-control" style="margin-bottom: 10px;"></textarea>');
			  var completeButton = $('<button type="button" class="btn-confirm" style="margin-left: 10px; margin-top: 5px;">확인</button>');
			  var cancelButton = $('<button type="button" class="btn-cancel" style="margin-left: 10px; margin-top: 5px;">취소</button>');
			
			  // Append stars to ratingStars
			  for (var i = 0; i < 5; i++) {
			    var star = $('<i class="rating__star far fa-star" style="margin-right: 1px;"></i>');
			    ratingStars.append(star);
			  }
			
			  textarea.attr('rows', '5');
			  textarea.css('resize', 'none');
			
			  modalBody.append(modalTitle);
			  modalBody.append(ratingStars);
			  modalBody.append(textarea);
			  modalBody.append(completeButton);
			  modalBody.append(cancelButton);
			  modalContent.append(modalBody);
			  modalDialog.append(modalContent);
			  modal.append(modalDialog);
			
			  modal.modal('show');
			
			  executeRating(ratingStars);
			
			  // Variables to store the number of colored stars
			  var score = 0;
			
			  // Star click event handler
			  ratingStars.find('.rating__star').click(function() {
			    score = $(this).prevAll('.rating__star').length;
			  });
			
			  // 작성 완료 버튼 클릭 시 데이터 전송
			  completeButton.click(function() {
			    var content = textarea.val();
			    var score = ratingStars.find('.rating__star.fas').length;
			
			    $.ajax({
			      url: 'writereview',
			      type: 'POST',
			      data: {
			        seq: seq,
			        content: content,
			        score: score // Include the number of colored stars in the request
			      },
			      success: function(response) {
			        console.log('Write review success');
			        updateData(selected);
			        getUnwritten(selected);
			        modal.modal('hide');
			      },
			      error: function(xhr, status, error) {
			        console.log(xhr.responseText);
			        console.log(status);
			        console.log(error);
			      }
			    });
			  });
			
			  // 취소 버튼 클릭
			  cancelButton.click(function() {
			    modal.modal('hide');
			  });
			
			  // 모달 창 바깥 클릭
			  modal.on('hidden.bs.modal', function() {
			    modal.remove();
			  });
			}




		
		
		// 리뷰 데이터 호출
		function updateData(selected) {

			var url = '';

			if (selected === 'accommodate' || selected === 'activity') {
				url = 'bookablereview';
			} else {
				url = 'unbookablereview';
			}

			$.ajax({
				url : url,
				type : 'GET',
				dataType : 'json',
				data : {
					selected : selected
				},
				success : function(response) {
					tablehandling(selected, response);
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				}
			});

		} // updateData()
		
		

		// 리뷰 데이터로 테이블 형성
		function tablehandling(selected, result) {
			  rcontainer.empty();
			
			  for (var i = 0; i < result.length; i++) {
			    (function () {
			      var review = result[i];
			
			      // 테이블 형성
			      var tableContainer = $('<div class="table-container">');
			      var table = $('<table class="review-table">');
			      var editButton = $('<button class="btn-edit">수정</button>');
			      var deleteButton = $('<button class="btn-delete">삭제</button>');
			
			      var ratingStars = $('<div class="rating" style="margin: 10px 0;"></div>');
			
			      // column 너비 조정
			      var colgroup = $('<colgroup>');
			      colgroup.append('<col width="20%">');
			      colgroup.append('<col width="35%">');
			      colgroup.append('<col width="20%">');
			      colgroup.append('<col width="20%">');
			      table.append(colgroup);
			
			      var tbody = $('<tbody>');
			
			      var row = $('<tr>');
			
			      var score = parseInt(review.score);
			
			      for (var j = 1; j <= 5; j++) {
			        var starClass = j <= score ? "rating__star fas fa-star" : "rating__star far fa-star";
			        var star = $('<i class="' + starClass + '" style="margin-right: 1px;"></i>');
			        ratingStars.append(star);
			      }
			
			      // 리뷰 정보 appending
			      row.append($('<td>').append(ratingStars)); // Append the ratingStars to a new <td> element and then append that <td> to the row
			      row.append('<td>' + review.name + '</td>'); //장소명
			
			      var rdate = review.rdate.substring(0, 10);
			      row.append('<td>' + rdate + '</td>'); //작성일
			
			      // 수정, 삭제 버튼 appending
			      var buttonCell = $('<td style="text-align: center;">');
			      buttonCell.append(editButton).append(deleteButton);
			      row.append(buttonCell);
			
			      // Set rowspan for the button column
			      buttonCell.attr('rowspan', '2');
			      tbody.append(row);
			
			      // 리뷰 내용 appending
			      var contentrow = $('<tr>');
			      var contentcell = $('<td colspan="3">' + review.content + '</td>');
			
			      contentrow.append(contentcell);
			      tbody.append(contentrow);
			
			      table.append(tbody);
			      tableContainer.append(table);
			      rcontainer.append(tableContainer);
			
			      var seq = '';
			
			      switch (selected) {
			        case 'accommodate':
			        case 'activity':
			          seq = review.review_seq;
			          break;
			        case 'restaurant':
			          seq = review.freview_seq;
			          break;
			      }
			
			      editButton.click(function () {
			        onedit(seq, selected, editButton, deleteButton);
			      });
			
			      deleteButton.click(function () {
			        ondelete(seq, selected);
			      });
			
			    })();
			  }
			} // tablehandling()

		

		// 수정 버튼 클릭 이벤트
		function onedit(seq, selected, editButton, deleteButton) {
			
			console.log('edit');

			var contentCell = editButton.closest('tr').next('tr').find('td');
			var content = contentCell.text();
			var rowspan = contentCell.prop('rowspan'); 
			  
			contentCell.empty();

			var textarea = $('<textarea style="width:100%;">' + content + '</textarea>');
			textarea.val(content); 
			  
			textarea.attr('rows', Math.ceil(content.length / 50)); // textarea 길이 조절
			contentCell.append(textarea);
			
			// 버튼 교환
			editButton.hide();
			deleteButton.hide();
			
			var confirmButton = $('<button class="btn-confirm">확인</button>');
			var cancelButton = $('<button class="btn-cancel">취소</button>');
			
			var buttonCell = editButton.parent();
			buttonCell.append(confirmButton);
			buttonCell.append(cancelButton);
			
			confirmButton.click(function() {
				var newContent = textarea.val();
				onconfirm(seq, selected, newContent, contentCell, editButton, deleteButton, confirmButton, cancelButton);
			});
			
			cancelButton.click(function() {
				contentCell.empty();
				contentCell.text(content);
				confirmButton.hide();
				cancelButton.hide();
				editButton.show();
				deleteButton.show();
			});

				
		} // onedit()

		
		
		// 수정 완료
		function onconfirm(seq, selected, newContent, contentCell, editButton, deleteButton, confirmButton, cancelButton) {
			
			$.ajax({
				 url: 'updatereview',
				 type: 'POST', 
				 data: {
					 seq: seq,
					 selected: selected,
				 	newContent: newContent
				 },
				 success: function (response) {
				 	
						confirmButton.hide();
						cancelButton.hide();

						editButton.show();
						deleteButton.show();
						
						contentCell.empty();
						contentCell.text(newContent);

				 },
				 error: function (a, b, c) {
					 console.log(a, b, c);
				 }
				 });
			
		} // onconfirm()
		
		
		
		// 삭제 버튼 클릭 이벤트
		function ondelete(seq, selected) {
			
			 // 모달창 생성
		    var modal = $('<div class="modal" tabindex="-1" role="dialog">');
		    var modalDialog = $('<div class="modal-dialog modal-dialog-centered" role="document">');
		    var modalContent = $('<div class="modal-content">');
		    var modalBody = $('<div class="modal-body">');
		    var confirmText = $('<p>정말 삭제하시겠습니까?</p>');
		    var confirmButton = $('<button type="button" class="btn-delete">삭제</button>');
		    var cancelButton = $('<button type="button" class="btn-cancel" style="margin-left: 10px;" data-dismiss="modal">취소</button>');

		    // 모달창에 appending
		    modalBody.append(confirmText);
		    modalBody.append(confirmButton);
		    modalBody.append(cancelButton);
		    modalContent.append(modalBody);
		    modalDialog.append(modalContent);
		    modal.append(modalDialog);

		    modal.modal('show');

		    confirmButton.click(function() {
		    	
		    	$.ajax({
					 url: 'deletereview',
					 type: 'POST', 
					 data: {
						 seq: seq,
						 selected: selected
					 },
					 success: function (response) {
						 console.log('delete success');
					     modal.modal('hide');
						 updateData(selected);
						  getUnwritten(selected);
					 },
					 error: function (a, b, c) {
						 console.log(a, b, c);
					 }
					 });
		    });

		    modal.on('hidden.bs.modal', function() {
		        modal.remove();
		    });
		}
		
		
		// 별점 주기
		function executeRating(stars) {
		  const starClassActive = "rating__star fas fa-star";
		  const starClassInactive = "rating__star far fa-star";
		
		  stars.find('.rating__star').click(function() {
		    const clickedStarIndex = $(this).index();
		
		    // Set all stars before the clicked star to active
		    stars.find('.rating__star:lt(' + (clickedStarIndex + 1) + ')').removeClass(starClassInactive).addClass(starClassActive);
		
		    // Set all stars after the clicked star to inactive
		    stars.find('.rating__star:gt(' + clickedStarIndex + ')').removeClass(starClassActive).addClass(starClassInactive);
		  });
		}

		
	</script>


</body>

</html>






