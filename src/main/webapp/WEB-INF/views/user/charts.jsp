<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<!-- Page font -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<!-- Chart -->
<script src="${contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
<script src="${contextPath}/resources/js/charts-custom.js"></script>

</head>
<style>
	
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	footer {
	  position: fixed;
	  left: 0;
	  bottom: 0;
	  width: 100%;
	}

</style>
		

<body>

	<!-- header -->
	<header>
		<nav class="navbar navbar-expand navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="${contextPath}"> 
				<img class="img-circle" alt="main_icon" src="${contextPath}/resources/img/truck.png" width="40" height="40">
					클린시티
				</a>
				<button class="navbar-toggler" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse flex-row-reverse"
					id="collapsibleNavbar">
					<c:if test="${empty USER}">
						<ul class="nav navbar-nav float-lg-right">
							<li class="nav-item mr-sm-2"><button id="loginBtn"
									type="button" class="btn btn-light m-1">로그인</button></li>
							<li class="nav-item mr-sm-2"><button id="joinBtn"
									type="button" class="btn btn-light m-1">회원가입</button></li>
						</ul>
					</c:if>
					<c:if test="${not empty USER}">
						<ul class="nav navbar-nav float-lg-right">
							<li class="nav-item mr-sm-2"><a class="nav-link"
								href="${contextPath}/user/mypage/${USER.userid}"><i
									class="fas fa-user"></i>${USER.userid}</a></li>

							<li class="nav-item mr-sm-2"><a class="nav-link"
								href="${contextPath}/user/logout"><i
									class="fas fa-sign-out-alt"></i>로그아웃 </a></li>
						</ul>
					</c:if>
				</div>
			</div>
		</nav>
	</header>

	<div class="container">
		<div class="jumbotron mt-5 content-center">
			<h4><i class="fas fa-info"></i>&nbsp;마이페이지</h4>
			<br/>
			<ul class="nav nav-tabs nav-justified">
				<li class="nav-item"><a class="nav-link active" href="#">정보수정</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/user/mypage/${USER.userid}/chart">이용 현황</a>
				</li>
			</ul>
			<!-- Chart-->
			<br>
			<h5>
				<i class="fas fa-user"></i>${USER.userid} 님의 쓰레기통 수거 현황
			</h5>
			<div class="row">
				<div class="col-10 offset-1">
					<div class="card line-chart-example">
						<div class="card-header d-flex align-items-center">일별 쓰레기 수거량
						</div>
						<div class="card-body">
							<canvas id="lineChartExample">${trash}</canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
	


	<!-- footer -->
	<footer class="mt-5 p-3 bg-dark text-white">
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-6">
					깨끗한 도시 &copy; 2019.05.23
				</div>
				<div class="col-sm-6 text-right">
						Design by <a
							href="https://bootstrapious.com/p/bootstrap-4-dashboard"
							class="external">Bootstrapious</a>
					
					<!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions and it helps me to run Bootstrapious. Thank you for understanding :)-->
				</div>
			</div>
		</div>
	</footer>
	
</body>      

</html>