<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html lang="en">

<style>
	.form-signin {
     height: auto;
     padding: 50px;
     margin: 0;
     position: relative;
     width: 500px;
   }
   
   .form-signin .checkbox {
     font-weight: 400;
   }
   
   .form-signin .form-floating:focus-within {
     z-index: 2;
   }
   
   .form-signin input[type="email"] {
     margin-bottom: -1px;
     border-bottom-right-radius: 0;
     border-bottom-left-radius: 0;
   }
   
   .form-signin input[type="password"] {
     margin-bottom: 10px;
     border-top-left-radius: 0;
     border-top-right-radius: 0;
   }
</style>

<head>
    <meta charset="utf-8">
    <title>TRAVELER - Free Travel Website Template</title>
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
</head>

<body>
	
	
    

    <%@ include file="/resources/inc/header.jsp" %>
    
     <!-- 제목 쓰는곳 -->
    <div class="container-fluid page-header">
        <div class="container">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
                <h3 class="display-4 text-white text-uppercase">로그인</h3>
                
            </div>
        </div>
    </div>
    <!-- Header End -->	

	<!-- 내용쓰는곳 -->
 	<div class="container-fluid" style="height: 500px; padding-left: 100px; padding-right: 100px; padding-top: 50px; padding-bottom: 50px; ">
 			  <div style="display: flex; justify-content: center; margin: 20px;">
			      <div style="width: 220px; height:150px; display:flex; align-content: center;">
			         <img src="/dreamjourney/resources/img/Journey.png" style="width: 220px;">
			      </div>
 			  </div>
			  <div class="wrap" style="text-align: center; position: relative;">
			  	<p style="margin-bottom: 30px;"><span style="color: #7AB730; font-size: 20px; font-weight: bold;">"꿈"</span>같은 <span style="font-size: 20px; font-weight: bold;">여행</span>을 위해 로그인하세요!</p>
				<a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=13346f688f01a6d944eb750631266672&redirect_uri=	
					http://localhost/dreamjourney/kakao&response_type=code">
				<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
					    alt="카카오 로그인 버튼" />
				</a>
				<div style="margin-top: 10px;">
					<a href="/dreamjourney/glogin">아이디로 로그인하기</a>
				</div>
		     </div> 
		         
	</div>
                


    <%@ include file="/resources/inc/footer.jsp" %>
    
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
  integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
    
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	
</script>
</body>

</html>






