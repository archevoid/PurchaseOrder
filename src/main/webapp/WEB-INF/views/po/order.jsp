<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
							<h2 class="page-title">발주 확인</h2>
						</div>
						<div class="col-12 col-md-auto ms-auto d-print-none">
							<div class="d-flex">
								<ol class="breadcrumb breadcrumb-arrows"
									aria-label="breadcrumbs">
									<li class="breadcrumb-item"><a href="dashboard">Purchase Order</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a
										href="#">Order</a></li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="page-body">
				<div class="container-xl">
					<div class="row g-4">
						<div class="col-12 searcher" id="order-searcher">
							<%-- Temp --%>
							<div class="card" id="data-order">
								<div class="card-header">
									<h3 class="card-title">Order</h3>
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
												<label class="form-label">발주품목</label>
												<div class="form-group">
													<div class="row row-searcher">
														<div class="col-6">
															<select id="part" class="form-select" name="partCode">
																<option value="0">선택</option>
																<c:forEach items="${ partList }" var="part">
																	<option value="${ part.partCode }" <c:if test="${ param.partCode eq part.partCode }">selected</c:if>>
																		${ part.partName }
																	</option>
																</c:forEach>
															</select>
														</div>
														<div class="col-6">
															<input type="text" id="part-selector" class="form-control select-searcher" name="partName" value="${ param.partName }"  placeholder="선택 목록 검색">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="mb-3">
												<label class="form-label">회사</label>
												<div class="form-group row row-searcher">
													<div class="col-6">
														<select id="company" class="form-select" name="companyCode">
															<option value="0">선택</option>
															<c:forEach items="${ companyList }" var="company">
																<option value="${ company.companyCode }" <c:if test="${ param.companyCode eq company.companyCode }">selected</c:if>>
																	${ company.companyName }
																</option>
															</c:forEach>
														</select>
													</div>
													<div class="col-6">
														<input type="text" id="company-selector" class="form-control select-searcher" name="companyName" value="${ param.companyName }"  placeholder="선택 목록 검색">
													</div>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="mb-3">
												<label class="form-label">담당자</label>
												<div class="form-group row row-searcher">
													<div class="col-6">
														<select id="employee" class="form-select" name="emplNum">
															<option value="0">선택</option>
															<c:forEach items="${ emplList }" var="empl">
																<option value="${ empl.emplNum }" <c:if test="${ param.emplNum eq empl.emplNum }">selected</c:if>>
																	${ empl.emplName }
																</option>
															</c:forEach>
														</select>
													</div>
													<div class="col-6">
														<input type="text" id="employee-selecotr" class="form-control select-searcher" name="emplName" value="${ param.emplName }" placeholder="선택 목록 검색">
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
										<div class="col-12 text-end mt-4">
											<button type="button" class="btn btn-primary me-3"
												id="search-button">조회하기</button>
											<button class="btn btn-ghost-primary" onclick="location.href=window.location.protocol + '//' + window.location.host + window.location.pathname"> 초기화 </button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%-- /temp --%>
							<div class="col-12 mt-2" id="data-area">
								<div class="card" id="data-order">
									<div class="card-body border-bottom py-3">
										<div class="d-flex">
											<div class="text-muted">
												Show
												<div class="mx-2 d-inline-block">
													<input type="text" class="form-control form-control-sm" value="${ pageInfo.curPageDto.amount }" size="3" aria-label="Invoices count" name="amount" id="amount">
					                        	</div>
					                        	entries
											</div>
										</div>
									</div>
									<div id="table-default">
										<table class="table card-table table-vcenter text-nowrap datatable">
											<thead>
												<tr>
													<th><button class="table-sort"
															data-sort="sort-scheduledNum">구분</button></th>
													<th><button class="table-sort"
															data-sort="sort-orderNum">발주번호</button></th>
													<th><button class="table-sort"
															data-sort="sort-emplName">발주담당자</button></th>
													<th><button class="table-sort"
															data-sort="sort-partName">품목명</button></th>
													<th><button class="table-sort"
															data-sort="sort-companyName">회사명</button></th>
													<th><button class="table-sort"
															data-sort="sort-leadTime">Lead Time</button></th>
													<th><button class="table-sort"
															data-sort="sort-orderQuantity">발주수량</button></th>
													<th><button class="table-sort"
															data-sort="sort-scheduledDate">발주예정일자</button></th>
													<th><button class="table-sort"
															data-sort="sort-orderDate">발주일자</button></th>
													<th><button class="table-sort"
															data-sort="sort-dueDate">조달납기</button></th>
													<th><button class="table-sort"
															data-sort="sort-status">상태</button></th>
													<th></th>
												</tr>
											</thead>
											<tbody class="table-tbody">
												<c:forEach items="${ orderList }" var="order">
													<form action="printpo" method="post">
													<tr class="plan-data">
														<td class="sort-scheduledNum" id="scheduledNum">${ order.scheduledNum }</td>
														<td class="sort-orderNum" id="orderNum">${ order.orderNum }</td>
														<td class="sort-emplName" id="emplName">${ order.emplName }</td>
														<td class="sort-partName" id="partName">${ order.partName }</td>
														<td class="sort-companyName" id="companyName">${ order.companyName }</td>
														<td class="sort-leadTime" id="leadTime">${ order.leadTime }</td>
														<td class="sort-orderQuantity" id="orderQuantity">${ order.orderQuantity }</td>
														<td class="sort-scheduledDate" id="scheduledDate">${ order.scheduledDate }</td>
														<td class="sort-orderDate" id="orderDate">${ order.orderDate }</td>
														<td class="sort-dueDate" id="dueDate">${ order.dueDate }</td>
														<td class="sort-status" id="status">
															<c:choose>
																<c:when test="${ order.status eq 0 }">
																	<div class="badge bg-yellow"></div> 발주 예정
																</c:when>
																<c:when test="${ order.status eq 1 }">
																	<div class="badge bg-primary"></div> 발주 완료
																</c:when>
																<c:when test="${ order.status ge 1000 }">
																	<div class="badge bg-purple"></div> ${ order.status - 1000 }차 검수 중
																</c:when>
																<c:when test="${ order.status eq 4 }">
																	<div class="badge bg-red"></div> 검수 완료
																</c:when>
															</c:choose>
														</td>
														<fmt:setLocale value="en_US" />
														<fmt:parseNumber value="${ order.dueDate.time / (1000 * 60 * 60 * 24) }" integerOnly="true" var="dueDateNumber" />
														<fmt:parseNumber value="${ order.today.time / (1000 * 60 * 60 * 24) }" integerOnly="true" var="todayNumber" />
														<td class="text-end order-btn-area">
															<c:choose>
																<c:when test="${ order.published eq 0 }">
																	<c:choose>
																		<c:when test="${ order.leadTime gt (dueDateNumber - todayNumber) }">
																			<button type="submit" class="btn" id="show-order-page" disabled>
																				<img src="/resources/img/row-insert-top.svg"
																					class="icon"> 발주 기간 초과
																			</button>
																		</c:when>
																		<c:when test="${ order.emergency eq 1 }">
																			<button type="submit" class="btn btn-danger" id="show-order-page">
																			<img src="/resources/img/row-insert-top.svg"
																				class="icon"> 긴급 발주서 발행
																			</button>
																		</c:when>
																		<c:when test="${ order.emergency ne 1 }">
																			<button type='button' class='btn btn-primary d-none d-sm-inline-block premature-order-update' id='premature-order-update'>수정</button>
																			<button type="submit" class="btn" id="show-order-page">
																				<img src="/resources/img/row-insert-top.svg"
																					class="icon"> 발주서 발행
																			</button>
																		</c:when>
																	</c:choose>
																</c:when>
																<c:when test="${ order.published ne 0 }">
																	<button type="submit" class="btn" id="show-order-page" disabled>
																		<img src="/resources/img/row-insert-top.svg"
																			class="icon"> 발행 완료
																	</button>
																</c:when>
															</c:choose>
														</td>
													</tr>
													<input type="hidden" name="companyCode" value="${ order.companyCode }">
													<input type="hidden" name="scheduledDate" value="${ order.scheduledDate }">
													<input type="hidden" name="scheduledNum" value="${ order.scheduledNum }">
													</form>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="card-footer d-flex align-items-center">
										<p class="m-0 text-muted">
											Showing <span>
												<c:choose>
													<c:when test="${ (pageNum - 1) * amount + orderList.size() eq 0}">
														0
													</c:when>
													<c:otherwise>
														${ (pageNum - 1) * amount + 1  }
													</c:otherwise>
												</c:choose>
											</span> to <span>${ (pageNum - 1) * amount + orderList.size() }</span>
											of <span>${ numberOfOrder }</span> entries
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
			</div>

			<%@ include file="../includes/footer.jsp"%>
		</div>
	</div>

	<script>
		var $searcher = $("div.searcher");
		
		$searcher.find("input.select-searcher").on("change keyup focus", function(event) {
			$selectTag = $(event.target).closest("div.row-searcher").find("select");
			
			$($selectTag).find("span.hidden-option option").unwrap();
			
			if ($(event.target).val() != "") {
				$selectTag.find("option").each(function(index, value) {
					if (!$(value).text().includes($(event.target).val()) && $(value).val() != 0) {
						$(value).wrap('<span class="hidden-option" style="display: none;" />');
					}
				});
			}
			
			$selectTag.addClass("is-valid");
			setTimeout(function() { $selectTag.removeClass("is-valid") }, 500);
			
		});
		
		$("button#search-button").on("click", function() {
			// var url = window.location.href;
			var url = window.location.protocol + "//" + window.location.host + window.location.pathname;
			
			var regex = /(?:[?&])(amount[=][^&])/g;
			
			if (window.location.href.search(regex) != -1) {
				url += "?" + regex.exec(window.location.href)[1];
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
		
	/* 	$(".updatable").on("change", function(event) {
			var $selectePlanData = $(event.target).closest("tr.plan-data");
			
			var updateButton = "<div class='d-print-none btn-list'>"
							+ "<span class='d-none d-sm-inline'>"
							+ "<button type='button' class='btn btn-white cancel-update' id='cancel-update'>취소</button>"
							+ "</span>"
							+ "<button type='button' class='btn btn-primary d-none d-sm-inline-block premature-order-update' id='premature-order-update'>수정</button>"
							+ "</div>";
							
			$selectePlanData.find("td.order-btn-area").append(updateButton);
			
			$selectePlanData.find("button[type=submit]").addClass("hidden");
			
			$("button.premature-order-update").on("click", function(eventBtn) {
				var $choicedPlanData = $(eventBtn.target).closest("tr.plan-data");
				
				$.ajax({
					url : "/api/updateOrder",
					type : "post",
					data : {
						"orderNum" : $choicedPlanData.find("#orderNum"),
						"emplNum" : $($choicedPlanData).find("select.updatable[name=emplNum]").val(),
						"scheduledDate" : $($choicedPlanData).find("input.updatable#scheduledDate").val()
					},
					success : function(data) {
						
					}
				});
			});
		}); */
		
		
		
		$("button#premature-order-update").on("click", function(event) {
			$("div#data-order").addClass("hidden");
			
			var elem = '<div class="col-12">'
		        + '<div class="card" id="order-input">' 
		        + ' <div class="card-header">' 
		        + ' <h3 class="card-title"><span id="input-form-planNum"></span>번 계획 발주 수정</h3>' 
		        + ' </div>' 
		        + ' <div class="card-body">' 
		        + ' <div class="form-group mb-4 row border-bottom p-3">' 
		        + ' <div class="col-lg-3">' 
		        + ' <label class="form-label col-3 col-form-label">품목</label>' 
		        + ' <input type="text" id="partName" class="form-control" value="" readonly>' 
		        + ' </div>' 
		        + ' <div class="col-lg-3">' 
		        + ' <label class="form-label col-3 col-form-label">납기</label>' 
		        + ' <input type="date" id="dueDate" class="form-control" value="" name="dueDate" readonly>' 
		        + ' </div>' 
		        + ' <div class="col-lg-3">' 
		        + ' <label class="form-label col-3 col-form-label">잔여량</label>' 
		        + ' <input type="number" id="remainQuantity" class="form-control" value="" name="remainQuantity" readonly>' 
		        + ' </div>' 
		        + ' <div class="col-lg-3">' 
		        + ' <label class="form-label col-3 col-form-label">요구량</label>' 
		        + ' <input type="number" id="requirement" class="form-control" value="" readonly>' 
		        + ' </div>'
		        + ' </div>' 
		        + ' <div class="form-group mb-3 row">' 
		        + ' <label class="form-label col-3 col-form-label">업체</label>' 
		        + ' <div class="col" id="company-container">'
		        + ' <button type="button" id="company-selector" class="btn w-100">업체 확인</button>' 
		        + ' <!-- ' + '                업체 선택시 업체 이름으로 바뀜' + '                <input type="text" id="companyName" class="form-control" value="" readonly>' + '                <input type="hidden" id="companyCode" value="">' + '            -->'
		        + ' <small class="form-hint">클릭시 업체 선택으로 이동합니다.</small>' 
		        + ' </div>' 
		        + ' </div>' 
		        + ' <div class="form-group mb-3 row">' 
		        + ' <label class="form-label col-3 col-form-label">담당자</label>' 
		        + ' <div class="col">' 
		        + ' <select id="emplNum" class="form-select" name="emplNum">' 
		        + ' <option value="0">선택</option>' 
		        + ' </select>' 
		        + ' </div>' 
		        + ' </div>'
		        + ' <div class="form-group mb-3 row">' 
		        + ' <label class="form-label col-3 col-form-label">발주일자</label>' 
		        + ' <div class="col">' 
		        + ' <input type="date" id="scheduledDate" class="form-control" name="scheduledDate">' 
		        + ' </div>' 
		        + ' </div>' 
		        + ' <div class="form-group mb-3 row">'
		        + ' <label class="form-label col-3 col-form-label">발주수량</label>' 
		        + ' <div class="col">' 
		        + ' <input type="number" id="orderQuantity" class="form-control" name="orderQuantity">' 
		        + ' </div>' 
		        + ' </div>' 
		        + ' <div class="form-footer">' 
		        + ' <div class="card-body py-3 ms-auto d-print-none btn-list float-end px-0">' 
		        + ' <span class="d-none d-sm-inline">' 
		        + ' <button type="button" class="btn btn-white" id="order-cancel">' 
		        + ' <img src="/resources/img/x.svg" class="icon"> 입력 취소' 
		        + ' </button>'
		        + ' </span>' 
		        + ' <button type="button" class="btn btn-primary d-none d-sm-inline-block" id="order-insert">' 
		        + ' <img src="/resources/img/row-insert-top.svg" class="icon"> 입력' 
		        + ' </button>' 
		        + ' </div>' 
		        + ' </div>' 
		        + ' </div>' 
		        + '</div>' 
		        + '</div>';


			$("div#data-area").append(elem);
			$("div#plan-input").focus();
			
			var emplNumArray = [];
			
			$.ajax({
				url : "/api/empl",
				type : "POST",
				async : false,
				success : function(data) {
					for (var i = 0; i < Object.keys(data).length; i++) {
						var id = "white";
		
						emplNumArray[i] = "<option " + "id=" + id + " value='" + data[i].emplNum + "'>" + data[i].emplName + " (" + data[i].emplNum + ") " + data[i].email + "</option>";
						
						$("select#emplNum").append(emplNumArray[i]);
					}
				}
			});
			
			$curPlan = $(event.target).closest("tr.plan-data");
			
			const planNum = $curPlan.find("td#planNum").text();
			const partName = $curPlan.find("td#partName").text();
			const dueDate = $curPlan.find("td#dueDate").text();
			const requirement = $curPlan.find("td#requirement").text();
			
			$("span#input-form-planNum").text(planNum);
			$("input#partName").val(partName);
			$("input#dueDate").val(dueDate);
			$("input#requirement").val(requirement);

			$("button#order-cancel").on("click", function() {
				$("div#order-input").remove();
				$("div.col-company-card").remove();
				$("div#data-plan").removeClass("hidden");

			});
			
			remainQuantity();
			
			$("button#order-insert").on("click", function(event) {
				var $closeCard = $(event.target).closest("div#order-input");
				
				if ($("input#companyName").length == 0) {
					alert("협력회사를 선택해주세요");
					return;
				} else if ($closeCard.find("select[name=emplNum]").val() == 0) {
					alert("담당자를 선택해주세요");
					return;
				} else if ($closeCard.find("input[name=scheduledDate]").val() == null || $closeCard.find("input[name=scheduledDate]").val() == "") {
					alert("발주일자를 입력해주세요");
					return;
				} else if ($closeCard.find("input[name=orderQuantity]").val() == null || $closeCard.find("input[name=orderQuantity]").val() == "") {
					alert("발주수량을 입력해주세요");
					return;
				} 
				
				$.ajax({
					url : "/api/inputOrder",
					type : "POST",
					data : {
						"planNum" : planNum,
						"contractNum" : $closeCard.find("input[name=contractNum]").val(),
						"scheduledDate" : $closeCard.find("input[name=scheduledDate]").val(),
						"orderQuantity" : $closeCard.find("input[name=orderQuantity]").val(),
						"emplNum" : $closeCard.find("select[name=emplNum]").val()
					},
					success : function(data) {
						if (data == -1) {
							alert("입력 수량이 계획 수량보다 큽니다.");
							return;
						} else if (data == -2) {
							alert("조달납기 이후의 값만 입력할 수 있습니다.");
							return;
						} else if (data == -3) {
							alert("Lead Time으로 계산한 발주 완료일이 조달납기 이후입니다.")
							return;
						}
						
						$closeCard.addClass("bg-primary-lt");
						
						// setTimeout(function() { $closeCard.removeClass("bg-primary-lt") }, 1000);
						
						// remainQuantity();
						
						$("div#order-input").remove();
						$("div.col-company-card").remove();
						$("div#data-plan").removeClass("hidden");
					}
				});
			});

			$("button#company-selector").on("click", function(event) {
				if ($("div.col-company-card").length != 0) {
					$("div.col-company-card").remove();
					$(event.target).text("업체 확인");
				} else {
					$(event.target).text("접기");
					$.ajax({
						url : "/api/companyInfo",
						type : "get",
						data : {
							"planNum" : $("span#input-form-planNum").text()
						},
						success : function(data) {
							if (Object.keys(data).length == 0) {
								alert("해당물품을 계약한 회사가 없습니다.");
							}
							
							
							for (var i = 0; i < Object.keys(data).length; i++) {
	
								var elem = makeCompanyCard(data[i]);
	
								$("div#data-area").append(elem);
								
								var offset = $("div.col-company-card").offset();
								
								$("html").animate({scrollTop : offset.top}, 100);
								
								$("button#inputOrder").on("click", function(event) {
									$selectedCompany = $(event.target).closest("div.card-plan");
									
									var companyName = $selectedCompany.find("h3.card-title").text();
									var contractNum = $selectedCompany.find("input[name=contractNum]").val();
									var unitPrice = $selectedCompany.find("span#unitPrice").text();
									
									var companyNameTag = '<input type="text" id="companyName" class="form-control" value="' + companyName + '" name="companyName" readonly>'
									var contractNumTag = '<input type="hidden" id="contractNum" value="' + contractNum + '" name="contractNum">';
									var unitPriceTag = '<input type="hidden" name="unitPrice" value="' + unitPrice + '">';
									
									$("div#company-container").children().remove();
									$("div#company-container").append(companyNameTag + contractNumTag);
									
									$("div.col-company-card").remove();
								});
							}
						}
					});
				}
			});
		});
		
	</script>


</body>

</html>