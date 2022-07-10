<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../includes/header.jsp"%>
<title>발주 선택 - TeamFoS</title>
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
							<h2 class="page-title">Order</h2>
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
					<div class="row row-cards">
						<div class="col-12">
							<div class="card">
								<form action="printpo" method="post">
									<div class="card-header">
										<h3 class="card-title">계획 선택</h3>
										<div class="ms-auto d-print-none">
											<button type="submit"
												class="btn btn-primary d-none d-sm-inline-block">
												<img src="/resources/img/arrow-big-right.svg" class="icon">
												출력 화면 이동
											</button>
										</div>
									</div>
									<table class="table table-vcenter card-table" id="calendar">
										<caption
											style="caption-side: top; text-align: center; font-size: 30px;">
											<button type="button" id="prev">&lt;</button>
											<span id="year"></span>년 <span id="month"></span>월
											<button type="button" id="next">&gt;</button>
											<div class="d-flex mr-1">
												<div class="ms-auto d-print-none">
													<div class="d-inline-block input-icon">
														<select class="form-control form-control-sm"
															name="companyCode">
															<option value="0">협력업체</option>
															<c:forEach items="${ companies }" var="company">
																<option value="${ company.companyCode }">${ company.companyName }</option>
															</c:forEach>
														</select> <span class="input-icon-addon"> <img
															src="/resources/img/chevron-down.svg" class="icon">
														</span>
													</div>
													<div class="ms-2 d-inline-block">
														<input type="date" class="form-control form-control-sm"
															name="orderDate">
													</div>
												</div>
											</div>
										</caption>
										<thead>
											<tr>
												<th class="sun">SUN</th>
												<th>MON</th>
												<th>TUE</th>
												<th>WED</th>
												<th>THU</th>
												<th>FRI</th>
												<th class="sat">SAT</th>
											</tr>
										</thead>
										<tbody></tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%@ include file="../includes/footer.jsp"%>
		</div>
	</div>

	<script>
		var today = new Date();
		var curYear = today.getFullYear();
		var curMonth = today.getMonth() + 1;

		$("span#year").text(curYear.toString().padStart(4, "0"));
		$("span#month").text(curMonth.toString().padStart(2, "0"));

		drawCalendarSpace();
		drawCalendar(curYear, curMonth);

		$("td.clickable").on(
				"click",
				function() {
					inputDay(curYear
							+ "-"
							+ curMonth.toString().padStart(2, "0")
							+ "-"
							+ $(this).children("div.date").text().padStart(2,
									"0"), "input[name=orderDate]");
				});

		$("#prev").on("click", function() {
			if (curMonth == 1) {
				curMonth = 12;
				curYear--;
			} else {
				curMonth--;
			}

			$("#year").text(curYear.toString().padStart(4, "0"));
			$("#month").text(curMonth.toString().padStart(2, "0"));

			clearCalendar();
			drawCalendar(curYear, curMonth);

			orderList();
		});

		$("#next").on("click", function() {
			if (curMonth == 12) {
				curMonth = 1;
				curYear++;
			} else {
				curMonth++;
			}

			$("#year").text(curYear.toString().padStart(4, "0"));
			$("#month").text(curMonth.toString().padStart(2, "0"));

			clearCalendar();
			drawCalendar(curYear, curMonth);

			orderList();
		});

		orderList();
	</script>
</body>
</html>