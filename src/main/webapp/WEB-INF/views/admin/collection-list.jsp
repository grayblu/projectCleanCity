<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<style>
.page-item.active .page-link {
	background-color: #495057;
}
</style>
<script>
	$(function() {
		//$('#select-btn').attr('value', $(this).attr(''));
		
		var type = '${type}';
		console.log(type);
		
		if(type == 'userid') {
			$('#select-btn').html('사용자ID');
		} else if(type == 'region') {
			$('#select-btn').html('지역');
		} else if(type == 'date') {
			$('#select-btn').html('날짜');
		} else {
			$('#select-btn').html('선택');
		}
		
		$('#select-btn').attr('value', $(this).attr('${type}'));		
		$('#searchType li').on('click', function() {
			console.log('드롭다운 메뉴 클릭');
			var button = $('#select-btn');
			$('#select-btn').html($(this).html());
			$('#select-btn').attr('value', $(this).attr('value'));
			console.log(button.attr('value'));
			$('#type').attr('value', $(this).attr('value'));
			console.log($('#type').attr('value'));
		});
	});
</script>
	
	 <!-- Breadcrumb-->
      <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="${contextPath}/admin/main">Home</a></li>
            <li class="breadcrumb-item active">Monitor       </li>
          </ul>
        </div>
	   </div>
	<!-- monitor -->
	<section class="monitoring">
		<div class="container mt-5">
			<ul class="nav nav-tabs nav-justified">
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					href="#myModal"><i class="fas fa-car"></i> 원격제어</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="${contextPath}/admin/monitor"><i
						class="fas fa-location-arrow"></i> 관제</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/admin/collection-list"><i
						class="fas fa-history"></i> 이용현황</a></li>
			</ul>
			<div class="jumbotron mt-5 text-center">
				<table class="table table-dark table-striped text-center">
					<thead class="thead-dark">
						<tr>
							<th><i class="fas fa-list-ol"></i> 번호</th>
							<th><i class="fas fa-user-friends"></i> 사용자</th>
							<th><i class="fas fa-battery-full"></i> 용량</th>
							<th><i class="fas fa-map-marker-alt"></i> 지역</th>
							<th><i class="fas fa-calendar-check"></i> 수집일</th>
						</tr>
					</thead>
					<c:forEach var="garbageCollection" items="${pi.list}"
						varStatus="status">
						<tr>
							<td>${garbageCollection.collectionNo}</td>
							<td>${garbageCollection.userid}</td>
							<td>${garbageCollection.cap}</td>
							<td>${garbageCollection.address}</td>
							<td><fmt:formatDate value="${garbageCollection.emptyDate}"
									pattern="yyyy-MM-dd hh:mm:ss" /></td>
						</tr>
					</c:forEach>
				</table>
	
				<ul class="pagination pagination-md justify-content-center mt-4">
					<c:forEach var="idx" begin="1" end="${pi.totalPage }">
						<c:choose>
							<c:when test="${pi.page == idx}">
								<li class="page-item active"><a class="page-link"
									style="background-color: #495057; border-color: #f8f9fa;"
									href="?page=${idx }">${idx }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="?page=${idx }">${idx }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ul>
	
				<form:form modelAttribute="search">
					<form:hidden id="type" path="type" class="form-contorl" />
					<form:errors path="type" cssClass="alert">
						<div class="alert alert-warning">
							<strong>${fail}</strong>
						</div>
					</form:errors>
					<div class="input-group mt-4">
						<div class="input-group-prepend">
							<button id="select-btn" type="button"
								class="btn btn-outline-secondary dropdown-toggle"
								data-toggle="dropdown" value="">선택</button>
							<ul id="searchType" class="dropdown-menu">
								<li class="dropdown-item" value="userid">사용자ID</li>
								<li class="dropdown-item" value="region">지역</li>
								<li class="dropdown-item" value="date">날짜</li>
							</ul>
						</div>
	
						<form:input path="content" type="text" class="form-control"
							placeholder="검색어를 입력하세요." />
						<span class="input-group-btn">
							<button class="btn btn-warning" type="submit">SEARCH</button>
						</span>
					</div>
				</form:form>
			</div>
		</div>
	</section>​​
</html>