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
         <h1>${USER.userid}님의 쓰레기통 수거 현황</h1>
          <div class="row">
            <div class="col-lg-6">
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
<!--  <script type="text/javascript">
	$(function() {		
		
		var trashListJson = JSON.parse('${trash}');
		var cap = new Array();
		var date = new Array();
		console.log(trashListJson);
		for(var ix in trashListJson){
			cap[ix] = trashListJson[ix].cap
			date[ix] = trashListJson[ix].emptyDate
			// console.log(trashListJson[ix].cap)
		}
		console.log(cap)
		// console.log(date)
		//trashListJson.forEach(trash => trash.cap)
		

//		list.forEach(trash => {
//			console.log('---------');
//			console.log(trash.cap);
//			console.log('---------');
//		});
	});
</script>
<script src="${contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${contextPath}/resources/js/charts-custom.js"></script>  -->


</html>