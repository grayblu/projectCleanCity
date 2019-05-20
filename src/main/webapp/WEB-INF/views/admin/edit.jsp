<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<body>
      <!-- Breadcrumb-->
      <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="${contextPath}/admin/main">Home</a></li>
            <li class="breadcrumb-item active">Edit       </li>
          </ul>
        </div>
      </div>
      <section>
      <div class="container-fluid">
	      <!-- Page Header-->
          <header> 
            <h1 class="h1 display"><i class="fas fa-sign-in-alt"></i> 회원정보 수정</h1>
          </header>
			<form:form modelAttribute="user">
				<form:hidden path="userid" class="form-contorl" />
				<form:hidden path="passwd" class="form-contorl" />

				<div class="form-group m-4">
					<h4>
						<i class="fas fa-user"></i> 회원명: ${user.userid}
					</h4>
				</div>
				<div class="form-group m-4">
					<label for="bin"><i class="fas fa-trash"></i> 쓰레기통 설치
						여부&nbsp;</label>
					<form:radiobutton path="bin" value="0" label="미설치" />
					<form:radiobutton path="bin" value="1" label="설치" />
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
				<div class="form-group m-4">
					<label for="lat"><i class="fas fa-map-marked-alt"></i> 위도</label>
					<form:input type="text" path="lat" class="form-control" />
				</div>
				<div class="form-group m-4">
					<label for="lon"><i class="fas fa-map-marked-alt"></i> 경도</label>
					<form:input type="text" path="lon" class="form-control" />
				</div>
				<div class="form-group m-4">
					<label for="cap">용량</label>
					<form:input type="text" path="cap" class="form-control" />
				</div>
				<div class="container text-center mt-4">
					<button id="submitBtn" type="submit" class="btn btn-secondary">수정</button>
					<button id="cancleBtn" type="button" class="btn btn-danger">다시작성</button>
				</div>
			</form:form>
		</div>
	</section>
</body>
</html>