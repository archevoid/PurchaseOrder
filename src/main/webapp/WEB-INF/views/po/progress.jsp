<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../includes/header.jsp"%>
<title>납기 진도율 - TeamFoS</title>

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
							<h2 class="page-title">납기진도율</h2>
							<%-- <div class="text-muted mt-1">About 2,410 result (0.19
								seconds)</div>--%>
						</div>
						<div class="col-12 col-md-auto ms-auto d-print-none">
							<div class="d-flex">
								<ol class="breadcrumb breadcrumb-arrows"
									aria-label="breadcrumbs">
									<li class="breadcrumb-item"><a href="#">Purchase Order</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a
										href="#">Progress</a></li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="page-body">
				<div class="container-xl">
					<div class="row g-4">
						<div class="col-12 searcher" id="progress-searcher">
							<%-- Temp --%>
							<div class="card" id="data-plan">
								<div class="card-header">
									<h3 class="card-title">발주 확인</h3>
								</div>
								<div class="card-body">
									<div class="row row-searcher">
										<div class="col-6">
											<div class="mb-3">
												<label class="form-label">품목명</label>
												<div class="form-group">
													<div class="row row-searcher">
														<div class="col-12">
															<input type="text" name="partName" class="form-control"
																placeholder="품목명을 입력해주세요" value="${ param.partName }">
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="mb-3">
												<label class="form-label">사원명</label>
												<div class="form-group row row-searcher">
													<div class="col-12">
														<input type="text" name="emplName" class="form-control"
															placeholder="사원명을 입력해주세요" value="${ param.emplName }">
													</div>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="mb-3">
												<label class="form-label">협력회사</label>
												<div class="form-group row row-searcher">
													<div class="col-6">
														<input type="text" name="companyName" class="form-control"
															placeholder="협력 회사를 입력해주세요" value="${ param.companyName }">
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
														<input type="date" name="initialScheduledDate"
															class="form-control" value="${ param.initialScheduledDate }">
													</div>
													<div class="col-6">
														<input type="date" name="finalScheduledDate" class="form-control" value="${ param.finalScheduledDate }">
													</div>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="mb-3">
												<label class="form-label">조달납기</label>
												<div class="form-group row row-searcher">
													<div class="col-6">
														<input type="date" name="initialDueDate" class="form-control" value="${ param.initialDueDate }">
													</div>
													<div class="col-6">
														<input type="date" name="finalDueDate" class="form-control" value="${ param.finalDueDate }">
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
							<div class="card">
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
														data-sort="sort-orderNum">발주번호</button></th>
												<th><button class="table-sort"
														data-sort="sort-partCode">품목명</button></th>
												<th><button class="table-sort"
														data-sort="sort-emplName">사원명</button></th>
												<th><button class="table-sort"
														data-sort="sort-companyName">협력회사</button></th>
												<th><button class="table-sort"
														data-sort="sort-scheduledDate">주문일자</button></th>
												<th><button class="table-sort"
														data-sort="sort-duedate">납기일자</button></th>
												<th><button class="table-sort"
														data-sort="sort-completeQuantity">검수 완료</button></th>
												<th><button class="table-sort"
														data-sort="sort-orderQuantity">목표 개수</button></th>
												<th><button class="table-sort"
														data-sort="sort-progress">Progress</button></th>
											</tr>
										</thead>
										<tbody class="table-tbody">
											<c:forEach items="${ orderList }" var="progress">
												<tr>
													<td class="sort-orderNum">${ progress.orderNum }</td>
													<td class="sort-partCode">${ progress.partName }</td>
													<td class="sort-emplName">${ progress.emplName }</td>
													<td class="sort-companyName">${ progress.companyName }</td>
													<td class="sort-scheduledDate">${ progress.scheduledDate }</td>
													<td class="sort-duedate" data-date="1628071164">${ progress.dueDate }</td>
													<td class="sort-completeQuantity">${ progress.completeQuantity }</td>
													<td class="sort-orderQuantity">${ progress.orderQuantity }</td>
													<td class="sort-progress"
														data-progress="${ progress.completeQuantity * 1.0 / progress.orderQuantity * 100 }">
														<div class="row align-items-center">
															<div class="col-auto">${ progress.completeQuantity * 1.0 / progress.orderQuantity * 100 }%
															</div>
															<div class="col">
																<div class="progress" style="width: 5rem">
																	<div class="progress-bar"
																		style="width: ${ progress.completeQuantity * 1.0 / progress.orderQuantity * 100 }%"
																		role="progressbar"
																		aria-valuenow="${ progress.completeQuantity * 1.0 / progress.orderQuantity * 100 }"
																		aria-valuemin="0" aria-valuemax="100"
																		aria-label="${ progress.completeQuantity * 1.0 / progress.orderQuantity * 100 }% Complete">
																		<span class="visually-hidden">${ progress.completeQuantity * 1.0 / progress.orderQuantity * 100 }%
																			Complete</span>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</tr>
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
											of <span>${ numberOfProgress }</span> entries
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
	</script>
</body>
</html>
