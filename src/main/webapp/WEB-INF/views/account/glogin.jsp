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
 	<div class="container-fluid" style="height: 500px; padding-left: 100px; padding-right: 100px; padding-top: 50px; padding-bottom: 50px;">
	 	<div>
		 	<form style="width: 300px; margin: 0 auto;" method="post" name="form1">
		 	<p style="margin-bottom: 30px;"><span style="color: #7AB730; font-size: 20px; font-weight: bold;">"꿈"</span>같은 <span style="font-size: 20px; font-weight: bold;">여행</span>을 위해 로그인하세요!</p>
			  <!-- Email input -->
			  <div class="form-outline mb-4">
			    <input type="email" id="email" class="form-control" name="email" />
			    <label class="form-label" for="form2Example1">이메일</label>
			  </div>
			
			  <!-- Password input -->
			  <div class="form-outline mb-4">
			    <input type="password" id="pw" class="form-control" name="pw" />
			    <label class="form-label" for="form2Example2">비밀번호</label>
			  </div>
			  
			
			  <!-- 2 column grid layout for inline styling -->
			  <div class="row mb-4">
			
			    <div class="col">
			      <!-- Simple link -->
			      <a href="/dreamjourney/findid">아이디 찾기</a>
			      <a href="/dreamjourney/findpw">비밀번호 찾기</a>
			    </div>
			  </div>
			
			  <!-- Submit button -->
			  <button type="submit" class="btn btn-primary btn-block mb-4" id="btnLogin">Sign in</button>
			  <c:if test="${message != null}">
				 <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.
				 </div>
				</c:if>
			  <!-- Register buttons -->
			  <div class="text-center">
			    <p>회원이 아니신가요? <a href="/dreamjourney/register">회원가입하기</a></p>
			  </div>
			</form>
				         
		</div>
 	</div>
                


    <%@ include file="/resources/inc/footer.jsp" %>
    
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
  integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
    
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	$(function(){
		$("#btnLogin").click(function(){
			var email=$("#email").val();
			var passwd=$("#pw").val(); 
		 	if(email == ""){
		  		alert("아이디를 입력하세요");
		  		$("#email").focus(); //입력포커스 이동
	
		  		return; //함수 종료
			}
			if(passwd==""){
				alert("비밀번호를 입력하세요"); 
				$("#pw").focus();
				return;
			}
		//폼 내부의 데이터를 전송할 주소
		 	document.form1.action= "${path}/dreamjourney/gloginok";
		 	document.form1.submit(); //제출
		 });
	});
</script>
</body>

</html>






