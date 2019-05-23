<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- header -->
<header>
	<nav class="navbar navbar-expand navbar-dark bg-dark fixed-top">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="${contextPath}">
	    	<img class="img-circle" alt="main_icon" src="${contextPath}/resources/img/truck.png" width="40" height="40">   클린시티
	    </a>
		<c:if test="${not empty USER}">
			<ul class="nav navbar-nav float-lg-right">
				<li class="nav-item mr-sm-2"><a class="nav-link"
					href="${contextPath}/admin/main"> <i class="fas fa-user"></i>${User.userid}</a></li>
	
				<li class="nav-item mr-sm-2"><a class="nav-link"
					href="${contextPath}/user/logout"> <i
						class="fas fa-sign-out-alt"></i>로그아웃
				</a></li>
			</ul>
		</c:if>
		</div>
	</nav>
</header>


</html>

