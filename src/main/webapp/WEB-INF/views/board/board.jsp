<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>DreamJourney > 자유게시판 > 동행 글쓰기</title>
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

<!-- BootStrap -->

<style>
 
 #board-list {
 	margin: 0 auto;
 	margin-top: 30px;
 	cursor: pointer;
 }
 
 #board-list > tbody > tr > th {
 	text-align: center;
 }


 #main-board {
 	width: 1000px;
 	min-height: 500px;
 	margin: 0 auto;
 	margin-bottom: 150px; 
 }
 
 #main-board-menu {
 	margin-top: 80px;
 }
 
 .form-control {
 	display: inline-block;
    width: 200px;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
 }
 
  
 #board-content-user1 {
 	width: 18px;
 }

 #board-content-user2 {
 	width: 18px;
 }

 #board-content-user3 {
 	width: 18px;
 }
 
 #board-button-area {
 	margin-top: 30px;
 	text-align: right;
 }
 
 #board-comment-count {
 	font-size: 13px;
 	font-weight: bold;
 	color: #7AB730;
 }
 
 #board-search {
 	align-items: center;
 	width: 500px;
 }
 
 #board-search-input {
 	margin-right: 10px;
 }
 
 #button-search-button {
 	background-color: #7AB730;
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
 
 #board-like {
 	cursor: pointer;
 	width: 15px;
 	margin-right: 5px;
 }
 
 #board-pagination {
	text-align: center;
 }
 
 #board-pagination > a {
 	font-size: 18px;
 }
 
</style>
 
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
	
	<!-- board.jsp -->
	<div id="main-board">
	<div id="main-board-menu">

			<div id="board-search" class="input-group mb-3">
					<select name="category" class="form-control" >
			<option onchange="/dreamjourney/board">말머리</option>
			<option onchange="/dreamjourney/reviewBoard" value="리뷰">리뷰</option>
			<option value="동행">동행</option>
			<option value="분실">분실</option>
		</select>
				<input type="text" name="word" class="form-control" placeholder="검색어를 입력하세요." id="board-search-input">
				<button class="btn btn-primary" type="button" id="button-search-button">검색</button>
			</div>

		</div>
	<table id="board-list" class="table table-hover">
	<tr>
		<th>번호</th>
		<th>말머리</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>작성날짜</th>
		<th>조회</th>
		<th>추천</th>
	</tr>
	<c:forEach items="${blist}" var="dto">
	<tr onclick="location.href='/dreamjourney/boardDetail?free_seq=${dto.free_seq}';">
		<td>${dto.free_seq }</td>
		<c:if test="${dto.category == '동행'}">
		<td>
			<div id="board-category-together">동행</div>
		</td>
		</c:if>
		<c:if test="${dto.category == '리뷰'}">
		<td>
			<div id="board-category-review">리뷰</div>
		</td>
		</c:if>
		<c:if test="${dto.category == '분실'}">
		<td>
			<div id="board-category-lost">분실</div>
		</td>
		</c:if>
		<td>${dto.title } <span id="board-comment-count"> (${dto.ccount})</span></td>
		<td>
			<c:if test="${dto.member_seq % 3 == 0 }">
				<img id="board-content-user1" src="resources/img/board/user1.png">
			</c:if>
			<c:if test="${dto.member_seq % 3 == 1 }">
				<img id="board-content-user1" src="resources/img/board/user2.png">
			</c:if>
			<c:if test="${dto.member_seq % 3 == 2 }">
				<img id="board-content-user1" src="resources/img/board/user3.png">
			</c:if>
			${dto.nickname	 }
		</td>
		<td style="color: #777;">${dto.regdate }</td>
		<td>${dto.readcount }</td>
		<td><img id="board-like" src="resources/img/board/heart.png">${dto.recommend }</td>
	</tr>
</c:forEach>
	</table>
	<div id="board-button-area">
	<c:if test="${seq != null }">
		<button type="button" id="add" onclick="location.href='/dreamjourney/addBoard';" class="btn btn-primary">글쓰기</button>
	</c:if>
	</div>
	<div id="board-pagination" class="w3-bar">
	  <a href="#" class="w3-button">&laquo;</a>
	  <a href="#" class="w3-button">1</a>
	  <a href="#" class="w3-button">2</a>
	  <a href="#" class="w3-button">3</a>
	  <a href="#" class="w3-button">4</a>
	  <a href="#" class="w3-button">5</a>
	  <a href="#" class="w3-button">6</a>
	  <a href="#" class="w3-button">7</a>
	  <a href="#" class="w3-button">8</a>
	  <a href="#" class="w3-button">9</a>
	  <a href="#" class="w3-button">10</a>
	  <a href="#" class="w3-button">&raquo;</a>
	</div>

	</div>
	<%@ include file="/resources/inc/footer.jsp" %>
	
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>






