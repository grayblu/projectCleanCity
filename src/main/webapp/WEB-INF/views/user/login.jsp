<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js">
	
</script>

<script>
	$.fn.cancle = function() {
		var self = this;

		self.click(function() {
			var form = self.closest('form')
			form.find('input').val('');
		});
	}
	$(function() {
		$('#cancleBtn').cancle();

		$('#joinBtn').on("click", function() {
			location = '${contextPath}/user/join';
		});
		$("#loginBtn").on("click", function() {
			location = '${contextPath}/user/login';
		});
	});
</script>

<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="/clean"><i class="fas fa-recycle"></i> 깨끗한도시</a>
		<button class="navbar-toggler" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse flex-row-reverse"
			id="collapsibleNavbar">
			<ul class="nav navbar-nav float-lg-right">
				<li class="nav-item mr-sm-2"><button id="loginBtn"
						type="button" class="btn btn-light m-1">로그인</button></li>
				<li class="nav-item mr-sm-2"><button id="joinBtn" type="button"
						class="btn btn-light m-1">회원가입</button></li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="jumbotron">
			<h3 class="m-3">
				<i class="fas fa-sign-in-alt"></i> 로그인
			</h3>
			<form:form modelAttribute="loginInfo">
				<div class="form-group m-4">
					<label for="userid"><i class="far fa-user"></i> 아이디</label>
					<form:input path="userid" class="form-control" />
					<form:errors path="userid" element="div" cssClass="error" />
				</div>
				<div class="form-group m-4">
					<label for="passwd"><i class="fas fa-lock"></i> 비밀번호</label>
					<form:input path="passwd" type="password" class="form-control" />
					<form:errors path="passwd" element="div" cssClass="error" />
				</div>
				<div class="container text-center mt-4">
					<button id="submitBtn" type="submit" class="btn btn-secondary">로그인</button>
					<button id="cancleBtn" type="button" class="btn btn-danger">다시작성</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>