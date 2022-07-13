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
						<div class="col-9" id="part-list-container">
							<div class="row row-cards">
								<div class="col-md-6 col-lg-6" id="location-part"
									style="height: 405.5px;">
									<button type="button" id="inputPart"
										class="btn btn-primary w-100">품목 추가</button>
								</div>
								<div class="col-md-6 col-lg-6 hidden"
									id="part-info-input-container">
									<form action="addpart" method="post" enctype="multipart/form-data">
										<div class="card">
											<div class="card-header">
												<h3 class="card-title">품목 입력</h3>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">품목 이름</div>
															<input type="text" class="form-control" name="partName">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">닉네임</div>
															<input type="text" class="form-control"
																name="partNickname">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">품목구분</div>
															<input type="text" class="form-control" name="partClass">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">설명</div>
															<input type="text" class="form-control" name="partRemark">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">공용여부</div>
															<input type="text" class="form-control" name="common">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">도면번호</div>
															<input type="text" class="form-control" name="drawNum">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">도면이미지</div>
															<input type="file" class="form-control" name="drawFile">
														</div>
													</div>
												</div>
											</div>
											<!-- Card footer -->
											<div class="card-footer">
												<div class="d-flex">
													<button type="button" id="cancelPart" class="btn btn-link">취소</button>
													<button type="submit" class="btn btn-primary ms-auto">입력</button>
												</div>
											</div>
										</div>
									</form>
								</div>
								<c:forEach items="${ partList }" var="part">
									<div class="col-md-6 col-lg-6 part-info-container">
										<div class="card">
											<div class="card-header">
												<h3 class="card-title">${ part.partName }</h3>
											</div>
											<div class="card-body">
												<div class="row">
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">품목 이름</div>
															<input type="text" class="form-control" name="partName"
																value="${ part.partName }">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">닉네임</div>
															<input type="text" class="form-control"
																name="partNickname" value="${ part.partNickname }">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">품목구분</div>
															<input type="text" class="form-control" name="partClass"
																value="${ part.partClass }">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">설명</div>
															<input type="text" class="form-control" name="partRemark"
																value="${ part.partRemark }">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">공용여부</div>
															<input type="text" class="form-control" name="common"
																value="${ part.common }">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">도면번호</div>
															<input type="text" class="form-control" name="drawNum"
																value="${ part.drawNum }">
														</div>
													</div>
													<div class="col-lg-6">
														<div class="mb-3">
															<div class="form-label">도면이미지</div>
															<img src="/resources/data/${ part.drawImage }">
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