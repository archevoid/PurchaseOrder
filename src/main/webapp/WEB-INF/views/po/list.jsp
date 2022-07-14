<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../includes/header.jsp"%>
<title>계획 검수 - TeamFoS</title>
</head>

<body>
	<div class="page">
		<%@ include file="../includes/verticalNav.jsp"%>
		<div class="page-wrapper">
			<div class="container-xl">
				<!-- Page title -->
				<div class="page-header d-print-none">
					<div class="row g-2 align-items-center">
						<div class="col">
							<div class="page-pretitle">Purchase Order</div>
							<h2 class="page-title">Inspection</h2>
						</div>
						<div class="col-12 col-md-auto ms-auto d-print-none">
							<div class="d-flex">
								<ol class="breadcrumb breadcrumb-arrows"
									aria-label="breadcrumbs">
									<li class="breadcrumb-item"><a href="dashboard">Purchase
											Order</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a
										href="#">Inspection</a></li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="page-body">
				<div class="container-xl">
					<div class="row row-cards">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">발주 목록</h3>
									<div class="ms-auto">
										
									</div>
								</div>
								<div class="card-body">
									<%-- 검색기능 --%>
								</div>
							</div>
						</div>

						<div class="col-12">
							<div class="card">
								<div class="card-body py-3 ms-auto d-print-none btn-list">
									<span class="d-none d-sm-inline">
										<button type="button" class="btn btn-white" id="downloadSchedule">
											<img src="/resources/img/download.svg" class="icon"> 선택
											일정 다운로드
										</button>
									</span>
									<button type="button"
										class="btn btn-primary d-none d-sm-inline-block"
										id="inputInspection">
										<img src="/resources/img/upload.svg" class="icon"> 계획입력
									</button>
								</div>
								<div>
									<table
										class="table card-table table-vcenter text-nowrap datatable"
										id="inspectionSchedule">
										<thead>
											<tr>
												<th>발주번호</th>
												<th>발주일자</th>
												<th>조달납기</th>
												<th>담당자</th>
												<th>이메일</th>
												<th>발주수량</th>
												<th>단가</th>
												<th>총 금액</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ orderList }" var="order">
												<tr>
													<td id="orderNum">
														${ order.orderNum }
													</td>
													<td id="orderDate">
														${ order.orderDate }
													</td>
													<td id="dueDate">
														${ order.dueDate }
													</td>
													<td id="emplName">
														${ order.emplName }
													</td>
													<td id="email">
														${ order.email }
													</td>
													<td id="orderQuantity">
														${ order.orderQuantity }
													</td>
													<td id="unitPrice">
														${ order.unitPrice }
													</td>
													<td id="totalPrice">
														<%-- 자바스크립트 --%>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="card-footer d-flex align-items-center">
									<p class="m-0 text-muted hidden" id="entryInfo">
										Showing <span id="showingEntry"></span> entries
									</p>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%@ include file="../includes/footer.jsp"%>
		</div>
	</div>
	<script>
		var orderNumVal = -1;

		$("select[name=orderNum]").on("change", function() {
			orderNumVal = $(this).val();
			createRow (orderNumVal);
		});

		$("button#inputInspection").on("click", function() {
			if ($("tr#inspectionInputTr").length != 0 || $("select[name=orderNum]").val() == 0) {
				$("tr#inspectionInputTr").remove();
				return;
			}

			$.ajax({
				url : "/api/nextInspectionNum",
				type : "post",
				data : {
					"orderNum" : orderNumVal
				},
				success : function(data) {
					var elem = '<tr id="inspectionInputTr">' + '<td>' + '<input class="form-check-input m-0 align-middle"'
						+			'type="checkbox" aria-label="Select invoice" name="selectedInspection">' + '</td>' + '<td id="inspectionNum">' + '<span class="text-muted" id="inspectionNum">' + data + '</span>' + '</td>' + '<td id="inspectionDate"><input type="date" class="form-control" name="inspectionDate"></td>' + '<td id="inspectionQuantity"><input type="number" class="form-control" name="inspectionQuantity"></td>' + '<td id="sampleQuantity"><input type="number" class="form-control" name="sampleQuantity"></td>' + '<td id="progress"></td>' + '<td class="text-end">' + '<span class="dropdown">' + '<button class="btn align-text-top" id="inspectionInputBtn">입력' + '</button>' + '</span>' + '</td>' + '</tr>';

					$("table#inspectionSchedule tbody").append(elem);

					$("button#inspectionInputBtn").on("click", function() {
						$.ajax({
							url : "/api/inputInspection",
							type : "post",
							data : {
								"orderNum" : $("select[name=orderNum]").val(),
								"inspectionDate" : $("input[name='inspectionDate']").val(),
								"inspectionQuantity" : $("input[name='inspectionQuantity']").val(),
								"sampleQuantity" : $("input[name='sampleQuantity']").val()
							},
							success : function(data) {
								$("tr#inspectionInputTr").remove();
								createRow (orderNumVal);
							}
						});
					});
				}
			});
		});

		$("textarea#complementModal").on("click keyup focus", function(event) {
			var $text = $(event.target).val();

			const limit = 1000;

			if ($text.length > limit) {
				$(event.target).val($text.substring(0, limit));
				$("span#numberOfContent").text(limit);
			} else {
				$("span#numberOfContent").text($text.length);
			}
		});
		
		$("button#downloadSchedule").on("click", function() {
			
			var checkedNum = [];
			$("input[name=selectedInspection]:checked").each(function(index) {
				checkedNum.push(parseInt($(this).val()));
			});
			
			var url = "/file/inspectionSchedule?orderNum=" + $("select[name=orderNum]").val();
			
			for (var i = 0; i < checkedNum.length; i++) {
				url += "&inspectionNumList=" + checkedNum[i]
			}
			
			location.href = url;
		});
		
		function createRow(orderNumVal) {
			$("tr#inspectionInfo").remove();
			$("tr#inspectionInputTr").remove();

			if ($("select[name=orderNum]").val() == 0) {
				$("p#entryInfo").addClass("hidden")
				return;
			}

			$.ajax({
				url : "/api/inspection",
				type : "post",
				data : {
					"orderNum" : orderNumVal
				},
				success : function(data) {
					$("td#orderNum").text(data[0].orderNum);
					$("td#emplName").text(data[0].emplName);
					$("td#email").text(data[0].email);
					$("td#partName").text(data[0].partName);
					$("td#orderQuantity").text(data[0].orderQuantity);

					$("table #inspectionSchedule tr").remove();

					var elem = "";

					for ( var key in data) {
						if (data[key].inspectionNum != null) {

							elem += '<tr id="inspectionInfo">' + '<td>' + '<input class="form-check-input m-0 align-middle"'
									+			'type="checkbox" aria-label="Select invoice" name="selectedInspection" value="' + data[key].inspectionNum +'">' + '</td>' + '<td id="inspectionNum">' + '<span class="text-muted" id="inspectionNum">' + data[key].inspectionNum + '</span>' + '</td>' + '<td id="inspectionDate">' + data[key].inspectionDate + '</td>' + '<td id="inspectionQuantity">' + data[key].inspectionQuantity + '</td>' + '<td id="sampleQuantity">' + data[key].sampleQuantity + '</td>' + '<td id="progress">' + data[key].progress + '</td>' + '<td class="text-end">' + '<span class="dropdown">' + '<button class="btn dropdown-toggle align-text-top"'
									+				'data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions' + '</button>' + '<div class="dropdown-menu dropdown-menu-end">'
									+ '<button type="button" class="dropdown-item"'
									+					'data-bs-toggle="modal" data-bs-target="#modal-report" id="showResultModal">' + '결과입력' + '</button>' + '<button type="button" class="dropdown-item" id="downloadResult">' + '결과 다운로드' + '</button>' + '</div>' + '</span>' + '</td>' + '</tr>';

						}
					}

					$("table#inspectionSchedule tbody").append(elem);

					$("span#showingEntry").text(Object.keys(data).length);

					$("p#entryInfo").removeClass("hidden");
					
					$("button#downloadResult").on("click", function(event) {
						var url = "/file/inspectionResult?orderNum=" + $("select[name=orderNum]").val();
						url += "&inspectionNum=" + $(event.target).closest("tr#inspectionInfo").find("span#inspectionNum").text();
						
						location.href = url;
					});

					$("button#showResultModal").on("click", function(event) {
						$thisInspection = $(event.target).closest("tr#inspectionInfo");

						$("input#orderNumModal").val(orderNumVal);
						$("input#inspectionNumModal").val($thisInspection.find("span#inspectionNum").text());
						$("input#inspectionQuantityModal").val($thisInspection.find("td#inspectionQuantity").text());
						$("input#sampleQuantityModal").val($thisInspection.find("td#sampleQuantity").text());
						$("input#sampleRatioModal").val(parseInt($thisInspection.find("td#sampleQuantity").text()) * 1.0 / parseInt($thisInspection.find("td#inspectionQuantity").text()) * 100);

						$("input#defectQuantityModal").on("change keyup focus", function() {
							$("input#defectRatioModal").val((parseInt($(this).val())) * 1.0 / parseInt($("input#sampleQuantityModal").val()) * 100);
						});

						$("button#insertResultBtn").on("click", function() {

							var checked = $("input#finalInspection").is(":checked") ? 1 : 0;

							$.ajax({
								url : "/api/inputResult",
								type : "post",
								data : {
									"orderNum" : $("input#orderNumModal").val(),
									"inspectionNum" : $("input#inspectionNumModal").val(),
									"inspectionDefect" : $("input#defectQuantityModal").val(),
									"complement" : $("textarea#complementModal").val(),
									"close" : checked
								}
							});
						});
					});
				}
			});
		}
	</script>
</body>
</html>