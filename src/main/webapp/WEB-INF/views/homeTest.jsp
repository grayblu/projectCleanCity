<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/home.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<title>자율주행</title>
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light shadow fixed-top">
  <div class="container">
    <a class="navbar-brand" href="#">Clean City</a>
    <c:if test="${empty USER}">
	    <a class="nav-link active" href="${contextPath}/user/login">
		   	<i class="fas fa-sign-in-alt"></i> login</a>
	    <a class="nav-link active" href="${contextPath}/user/join">
		   	<i class="fas fa-sign-in-alt"></i> join</a>    
		    
    </c:if>
    <c:if test="${not empty USER}">
		<a class="nav-link" href="${contextPath}/admin/main">
			<i class="fas fa-user"></i> ${USER.userid}</a>
		<a class="nav-link" href="${contextPath}/logout">
			<i class="fas fa-sign-out-alt"></i> 로그아웃</a>
    </c:if>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#about">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#services">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Full Page Image Header with Vertically Centered Content -->
<header class="masthead">
  <div class="container h-100">
    <div class="row h-100 align-items-center">
      <div class="col-12 text-center">
        <h1 class="font-weight-light">클린 시티 프로젝트</h1>
        <p class="lead">자율주행을 활용한 IoT 쓰레기 수거 트럭 개발</p>
      </div>
    </div>
  </div>
</header>

<!-- Page Content -->
<section id="about">
  <div class="container">
    <h2 class="font-weight-light text-center mb-3">About</h2>
    <h4>우리의 프로젝트 목표는 자율주행 기술을 활용하여 도시 전역의 쓰레기를 효과적으로 수거하는 것입니다.</h4>
  </div>
</section>

<section id="services">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			    <h2 class="font-weight-light text-center mb-3">Service</h2>			
			</div>
		</div>
		<div class="row text-center">
			<div class="col-4">
				<i class="fas fa-map-marked-alt fa-4x"></i>
				<h2 class="global-positioning">위치 확인</h2>				
			</div>
			<div class="col-4">
				<i class="fas fa-users fa-4x"></i>
				<h2 class="remote">원격 주행</h2>
			</div>
			<div class="col-4">
				<i class="fas fa-database fa-4x"></i>
				<h2 class="dashboard">수거 현황</h2>
			</div>
		</div>
	</div>
</section>

</body>
</html>