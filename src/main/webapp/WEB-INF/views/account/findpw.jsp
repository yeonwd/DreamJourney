<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resources/inc/asset.jsp"%>
<style>
.email_ok {
	color: tomato;
	display: none;
}

.email_already {
	color: blue;
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
				<h3 class="display-4 text-white text-uppercase">비밀번호 찾기</h3>
			</div>
		</div>
	</div>

	<div class="container_wj">
		<div class="container_regi">
			<h2 style="text-align: center; padding-top: 30px;">이메일 인증</h2>
			<div style="max-width: 100%; height: 30vh; display: flex;">
				<div class="regicon_wj">
					<div class="mb-3" style="margin: 0 auto;">
						<form action="/dreamjourney/updatepw" method="get">
						<label for="exampleFormControlInput1" class="form-label">이메일</label>
						<button type="button" class="btn btn-primary" id="mailChkbtn"
							style="margin-left: 10px; margin-bottom: 10px;">본인인증</button>
													<span style="margin-left: 10px;" class="email_notval">올바르지 않은 이메일 형식입니다.</span>
						<span style="margin-left: 10px;" class="email_ok">존재하지 않는 이메일입니다.</span> 
						<span style="margin-left: 10px;" class="email_already">존재하는 이메일 입니다.</span> <input type="email" class="form-control" id="email" required
							placeholder="example001@naver.com" style="width: 90%;"
							name="email" oninput="checkEmail()">
								<div class="mailChk-box">
<input class="form-control mailChkInput"  required style="width:90%;" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
</div>
						<span id="mailChkWarn"></span>
						<input type="submit" style="visibility: hidden;" id="updatepwbtn" value="비밀번호 변경하기">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/resources/inc/footer.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	
	/* 중복 이메일 체크 */
	function checkEmail(){
	    var email = $('#email').val(); //id값이 "id"인 입력란의 값을 저장
	
	    $.ajax({
	        url:'./emailCheck', //Controller에서 요청 받을 주소
	        type:'post', //POST 방식으로 전달
	        data:{email:email},
	        dataType: 'json',
	        success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
	            if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 				 // 이메일 형식 확인
	                if (!validateEmail(email)) {
	                $('.email_notval').css("display","inline-block"); 
	             	$('.email_ok').css("display","none"); 
	                $('.email_already').css("display","none");
	                } else {
	                	$('.email_notval').css("display", "none");
	                    $('.email_ok').css("display","inline-block"); 
	                    $('.email_already').css("display", "none");
	                    $('#mailChkbtn').css("disabled", "disabled");
	                }
	            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
	                $('.email_already').css("display","inline-block");
	                $('.email_ok').css("display", "none");
	                $('.email_notval').css("display", "none");
	                
	            }
	        },
	        error:function(){
	            alert("에러입니다");
	        }
	    });
	    };

	$('#mailChkbtn').click(function() {
		const email = $('#email').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		
		 // 이메일 형식 확인
	    if (!validateEmail(email)) {
	        alert('올바른 이메일 형식이 아닙니다.');
	        return; // 메서드 실행 중지
	    }
	
		const checkInput = $('.mailChkInput') // 인증번호 입력하는곳 
		
		$.ajax({
			type : 'get',
			url : '<c:url value ="/findpwcheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	}); // end send eamil
	
	//이메일 형식 확인
	function validateEmail(email) {
	    const regex = /^[\w.-]+@[a-zA-Z_-]+?\.[a-zA-Z]{2,3}$/;
	    return regex.test(email);
	}
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mailChkInput').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mailChkWarn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','blue');
			$('#mailChkbtn').attr('disabled',true);
			$('#email').attr('readonly',true);
			$('.mailChkInput').attr('readonly', true);
			$('#updatepwbtn').css('visibility','visible');
			
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
			$resultMsg.css('color','red');
		}
	});


	
</script>
</body>
</html>






