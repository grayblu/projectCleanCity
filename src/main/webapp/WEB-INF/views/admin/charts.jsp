<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

      <!-- Breadcrumb-->
      <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="${contextPath}/admin/main">Home</a></li>
            <li class="breadcrumb-item active">Charts       </li>
          </ul>
        </div>
      </div>
      <section class="charts">
        <div class="container-fluid">
          <!-- Page Header-->
          <header> 
            <h1 class="h3 display">Charts            </h1>
          </header>
          <div class="row">
          	<div class="col-10">
	          <h1>${USER.userid}님의 쓰레기통 수거 현황</h1>
	          <div class="card line-chart-example">
	            <div class="card-header d-flex align-items-center">
	              <h4>일별 쓰레기 수거량</h4>
	            </div>
	            <div class="card-body">
	              <canvas id="lineChartExample">${trash}</canvas>
	            </div>
	          </div>
          	</div>
          </div>
      	</div>
      </section>


</html>