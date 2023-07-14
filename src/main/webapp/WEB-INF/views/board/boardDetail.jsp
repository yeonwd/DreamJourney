<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dreamjourney > 자유게시판</title>
<style>
 #main-board {
 	width: 1000px;
 	margin: 0 auto;
 	margin-top: 150px;
	justify-content: center;
 }
 
 #board-content-list {
 	margin-bottom: 80px;
 
 }
 
 #board-content-title {
 	font-weight: bold;
 	font-size: 28px;
 	padding: 20px;
 }
 
 
 .hr-sect {
 	display: flex;
    flex-basis: 100%;
    align-items: center;
    color: rgba(0, 0, 0, 0.35);
    font-size: 12px;
    margin: 80px 0px;
 }
 
 .hr-sect::before,
 .hr-sect::after {
 	content: "";
 	flex-grow: 1;
 	background: rgba(0, 0, 0, 0.35);
 	height: 1px;
 	font-size: 0px;
 	line-height: 0px;
 	margin: 0px 16px;
 }
 
 #board-content-user1 {
 	width: 27px;
 }

 #board-content-user2 {
 	width: 27px;
 }

 #board-content-user3 {
 	width: 27px;
 }
 
 #board-content-nickname {
 	margin-right: 20px;
 }
 
 #board-content-seq {
 	text-align: right;	
 }
 
 #board-content-info-user {
 	display: inline-block;
 	width: 400px;
 
 }
 
 #board-content-info-feedback {
 	display: inline-block;
 	width: 550px;
 	text-align: right;
 }
 
 #board-content-regdate {
 	font-size: 13px;
 	color: #888;
 	text-align: right;
 }
 
 #board-content-content {
 	width: 950px;
 	padding: 30px;
 	font-size: 17px;
 	color: #333;
 }
  
 #board-category-together {
 	dispaly: inline-block;
 	width: 37px;
 	border: 1px solid cornflowerblue;
 	border-radius: 2px;
 	color: cornflowerblue;
 	text-align: center;
 	font-weight: bold;
 	font-size: 13px;
 }
 
 
 #board-category-review {
 	dispaly: inline-block;
 	width: 37px;
 	border: 1px solid #7AB730;
 	border-radius: 2px;
 	color: #7AB730;
 	text-align: center;
 	font-weight: bold;
 	font-size: 13px;
 
 }
 
 #board-category-lost {
 	dispaly: inline-block;
 	width: 37px;
 	border: 1px solid tomato;
 	border-radius: 2px;
 	color: tomato;
 	text-align: center;
 	font-weight: bold;
 	font-size: 13px;
 }
 
 
 
 #board-comment-input {
 	width: 1000px;
 	min-height: 50px;
 }




 #comment-area-title > span {
 	font-weight: none;
 	font-size: 16px;
 	color: #7AB730;
 }


#comment-list {
	width: 1000px;
}

 
 #comment-input-area {
 	resize: none;
 	margin: 10px 0;
 }
 
 
 .btn-grid {
 	margin: 0 5px;
 }
 
 
 .comment-list-tr > td {
 	padding: 30px;
 }
 
 #comment-list-null {
 	text-align: center;
 	padding: 30px;
 	border-top: 1px solid #CCC;
 	border-bottom: 1px solid #CCC;
 }

 #comment-list > tbody > tr {
 	border-top: 1px solid #CCC;
 	border-bottom: 1px solid #CCC;
 
 }
  
 #comment-list > tbody > tr > td:first-child {
 	font-weight: bold;
 }
  
 #comment-list > tbody > tr > td:second-child {
	padding: 50px;
 }
 
 #comment-list > tbody > tr > td:last-child {
 	text-align: right;
 	font-size: 12px;
 }
 
 #board-comment-user {
 	width: 20px;
 	margin-right: 10px;
 }
 
 #board-writer-comment {
 	dispaly: inline-block;
 	width: 37px;
 	border: 1px solid tomato;
 	border-radius: 2px;
 	color: tomato;
 	text-align: center;
 	font-weight: bold;
 	font-size: 10px;
 	margin-bottom: 7px;
 }

 
 #board-buttons {
 	margin-top: 50px;
 	margin-bottom: 100px;
 }
 
 #board-feedback {
 	text-align: right;
 	
 	margin-bottom: 150px;
 }
 
 #board-like-div {
 	display: inline-block;
 	width: 100px;
 } 
 #board-like {
 	cursor: pointer;
 	width: 20px;
 }
 
 #board-siren {
 	cursor: pointer;
 	width: 27px;
 }
 
 #board-readcount {
 	width: 27px;
 }
 
 #board-feedback > div:nth-child(1) {
 	cursor: pointer;
 }
 
 #board-feedback > div:nth-child(1):hover {
 	text-decoration: underline;
 }
 
 #board-feedback > div:nth-child(1) > span {
 	font-size: 12px;
 }
 
 #comment-edit {
 	cursor: pointer;
 }
 
 #comment-del {
 	cursor: pointer;
 }
 
 #comment-edit-cancel {
 	background-color: #666;
 	border: 1px solid #666;
 }
 
</style>
    <meta charset="utf-8">
    <title>TRAVELER - Free Travel Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    
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
    <link href="/dreamjourney/resources/css/wanjin.css" rel="stylesheet">
</head>
<body>
	<%@ include file="/resources/inc/header.jsp" %>
	
	    <!-- 제목 쓰는곳 -->
    <div class="container-fluid page-header">
        <div class="container">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
                <h3 class="display-4 text-white text-uppercase">함께하는 즐거움</h3>
                
            </div>
        </div>
    </div>
	<div id="main-board">
	<div id="board-content">
	<div class="hr-sect">
		<a href="/dreamjourney/board">커뮤니티</a>
		 &nbsp;&nbsp;/&nbsp;&nbsp; 
		<a href="/dreamjourney/board">${bdetail.category}</a>
	</div>
	
	<!-- 글 내용 영역 -->
 	<table id="board-content-list" class="table">
		<tr>
 			<td id="board-content-title">${bdetail.title }</td>
		</tr>

		<tr>
			<!-- <th>글쓴이</th> -->
			<td>
				<div id="board-content-info-user">
					<c:if test="${bdetail.member_seq % 3 == 0 }">
						<img id="board-content-user1" src="resources/img/board/user1.png">
					</c:if>
					<c:if test="${bdetail.member_seq % 3 == 1 }">
						<img id="board-content-user1" src="resources/img/board/user2.png">
					</c:if>
					<c:if test="${bdetail.member_seq % 3 == 2 }">
						<img id="board-content-user1" src="resources/img/board/user3.png">
					</c:if>
						<span id="board-content-nickname">${bdetail.nickname }</span> 
				</div>
				
				<div id="board-content-info-feedback">
					<img id="board-like" src="resources/img/board/heart.png" onclick="location.href='/dreamjourney/boardRecommend?free_seq=${bdetail.free_seq}'"><span style="margin-right: 20px; margin-left: 5px;">${bdetail.recommend }</span>
					<img id="board-readcount" src="resources/img/board/eye.png">
					<span id="board-content-readcount" style="margin-left: 5px;">${bdetail.readcount }</span>
				</div>
		</tr>
		<tr>
			<!-- <th>내용</th> -->
			<td>
				<div id="board-content-regdate">${bdetail.regdate }</div> 
				<div id="board-content-content"> ${bdetail.content} </div>
			</td>
		</tr>
	</table>
	</div>
	
	<div id="board-feedback">
		<div onclick="location.href='/dreamjourney/boardReport?free_seq=${bdetail.free_seq}'">
			<span>규칙을 위반한 글인가요? [신고하기]</span>
			<img id="board-siren" src="resources/img/board/siren.png">
		</div>
	</div>
	
	
	<!-- 댓글 목록 출력하는 영역 -->
	<!-- 댓글 수정/삭제 -->
	<div id="comment-area">
	<h3 id="comment-area-title">댓글 <span>(${commentCount })</span></h3>
	<c:if test="${clist.size() == 0 }">
		<div id="comment-list-null">댓글이 없습니다.</div>	
	</c:if>
	
	<table id="comment-list">
	<colgroup>
		<col width="15%"/>
		<col width="60%"/>
		<col width="auto"/>
	</colgroup>

	<c:forEach items="${clist}" var="cdto">
		<tr class="comment-list-tr">
			<td>
				<c:if test="${cdto.member_seq % 3 == 0 }">
					<img id="board-content-user1" src="resources/img/board/user1.png">
				</c:if>
				<c:if test="${cdto.member_seq % 3 == 1 }">
					<img id="board-content-user1" src="resources/img/board/user2.png">
				</c:if>
				<c:if test="${cdto.member_seq % 3 == 2 }">
					<img id="board-content-user1" src="resources/img/board/user3.png">
				</c:if>
				${cdto.nickname}
			</td>
			<td id="comment-edit-content">
				<c:if test="${bdetail.member_seq == cdto.member_seq }">
					<div id="board-writer-comment">글쓴이</div>
				</c:if>
				${cdto.content }
			</td>
			<td>
				${cdto.regdate }
				<c:if test="${seq == cdto.member_seq }">
				 <span id="comment-edit" onclick="editComment(${cdto.freply_seq}, ${cdto.free_seq });">수정</span> | 
				 <span id="comment-del" onclick="delComment(${cdto.freply_seq}, ${cdto.free_seq});">삭제</span>  
				 </c:if>
		<form id="editCommentForm" method="POST"
			action="/dreamjourney/editOkComment?free_seq=${cdto.free_seq }">
			<input type="hidden" name="free_seq"> 
			<input type="hidden" name="freply_seq"> 
			<input type="hidden" name="content">
		</form>
			</td>
		</tr>
	</c:forEach>
	</table>
	</div>

	<!-- 댓글창 -->
	<form method="POST" action="/dreamjourney/addComment">
	<div>
		<!-- 댓글창 제목 -->
		<div id="board-comment-title">
		</div>	
		<!-- 댓글 작성 영역 -->
		<div id="board-comment-content">
			<table id="board-comment-input">
				<tr>
					<td><textarea id="comment-input-area" name="content" class="form-control form-control-lg "placeholder="댓글을 입력하세요." maxlength="300"></textarea> 
					</td>
				</tr>
				<tr>
					<td style="text-align: right;">
						<button id="comment-input-button" type="submit" class="btn btn-primary">등록하기</button>
					</td>
				</tr>
			</table>
		</div>
		<input type="hidden" name="free_seq" value="${bdetail.free_seq }">
	
	</div>
	</form>
	
	
	<!-- 게시글 상세보기 > 하단 버튼 -->
	<div id="board-buttons" class="d-grid d-md-block">
	<c:if test="${bdetail.category eq '동행' }">
 		<button class="btn btn-primary" type="button" value="${bdetail.free_seq}" onclick="openChat(${bdetail.free_seq}, '${nickname}' )">채팅하기</button>
	</c:if>
	<c:if test="${seq == bdetail.member_seq }">
	  	<button class="btn btn-primary btn-grid" type="button" onclick="location.href='/dreamjourney/editBoard?free_seq=${bdetail.free_seq}';">수정하기</button>
	  	<button class="btn btn-primary btn-grid" type="button" onclick="location.href='/dreamjourney/delBoard?free_seq=${bdetail.free_seq }';">삭제하기</button>
	 </c:if>
	  	<button class="btn btn-primary btn-grid" type="button" onclick="location.href='/dreamjourney/board';">목록으로</button>
	
	</div>


	</div>
	

	<%@ include file="/resources/inc/footer.jsp" %>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	let freeSeq;
	let content;
	let freplySeq;

	function editComment(freply_seq, free_seq) {
		//이전 수정중인 댓글 폼 > 전부 삭제
		$('.edit-comment').remove();
		
		freplySeq = freply_seq;
		freeSeq = free_seq;
		
		content = $(event.target).closest('tr').children().eq(1).text();
		
		// 수정 버튼을 누르면 tr 생성
		$(event.target).closest('tr').children().eq(1).html(''); 
 		$(event.target).closest('tr').children().eq(1).append(
 				`
					<textarea style="resize:none;" class="form-control" id="editcomment">\${content}</textarea>
					<button class="btn btn-primary" id="comment-edit-ok" onclick="editOkComment(freplySeq)">등록</button>	
					<button class="btn btn-primary" id="comment-edit-cancel" onclick="cancelComment(content)">취소</button>	
				`
			);
	}
	
	function cancelComment(content) {
 		$(event.target).closest('tr').children().eq(1).html(
 			`<td id="comment-edit-content">\${content}</textarea>`
			);

	}
	
	function delComment(freply_seq, free_seq) {
		
		location.href='/dreamjourney/delComment?free_seq='+ free_seq +'&freply_seq=' + freply_seq;
		
//		location.href=`/dreamjourney/delComment?free_seq=\${free_seq}&freply_seq=\${freply_seq}`;
		
		
	}
	
	function editOkComment(freplySeq, freeSeq) {
	// 값 불러와짐		
	
		
		$('#editCommentForm input[name=freply_seq').val(freplySeq);
		
		$('#editCommentForm input[name=free_seq').val(freeSeq);
		$('#editCommentForm input[name=content]').val($('#editcomment').val());
		
		$('#editCommentForm').submit();
		
	}

	// 웹소켓 채팅
	function openChat(seq, nickname) {
		let free_seq = seq;
		let name = nickname;
		
		console.log('nickname');
		
		let child = window.open(`/dreamjourney/chat?free_seq=\${free_seq}&sender=\${name}`, 'chat', 'width=560 height=750');
		
		
		$('.in').prop('disabled', true);
		
		
		child.addEventListener('load', function() {
 			
			child.connect(name);
 			
 		});
	}
</script>
</body>
</html>






