<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<link rel="apple-touch-icon" sizes="180x180" href="/resources/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="/resources/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="/resources/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="/resources/assets/css/theme.css" rel="stylesheet" />
    
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-5 d-block" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container"><a class="navbar-brand" href="/"><img src="/resources/assets/img/logo.svg" height="34" alt="logo" /></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"> </span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base align-items-lg-center align-items-start">
              <li class="nav-item px-3 px-xl-4"><a class="nav-link fw-medium" aria-current="page" href="/jiacen.do">Service</a></li>
              <li class="nav-item px-3 px-xl-4"><a class="nav-link fw-medium" aria-current="page" href="/practiceList.do?reqPage=1">내 패이보릿 목록</a></li>
              <li class="nav-item px-3 px-xl-4"><a class="nav-link fw-medium" aria-current="page" href="/practice.do">내 패이보릿 등록</a></li>
              
              <c:choose>
              	<c:when test="${not empty sessionScope.owner }">
              		<li class="nav-item px-3 px-xl-4"><a class="nav-link fw-medium" aria-current="page" href="/goPensionRegistFrm.do">팬션등록하기</a></li>
              	</c:when>
              	
              	<c:otherwise>
              		<li class="nav-item px-3 px-xl-4"><a class="nav-link fw-medium" aria-current="page" href="#testimonial">팬션목록</a></li>
              	</c:otherwise>
              </c:choose>
              
              <c:choose>
              	<c:when test="${not empty sessionScope.member }">
              		<li class="nav-item px-3 px-xl-4"><a class="nav-link fw-medium" aria-current="page" href="#">${sessionScope.member.memberName }</a></li>
              		<li class="nav-item px-3 px-xl-4"><a class="btn btn-outline-dark order-1 order-lg-0 fw-medium" href="/logout.do">Logout</a></li>
              		
              	</c:when>
              	
              	<c:when test="${not empty sessionScope.owner }">
              		<li class="nav-item px-3 px-xl-4"><a class="nav-link fw-medium" aria-current="page" href="#">${sessionScope.owner.ownerName }</a></li>
              		<li class="nav-item px-3 px-xl-4"><a class="btn btn-outline-dark order-1 order-lg-0 fw-medium" href="/logout.do">Logout</a></li>
              	</c:when>
              	
              	<c:otherwise>
              		<li class="nav-item px-3 px-xl-4"><a class="nav-link fw-medium" aria-current="page" href="/loginFrm.do">login</a></li>
					<li class="nav-item px-3 px-xl-4"><a class="btn btn-outline-dark order-1 order-lg-0 fw-medium" href="/signFrm.do">Sign Up</a></li>
              	</c:otherwise>
              </c:choose>
              
              <li class="nav-item dropdown px-3 px-lg-0"> <a class="d-inline-block ps-0 py-2 pe-3 text-decoration-none dropdown-toggle fw-medium" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">연습</a>
                <ul class="dropdown-menu dropdown-menu-end border-0 shadow-lg" style="border-radius:0.3rem;" aria-labelledby="navbarDropdown">
                  <li><a class="dropdown-item" href="/adminPage.do?reqPage=1">관리자</a></li>
                  <li><a class="dropdown-item" href="#!">BN</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>