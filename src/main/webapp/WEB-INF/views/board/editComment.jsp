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
 	text-align: center;
 	font-weight: bold;
 }
  
 #comment-list > tbody > tr > td:second-child {
	padding: 50px;
 }
 
 #comment-list > tbody > tr > td:last-child {
 	text-align: right;
 	font-size: 12px;
 }
 

 
 #board-buttons {
 	margin-top: 50px;
 	margin-bottom: 100px;
 }
 
 #board-feedback {
 	text-align: right;
 }
 
 #board-like {
 	cursor: pointer;
 	width: 30px;
 }
 
 #board-siren {
 	cursor: pointer;
 	width: 27px;
 }
 
 #board-feedback > div:nth-child(2) {
 	cursor: pointer;
 }
 
 #board-feedback > div:nth-child(2):hover {
 	text-decoration: underline;
 }
 
 #board-feedback > div:nth-child(2) > span {
 	font-size: 12px;
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
	<h3>Board</h3>
	<table id="board-content-list" class="table">
		<tr>
			<th>제목</th>
			<td>${bdetail.title }</td>
		</tr>
		<tr>
			<th>말머리</th>
			<td>${bdetail.category }</td>
		</tr>
		<tr>
			<th>번호</th>
			<td>${bdetail.free_seq }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${bdetail.content}</td>
		</tr>
		<tr>
			<th>글쓴이</th>
			<td>${bdetail.nickname }</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td>${bdetail.regdate}</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${bdetail.readcount}</td>
		</tr>
	</table>
	</div>
	
	<div id="board-feedback">
		<div>
			<img id="board-like" src="resources/img/board_like.png">
			<span>${bdetail.recommend }</span>
		</div>
		<div onclick="location.href='/dreamjourney/boardReport?free_seq=${bdetail.free_seq}'">
			<span>규칙을 위반한 글인가요? [신고하기]</span>
			<img id="board-siren" src="resources/img/siren.png">
		</div>
	</div>
	
	
	<!-- 댓글 목록 출력하는 영역 -->
	<div id="comment-area">
	<h3 id="comment-area-title">Comments <span>(${commentCount })</span></h3>
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
			<td>${cdto.nickname}</td>
			<td>${cdto.content }</td>
			<td>${cdto.regdate }</td>
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
	
	
	
	
	<div id="board-buttons" class="d-grid d-md-block">
	<c:if test="${bdetail.category eq '동행' }">
 		<button class="btn btn-primary" type="button" value="${bdetail.free_seq}" onclick="openChat(${bdetail.free_seq})">채팅하기</button>
	</c:if>
	  	<button class="btn btn-primary btn-grid" type="button" onclick="location.href='/dreamjourney/editBoard?free_seq=${bdetail.free_seq}';">수정하기</button>
	  	<button class="btn btn-primary btn-grid" type="button" onclick="location.href='/dreamjourney/delBoard?free_seq=${bdetail.free_seq }';">삭제하기</button>
	  	<button class="btn btn-primary btn-grid" type="button" onclick="location.href='/dreamjourney/board';">목록으로</button>
	
	</div>
	
	</div>
	

	<%@ include file="/resources/inc/footer.jsp" %>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	
	function openChat(seq) {
		let free_seq = seq;
		
		let child = window.open(`/dreamjourney/chat?free_seq=\${free_seq}`, 'chat', 'width=560 height=650');
		
		
		$('.in').prop('disabled', true);
		
		
		child.addEventListener('load', function() {
 			
			child.connect(name);
 			
 		});
	}
</script>
</body>
</html>






