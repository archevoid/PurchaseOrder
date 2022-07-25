<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../includes/header.jsp"%>
<title>계획 검수 - TeamFoS</title>

<c:choose>
	<c:when test="${ param.pageNum ne null }">
		<c:set value="${ param.pageNum }" var="pageNum" />
	</c:when>
	<c:otherwise>
		<c:set value="1" var="pageNum" />
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${ param.amount ne null }">
		<c:set value="${ param.amount }" var="amount" />
	</c:when>
	<c:otherwise>
		<c:set value="10" var="amount" />
	</c:otherwise>
</c:choose>
</head>

<body>
	<div class="page">
		<%@ include file="../includes/horizontalNav.jsp"%>
		<div class="page-wrapper">
			<div class="container-xl">
				<!-- Page title -->
				<div class="page-header d-print-none">
					<div class="row g-2 align-items-center">
						<div class="col">
							<div class="page-pretitle">Purchase Order</div>
							<h2 class="page-title">발주 검수</h2>
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
					<div class="row g-4">
						<div class="col-12 searcher" id="inspection-searcher">
							<%-- Temp --%>
							<div class="card" id="data-plan">
								<div class="card-header">
									<h3 class="card-title">Inspection</h3>
									<div class="ms-auto d-print-none btn-list float-end">
										<button class="btn btn-primary" id="hide-searcher">
											검색창 숨기기
										</button>
									</div>
								</div>
								<div class="card-body" id="searcher-body">
									<div class="row row-searcher">
										<div class="col-6">
											<div class="mb-3">
												<label class="form-label">발주번호</label>
												<div class="form-group">
													<div class="row row-searcher">
														<div class="col-12">
															<select id="orderNum" class="form-select" name="orderNum">
																<option value="0">발주번호</option>
																<c:forEach items="${ orderNumList }" var="orderNum">
																	<option value="${ orderNum.orderNum }" <c:if test="${ param.orderNum eq orderNum.orderNum }">selected</c:if>>
																		${ orderNum.orderNum }
																	</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="mb-3">
												<label class="form-label">발주일자</label>
												<div class="form-group row row-searcher">
													<div class="col-6">
														<input type="date" id="initialScheduledDate" class="form-control" name="initialScheduledDate" value="${ param.initialScheduledDate }">
													</div>
													<div class="col-6">
														<input type="date" id="finalScheduledDate" class="form-control" name="finalScheduledDate" value="${ param.finalScheduledDate }">
													</div>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="mb-3">
												<label class="form-label">조달납기</label>
												<div class="form-group row row-searcher">
													<div class="col-6">
														<input type="date" id="initialDueDate" class="form-control" name="initialDueDate" value="${ param.initialDueDate }">
													</div>
													<div class="col-6">
														<input type="date" id="finalDueDate" class="form-control" name="finalDueDate" value="${ param.finalDueDate }">
													</div>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="mb-3">
												<label class="form-label">검수일자</label>
												<div class="form-group row row-searcher">
													<div class="col-6">
														<input type="date" id="initialInspectionDate" class="form-control" name="initialInspectionDate" value="${ param.initialInspectionDate }">
													</div>
													<div class="col-6">
														<input type="date" id="finalInspectionDate" class="form-control" name="finalInspectionDate" value="${ param.finalInspectionDate }">
													</div>
												</div>
											</div>
										</div>
										<div class="col-12 text-end mt-4">
											<button type="button" class="btn btn-primary me-3"
												id="search-button">조회하기</button>
											<button class="btn btn-ghost-primary" onclick="location.href=window.location.protocol + '//' + window.location.host + window.location.pathname;"> 초기화 </button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%-- /temp --%>
						<div class="col-12 mt-2" id="data-area">
							<div class="card">
								<div class="card-body border-bottom py-3">
									<div class="ms-auto d-print-none btn-list float-end">
										<span class="d-none d-sm-inline">
											<button type="button" class="btn btn-white" id="downloadSchedule">
												<img src="/resources/img/download.svg" class="icon"> 선택
												일정 다운로드
											</button>
										</span>
										<button type="button"
											class="btn btn-primary d-none d-sm-inline-block"
											data-bs-toggle="modal" data-bs-target="#modal-input"
											id="inputInspection">
											<img src="/resources/img/upload.svg" class="icon"> 계획입력
										</button>
									</div>
									<div class="d-flex">
										<div class="text-muted pt-2">
											Show
											<div class="mx-2 d-inline-block">
												<input type="text" class="form-control form-control-sm" value="${ pageInfo.curPageDto.amount }" size="3" aria-label="Invoices count" name="amount" id="amount">
				                        	</div>
				                        	entries
										</div>
									</div>
								</div>
								<div class="table-default">
									<table
										class="table card-table table-vcenter text-nowrap datatable"
										id="inspectionSchedule">
										<thead>
											<tr>
												<th class="w-1"><input
													class="form-check-input m-0 align-middle" type="checkbox"
													aria-label="Select all invoices" name="selectedOrder" id="select-all-checkbox"></th>
													
												<th>발주번호</th>
												
												<th class="w-1">차수 <!-- Download SVG icon from http://tabler-icons.io/i/chevron-up -->
													<svg xmlns="http://www.w3.org/2000/svg"
														class="icon icon-sm text-dark icon-thick" width="24"
														height="24" viewBox="0 0 24 24" stroke-width="2"
														stroke="currentColor" fill="none" stroke-linecap="round"
														stroke-linejoin="round">
																			<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																			<polyline points="6 15 12 9 18 15">
																			</polyline>
																		</svg>
												</th>
												<th>검수일자</th>
												<th>품목</th>
												<th>발주 수량</th>
												<th>협력회사 담당자</th>
												<th>이메일</th>
												<th>상태</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ inspectionList }" var="inspection">
												<tr id="inspectionInfo">
												    <td>
												        <input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice" name="selectedInspection" value="${ inspection.inspectionNum }">
												    </td>
												    <td id="orderNum">${ inspection.orderNum }</td>
												    <td id="inspectionNum">
												        <span class="text-muted" id="inspectionNum">${ inspection.inspectionNum }</span>
												    </td>
												    <td id="inspectionDate">${ inspection.inspectionDate }</td>
												    <td id="partName">${ inspection.partName }</td>
												    <td id="orderQuantity">${ inspection.orderQuantity }</td>
												    <td id="comEmployee">${ inspection.comEmployee }</td>
												    <td id="comEmail">${ inspection.comEmail }</td>
												    <td id="status">${ inspection.status }</td>
												    <td class="text-end">
												        <span class="dropdown">
												            <button class="btn dropdown-toggle align-text-top" data-bs-boundary="viewport" data-bs-toggle="dropdown">
												                Actions
												            </button>
												            <div class="dropdown-menu dropdown-menu-end">
												                <button type="button" class="dropdown-item" data-bs-toggle="modal" data-bs-target="#modal-report" id="showResultModal"
												                <c:if test="${ inspection.status eq '종료' }">disabled</c:if>
												                >
												                    결과입력
												                </button>
												                <button type="button" class="dropdown-item" id="downloadResult"
												                <c:if test="${ inspection.status ne '종료' }">disabled</c:if>>
												                    결과 다운로드
												                </button>
												            </div>
												        </span>
												    </td>
												    <input type="hidden" id="progress" name="progress" value="${ inspection.progress }">
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="card-footer d-flex align-items-center">
									<p class="m-0 text-muted">
										Showing <span>
											<c:choose>
												<c:when test="${ (pageNum - 1) * amount + inspectionList.size() eq 0}">
													0
												</c:when>
												<c:otherwise>
													${ (pageNum - 1) * amount + 1  }
												</c:otherwise>
											</c:choose>
										</span> to <span>${ (pageNum - 1) * amount + inspectionList.size() }</span>
										of <span>${ numberOfInspection }</span> entries
									</p>
									<ul class="pagination m-0 ms-auto">
										<li
											class="page-item <c:if test="${ pageInfo.curFirstPage le 1 }"> disabled </c:if>"><button
												class="page-link page-prev" tabindex="-1"
												aria-disabled="true">
												<img src="/resources/img/chevron-left.svg"> prev
											</button></li>
										<c:forEach begin="${ pageInfo.curFirstPage }"
											end="${ pageInfo.curLastPage }" var="num">
											<c:choose>
												<c:when test="${ num eq pageInfo.curPageDto.pageNum }">
													<li class="page-item active"><button
															class="page-link page-number">${ num }</button></li>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when
															test="${ num le pageInfo.lastPage }">
															<li class="page-item"><button
																	class="page-link page-number">${ num }</button></li>
														</c:when>
														<c:otherwise>
															<li class="page-item disabled"><button
																	class="page-link page-number">${ num }</button></li>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<li
											class="page-item <c:if test="${ pageInfo.curLastPage ge pageInfo.lastPage }"> disabled </c:if>"><button
												class="page-link page-next">
												next <img src="/resources/img/chevron-right.svg">
											</button></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

				
				<%-- modal 창 시작 modal-report (계획입력 버튼) --%>
				<div class="modal modal-blur fade" id="modal-input" tabindex="-1"
					role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered"
						role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">검수 일정 입력</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">발주번호</label>
											<select id="selectedOrderNum" class="form-select" name="selectedOrderNum">
											<option value="0">발주번호</option>
											<c:forEach items="${ orderNumList }" var="orderNum">
												<c:if test="${ orderNum.close ne 1 }">
													<option value="${ orderNum.orderNum }">${ orderNum.orderNum }</option>
												</c:if>
											</c:forEach>
										</select>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">차수</label> <input type="number"
												id="inspectionNumModalInput" class="form-control rm-side"
												readonly>
										</div>
									</div>
								</div>
								<div class="mb-3">
									<label class="form-label">검수일자</label> <input type="date"
										id="inspectionDateModalInput" class="form-control rm-side" name="inspectionDateModalInput">
								</div>
							</div>

							<div class="modal-footer">
								<button class="btn btn-link link-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<button id="inspectionInputBtn" class="btn btn-primary ms-auto"
									data-bs-dismiss="modal">
									<!-- Download SVG icon from http://tabler-icons.io/i/plus -->
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<line x1="12" y1="5" x2="12" y2="19" />
										<line x1="5" y1="12" x2="19" y2="12" /></svg>
									입력
								</button>
							</div>
						</div>
					</div>
				</div>
				<%-- modal 창 끝 --%>
				
				<%-- modal 창 시작 modal-report (Modal with form 버튼) --%>
				<div class="modal modal-blur fade" id="modal-report" tabindex="-1"
					role="dialog" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered"
						role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">검수 결과 입력</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">발주번호</label> <input type="number"
												id="orderNumModal" class="form-control rm-side" readonly>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">차수</label> <input type="number"
												id="inspectionNumModal" class="form-control rm-side"
												readonly>
										</div>
									</div>
								</div>
								<div class="mb-3">
									<label class="form-label">발주수량</label> <input type="number"
										id="orderQuantityModal" class="form-control rm-side"
										readonly>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">검수수량</label> <input type="number"
												id="inspectionQuantityModal" class="form-control rm-side" name="inspectionQuantityModal">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">진도율
												<label class="form-check form-check-inline float-end">
					                                <input class="form-check-input" type="checkbox" id="self-insert-progress">
					                                <span class="form-check-label">직접 입력</span>
					                              </label>
											</label>
											<div class="input-group input-group-flat">
												<input type="number" id="progressModal" step="0.1"
													class="form-control rm-side" readonly> <span
													class="input-group-text"> % </span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">샘플수량</label> <input type="number"
												id="sampleQuantityModal" class="form-control rm-side" name="sampleQuantityModal">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">샘플비율</label>
											<div class="input-group input-group-flat">
												<input type="number" id="sampleRatioModal" step="0.1"
													class="form-control rm-side" readonly> <span
													class="input-group-text"> % </span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">불량수량</label> <input type="number"
												id="defectQuantityModal" class="form-control">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">불량비율</label>
											<div class="input-group input-group-flat">
												<input type="number" id="defectRatioModal" step="0.1"
													class="form-control rm-side" readonly> <span
													class="input-group-text"> % </span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<input type="hidden" id="orderDateModal">
							<input type="hidden" id="inspectionDateModal">
							<div class="modal-body">
								<div class="mb-3">
									<label class="form-label">보완사항 <span
										class="form-label-description"><span
											id="numberOfContent"></span>/1000</span></label>
									<textarea class="form-control" name="complement" rows="6"
										id="complementModal" placeholder="보완사항 입력"></textarea>
								</div>
								<div class="mb-3">
									<label class="form-check"> <input type="checkbox"
										class="form-check-input" id="finalInspection"> <span
										class="form-check-label">마지막 검수</span>
									</label>
								</div>
							</div>

							<div class="modal-footer">
								<button class="btn btn-link link-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<button id="insertResultBtn" class="btn btn-primary ms-auto"
									data-bs-dismiss="modal">
									<!-- Download SVG icon from http://tabler-icons.io/i/plus -->
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<line x1="12" y1="5" x2="12" y2="19" />
										<line x1="5" y1="12" x2="19" y2="12" /></svg>
									Create new Inspection
								</button>
							</div>
						</div>
					</div>
				</div>
				<%-- modal 창 끝 --%>
			</div>

			<%@ include file="../includes/footer.jsp"%>
		</div>
	</div>
	<script>
		$("input#sampleQuantityModal, input#inspectionQuantityModal").on("change keyup focus", function(event) {
			if (!(isNaN($("input#sampleQuantityModal").val()) || $("input#sampleQuantityModal").val() == ""
					|| isNaN($("input#inspectionQuantityModal").val()) || $("input#inspectionQuantityModal").val() == "")) {
				$("input#sampleRatioModal").val($("input#sampleQuantityModal").val() / $("input#inspectionQuantityModal").val() * 100);
			}
		});
	
		var orderNumVal = -1;
		$("select#selectedOrderNum").on("change", function(event) {
			$.ajax({
				url : "/api/nextInspectionNum",
				type : "post",
				data : {
					"orderNum" : $(event.target).val()
				},
				success : function(data) {
					$("input#inspectionNumModalInput").val(data);
				}
			});
		});
		
		$("input#select-all-checkbox").on("change", function(event) {
			if ($(event.target).is(":checked")) {
				$("input[name=selectedInspection]").prop("checked", true);
			} else {
				$("input[name=selectedInspection]").prop("checked", false);
			}
		});

		$("button#inspectionInputBtn").on("click", function() {
			var orderDate;
			var dueDate;
			
			$.ajax({
				url : "/api/dateInfo",
				type : "post",
				async : false,
				data : {
					"orderNum" : $("select[name=selectedOrderNum]").val()
				},
				success : function(data) {
					orderDate = data.orderDate;
					dueDate = data.dueDate;
				}
			});
			
			
			if ($("select[name=selectedOrderNum]").val() == 0) {
				alert("발주번호를 선택해주세요");
				return;
			} else if ($("input[name=inspectionDateModalInput]").val() == null || $("input[name=inspectionDateModalInput]").val() == "") {
				alert("발주일자를 입력해주세요");
				return;
			} else if ($("input[name=inspectionDateModalInput]").val() < orderDate || $("input[name=inspectionDateModalInput]").val() > dueDate) {
				alert("발주일자와 조달납기 사이의 날짜를 입력해주세요");
				return;
			}
			
			$.ajax({
				url : "/api/inputInspection",
				type : "post",
				data : {
					"orderNum" : $("select[name=selectedOrderNum]").val(),
					"inspectionDate" : $("input[name=inspectionDateModalInput]").val(),
				},
				success : function(data) {
					location.reload();
				}
			});
			
		});
		
		$("input#select-all-checkbox").on("change", function(event) {
			if ($(event.target).is(":checked")) {
				$("input[name=selectedInspection]").prop("checked", true);
			} else {
				$("input[name=selectedInspection]").prop("checked", false);
			}
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
		
		$("button#downloadSchedule").on("click", function(event) {
			if ($("input[name=selectedInspection]:checked").length == 0) {
				alert("검수를 선택해주세요");
				return;
			}
			
			var checkedNum = [];
			$("input[name=selectedInspection]:checked").each(function(index, value) {
				var tmp = new Object();
				
				tmp.orderNum = $(value).closest("tr#inspectionInfo").find("td#orderNum").text();
				tmp.inspectionNum = $(value).closest("tr#inspectionInfo").find("span#inspectionNum").text();
				
				checkedNum.push(tmp);
			});
			
			
			var excelUrl = "/file/inspectionSchedule";
			
			var request = new XMLHttpRequest();
			request.open('POST', excelUrl, true);
			request.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
			request.responseType = 'blob';
			
			request.onload = function(e) {
				var filename = "";
				var disposition = request.getResponseHeader('Content-Disposition');
				if (disposition && disposition.indexOf('attachment') !== -1) {
					var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
					var matches = filenameRegex.exec(disposition);
					if (matches != null && matches[1]) {
						filename = decodeURI( matches[1].replace(/['"]/g, '') );
					}
				}
				console.log("FILENAME: " + filename);
			
				if (this.status === 200) {
					var blob = this.response;
					if(window.navigator.msSaveOrOpenBlob) {
						window.navigator.msSaveBlob(blob, filename);
					} else{
						var downloadLink = window.document.createElement('a');
						
						var contentTypeHeader = request.getResponseHeader("Content-Type");
						
						downloadLink.href = window.URL.createObjectURL(new Blob([blob], { type: contentTypeHeader }));
						downloadLink.download = filename;
						document.body.appendChild(downloadLink);
						downloadLink.click();
						document.body.removeChild(downloadLink);
					}
				}
			};
			         
			request.send(JSON.stringify(checkedNum));
			
			
			
		});
		
		$("input#self-insert-progress").on("change", function(event) {
			if ($(event.target).is(":checked")) {
				$(event.target).closest(".col-lg-6").find("input#progressModal").prop("readonly", false);
			} else {
				$(event.target).closest(".col-lg-6").find("input#progressModal").prop("readonly", true);
			}
		});
		
		
		$("button#downloadResult").on("click", function(event) {
			$thisInspection = $(event.target).closest("tr#inspectionInfo");
			
			var url = "/file/inspectionResult?orderNum=" + $thisInspection.find("td#orderNum").text();
			url += "&inspectionNum=" + $thisInspection.find("span#inspectionNum").text();
			
			location.href = url;
		});

		$("button#showResultModal").on("click", function(event) {
			$thisInspection = $(event.target).closest("tr#inspectionInfo");

			$("input#orderNumModal").val($thisInspection.find("td#orderNum").text());
			$("input#inspectionNumModal").val($thisInspection.find("span#inspectionNum").text());
			$("input#orderQuantityModal").val($thisInspection.find("td#orderQuantity").text());
			
			$.ajax({
				url : "/api/maxProgress",
				type : "post",
				data : {
					"orderNum" : $thisInspection.find("td#orderNum").text()
				},
				success : function(data) {
					$("input#progressModal").val(parseInt(data));
				}
			});
			
			
			$("input#orderDateModal").val($thisInspection.find("td#orderDate").text());
			$("input#inspectionDateModal").val($thisInspection.find("td#inspectionDate").text());
			
			
			var orderQuantity;
			var totalInspectionQuantity;
			
			$.ajax({
				url : "/api/totalInspectionQuantity",
				type : "post",
				async : false,
				data : {
					"orderNum" : $thisInspection.find("td#orderNum").text()
				},
				success : function(data) {
					orderQuantity = parseInt(data.orderQuantity);
					totalInspectionQuantity = parseInt(data.totalInspectionQuantity);
				}
			});
			
			
			$("input#inspectionQuantityModal").on("change keyup focus", function(inputModal) {
				$.ajax({
					url : "/api/maxProgress",
					type : "post",
					async : false,
					data : {
						"orderNum" : $thisInspection.find("td#orderNum").text()
					},
					success : function(data) {
						if ($(inputModal.target).val() == null || $(inputModal.target).val() == "") {
							$("input#progressModal").val(parseInt(data));
						} else {
							if (!isNaN($(inputModal.target).val())) {
								$("input#progressModal").val(parseInt(data) + (parseInt($(inputModal.target).val()) * 1.0) / orderQuantity * 100);
							}
						}
					}
				});
				
				if ($("input#progressModal").val() >= 100) {
					$("input#finalInspection").prop("checked", true);
				} else {
					$("input#finalInspection").prop("checked", false);
				}
			});

			$("input#defectQuantityModal").on("change keyup focus", function() {
				if (!(isNaN($(this).val()) || isNaN($("input#sampleQuantityModal").val()) || $(this).val() == "")) {
					$("input#defectRatioModal").val((parseInt($(this).val())) * 1.0 / parseInt($("input#sampleQuantityModal").val()) * 100);
				}
			});

			$("button#insertResultBtn").on("click", function() {
				if ($("input#defectQuantityModal").val() == null || $("input#defectQuantityModal").val() == "") {
					alert("불량수량을 입력하세요");ㅣ
					return;
				} else if ($("input[name=inspectionQuantityModal]").val() == null || $("input[name=inspectionQuantityModal]").val() == "") {
					alert("검수수량을 입력해주세요");
					return;
				} else if ($("input[name=sampleQuantityModal]").val() == null || $("input[name=sampleQuantityModal]").val() == "") {
					alert("샘플수량을 입력해주세요");
					return;
				}
				
				var checked = $("input#finalInspection").is(":checked") ? 1 : 0;
				$.ajax({
					url : "/api/inputResult",
					type : "post",
					data : {
						"orderNum" : $("input#orderNumModal").val(),
						"inspectionNum" : $("input#inspectionNumModal").val(),
						"inspectionDefect" : $("input#defectQuantityModal").val(),
						"complement" : $("textarea#complementModal").val(),
						"inspectionQuantity" : $("input[name=inspectionQuantityModal]").val(),
						"sampleQuantity" : $("input[name=sampleQuantityModal]").val(),
						"close" : checked
					},
					success : function(data) {
						location.reload();
					}
				
				});
				
			});
		});
		
		$("button#search-button").on("click", function() {
			// var url = window.location.href;
			var url = window.location.protocol + "//" + window.location.host + window.location.pathname;
			
			var regex = /(?:[?&])(amount[=][^&])/g;
			
			if (window.location.href.search(regex) != -1) {
				url += "?" + regex.exec(window.location.href)[1];
				console.log(url);
			}
			
			$("div.row-searcher select").each(function(index, value) {
				if ($(value).val() != 0 && $(value).val() != null) {
					var inputName = $(value).attr("name");
					
					if (url.indexOf(inputName) != -1) {
						var regex = new RegExp(inputName + "=[^&]+", "g");
						url = url.replace(regex, inputName + "=" + $(value).val());
					} else if (url.match(/[?].+[=].+/g)) {
						url = url + "&" + inputName + "=" + $(value).val();
					} else {
						url = url.replace(/[?]\s*$/g, "");
						url = url + "?" + inputName + "=" + $(value).val();
					}
				}
			});
			
			$("div.row-searcher input").each(function(index, value) {
				var inputName = $(value).attr("name");
				
				if (!(/^\s*$/).test($(value).val())) {
					
					if (url.indexOf(inputName) != -1) {
						var regex = new RegExp(inputName + "=[^&]+", "g");
						url = url.replace(regex, inputName + "=" + $(value).val());
					} else if (url.match(/[?].+[=].+/g)) {
						url = url + "&" + inputName + "=" + $(value).val();
					} else {
						url = url.replace(/[?]\s*$/g, "");
						url = url + "?" + inputName + "=" + $(value).val();
					}
				}
			});
			location.href = url;
		});
		
		$("button.page-number").on("click", function(event) {
			var url = window.location.href;
			
			if (url.indexOf("pageNum=") != -1) {
				url = url.replace(/pageNum=\d+/, "pageNum=" + $(event.target).text());
			} else if (url.match(/[?].+[=].+/g)) {
				url = url + "&pageNum=" + $(event.target).text();
			} else {
				url = url.replace(/[?]\s*$/g, "");
				url = url + "?pageNum=" + $(event.target).text();
			}
			
			location.href = url;
		});
		
		$("button.page-prev").on("click", function(event) {
			var url = window.location.href;
			

			if (url.indexOf("pageNum=") != -1) {
				url = url.replace(/pageNum=\d+/, "pageNum=" + "${ pageInfo.curFirstPage - 1 }");
			} else if (url.match(/[?].+[=].+/g)) {
				url = url + "&pageNum=" + "${ pageInfo.curFirstPage - 1 }";
			} else {
				url = url.replace(/[?]\s*$/g, "");
				url = url + "?pageNum=" + "${ pageInfo.curFirstPage - 1 }";
			}
			
			location.href = url;
		});
		
		$("button.page-next").on("click", function(event) {
			var url = window.location.href;
			

			if (url.indexOf("pageNum=") != -1) {
				url = url.replace(/pageNum=\d+/, "pageNum=" + "${ pageInfo.curLastPage + 1 }");
			} else if (url.match(/[?].+[=].+/g)) {
				url = url + "&pageNum=" + "${ pageInfo.curLastPage + 1 }";
			} else {
				url = url.replace(/[?]\s*$/g, "");
				url = url + "?pageNum=" + "${ pageInfo.curLastPage + 1 }";
			}
			
			location.href = url;
		});
		
	</script>
</body>
</html>