<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Naver Maps API 키 값 필요 -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=rbeyz68rf5">
</script>
<script>
	$.fn.getUsers = function(map) {
		console.log('사용자 목록 불러오기');
		
		var userArray = JSON.parse('${userList}');		
		var users = new Array();
				
		userArray.forEach(user=> {			
			var contentColor;
			var userid = user.userid;
			users[user.userid] = user;
			
			if(user.cap >= 75) {
				contentColor = '<i class="fas fa-trash-alt fa-lg" style="color:#FD2876;"></i>';
			} else if(user.cap >= 50) {
				contentColor = '<i class="fas fa-trash-alt fa-lg" style="color:#F6C501;"></i>';
			} else {
				contentColor = '<i class="fas fa-trash-alt fa-lg" style="color:#00FF00;"></i>';
			}
			
			// marker 생성
			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(user.lat, user.lon),				
				map : map,
				icon : {
					content : contentColor,
					size : new naver.maps.Size(22, 35),
					anchor : new naver.maps.Point(11,35)
				}
			});
			
			var contentString = ['<div class="card">',
									'<div class="card-body text-center">',
										'<h4 class="card-title">'+user.userid+'</h4>',
										'<p class="card-text">'+user.address+'</p>',
										'<p class="card-text">용량 : '+user.cap+'L</p>',
										'<p class="card-text">상태 : ' + user.condition + '</p>',
										'<button id="info-plus-btn" class="btn btn-dark m-1">수거</button>',
										'<button id="info-cancle-btn" class="btn btn-danger m-1">취소</button>',
									'</div>',								
								'</div>'].join('');
			
			var infoWindow = new naver.maps.InfoWindow({
				content : contentString 
			});
			
			users[user.userid].marker = marker;
						
			naver.maps.Event.addListener(users[userid].marker, 'click', function(e) {			
				var infoWindowElement;
				
				// 맵에 마커의 윈도우창이 열려있으면
				if(infoWindow.getMap()) {
					infoWindowElement = infoWindow.getElement();
					$(infoWindowElement).off('click', '#info-plus-btn');
					$(infoWindowElement).off('click', '#info-cancle-btn');
					infoWindow.close();
				} else {
					infoWindow.open(map, users[userid].marker);					
					infoWindowElement = infoWindow.getElement();
					$(infoWindowElement).off('click', '#info-plus-btn');
					$(infoWindowElement).off('click', '#info-cancle-btn');
					$(infoWindowElement).on('click', '#info-plus-btn', function() {
						$('#condition-table').updateCollectingList(map, infoWindow, users, users[userid], 'collecting');
						infoWindow.close();
					});
					
					$(infoWindowElement).on('click', '#info-cancle-btn', function() {
						$('#condition-table').updateCollectingList(map, infoWindow, users, users[userid], 'waiting');
						infoWindow.close();
					});
				}
			});
		});
		
		return users;
	}
	
	$.fn.loadMap = function() {
		var mapOptions = {
				center : new naver.maps.LatLng(37.4999, 127.03739),
				zoom : 9,
				zoomControl : true,
				zoomControlOptions : {
					style : naver.maps.ZoomControlStyle.SMALL
				}
			};
		var map = new naver.maps.Map('map', mapOptions);
		
		return map;
	}
	
	$.fn.updateInfoWindow = function(map, infoWindow, users, user) {
		var userid = user.userid;
				
		var contentString = ['<div class="card">',
			'<div class="card-body text-center">',
				'<h4 class="card-title">'+users[userid].userid+'</h4>',
				'<p class="card-text">'+users[userid].address+'</p>',
				'<p class="card-text">용량 : '+ users[userid].cap+'L</p>',
				'<p class="card-text">상태 : ' + users[userid].condition + '</p>',
				'<button id="info-plus-btn" class="btn btn-dark m-1">수거</button>',
				'<button id="info-cancle-btn" class="btn btn-danger m-1">취소</button>',
			'</div>',								
		'</div>'].join('');
		
		infoWindow = new naver.maps.InfoWindow({
			content : contentString
		});
		
		// 기존 마커 리스너를 삭제하고 새로운 마커 리스너를 생성 후 InfoWindow 객체를 등록
		naver.maps.Event.clearInstanceListeners(users[userid].marker);
		naver.maps.Event.addListener(users[userid].marker, 'click', function(e) {			
			var infoWindowElement;
			
			// 맵에 마커의 윈도우창이 열려있으면
			if(infoWindow.getMap()) {
				infoWindowElement = infoWindow.getElement();
				$(infoWindowElement).off('click', '#info-plus-btn');
				$(infoWindowElement).off('click', '#info-cancle-btn');
				infoWindow.close();
			} else {
				infoWindow.open(map, users[userid].marker);					
				infoWindowElement = infoWindow.getElement();
				$(infoWindowElement).off('click', '#info-plus-btn');
				$(infoWindowElement).off('click', '#info-cancle-btn');
				$(infoWindowElement).on('click', '#info-plus-btn', function() {
					$('#condition-table').updateCollectingList(map, infoWindow, users, users[userid], 'collecting');
					infoWindow.close();
				});
				
				$(infoWindowElement).on('click', '#info-cancle-btn', function() {
					$('#condition-table').updateCollectingList(map, infoWindow, users, users[userid], 'waiting');
					infoWindow.close();
				});
			}
		});
	}
	
	$.fn.getConditionList = function() {
		console.log('---------상태 리스트 출력-----------');
		
		var userList;
		
		// 수집중인 쓰레기 리스트 가져오기
		$.ajax({
			type : "GET",
			url : '${contextPath}/admin/collectingList',
			contentType : "application/json",
			charset : "utf-8",
			dataType : "text",
			success : function(response) {
				response = JSON.parse(response);				
				console.log('response: ',response)
				
				
				if(response.result == 'ok') {
					list = JSON.parse(response.message);
					
					$.each(list, function(index, user) {
						var rowItem = "<tr>";
						rowItem += "<td>" + user.userid + "</td>";
						rowItem += "<td>" + user.address + "</td>";
						rowItem += "<td>" + user.lat + "</td>";
						rowItem += "<td>" + user.lon + "</td>";
						rowItem += "<td>" + user.cap + "</td>";
						rowItem += "<td>" + user.condition + "</td>";
						rowItem += "</tr>";
						
						$('#condition-table > tbody:last').append(rowItem);

					});
				}
			}
		});
		console.log('------------------------------');
	}
	
	$.fn.updateCollectingList = function(map, infoWindow, users, user, condition) {
		console.log('--------상태 리스트 업데이트---------');
		console.log(condition);
		
		var data = new Object();
		data.userid = user.userid;
		data.condition = condition;
		console.log(data);
		data = JSON.stringify(data);
		
		$.ajax({
			type : "POST",
			url : '${contextPath}/admin/updateCollectingList',
			contentType : "application/json",
			charset : "utf-8",
			dataType : "text",
			data : data,
			success : function(response) {
				response = JSON.parse(response);
				
				if(response.result == 'ok') {
					$('#condition-table > tbody > tr').remove();
					$('#condition-table').getConditionList();
					users[user.userid].condition = condition;
					$('#map').updateInfoWindow(map, infoWindow, users, user);
				}
			}
		});
		console.log('-----------------------------');
	}	
	/////////////////////////////////////////////////////////////////////////////////
	$(function() {
		var map = $('#map').loadMap();
		var users = $('#map').getUsers(map);
		
		$('#condition-table').getConditionList();
		
		if(!window.WebSocket) {
			alert('웹 소켓을 지원하지 않는 브라우저 입니다.');
			return;
		}
		
		var socket = new WebSocket("ws://localhost:8080/projectCleanCity/admin/monitor/data");
		
		socket.onopen = function() {
			console.log('웹소켓 접속 성공');
			socket.send('{"type":"browser"}');
		}
		
		socket.onclose = function() {
			console.log('웹소켓 접속 해제');
			socket.send('termination');
		}
		
		// 웹소켓 메시지 수신시
		socket.onmessage = function(msg) {
			console.log(msg);
			console.log('데이터 수신 : ', msg.data);
						
			var contentString;
			var jsonMsg = JSON.parse(msg.data);
			var type = jsonMsg.type;
			
			console.log('type >> ' + type);
						
			if(type == 'binData' || 'collectedData') {
				var userid = jsonMsg.userid;
				var user = users[userid];
				var marker = users[userid].marker;			
				users[userid].cap = jsonMsg.cap;
				
				var updateUserCap = {
						userid : userid,
						cap : jsonMsg.cap,
						type : jsonMsg.type,
						address : jsonMsg.address
				};			
				
				// 쓰레기통 용량 업데이트
				$.ajax({
					type : "POST",
					url : '${contextPath}/admin/capUpdate',
					contentType : "application/json",
					charset : "utf-8",
					dataType : "text",
					data : JSON.stringify(updateUserCap),
					success : function(response) {
						var res = JSON.parse(response);
						console.log(res);
						if(res.result == 'ok') {
							alert('갱신하였습니다');
						} else {
							alert('갱신에 실패하였습니다');
						}
					}
				});			
				
				if(type == 'collectedData') {
					users[userid].cap = 0;
					users[userid].condition = "waiting";
					$('#condition-table').updateCollectingList(map, infoWindow, users, users[userid], 'waiting');
				} else {
					users[userid].cap = jsonMsg.cap;
					$('#condition-table').updateCollectingList(map, infoWindow, users, users[userid], users[userid].condition);
				}
				
				// 마커 아이콘 설정
				if(users[userid].cap >= 75) {
					$('#recv-message').text('RED');						
					marker.setIcon({
						content : '<i class="fas fa-trash-alt fa-lg" style="color:#FD2876;"></i>',
						size : new naver.maps.Size(22, 35),
						anchor : new naver.maps.Point(11,35)
					});
				} else if(users[userid].cap >= 50) {
					$('#recv-message').text('YELLOW');					
					marker.setIcon({
						content : '<i class="fas fa-trash-alt fa-lg" style="color:#F6C501;"></i>',
						size : new naver.maps.Size(22, 35),
						anchor : new naver.maps.Point(11,35)
					});
				} else {
					$('#recv-message').text('GREEN');					
					marker.setIcon({
						content : '<i class="fas fa-trash-alt fa-lg" style="color:#00FF00;"></i>',
						size : new naver.maps.Size(22, 35),
						anchor : new naver.maps.Point(11,35)
					});
				}			
								
				contentString = ['<div class="card">',
					'<div class="card-body text-center">',
					'<h4 class="card-title">' + users[userid].userid + '</h4>',
					'<p class="card-text">' + users[userid].address +'</p>',
					'<p class="card-text">용량 : ' + users[userid].cap + 'L</p>',
					'<p class="card-text">상태 : ' + users[userid].condition + '</p>',
					'<button id="info-plus-btn" class="btn btn-dark m-1">수거</button>',
					'<button id="info-cancle-btn" class="btn btn-danger m-1">취소</button>',
					'</div>',								
					'</div>'].join('');
				
				var infoWindow = new naver.maps.InfoWindow({
					content : contentString 
				});
								
				// 기존 마커 리스너를 삭제하고 새로운 마커 리스너를 생성 후 InfoWindow 객체를 등록
				naver.maps.Event.clearInstanceListeners(users[userid].marker);
				naver.maps.Event.addListener(users[userid].marker, 'click', function(e) {			
					var infoWindowElement;
					
					// 맵에 마커의 윈도우창이 열려있으면
					if(infoWindow.getMap()) {
						infoWindowElement = infoWindow.getElement();
						$(infoWindowElement).off('click', '#info-plus-btn');
						$(infoWindowElement).off('click', '#info-cancle-btn');
						infoWindow.close();
					} else {
						infoWindow.open(map, users[userid].marker);					
						infoWindowElement = infoWindow.getElement();
						$(infoWindowElement).off('click', '#info-plus-btn');
						$(infoWindowElement).off('click', '#info-cancle-btn');
						$(infoWindowElement).on('click', '#info-plus-btn', function() {
							$('#map').updateInfoWindow(map, infoWindow, users, user);
							infoWindow.close();
						});
						
						$(infoWindowElement).on('click', '#info-cancle-btn', function() {							
							$('#map').updateInfoWindow(map, infoWindow, users, user);
							infoWindow.close();
						});
					}
				});
			}
		}
		
		$('#send-btn').click(function() {
			var msg = $('#send-message').val();
			console.log(msg);
			socket.send(msg);
		});
		
		$('#forward-btn').click(function() {
			alert('△');
			socket.send('{"type":"direction","message":"forward"}');
		});
		$('#left-btn').click(function() {
			alert('◁');
			socket.send('{"type":"direction","message":"turnleft"}');
		});
		$('#back-btn').click(function() {
			alert('▽');
			socket.send('{"type":"direction","message":"back"}');
		});
		$('#right-btn').click(function() {
			alert('▷');
			socket.send('{"type":"direction","message":"turnright"}');
		});
		$('#stop-btn').click(function() {
			alert('STOP');
			socket.send('{"type":"direction","message":"stop"}');
		});
		
	});	
</script>


	
	<!-- Breadcrumb-->
	<div class="breadcrumb-holder">
		<div class="container-fluid">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="${contextPath}/admin/main">Home</a></li>
				<li class="breadcrumb-item active">Monitor</li>
			</ul>
		</div>
	</div>
	<!-- monitor -->
	<section class="monitoring">
	<div class="container mt-5">
		<ul class="nav nav-tabs nav-justified">
			<li class="nav-item"><a class="nav-link"
				data-toggle="modal"
				href="#myModal"><i class="fas fa-car"></i>
					원격제어</a></li>
			<li class="nav-item"><a class="nav-link active"
				href="${contextPath}/admin/monitor"><i
					class="fas fa-location-arrow"></i> 관제</a></li>
			<li class="nav-item"><a class="nav-link" href="${contextPath}/admin/collection-list"><i
					class="fas fa-history"></i> 이용현황</a></li>
		</ul>
		
		<div class="jumbotron mt-5 text-center">
			<div id="map" style="width: 100%; height: 400px;"></div>
			<br />
			<h5>수거중</h5>
			<br />
			<table id='condition-table'
				class="table table-dark table-striped text-center">
				<thead class="thead-dark">
					<tr>
						<th><i class="fas fa-user-friends"></i> 사용자</th>
						<th><i class="fas fa-map-marker-alt"></i> 주소</th>
						<th><i class="fas fa-map-marked-alt"></i> 위도</th>
						<th><i class="fas fa-map-marked-alt"></i> 경도</th>
						<th><i class="fas fa-battery-full"></i> 용량</th>
						<th><i class="fas fa-flag-usa"></i> 상태</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="mt-5">
				전송 메시지 : <input type="text" id="send-message">
				<button type="button" id="send-btn">전송</button>
			</div>
			<br />
			<div>
				수신 메시지 : <span id="recv-message"></span>
			</div>
			<br />
		</div>
		
		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
	
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title"><i class="fas fa-car"></i>원격제어</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
	
					<!-- Modal body -->
					<div class="modal-body">
						<div class="row mt-5">
							<div class="col-md-8">
								<h4>차량 카메라</h4>
								<br /> <img src="${contextPath}/camera/1"
									class="mx-auto d-block" style="width: 100%; height: 400px;" />
								<br />
							</div>
							<div class="col-md-4">
								<h4>수동조작</h4>
								<br /> <br /> <br /> <br /> <br />
								<div class="container">
									<div class="row justify-content-center">
										<button id="forward-btn" type="button" class="btn btn-dark">
											<i class="fas fa-arrow-up"></i>
										</button>
	
									</div>
									<div class="row justify-content-center">
										<button id="left-btn" type="button"
											class="btn btn-dark mt-1 mr-1">
											<i class="fas fa-arrow-left"></i>
										</button>
										<button id="back-btn" type="button" class="btn btn-dark mt-1">
											<i class="fas fa-redo"></i>
										</button>
										<button id="right-btn" type="button"
											class="btn btn-dark mt-1 ml-1">
											<i class="fas fa-arrow-right"></i>
										</button>
									</div>
									<div class="row justify-content-center">
										<button id="stop-btn" type="button" class="btn btn-danger mt-1">
											<i class="far fa-stop-circle"></i>
										</button>
									</div>
								</div>
								<br>
							</div>
						</div>
	
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
	
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
</html>
