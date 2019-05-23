<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<!-- Page font -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
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
				<a class="navbar-brand" href="${contextPath}"> <img
					class="img-circle" alt="main_icon"
					src="${contextPath}/resources/img/truck.png" width="40" height="40">
					깨끗한도시
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
				<li class="nav-item">
					<a class="nav-link active" href="${contextPath}/user/mypage/${USER.userid}/edit">정보수정</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/user/mypage/${USER.userid}/chart">이용 현황</a>
				</li>
			</ul>
			<!-- User edit -->
			<br>
			<h1 class="h1 display"><i class="fas fa-sign-in-alt"></i> 회원정보 수정</h1>
			<form:form modelAttribute="user">
				<form:hidden path="userid" class="form-contorl" />
				<div class="form-group m-4">
					<h4>
						<i class="fas fa-user"></i> 회원명: ${USER.userid}
					</h4>
				</div>
				<div class="form-group m-4">
					<label for="passwd">비밀번호</label>
					<form:password path="passwd" class="form-control" />
					<form:errors path="passwd" element="div" cssClass="error" />
				</div>

				<div class="form-group m-4">
					<label for="email"><i class="fas fa-envelope"></i> 이메일</label>
					<form:input tpye="email" path="email" class="form-control" />
					<form:errors path="email" element="div" cssClass="error" />
				</div>
				<div class="form-group m-4">
					<label for="address"><i class="fas fa-map-marker-alt"></i>
						주소</label>
					<form:input type="text" path="address" class="form-control" />
					<form:errors path="address" element="div" cssClass="error" />
				</div>
				<div class="form-group m-4">
					<label for="phone"><i class="fas fa-phone"></i> 전화번호</label>
					<form:input type="phone" path="phone" class="form-control" />
					<form:errors path="phone" element="div" cssClass="error" />
				</div>
				<div class="container text-center mt-4">
					<button id="submitBtn" type="submit" class="btn btn-secondary">수정</button>
					<button id="cancleBtn" type="button" class="btn btn-danger">다시작성</button>
				</div>
			</form:form>

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