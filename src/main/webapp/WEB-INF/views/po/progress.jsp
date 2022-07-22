<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../includes/header.jsp"%>
<title>납기 진도율 - TeamFoS</title>
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
						<div class="col-3" id="search-div">
							<div class="subheader mb-2">품목명</div>
							<div class="mb-3">
								<input type="text" name="partName" class="form-control"
									placeholder="품목명을 입력해주세요">
							</div>
							<div class="subheader mb-2">사원명</div>
							<div class="mb-3">
								<input type="text" name="emplName" class="form-control"
									placeholder="사원명을 입력해주세요">
							</div>
							<div class="subheader mb-2">협력회사</div>
							<div class="mb-3">
								<input type="text" name="companyName" class="form-control"
									placeholder="협력 회사를 입력해주세요">
							</div>
							<div class="subheader mb-2">주문일자</div>
							<div class="row">
								<div class="col-6">
									<div class="mb-3">
										<input type="date" name="initialScheduledDate"
											class="form-control">
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<input type="date" name="finalScheduledDate" class="form-control">
									</div>
								</div>
							</div>
							<div class="subheader mb-2">
								<h3>납기일자</h3>
							</div>
							<div class="row">
								<div class="col-6">
									<div class="mb-3">
										<input type="date" name="initialDueDate" class="form-control">
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<input type="date" name="finalDueDate" class="form-control">
									</div>
								</div>
							</div>
							<div class="mt-5">
								<button type="button" class="btn btn-primary w-100"
									id="search-button">조회하기</button>
								<a href="progress" class="btn btn-link w-100"> 초기화 </a>
							</div>
						</div>
						<div class="col-9">
							<div class="card">
								<div class="card-body">
									<div id="table-default">
										<table class="table">
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
												<c:forEach items="${ orders }" var="progress">
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
		$("button#search-button").on("click", function(event) {
			var url = "";
			$(event.target).closest("div#search-div").find("input").each(function(index, elem) {
				if ($(elem).val()) {
					url += "&" + $(elem).attr("name") + "=" + $(elem).val();
				}
			});

			url = url.replaceAll("^[&]");
			url = "?" + url;

			location.href = url;
		});
	</script>
</body>
</html>
