<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Dreamjourney > 자유게시판 > 글쓰기</title>
<style>
 #main-board {
 	width: 1000px;
 	margin: 0 auto;
 	margin-top: 50px;
	justify-content: center;
	margin-bottom: 80px;
 }

 .form-control {
 	resize: none;
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
 
 #board-input-content {
 	height: 300px;
 }
 
  #board-buttons {
 	margin-top: 50px;
 	margin-bottom: 100px;
 }
 
</style>
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

</head>
<body>
	<!--  -->
	<%@ include file="/resources/inc/header.jsp" %>
	
	    <!-- 제목 쓰는곳 -->
    <div class="container-fluid page-header">
        <div class="container">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
                <h3 class="display-4 text-white text-uppercase">함께하는 즐거움</h3>
                
            </div>
        </div>
    </div>
    <!-- Header End -->   
    
       <!-- 내용 작성 -->
    <div class="container-fluid py-5" style="height: 100px;">
   </div>
	
	<div id="main-board">
	<div class="hr-sect">
		<a href="/dreamjourney/board">커뮤니티</a>
		 &nbsp;&nbsp;/&nbsp;&nbsp; 
		<a href="/dreamjourney/addBoard">글쓰기</a>
	</div>
	<form class="row g-2" method="POST" action="/dreamjourney/addBoard">
	
  <div class="col-3">
    <label for="inputState" class="form-label">말머리</label>
    <select id="inputState" class="form-control" name="category">
      <option value="리뷰">리뷰</option>
      <option value="동행">동행</option>
      <option value="분실">분실</option>
    </select>
  </div>
  
    <div class="col-9">
    <label for="board-input-file" class="form-label">첨부파일</label>
    <input type="file" name="fname" class="form-control" id="board-input-file" placeholder="Apartment, studio, or floor">
  </div>
  <div class="col-md-12">
    <label for="board-input-title" class="form-label">제목</label>
    <input type="text" class="form-control" name="title" id="board-input-title" placeholder="제목을 입력해주세요.">
  </div>
  <div class="col-12">
    <label for="board-input-content" class="form-label">내용</label>
    <textarea class="form-control" name="content" id="board-input-content" placeholder="내용을 입력해주세요."></textarea>
    <div id="board-buttons">
    	<button type="submit" class="btn btn-primary">등록하기</button>	
		<button type="button"  class="btn btn-primary" onclick="location.href='/dreamjourney/board';">목록으로</button>
    </div>
  </div>

</form>
	</div>
	
	<%@ include file="/resources/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>






