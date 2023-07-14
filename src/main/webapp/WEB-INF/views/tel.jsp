<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://me2.do/5BvBFJ57">
<style>
</style>
</head>
<body>

	<button onclick="requestCert()">인증하기</button>

	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	/* 판매자 함수 호출 */
		const userCode = "imp45442441";
		IMP.init(userCode);
		
		/* 본인인증 페이지 호출 */
		function requestCert() {
			IMP.certification({
				  pg: "inicis_unified",
				  merchant_uid: "MIIiasTest", // 주문 번호
				  popup: false // PC환경에서는 popup 파라미터가 무시되고 항상 true 로 적용됨
				}, function (rsp) { // callback
				  if (rsp.success) {
				    console.log(rsp);
				    // 인증 성공 시 로직,
				    jQuery.ajax({
				      url: "/dreamjourney/telCheck2",
				      method: "POST",
				      data: { imp_uid: rsp.imp_uid }
				    });
				  } else {
				    // 인증 실패 시 로직,
				    alert("인증에 실패하였습니다. 에러 내용: " + rsp.error_msg);
				  }
				});

			  
			}

	</script>
</body>
</html>
