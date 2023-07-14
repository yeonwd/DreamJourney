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
				<h2 style="text-align: center; padding-top: 30px;">아이디 찾기</h2>
				<div>
				<button id="telcheckBtn" style="position: relative; top: 90px;" class="btn btn-primary" type="button" onclick="requestCert()">전화번호 인증</button>
				</div>
				<div>
				  <button type="submit" class="btn btn-primary btn-block mb-4" onclick="location.href='/dreamjourney/index';" style="width: 150px; display: inline; position: relative; top: 150px;">메인화면으로</button>
				</div>
			</div>
		</div>
<%@ include file="/resources/inc/footer.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	

const userCode = "imp45442441";
IMP.init(userCode);			
function requestCert() {
	IMP.certification({
		pg: "inicis_unified",
		merchant_uid: "MIIiasTest", // 주문 번호
		popup: false // PC환경에서는 popup 파라미터가 무시되고 항상 true 로 적용됨
	}, function (rsp) { //callback
	    if (rsp.success) {
	        console.log(rsp);
	       	// 인증 성공 시 로직,
	        $.ajax({
	            url: "/dreamjourney/telCheck2",
	            method: "POST",
	            dataType:'json',		
	            data: { imp_uid: rsp.imp_uid },
	            success: function(data) {
	            	 if (data.isAdult) {
                         /* 이름, 번호 대조  */
                         if ((data.cnt)==1) {
                        	location.href="/dreamjourney/findidok?tel="+data.tel;
                         }else{
                        		console.log(data.tel);
								console.log(data.name);
                         }
	            	 }
	            },
	            error: function() {
	                alert("에러입니다");
	                document.location.reload();
	            }
	        });
	    } else {
	        // 인증 실패 시 로직,
	        alert("인증에 실패하였습니다. 에러 내용: " + rsp.error_msg);
	    }
	    });
}

	/* 핸드폰인증을 해야만함 */
$("#regForm").on("submit", function() {
	var telValue = $("#tel").val();
	
	if (!telValue) {
		alert("번호인증이 필요합니다.");
		return false; // 폼 제출 중지
	}
	
	// 추가 유효성 검사 로직
		
	// 폼 제출
	return true;
});	
	

</script>
</body>
</html>






