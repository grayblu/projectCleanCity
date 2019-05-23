<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Side Navbar -->
    <nav class="side-navbar">
      <div class="side-navbar-wrapper">
        <!-- Sidebar Header    -->
        <div class="sidenav-header d-flex align-items-center justify-content-center">
          <!-- User Info-->
          <div class="sidenav-header text-center"><img src="${contextPath}/resources/img/avatar-7.jpg" alt="person" class="img-fluid rounded-circle">
            <h2 class="h5">${ADMIN.userid}</h2><span>웹서버 관리자</span>
          </div>
        </div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
          <h5 class="sidenav-heading">메뉴</h5>
          <ul id="side-main-menu" class="side-menu list-unstyled">
            <li><a href="${contextPath}/admin/main"> <i class="icon-home"></i>Home</a></li>
            <li><a href="${contextPath}/admin/list"> <i class="icon-grid"></i>회원 현황</a></li>
            <li> <a href="${contextPath}/admin/monitor"><i class="icon-screen"> </i>모니터링</a></li>
          </ul>  
        </div>
       </div>
    </nav>


</html>