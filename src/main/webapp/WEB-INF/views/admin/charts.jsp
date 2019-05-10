<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <!-- Breadcrumb-->
      <div class="breadcrumb-holder">
        <div class="container-fluid">
          <ul class="breadcrumb">
            <li class="breadcrumb-item"><a href="${contextPath}/admin/index">Home</a></li>
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
	         <h1>${trash}</h1>
          	<h2>${trash.userid }</h2>
    	    <h2>${trash.cap }</h2>
    	    <h2>${trash.emptyDate }</h2>
          	
          
          <div class="row">
            <div class="col-lg-6">
              <div class="card line-chart-example">
                <div class="card-header d-flex align-items-center">
                  <h4>Line Chart Example</h4>
                </div>
                <div class="card-body">
                  <canvas id="lineChartExample" ></canvas>
                </div>
              </div>
            </div>
     		</div>
          </div>
      </section>
</html>