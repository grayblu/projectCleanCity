<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<style>
.page-item.active .page-link {
	background-color: #495057;
}
</style>
<html>
      <!-- Breadcrumb-->
      <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="${contextPath}/admin/main">Home</a></li>
            <li class="breadcrumb-item active">Tables       </li>
          </ul>
        </div>
      </div>
      <section>
        <div class="container-fluid">
          <!-- Page Header-->
          <header> 
            <h1 class="h3 display"><i class="icon-user"></i> 회원 현황            </h1>
          </header>
            <div class="table-responsive">
              <table class="table table-striped">
                <thead>
                  <tr>
						<th><i class="fas fa-user-friends"></i> 사용자</th>
						<th><i class="fas fa-map-marker-alt"></i> 주소</th>
						<th><i class="fas fa-map-marked-alt"></i> 위도</th>
						<th><i class="fas fa-map-marked-alt"></i> 경도</th>
						<th><i class="far fa-trash-alt"></i> 설치여부</th>
						<th><i class="fas fa-registered"></i> 신청일</th>
                  </tr>
                </thead>
                <tbody>
					<c:forEach var="user" items="${pi.list}" varStatus="status">
						<tr>
							<td><a href="${contextPath}/admin/edit/${user.userid}">${user.userid}</a></td>
							<td>${user.address}</td>
							<td>${user.lat}</td>
							<td>${user.lon}</td>
							<td><c:if test="${user.bin == 0}">
									<button type="button" class="btn btn-danger btn-sm">미완료</button>
								</c:if> <c:if test="${user.bin == 1}">
									<button type="button" class="btn btn-light btn-sm">완료</button>
								</c:if></td>
							<td><fmt:formatDate value="${user.regDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
              </table>
              <br/>
              <ul class="pagination pagination-md justify-content-center mt-4">
				<c:forEach var="idx" begin="1" end="${pi.totalPage }">
					<c:choose>
						<c:when test="${pi.page == idx}">
							<li class="page-item active"><a class="page-link" style="background-color: #495057; border-color: #f8f9fa;"  
								href="?page=${idx }">${idx }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="?page=${idx }">${idx }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			  </ul>
            </div>
          </div>
      </section>

</html>