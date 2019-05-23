/*global $, document, LINECHARTEXMPLE*/


$(document).ready(function () {

    'use strict';
    console.log('charts-custom 실행');
//    var trashListJson = JSON.parse('${trash}');
//	console.log('사용자쓰레기현황: ',trashListJson);

    var list = $('#lineChartExample').text()
    console.log(list);
    var trashListJson = JSON.parse(list);
	var cap = new Array();
	var emptydate = new Array();
	console.log('사용자쓰레기현황: ',trashListJson);
	for(var ix in trashListJson){
		cap[ix] = trashListJson[ix].cap
		
		var m = trashListJson[ix].emptyDate.substr(0,3)
		var d = trashListJson[ix].emptyDate.substr(4,2)
		var y = trashListJson[ix].emptyDate.substr(8,4)
		var t = trashListJson[ix].emptyDate.substr(12)
//		console.log('Month: ',m);		
//		console.log('Year:', y);
//		console.log('Day:',d);		
//		console.log('time:', t);
		emptydate[ix] = m + ' ' + d;
		
	}



    var brandPrimary = 'rgba(51, 179, 90, 1)';

    var LINECHARTEXMPLE   = $('#lineChartExample');

    

    var lineChartExample = new Chart(LINECHARTEXMPLE, {
        type: 'line',
        data: {
        	// empty date
            labels: emptydate,
            	// ["January", "February", "March", "April", "May", "June", "July"],	
            datasets: [
                {
                    label: "쓰레기 수거량(단위:L)",
                    fill: true,
                    lineTension: 0.3,
                    backgroundColor: "rgba(51, 179, 90, 0.38)",
                    borderColor: brandPrimary,
                    borderCapStyle: 'butt',
                    borderDash: [],
                    borderDashOffset: 0.0,
                    borderJoinStyle: 'miter',
                    borderWidth: 1,
                    pointBorderColor: brandPrimary,
                    pointBackgroundColor: "#fff",
                    pointBorderWidth: 1,
                    pointHoverRadius: 5,
                    pointHoverBackgroundColor: brandPrimary,
                    pointHoverBorderColor: "rgba(220,220,220,1)",
                    pointHoverBorderWidth: 2,
                    pointRadius: 1,
                    pointHitRadius: 10,
                    data: cap,
                    	// [50, 20, 40, 31, 32, 22, 10],	// cap 입력값
                    spanGaps: false
                }
            ]
        }
    });
});



