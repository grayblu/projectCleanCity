<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="text-center">사용자 로그인 페이지</h1>
<div class="row">
	<div class="col-sm-5 mx-auto">
		<h2 class="my-5 text-primary">
			<i class="fas fa-sign-in-alt"></i> 로그인
		</h2>
		<form:form modelAttribute="loginInfo">
			<div class="form-group">
				<label for="userId">사용자 ID</label>
				<form:input path="userId" class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">비밀번호</label>
				<form:password path="password" class="form-control" />
			</div>
			<div class="form-group">
				<!-- 전역 에러(id나 비번이 일치하지 않습니다): 보안 상의 이유로 잘못된 정보를 알려주지 않음 -->
				<form:errors path="" element="div" cssClass="error" />
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary">
					<i class="fas fa-sign-in-alt"></i> 로그인
				</button>
			</div>
		</form:form>
	</div>
</div>

</body>
</html>