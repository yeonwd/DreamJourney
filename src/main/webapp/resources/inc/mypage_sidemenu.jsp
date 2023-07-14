<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true" %>
<style>
#menucontainer {
	border: 1px solid #CCCCCC;
	width: 15%;
	height: 800px;
	margin-left: 100px;
	margin-right: 30px;
	border-radius: 20px;
	padding-left: 30px;
	padding-right: 30px;
}

#sidemenu {
	text-align: left;
	width: 100%;
	height: 100%;
}

#sidemenu tr td span:hover {
  cursor: pointer;
}

#temp {
position: relative;
height: 100%;
}

#unregister {
	position: absolute;
	bottom: 10px;
	right: 0;
	opacity: 0.4;
	font-size: small;
}



</style>
<div id="menucontainer">
<div id="temp">
	<table id="sidemenu">
		<tr style="height: 30%; text-align: center">
			<td><img src="../resources/img/마이페이지유저.png" style="max-width: 100%; max-height: 100%;"></td>
		</tr>
		<tr style="height: 10%; text-align: center">
			<td onclick="location.href='/dreamjourney/mypage/info'"><span>${sessionScope.name}(${sessionScope.nickname})</span></td>
		</tr>
		<tr style="height: 5%;">
			<td onclick="location.href='/dreamjourney/mypage/journey'"><span class="material-symbols-outlined">travel_explore</span><span>내	여행</span></td>
		</tr>
		<tr style="height: 5%;">
			<td onclick="location.href='/dreamjourney/mypage/mypage_reserve'"><span class="material-symbols-outlined">event_available</span><span>내
				예매내역</span></td>
		</tr>
		<tr style="height: 5%;">
			<td onclick="location.href='/dreamjourney/mypage/mypage_write'"><span class="material-symbols-outlined">stylus_note</span><span>내
				작성글</span></td>
		</tr>
		<tr style="height: 5%;">
			<td onclick="location.href='/dreamjourney/mypage/review'"><span class="material-symbols-outlined">comment</span><span>내 리뷰</span></td>
		</tr>
		<tr style="height: 5%;">
			<td onclick="location.href='/dreamjourney/mypage/mypage_bookmark'"><span class="material-symbols-outlined">star</span><span>즐겨찾기</span></td>
		</tr>
		<tr style="height: 55%;">
		</tr>
	</table>
	<form method="POST" action="/dreamjourney/mypage/unregi">
	<button type="submit" id="unregister" name="member_seq" value="${sessionScope.seq}">회원 탈퇴</button>
	</form>
	</div>
</div>










