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
									<h3 class="card-title">검수 일정</h3>
									<div class="ms-auto">
										<select class="form-select" name="orderNum">
											<option value="0">발주계획번호</option>
											<c:forEach items="${ orderList }" var="order">
												<option value="${ order.orderNum }">${ order.orderNum }.${
																order.partName }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="card-body">
									<table class="table table-vcenter card-table">
										<thead>
											<tr>
												<th>발주번호</th>
												<th>담당자</th>
												<th>이메일</th>
												<th>품목</th>
												<th>계획 수량</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td id="orderNum"></td>
												<td id="emplNum"></td>
												<td id="email"></td>
												<td id="partName"></td>
												<td id="orderQuantity"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="col-12">
							<div class="card">
								<div class="card-body py-3 ms-auto d-print-none btn-list">
									<span class="d-none d-sm-inline">
										<button type="button" class="btn btn-white">
											<img src="/resources/img/download.svg" class="icon"> 선택
											일정 다운로드
										</button>
									</span>
									<button type="button"
										class="btn btn-primary d-none d-sm-inline-block">
										<img src="/resources/img/upload.svg" class="icon"> 계획입력
									</button>
								</div>
								<div>
									<table
										class="table card-table table-vcenter text-nowrap datatable">
										<thead>
											<tr>
												<th class="w-1"><input
													class="form-check-input m-0 align-middle" type="checkbox"
													aria-label="Select all invoices" name="selectedOrder"></th>
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
												<th>수량</th>
												<th>샘플개수</th>
												<th>상태</th>
												<th>PROGRESS</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><input class="form-check-input m-0 align-middle"
													type="checkbox" aria-label="Select invoice"></td>
												<td><span class="text-muted">001401</span></td>
												<td><a href="invoice.html" class="text-reset"
													tabindex="-1">Design Works</a></td>
												<td><span class="flag flag-country-us"></span> Carlson
													Limited</td>
												<td>87956621</td>
												<td>15 Dec 2017</td>
												<td>$887</td>
												<td class="text-end"><span class="dropdown">
														<button class="btn dropdown-toggle align-text-top"
															data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#"> Action </a>
															<button type="button" class="dropdown-item"
																data-bs-toggle="modal" data-bs-target="#modal-report">
																결과입력</button>
															<button type="button" class="dropdown-item"
																data-bs-toggle="modal" data-bs-target="#modal-report">
																결과 다운로드</button>
												</span></td>
											</tr>

										</tbody>
									</table>
								</div>
								<div class="card-footer d-flex align-items-center">
									<p class="m-0 text-muted">
										Showing <span>1</span> to <span>8</span> of <span>16</span>
										entries
									</p>

								</div>
							</div>
						</div>
					</div>
				</div>

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
												id="orderNum" class="form-control rm-side" readonly>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">차수</label> <input type="number"
												id="inspectionNum" class="form-control rm-side" readonly>
										</div>
									</div>
								</div>
								<div class="mb-3">
									<label class="form-label">검수수량</label> <input type="number"
										id="inspectionQuantity" class="form-control rm-side" readonly>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">샘플수량</label> <input type="number"
												id="sampleQuantity" class="form-control rm-side" readonly>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">샘플비율</label>
											<div class="input-group input-group-flat">
												<input type="number" id="sampleRatio"
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
												id="defectQuantity" class="form-control">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">불량비율</label>
											<div class="input-group input-group-flat">
												<input type="number" id="defectRatio"
													class="form-control rm-side" readonly> <span
													class="input-group-text"> % </span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-body">
								<div class="mb-3">
									<label class="form-label">보완사항 입력 <span
										class="form-label-description"><span
											id="numberOfContent"></span>/1000</span></label>
									<textarea class="form-control" name="complement" rows="6"
										placeholder="보완사항 입력"></textarea>
								</div>
							</div>

							<div class="modal-footer">
								<a href="#" class="btn btn-link link-secondary"
									data-bs-dismiss="modal"> Cancel </a> <a href="#"
									class="btn btn-primary ms-auto" data-bs-dismiss="modal"> <!-- Download SVG icon from http://tabler-icons.io/i/plus -->
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
										height="24" viewBox="0 0 24 24" stroke-width="2"
										stroke="currentColor" fill="none" stroke-linecap="round"
										stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<line x1="12" y1="5" x2="12" y2="19" />
										<line x1="5" y1="12" x2="19" y2="12" /></svg> Create new report
								</a>
							</div>
						</div>
					</div>
				</div>
				<%-- modal 창 끝 --%>
			</div>

			<%@ include file="../includes/footer.jsp"%>
		</div>
	</div>
</body>
</html>