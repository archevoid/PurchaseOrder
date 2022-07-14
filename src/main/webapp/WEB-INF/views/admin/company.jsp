<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../includes/header.jsp"%>
<title>정보 관리 - TeamFoS</title>
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
							<h2 class="page-title">정보 관리</h2>
						</div>
						<div class="col-12 col-md-auto ms-auto d-print-none">
							<div class="d-flex">
								<ol class="breadcrumb breadcrumb-arrows"
									aria-label="breadcrumbs">
									<li class="breadcrumb-item"><a
										href="http://m-it.or.kr/main.php">MIT 능력 개발원</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a
										href="#">Common</a></li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="page-body">
				<div class="container-xl">
					<div class="row g-4">
						<div class="col-3">
						</div>
						<div class="col-9" id="company-list-container">
							<div class="row row-cards">
								<div class="col-md-6 col-lg-6" id="location-company"
									style="height: 405.5px;">
									<button type="button" id="inputCompany"
										class="btn btn-primary w-100">회사 추가</button>
								</div>
								<div class="col-md-6 col-lg-6 hidden"
									id="company-info-input-container">
									<form action="addcompany" method="post">
										<div class="card">
											<div class="card-header">
												<h3 class="card-title">회사 입력</h3>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">회사 이름</div>
															<input type="text" class="form-control"
																name="companyName">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">사업자 번호</div>
															<input type="text" class="form-control"
																name="businessNum">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">세무코드</div>
															<input type="text" class="form-control" name="taxCode">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">대표자</div>
															<input type="text" class="form-control" name="owner">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">연락처</div>
															<input type="text" class="form-control" name="contact">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">회사주소</div>
															<input type="text" class="form-control"
																name="companyAddress">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">계좌정보</div>
															<input type="text" class="form-control"
																name="companyAccount">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">업체규모</div>
															<input type="text" class="form-control"
																name="companySize">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">업태분류</div>
															<input type="text" class="form-control"
																name="companyCategory">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">매출액</div>
															<input type="number" class="form-control"
																name="companySales">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">거래형태</div>
															<input type="text" class="form-control" name="dealType">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">내외자구분</div>
															<input type="text" class="form-control" name="domestic">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">결제통화</div>
															<input type="text" class="form-control"
																name="contractCurrency">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">거래개시일</div>
															<input type="date" class="form-control" name="startDate">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">거래종료일</div>
															<input type="date" class="form-control" name="endDate">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">계산서 발행</div>
															<input type="text" class="form-control"
																name="invoiceIssue">
														</div>
													</div>
												</div>
											</div>
											<!-- Card footer -->
											<div class="card-footer">
												<div class="d-flex">
													<button type="button" id="cancelCompany"
														class="btn btn-link">취소</button>
													<button type="submit" class="btn btn-primary ms-auto">입력</button>
												</div>
											</div>
										</div>
									</form>
								</div>
								<c:forEach items="${ companyList }" var="company">
									<div class="col-md-6 col-lg-6 company-info-container">
										<div class="card">
											<div class="card-header">
												<h3 class="card-title">${ company.companyName }</h3>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">사업자 번호</div>
															<input type="text" class="form-control"
																value="${ company.businessNum }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">세무코드</div>
															<input type="text" class="form-control"
																value="${ company.taxCode }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">대표자</div>
															<input type="text" class="form-control"
																value="${ company.owner }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">연락처</div>
															<input type="text" class="form-control"
																value="${ company.contact }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">회사주소</div>
															<input type="text" class="form-control"
																value="${ company.companyAddress }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">계좌정보</div>
															<input type="text" class="form-control"
																value="${ company.companyAccount }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">업체규모</div>
															<input type="text" class="form-control"
																value="${ company.companySize }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">업태분류</div>
															<input type="text" class="form-control"
																value="${ company.companyCategory }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">매출액</div>
															<input type="text" class="form-control"
																value="${ company.companySales }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">거래형태</div>
															<input type="text" class="form-control"
																value="${ company.dealType }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">내외자구분</div>
															<input type="text" class="form-control"
																value="${ company.domestic }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">결제통화</div>
															<input type="text" class="form-control"
																value="${ company.contractCurrency }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">거래개시일</div>
															<input type="text" class="form-control"
																value="${ company.startDate }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">거래종료일</div>
															<input type="text" class="form-control"
																value="${ company.endDate }" readonly>
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">계산서 발행</div>
															<input type="text" class="form-control"
																value="${ company.invoiceIssue }" readonly>
														</div>
													</div>
												</div>
											</div>
											<!-- Card footer -->
											<div class="card-footer">
												<div class="d-flex">
													<button type="button" class="btn btn-link">초기화</button>
													<button type="button" class="btn btn-primary ms-auto"
														id="inputOrder">입력</button>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						
					</div>
				</div>
			</div>

			<%@ include file="../includes/footer.jsp"%>
		</div>
	</div>
	<script>
		$("button#inputCompany").on("click", function() {
			$("div#company-info-input-container").removeClass("hidden");
			$("div#location-company").addClass("hidden");
		});

		$("button#cancelCompany").on("click", function() {
			$("div#company-info-input-container").addClass("hidden");
			$("div#location-company").removeClass("hidden");
		});
		
		$("button#inputPart").on("click", function() {
		    $("div#part-info-input-container").removeClass("hidden");
		    $("div#location-part").addClass("hidden");
		});

		$("button#cancelPart").on("click", function() {
		    $("div#part-info-input-container").addClass("hidden");
		    $("div#location-part").removeClass("hidden");
		});
		
		$("button#company-show-button").on("click", function() {
			location.href="/admin/company";
		});
		$("button#part-show-button").on("click", function() {
			location.href="/admin/part";
		});
	</script>
</body>
</html>