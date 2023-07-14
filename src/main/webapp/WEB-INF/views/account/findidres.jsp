<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resources/inc/asset.jsp"%>
<style>
.email_ok {
	color: blue;
	display: none;
}

.email_already {
	color: tomato;
	display: none;
}

.email_notval{
	color: tomato;
	display: none;
}

.tel_ok {
	color: blue;
	display: none;
}

.tel_already {
	color: tomato;
	display: none;
}

.nick_ok {
	color: blue;
	display: none;
}

.nick_already {
	color: tomato;
	display: none;
}

.form-check {
	padding-left:0px !important; 
}

</style>
</head>
<body>
	<%@ include file="/resources/inc/header.jsp"%>
	
	
		<div class="container-fluid page-header">
			<div class="container">
				<div
					class="d-flex flex-column align-items-center justify-content-center"
					style="min-height: 400px">
					<h3 class="display-4 text-white text-uppercase">아이디 찾기</h3>
				</div>
			</div>
		</div>
	
		<div class="container-fluid" style="height: 500px; padding-left: 100px; padding-right: 100px; padding-top: 50px; padding-bottom: 50px;">
	 		<div style="text-align: center;">
				<h2 style="text-align: center; padding-top: 30px;">아이디 찾기 결과</h2>
					<p>${param.name }님의 아이디는 ${param.email }입니다.</p>
				  <button type="submit" class="btn btn-primary btn-block mb-4" onclick="location.href='/dreamjourney/index';" style="width: 200px; display: inline; position: relative; top: 150px;">메인화면으로</button>
			</div>
		</div>
<%@ include file="/resources/inc/footer.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	

	

</script>
</body>
</html>






