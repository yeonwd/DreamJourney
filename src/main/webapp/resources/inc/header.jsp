<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<header>
    <!-- Topbar Start -->
    <div class="container-fluid bg-light pt-3 d-none d-lg-block">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">

                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                    	<c:if test="${sessionScope.name != null }">
                    		<p>${sessionScope.name}(${sessionScope.nickname })님 환영합니다</p>
                    		<p class="text-body px-3">|</p>
                    		<p><a href="/dreamjourney/mypage/info">마이 페이지</a></p>
                    		<p class="text-body px-3">|</p>
                    		<p><a href="/dreamjourney/glogout">로그아웃</a></p>
                    	</c:if>
                    	<c:if test="${sessionScope.name == null }"> 
	                        <p><a href="/dreamjourney/login">로그인</a></p>
        	                <p class="text-body px-3">|</p>
    	                    <p><a href="/dreamjourney/register">회원가입</a></p>
                    	</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative nav-bar p-0">
        <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
                <a href="/dreamjourney/index" class="navbar-brand">
                    <h1 class="m-0 text-primary"><span class="text-dark">Dream</span>Journey</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between px-5" id="navbarCollapse">
                    <div class="navbar-nav ml-auto py-0">
                        <a href="/dreamjourney/index" class="nav-item nav-link active">홈</a>
                        <a href="/dreamjourney/reservation" class="nav-item nav-link">예약/예매</a>
                        <a href="/dreamjourney/board/share" class="nav-item nav-link">추천 여행지</a>
                        <div onclick="location.href='/dreamjourney/board';" class="nav-item nav-link">커뮤니티</div>
                        
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Contact</a>
                            <div class="dropdown-menu border-0 rounded-0 m-0">
                                
                                <a href="single.html" class="dropdown-item">공지사항</a>
                                <a href="single.html" class="dropdown-item">FAQ/문의</a>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->
	</header>



