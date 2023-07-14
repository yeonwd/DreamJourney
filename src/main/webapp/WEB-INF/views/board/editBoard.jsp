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
                
    
	
	<h2>동행 수정</h2>
	<div id="main-board">
	<form method="POST" action="/dreamjourney/editBoard">
		<table>
			<tr>
				<th>말머리</th>
				<td>${bdetail.category }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="title" type="text" value="${bdetail.title}" maxlength="65" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" maxlength="1000" required>${bdetail.content}</textarea></td>			
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file"></td>			
			</tr>
		</table>
		<button type="submit">등록하기</button>	
		<button type="button" onclick="location.href='/dreamjourney/board';">목록으로</button>	
		<input type="hidden" name="free_seq" value="${bdetail.free_seq}">
		
	</form>
	</div>
	
	<%@ include file="/resources/inc/footer.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

</script>
</body>
</html>






