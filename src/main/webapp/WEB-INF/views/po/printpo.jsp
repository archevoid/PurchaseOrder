<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	/* 사명, 참조, 전화번호, 팩스번호, 주소 */
String[] aboutUs = new String[]{"Team FoS", "", "010-4242-4242", "031-4242-4242", "대한민국 경기도 수원시 권선구 1234-1234"};
%>


<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../includes/header.jsp"%>
<title>발주서 출력 - TeamFoS</title>
<link href="/resources/css/printpo.css" rel="stylesheet">
<link href="/resources/dist/css/demo.min.css" rel="stylesheet" />
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
							<h2 class="page-title">Print Order</h2>
						</div>
						<div class="col-12 col-md-auto ms-auto d-print-none">
							<div class="d-flex">
								<ol class="breadcrumb breadcrumb-arrows"
									aria-label="breadcrumbs">
									<li class="breadcrumb-item"><a href="dashboard">Purchase
											Order</a></li>
									<li class="breadcrumb-item"><a href="order">Order</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a
										href="#">Print Order</a></li>
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
								<div class="card-header d-print-none">
									<h3 class="card-title">계획 선택</h3>
									<div class="ms-auto d-print-none btn-list">
										<span class="d-none d-sm-inline">
											<button type="button" class="btn btn-danger"
												onclick="history.go(-1);">
												<img src="/resources/img/download.svg" class="icon">
												뒤로가기
											</button>
										</span>
										<button type="button"
											class="btn btn-primary d-none d-sm-inline-block"
											onclick="window.print();">
											<img src="/resources/img/upload.svg" class="icon"> 출력
										</button>
									</div>
								</div>

								<div id="content">
									<h1 id="documentName">발주서</h1>
									<div id="planContent">
										<div id="company">
											<div id="companyInfo">
												<!-- company information -->
												<table id="companyTable">
													<thead>
														<tr>
															<th colspan="2" id="title">수주처</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th>상호</th>
															<td>${ orderInfo[0].companyName }</td>
														</tr>
														<tr>
															<th>대표</th>
															<td>${ orderInfo[0].charge }</td>
														</tr>
														<tr>
															<th>연락처</th>
															<td>${ orderInfo[0].contact }</td>
														</tr>
														<tr>
															<th>사업자번호</th>
															<td>${ orderInfo[0].businessNumber }</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div id="companyInfo">
												<table id="companyTable">
													<thead>
														<tr>
															<th colspan="2" id="title">발주처</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th>상호</th>
															<td><%=aboutUs[0]%></td>
														</tr>
														<tr>
															<th>담당자</th>
															<td>${ orderInfo[0].email }</td>
														</tr>
														<tr>
															<th>전화</th>
															<td><%=aboutUs[2]%></td>
														</tr>
														<tr>
															<th>팩스</th>
															<td><%=aboutUs[3]%></td>

														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div id="planInfo">
											<table id="planTable">
												<tbody>
													<tr>
														<th>납기일자</th>
														<td>${ orderInfo[0].dueDate }</td>
													</tr>
													<tr>
														<th>납품장소</th>
														<td><%=aboutUs[4]%></td>
													</tr>
													<tr>
														<th>합계금액</th>
														<td><span id="currency"> <c:set var="curr"
																	value="${ fn:toUpperCase(orderInfo[0].currency) }" />
																<c:choose>
																	<c:when test="${ not empty currency[curr] }">
																		<c:out value="${ currency[curr] }" />
																	</c:when>
																	<c:otherwise>
																		<c:out value="${ currency.other }" />
																	</c:otherwise>
																</c:choose>
														</span> <span class="number total"></span></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div id="productInfo">
											<table id="productTable">
												<thead>
													<tr>
														<th>No</th>
														<th>품명</th>
														<th>수량</th>
														<th>개당 가격</th>
														<th>총 가격</th>
														<th>비고</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach begin="0" end="9" var="i">
														<tr>
															<th>${ i + 1 }</th>
															<td><c:out value="${ orderInfo[i].partName }" /></td>
															<td class="number"><c:out
																	value="${ orderInfo[i].orderQuantity }" /></td>
															<td class="number"><c:out
																	value="${ orderInfo[i].unitPrice }" /></td>
															<td class="totalPrice number"><c:if
																	test="${ (orderInfo[i].orderQuantity ne null) or (orderInfo[i].unitPrice ne null) }">
																	<c:out
																		value="${ orderInfo[i].orderQuantity * orderInfo[i].unitPrice }" />
																</c:if></td>
															<td></td>
														</tr>
													</c:forEach>

													<tr>
														<th>합계</th>
														<td></td>
														<td></td>
														<td></td>
														<td class="number total"></td>
														<td></td>
													</tr>
													<tr>
														<td colspan="6" id="etc">※ 비고</td>
												</tbody>
											</table>
										</div>
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
		$(document).ready(function() {
			let sum = 0;
			$(".totalPrice").each(function() {
				if ((!isNaN($(this).text()) && (!$(this).text().trim() == ""))) {
					sum += parseInt($(this).text());
				}
			});

			$(".total").each(function() {
				$(this).text(sum);
			});

			$(".number").each(function() {
				if ((!isNaN($(this).text()) && (!$(this).text().trim() == ""))) {
					$(this).text(parseInt($(this).text()).toLocaleString('ko-KR'));
				}
			});

			$("table#companyTable tbody th").each(function() {
				if ($(this).text().length > 3) {
					$(this).addClass("longWord");
				}
			});
		});
	</script>

</body>
</html>