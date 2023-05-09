<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>쿠폰 상세 정보</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/dashmin/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/dashmin/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/resources/dashmin/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/dashmin/css/style.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/dashmin/lib/easing/easing.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/dashmin/lib/waypoints/waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/dashmin/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/dashmin/lib/tempusdominus/js/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/dashmin/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/dashmin/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
</head>
<body onload="resizeWindow(this)">
	<!-- Form Start -->
	<div class="container-fluid pt-4 px-4">
		<div class="col-sm-12 col-xl-6">
			<div class="bg-light rounded h-100 p-4">
				<h6 class="mb-4">차량 상세 정보</h6>
				<form>
					<div class="form-floating mb-3 row">
					<div class="form-floating col-6">
						<input type="text" class="form-control" id="model" name="model" value="${vehicle.model}">
						<label for="model" class="ps-4">모델명</label>
					</div>
					<div class="form-floating col-6">
						<input type="text" class="form-control" id="maker" name="maker" value="${vehicle.maker }">
						<label for="maker" class="ps-4">제조사</label>
					</div>
				</div>
				<div class="form-floating mb-3 row">
					<div class="form-floating col-4">
						<select class="form-select" id="carType">
							<c:forEach items="${cartypeList }" var="list">
								<option value="${list.idx }">${list.type }</option>
							</c:forEach>
						</select>
						<label for="carType" class="ps-4">분류</label>
					</div>
					<div class="form-floating col-4">
						<select class="form-select" id="fuelType">
							<c:forEach items="${fueltypeList }" var="list">
								<option value="${list.idx }">${list.type }</option>
							</c:forEach>
						</select>
						<label for="fuelType" class="ps-4">연료</label>
					</div>
					<div class="form-floating col-4">
						<input type="number" class="form-control" id="price" name="price" value="${vehicle.price }">
						<label for="price" class="ps-4">가격</label>
					</div>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="year" name="year" value="${vehicle.year }">
					<label for="year">연식</label>
				</div> 
				<div class="form-floating mb-3">
					<select class="form-select" id="location">
						<c:forEach items="${locationList }" var="list">
							<c:choose>	
								<c:when test="${vehicle.location eq  list.name}">
									<option value="${list.idx }" selected>${list.name }</option>
								</c:when>
								<c:otherwise>
									<option value="${list.idx }">${list.name }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<label for="location">지점</label>
				</div>
					<div style="text-align: center;">
						<button type="button" class="btn btn-primary" id="insertBtn" style="display: inline-block">등록하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Form End -->

<script src="<%=request.getContextPath()%>/resources/dashmin/js/main.js"></script>

<script>
	function resizeWindow(win) {
		var hei = win.document.body.offsetHeight + 100;
		win.resizeTo(500, hei);
	}
	
	$('#updateBtn').on('click', updateNotice);
	
	function updateNotice() {
		if($('#updateBtn').text() == '수정하기') {
			$('#updateBtn').text('수정 완료');
			$('#name').attr('readonly', false);
			$('#period').attr('readonly', false);
			$('#rate').attr('readonly', false);
		} else {
			let idx = $('#idx').val();
			let name = $('#name').val();
			let period = $('#period').val();
			let rate = $('#rate').val() / 100;
			let data = {
					idx: idx,
					name: name,
					period: period,
					rate: rate
			}
			
			if(period <= 0 || rate >= 1) {
				alert("입력하신 값을 확인하세요")
			} else {
				$.ajax({
					url: "${pageContext.request.contextPath}/admin/coupon/update",
					type: "patch",
					data: JSON.stringify(data),
					contentType: "application/json; charset=utf-8",
					success: function(result) {
						if(result == 1) {
							alert("쿠폰 수정 완료");
							opener.parent.location.reload();
							window.close();
						} else {
							alert('실패');
						}
					},
					error: function() {
						alert("에러");
					}
				});
			}
		} 
	}
	
	$('#deleteBtn').on('click', deleteCoupon);
	
	function deleteCoupon() {
		let idx = $('#idx').val();
		$.ajax({
			url: "${pageContext.request.contextPath}/admin/coupon/delete",
			data: {idx: idx},
			type: "patch",
			success: function(result) {
				if(result == 1) {
					opener.parent.location.reload();
					window.close();
				} else {
				alert('실패');					
				}
			}, 
			error: function() {
				alert('에러');
			}
		})
		
	}
</script>
</body>

</html>