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
									<li class="breadcrumb-item"><a href="dashboard">Purchase Order</a></li>
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
												<th>Num</th>
												<th>담당자</th>
												<th>이메일</th>
												<th>품목</th>
												<th>수량</th>
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
								<div class="table-responsive">
									<table
										class="table card-table table-vcenter text-nowrap datatable">
										<thead>
											<tr>
												<th class="w-1"><input
													class="form-check-input m-0 align-middle" type="checkbox"
													aria-label="Select all invoices" name="selectedOrder"></th>
												<th class="w-1">Num <!-- Download SVG icon from http://tabler-icons.io/i/chevron-up -->
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
												<td><span class="badge bg-success me-1"></span> Paid</td>
												<td>$887</td>
												<td class="text-end"><span class="dropdown">
														<button class="btn dropdown-toggle align-text-top"
															data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#"> Action </a> <a
																class="dropdown-item" href="#"> Another action </a>
														</div>
												</span></td>
											</tr>
											<tr>
												<td><input class="form-check-input m-0 align-middle"
													type="checkbox" aria-label="Select invoice"></td>
												<td><span class="text-muted">001402</span></td>
												<td><a href="invoice.html" class="text-reset"
													tabindex="-1">UX Wireframes</a></td>
												<td><span class="flag flag-country-gb"></span> Adobe</td>
												<td>87956421</td>
												<td>12 Apr 2017</td>
												<td><span class="badge bg-warning me-1"></span> Pending</td>
												<td>$1200</td>
												<td class="text-end"><span class="dropdown">
														<button class="btn dropdown-toggle align-text-top"
															data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#"> Action </a> <a
																class="dropdown-item" href="#"> Another action </a>
														</div>
												</span></td>
											</tr>
											<tr>
												<td><input class="form-check-input m-0 align-middle"
													type="checkbox" aria-label="Select invoice"></td>
												<td><span class="text-muted">001403</span></td>
												<td><a href="invoice.html" class="text-reset"
													tabindex="-1">New Dashboard</a></td>
												<td><span class="flag flag-country-de"></span> Bluewolf</td>
												<td>87952621</td>
												<td>23 Oct 2017</td>
												<td><span class="badge bg-warning me-1"></span> Pending</td>
												<td>$534</td>
												<td class="text-end"><span class="dropdown">
														<button class="btn dropdown-toggle align-text-top"
															data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#"> Action </a> <a
																class="dropdown-item" href="#"> Another action </a>
														</div>
												</span></td>
											</tr>
											<tr>
												<td><input class="form-check-input m-0 align-middle"
													type="checkbox" aria-label="Select invoice"></td>
												<td><span class="text-muted">001404</span></td>
												<td><a href="invoice.html" class="text-reset"
													tabindex="-1">Landing Page</a></td>
												<td><span class="flag flag-country-br"></span>
													Salesforce</td>
												<td>87953421</td>
												<td>2 Sep 2017</td>
												<td><span class="badge bg-secondary me-1"></span> Due
													in 2 Weeks</td>
												<td>$1500</td>
												<td class="text-end"><span class="dropdown">
														<button class="btn dropdown-toggle align-text-top"
															data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#"> Action </a> <a
																class="dropdown-item" href="#"> Another action </a>
														</div>
												</span></td>
											</tr>
											<tr>
												<td><input class="form-check-input m-0 align-middle"
													type="checkbox" aria-label="Select invoice"></td>
												<td><span class="text-muted">001405</span></td>
												<td><a href="invoice.html" class="text-reset"
													tabindex="-1">Marketing Templates</a></td>
												<td><span class="flag flag-country-pl"></span> Printic
												</td>
												<td>87956621</td>
												<td>29 Jan 2018</td>
												<td><span class="badge bg-danger me-1"></span> Paid
													Today</td>
												<td>$648</td>
												<td class="text-end"><span class="dropdown">
														<button class="btn dropdown-toggle align-text-top"
															data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#"> Action </a> <a
																class="dropdown-item" href="#"> Another action </a>
														</div>
												</span></td>
											</tr>
											<tr>
												<td><input class="form-check-input m-0 align-middle"
													type="checkbox" aria-label="Select invoice"></td>
												<td><span class="text-muted">001406</span></td>
												<td><a href="invoice.html" class="text-reset"
													tabindex="-1">Sales Presentation</a></td>
												<td><span class="flag flag-country-br"></span> Tabdaq</td>
												<td>87956621</td>
												<td>4 Feb 2018</td>
												<td><span class="badge bg-secondary me-1"></span> Due
													in 3 Weeks</td>
												<td>$300</td>
												<td class="text-end"><span class="dropdown">
														<button class="btn dropdown-toggle align-text-top"
															data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#"> Action </a> <a
																class="dropdown-item" href="#"> Another action </a>
														</div>
												</span></td>
											</tr>
											<tr>
												<td><input class="form-check-input m-0 align-middle"
													type="checkbox" aria-label="Select invoice"></td>
												<td><span class="text-muted">001407</span></td>
												<td><a href="invoice.html" class="text-reset"
													tabindex="-1">Logo &amp; Print</a></td>
												<td><span class="flag flag-country-us"></span> Apple</td>
												<td>87956621</td>
												<td>22 Mar 2018</td>
												<td><span class="badge bg-success me-1"></span> Paid
													Today</td>
												<td>$2500</td>
												<td class="text-end"><span class="dropdown">
														<button class="btn dropdown-toggle align-text-top"
															data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#"> Action </a> <a
																class="dropdown-item" href="#"> Another action </a>
														</div>
												</span></td>
											</tr>
											<tr>
												<td><input class="form-check-input m-0 align-middle"
													type="checkbox" aria-label="Select invoice"></td>
												<td><span class="text-muted">001408</span></td>
												<td><a href="invoice.html" class="text-reset"
													tabindex="-1">Icons</a></td>
												<td><span class="flag flag-country-pl"></span> Tookapic</td>
												<td>87956621</td>
												<td>13 May 2018</td>
												<td><span class="badge bg-success me-1"></span> Paid
													Today</td>
												<td>$940</td>
												<td class="text-end"><span class="dropdown">
														<button class="btn dropdown-toggle align-text-top"
															data-bs-boundary="viewport" data-bs-toggle="dropdown">Actions</button>
														<div class="dropdown-menu dropdown-menu-end">
															<a class="dropdown-item" href="#"> Action </a> <a
																class="dropdown-item" href="#"> Another action </a>
														</div>
												</span></td>
											</tr>
										</tbody>
									</table>
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
								<h5 class="modal-title">New report</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<div class="mb-3">
									<label class="form-label">Name</label> <input type="text"
										class="form-control" name="example-text-input"
										placeholder="Your report name">
								</div>
								<label class="form-label">Report type</label>
								<div class="form-selectgroup-boxes row mb-3">
									<div class="col-lg-6">
										<label class="form-selectgroup-item"> <input
											type="radio" name="report-type" value="1"
											class="form-selectgroup-input" checked> <span
											class="form-selectgroup-label d-flex align-items-center p-3">
												<span class="me-3"> <span
													class="form-selectgroup-check"></span>
											</span> <span class="form-selectgroup-label-content"> <span
													class="form-selectgroup-title strong mb-1">Simple</span> <span
													class="d-block text-muted">Provide only basic data
														needed for the report</span>
											</span>
										</span>
										</label>
									</div>
									<div class="col-lg-6">
										<label class="form-selectgroup-item"> <input
											type="radio" name="report-type" value="1"
											class="form-selectgroup-input"> <span
											class="form-selectgroup-label d-flex align-items-center p-3">
												<span class="me-3"> <span
													class="form-selectgroup-check"></span>
											</span> <span class="form-selectgroup-label-content"> <span
													class="form-selectgroup-title strong mb-1">Advanced</span>
													<span class="d-block text-muted">Insert charts and
														additional advanced analyses to be inserted in the report</span>
											</span>
										</span>
										</label>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-8">
										<div class="mb-3">
											<label class="form-label">Report url</label>
											<div class="input-group input-group-flat">
												<span class="input-group-text">
													https://tabler.io/reports/ </span> <input type="text"
													class="form-control ps-0" value="report-01"
													autocomplete="off">
											</div>
										</div>
									</div>
									<div class="col-lg-4">
										<div class="mb-3">
											<label class="form-label">Visibility</label> <select
												class="form-select">
												<option value="1" selected>Private</option>
												<option value="2">Public</option>
												<option value="3">Hidden</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">Client name</label> <input
												type="text" class="form-control">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="mb-3">
											<label class="form-label">Reporting period</label> <input
												type="date" class="form-control">
										</div>
									</div>
									<div class="col-lg-12">
										<div>
											<label class="form-label">Additional information</label>
											<textarea class="form-control" rows="3"></textarea>
										</div>
									</div>
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