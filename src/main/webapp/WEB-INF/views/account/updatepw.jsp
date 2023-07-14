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
	
	
	<form id="updatepw" action="/dreamjourney/updatepwok" method="POST">
		<div class="container-fluid page-header">
			<div class="container">
				<div
					class="d-flex flex-column align-items-center justify-content-center"
					style="min-height: 400px">
					<h3 class="display-4 text-white text-uppercase">비밀번호 찾기</h3>
				</div>
			</div>
		</div>
	
		<div class="container_wj">
			<div class="container_regi">
				<h2 style="text-align: center; padding-top: 30px;">비밀번호 변경</h2>
				<div style="max-width: 100%; height: 65vh; display: flex;">
					<div class="regicon_wj">
						<div class="mb-3" style="margin: 0 auto;">
							<label for="exampleFormControlInput1" class="form-label">비밀번호</label><br>
							<span id="pw"></span> <input type="password" required
								class="form-control" id="passwordField"
								placeholder="새로운 비밀번호(6~12자 이내, 영문/숫자/특수문자 최소 1개 포함)"
								style="width: 90%;" onkeyup="checkPasswordValidity()">
						</div>
	
						<div class="mb-3" style="margin: 0 auto;">
							<label for="exampleFormControlInput1" class="form-label">비밀번호
								확인</label><br>
							<span style="color: tomato;" id="passwordSame"></span> <input required
								type="password" id="passwordFieldCheck" class="form-control"
							placeholder="비밀번호는 동일하게 입력하세요"
								onkeyup="checkPasswordMatch()" style="width: 90%;" name="pw">
						</div>
						<input type="hidden" name="email" id="email" value="${param.email }">
						<input type="submit" value="변경하기" id="updateokpwbtn" style="visibility: hidden;">
	
					</div>
				</div>
			</div>
		</div>
	</form>
<%@ include file="/resources/inc/footer.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	

/* 비밀번호 유효성 체크 */
function checkPasswordValidity() {
	  const passwordField = document.getElementById("passwordField");
	  const password = passwordField.value;
	  
	  const regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[a-zA-Z\d@$!%*#?&]{6,20}$/;
	  
	  if (regex.test(password)) {
	    document.getElementById("pw").textContent = "비밀번호 형식이 유효합니다.";
	    document.getElementById("pw").style.color = "blue";
	  } else {
		  document.getElementById("pw").innerHTML = `비밀번호는 영문, 숫자, 특수문자를 최소 1개 이상 포함하고<br>
			  6자~20자 이내여야 합니다.`;
			  
	    document.getElementById("pw").style.color = "tomato";
	  }
	}

/* 비밀번호 동일 여부 */
function checkPasswordMatch() {
	  const password = document.getElementById("passwordField").value;
	  const passwordCheck = document.getElementById("passwordFieldCheck").value;
	  const passwordMatchText = document.getElementById("passwordSame");
	  
	  if (password === passwordCheck && document.getElementById("pw").style.color=="blue") {
	    passwordMatchText.textContent = "비밀번호가 일치합니다.";
	    passwordMatchText.style.color = "blue";
	    $('#updateokpwbtn').css('visibility','visible');
	  } else {
	    passwordMatchText.textContent = "비밀번호가 일치하지 않습니다.";
	    passwordMatchText.style.color = "tomato";
	  }
	}
	

</script>
</body>
</html>






