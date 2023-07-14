<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.email_notval {
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
	padding-left: 0px !important;
}
</style>
</head>
<body>
	<%@ include file="/resources/inc/header.jsp"%>


	<form id="regForm" action="/dreamjourney/add" method="POST">
		<div class="container-fluid page-header">
			<div class="container">
				<div
					class="d-flex flex-column align-items-center justify-content-center"
					style="min-height: 400px">
					<h3 class="display-4 text-white text-uppercase">회원가입</h3>
				</div>
			</div>
		</div>

		<div class="container_wj">
			<div class="container_regi">
				<h2 style="text-align: center; padding-top: 30px;">회원가입</h2>
				<div style="max-width: 100%; height: 65vh; display: flex;">
					<div class="regicon_wj">
						<div class="mb-3" style="margin: 0 auto;">
							<label for="exampleFormControlInput1" class="form-label">이름</label>
							<input type="text" class="form-control" id="name" required
								name="name" placeholder="이름" style="width: 90%;"
								onkeyup="checkReg(event)" maxlength="8">
						</div>
						<div class="mb-3" style="margin: 0 auto;">
							<label for="exampleFormControlInput1" class="form-label">닉네임</label><span
								style="margin-left: 10px;" class="nick_ok">사용 가능한 닉네임입니다.</span>
							<span style="margin-left: 10px;" class="nick_already">중복된
								닉네임 입니다.</span> <input type="text" class="form-control" id="nick"
								required name="nickname" placeholder="닉네임(3~15자 이내)"
								maxlength="15" style="width: 90%;" oninput="checkNick()">

						</div>
						<div class="mb-3" style="margin: 0 auto;">
							<label for="exampleFormControlInput1" class="form-label">이메일</label>
							<button type="button" class="btn btn-primary" id="mailChkbtn"
								style="margin-left: 10px; margin-bottom: 10px;">본인인증</button>
							<span style="margin-left: 10px;" class="email_notval">올바르지
								않은 이메일 형식입니다.</span> <span style="margin-left: 10px;" class="email_ok">사용
								가능한 이메일입니다.</span> <span style="margin-left: 10px;"
								class="email_already">중복된 이메일 입니다.</span> <input type="email"
								class="form-control" id="email" required
								placeholder="example001@naver.com" style="width: 90%;"
								name="email" oninput="checkEmail()">
							<div class="mailChk-box">
								<input class="form-control mailChkInput" required
									style="width: 90%;" placeholder="인증번호 6자리를 입력해주세요!"
									disabled="disabled" maxlength="6">
							</div>
							<span id="mailChkWarn"></span>
						</div>
						<div class="mb-3" style="margin: 0 auto;">
							<label for="exampleFormControlInput1" class="form-label">비밀번호</label><br>
							<span id="pw"></span> <input type="password" required name="pw"
								class="form-control" id="passwordField"
								placeholder="비밀번호(6~12자 이내, 영문/숫자/특수문자 최소 1개 포함)"
								style="width: 90%;" onkeyup="checkPasswordValidity()">
						</div>

						<div class="mb-3" style="margin: 0 auto;">
							<label for="exampleFormControlInput1" class="form-label">비밀번호
								확인</label><br> <span style="color: tomato;" id="passwordSame"></span>
							<input required type="password" id="passwordFieldCheck"
								class="form-control" placeholder="비밀번호는 동일하게 입력하세요"
								onkeyup="checkPasswordMatch()" style="width: 90%;">
						</div>

						<div class="mb-3" style="margin: 0 auto;">
							<label for="exampleFormControlInput1" class="form-label">전화번호</label>
							<button id="telcheckBtn"
								style="margin-left: 10px; margin-bottom: 10px;"
								class="btn btn-primary" type="button" onclick="requestCert()">전화번호
								인증</button>
							<span style="margin-left: 10px;" class="tel_ok">사용 가능한
								전화번호 입니다.</span> <span style="margin-left: 10px;" class="tel_already">중복된
								전화번호 입니다.</span> <input type="text" required class="form-control"
								id="tel" name="tel" style="width: 90%;" placeholder="번호를 인증하세요."
								readonly>
						</div>
					</div>
					<div class="regicon_wj">
						<div style="margin-top: 5rem;">
							<b style="color: #000000;"> 개인정보 처리방침 </b>
						</div>
						<div
							style="border-top: 1px solid #b3b3b3; width: 80%; margin-top: 10px;">
							<div>회원가입을 위해 모든 개인정보 처리방침에 동의해 주시기 바랍니다.</div>
							<div class="form-check" style="margin-top: 20px;">
								<input class="form-checkInput" type="checkbox" value=""
									id="allcheck"> <label class="form-check-label"
									for="flexCheckDefault"> <b style="color: #000000;">본인은
										아래의 모든 개인정보 처리방침에 동의합니다</b>
								</label>
							</div>
							<div style="margin-top: 10px; background-color: #EDF1FC;">
								<div class="form-check" style="margin-top: 20px;">
									<label class="form-check-label" for="flexCheckDefault"><input
										class="form-checkInput" type="checkbox" value="" required
										id="flexCheckDefault"> 본인은 본 서비스 약관에 동의하며 18세 이상임을
										확인합니다. <span style="color: #6268FF;">[필수]</span> </label>
								</div>
								<div class="form-check" style="margin-top: 20px;">
									<label class="form-check-label" for="flexCheckDefault"><input
										class="form-checkInput" type="checkbox" value="" required
										id="flexCheckDefault"> 본인은 개인정보 처리방침에 따라 본인의 개인 정보를
										사용하고 수집하는 것에 동의합니다. <span style="color: #6268FF;">[필수]</span>
									</label>
								</div>
								<div class="form-check" style="margin-top: 20px;">
									<input class="form-checkInput" type="checkbox" value=""
										required id="flexCheckDefault"> <label
										class="form-check-label" for="flexCheckDefault"> 본인은
										개인정보 처리방침에 따라 제 3자에게 본인의 개인 정보를 제공하는 것에 동의합니다. <span
										style="color: #6268FF;">[필수]</span>
									</label>
								</div>
							</div>
							<div
								style="display: flex; justify-content: center; margin-top: 40px;">

								<button type="submit" class="btn btn-primary">회원가입</button>
								<button type="button" class="btn btn-secondary"
									style="margin-left: 30px; background-color: #dcdcdc"
									onclick="history.back()">돌아가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<%@ include file="/resources/inc/footer.jsp"%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
                }
            } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                $('.email_already').css("display","inline-block");
                $('.email_ok').css("display", "none");
                $('.email_notval').css("display", "none");
                alert("이메일을 다시 입력해주세요");
                $('#email').val('');
            }
        },
        error:function(){
            alert("에러입니다");
        }
    });
    };

/* 중복 닉네임 체크 */
    function checkNick(){
        var nick = $('#nick').val(); //id값이 "id"인 입력란의 값을 저장
        console.log(nick);

        $.ajax({
            url:'./nickCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{nick:nick},
            dataType: 'json',
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 				 // 이메일 형식 확인
                    $('.nick_ok').css("display","inline-block"); 
                    $('.nick_already').css("display", "none");

                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.nick_already').css("display","inline-block");
                    $('.nick_ok').css("display", "none");
                    alert("닉네임을 다시 입력해주세요");
                    $('#nick').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
        };
    

$('#mailChkbtn').click(function() {
	const email = $('#email').val(); // 이메일 주소값 얻어오기
	
	 // 이메일 형식 확인
    if (!validateEmail(email)) {
        alert('올바른 이메일 형식이 아닙니다.');
        return; // 메서드 실행 중지
    }

	const checkInput = $('.mailChkInput') // 인증번호 입력하는곳 
	
	$.ajax({
		type : 'get',
		url : '<c:url value ="/mailCheck?email="/>'+email, // GET방식으로 사용자가 입력한 email 전송
		success : function (data) { //성공시 이메일 인증번호를 data변수에 담아서 함수 실행
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	});
});

//이메일 형식 확인
function validateEmail(email) {
    const regex = /^[\w.-]+@[a-zA-Z_-]+?\.[a-zA-Z]{2,3}$/;
    return regex.test(email);
}

// 인증번호 비교 
// mailChkInput 클래스를 가진 요소에서 포커스가 해제되었을 때, 해당 이벤트 핸들러 내에 작성된 로직이 실행
$('.mailChkInput').blur(function () {
	const inputCode = $(this).val();
	const $resultMsg = $('#mailChkWarn');
	
	if(inputCode == code){
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color','blue');
		$('#mailChkbtn').attr('disabled',true);
		$('#email').attr('readonly',true);
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!');
		$resultMsg.css('color','red');
	}
});

/* 이름에 한글만 입력하는 함수 */
function checkReg(event) {
//const regExp = /[^0-9a-zA-Z]/g; // 숫자와 영문자만 허용
const regExp = /[^ㄱ-ㅎ|가-힣]/g; // 한글만 허용
const del = event.target;
if (regExp.test(del.value)) {
	  alert('한글만 입력해주세요.');
    del.value = del.value.replace(regExp, '');
}
}; 

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
	  
	  if (password === passwordCheck) {
	    passwordMatchText.textContent = "비밀번호가 일치합니다.";
	    passwordMatchText.style.color = "blue";
	  } else {
	    passwordMatchText.textContent = "비밀번호가 일치하지 않습니다.";
	    passwordMatchText.style.color = "tomato";
	  }
	}
	
/* 전화번호 본인인증 */
/* 판매자 함수 호출 */
const userCode = "imp45442441";
	IMP.init(userCode);			
		function requestCert() {
			IMP.certification({
			   pg: "inicis_unified",
			   merchant_uid: "MIIiasTest",
			   popup: false // PC환경에서는 popup 파라미터가 무시되고 항상 true 								로적용됨
			   }, function (rsp) { // callback
			        if (rsp.success) {
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
			                        	alert("사용할 수 없는 번호입니다.");                    	
			                         }else{
										if ($('#name').val() != data.name){
										alert("잘못된 정보 입니다, 다시 인증하세요.")
    									$('#name').val('');
										} else {
											$('#tel').val(data.tel);
										   $("#telcheckBtn").attr("disabled", true);
											$('#name').attr("readonly", true);
											}
			                        	 }	                        
			                         }		                         
			                     else {    
			                    	 /* 미성년자 일시 index페이지 소환 */
			                         alert(data.errorMessage);
			                         location.href = "/dreamjourney/index.do";
			                     }
			                },
			                error: function() {
			                    alert("에러입니다");
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






