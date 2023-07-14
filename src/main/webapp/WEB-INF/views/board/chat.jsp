<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DreamJourney 동행</title>
<link rel="stylesheet" href="/dreamjourney/resources/css/chat.css">
<style>
html, body {
	padding: 0 !important;
	margin: 0 !important;
	background-color: #faf9f9 !important;
	display: block;
	overflow: hidden;
}

body>div {
	margin: 0;
	padding: 0;
}

hr {
	height: 10px;
	border: 0;
	box-shadow: 0 10px 10px -10px #bbb inset;
}

#main {
	width: 400px;
	height: 620px;
	margin: 3px;

	
	display: grid;
	grid-template-rows: repeat(12, 1fr);
}

#header {
	
}

#header>h2 {
	margin: 0px;
	margin-bottom: 10px;
	padding: 5px;
}

 #title {
	text-align: center;
 	font-weignt: bold;
 }
 
 #title > span {
 	color: #7AB730;
 }
 
 .caution {
 	text-align: center;
 	font-size: 12px;
 	color: #666;
 	margin-bottom: 10px;
 }
 
 .caution > span {
 	color: #EDBC40;
 	font-size: 10px;
 }
 
 #board-title {
 	height: 30px;
 	border-radius: 5px;
 
 	font-size: 16px;
 	font-weight: 600;
 	text-align: center;
 	padding: 8px 0 5px 0;
 	
 	color: #3A3A38;
 	
 	background-color: #F9F9F9;
 }
 
 #board-title > div {
 	display: inline-block;
 	width: 30px;
 	background-color: #ff5f2e;
 	padding-bottom: 5px;
 	
 	border-radius: 10px;
 	color: #FFF;
 }
 
 
#list {
	border: 1px solid var(- -border-color);
	box-sizing: content-box;
	padding: .5rem;
	grid-row-start: 2;
	grid-row-end: 12;
	font-size: 14px;
	overflow: auto;
	padding: 0 20px 0 20px;
}

 #msg {
 	width: 500px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 20px;
	outline: none;
	padding-left: 20px;
	padding-right: 20px;
	background-color: rgba(122, 183, 48, 0.3);
	box-shadow: 0 10px 10px -5px #DDD;
	margin-left: 10px;
 }

#list .item {
	font-size: 14px;
	margin: 15px 0;
}

#list .item>div:first-child {
	display: flex;
}

#list .item.me>div:first-child {
	justify-content: flex-end;
}

#list .item.other>div:first-child {
	justify-content: flex-end;
	flex-direction: row-reverse;
}

#list .item>div:first-child>div:first-child {
	font-size: 10px;
	color: #777;
	margin: 3px 5px;
}

#list .item>div:first-child>div:nth-child(2) {
	border: 1px solid var(- -border-color);
	display: inline-block;
	min-width: 30px;
	max-width: 250px;
	text-align: left;
	padding: 3px 7px;
}

#list .state.item>div:first-child>div:nth-child(2) {
	font-size: 13px;
}

#list .item>div:last-child {
	font-size: 10px;
	color: #777;
	margin-top: 5px;
}

#list .me {
	text-align: right;
}

#list .other {
	text-align: left;
}

#list .msg.me.item>div:first-child>div:nth-child(2) {
	background-color: rgba(48, 148, 238, 0.3);
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 20px;
	box-shadow: 0 10px 10px -5px #BBB;
	padding: 12px;

	
}

#list .msg.other.item>div:first-child>div:nth-child(2) {
	background-color: #F1F1F1;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-right-radius: 20px;
	box-shadow: 0 10px 10px -5px #BBB;

	padding: 12px;
}

#list .msg img {
	width: 150px;
}
</style>
</head>
<body>
	<!-- chat.jsp -->
	<h1 id="title">Dream<span>Journey</span></h1>
	<div class="caution"><span>●</span> 서로 예의를 지켜서 이야기해요!</div>
	<div id="main">
		<div id="header">
			<div id="board-title">${bdetail.title }<div>on</div>
			</div>
			<hr>
		</div>
		
		<div id="list">
		
		</div>
		<input type="text" id="msg" placeholder="메시지를 입력하고 Enter를 누르세요." maxlength="300">
	</div>
	
	
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/dayjs@1.11.8/dayjs.min.js"></script>
<script>

	
	// 채팅창 새로고침 방지
	window.onkeydown = function() {
		
		if (event.keyCode == 116) {
			event.preventDefault();
			return false;
		}
	};
	
	// 채팅 준비
	const url = 'ws://192.168.10.67/dreamjourney/chattingserver.do';
	
	let ws; // 웹소켓
	
	var name;
	
	// 서버와 연결
	function connect(name) {
		window.name = name;
		
		// 웹 소켓 연결하기
		console.log('웹 소켓 연결 직전');
		ws = new WebSocket(url);
		console.log('웹 소켓 연결 성공');
		
		ws.onopen = function(evt) {
			log('서버 연결 성공');
			
			// 접속자 알리기
			let chat = {
				code: '1',
				seq: 10,
				sender: window.name,
				receiver: '',
				content: '',
				regdate: dayjs().format('YYYY-MM-DD HH:mm:ss')
			};
			
			ws.send(JSON.stringify(chat));
			print('', '입장했습니다.', 'me', 'state', chat.regdate);
			
			$('#msg').focus();
		};
		
		
		ws.onmessage = function(evt) {
			log('메시지 수신');
			
			let chat = JSON.parse(evt.data);
			
			log(chat.code + ':' + chat.sender);
			
			if (chat.code == '1') {
				// 입장
				print('', `[\${chat.sender}]님이 입장했습니다.`, 'other', 'state', chat.regdate);
			} else if (chat.code == '2') {
				print('', `[\${chat.sender}]님이 퇴장했습니다.`, 'other', 'state', chat.regdate);
				
			} else if (chat.code == '3') {
				print(chat.sender, chat.content, 'other', 'msg', chat.regdate);
			}
				
		};
		
		// 채팅창 닫히고 실행되는 메소드
		ws.onclose = function(evt) {};
		
		// 채팅창에서 에러 발생시 실행되는 메소드
		ws.onerror = function(evt) {};
		
	} //connect
	
	// 확인용 로그 출력
	function log(msg) {
		console.log(`[\${new Date().toLocaleTimeString()}]` + msg);
	}
	
	// 채팅창에 메시지 출력하는 메소드
	function print(name, msg, side, state, time) {
		
		let temp = `
			<div class="item \${state} \${side}">
				<div>
					<div>\${name }</div>
					<div>\${msg }</div>
				</div>
				<div>\${time}</div>
			</div>
			`;
			
		$('#list').append(temp);
		scrollList();
		
	}

	
	$('#msg').keydown(function(evt) {
		
		if (evt.keyCode == 13) {
			let chat = {
				code:'3',
				sender: window.name,
				receiver: '',
				content: $('#msg').val(),
				regdate: dayjs().format('YYYY-MM-DD HH:mm:ss')
			};
			
			ws.send(JSON.stringify(chat));
			
			if (chat.code == 3) {
				print(window.name, chat.content, 'me', 'msg', chat.regdate);
			}
			
			$('#msg').val('').focus();
			
		}
	});
	
	
	// 채팅방 퇴장 메시지 
	$(window).on('beforeunload', function() {
		alert();
		$(opener.document).find('.in').css('opacity', 1);
		$(opener.document).find('.in').prop('disabled', false);
		
		let chat = {
				// 보내는 메시지
			code: '2',
			sender: window.name,
			receiver: '',
			content:'',
			regdate: dayjs().format('YYYY-MM-DD HH:mm:ss')
		};

		ws.send(JSON.stringify(chat));
		
	});
	
	// 스크롤바 자동으로 내리기
	function scrollList() {
		$('#list').scrollTop($('#list')[0].scrollHeight + 500);
	}
	
</script>
</body>
</html>






