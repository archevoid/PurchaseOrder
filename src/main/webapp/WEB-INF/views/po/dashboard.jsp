<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../includes/header.jsp"%>
<title>대시보드 - TeamFoS</title>
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
							<!-- Page pre-title -->
							<div class="page-pretitle">Purchase Order</div>
							<h2 class="page-title">Dashboard</h2>
						</div>
						<div class="col-12 col-md-auto ms-auto d-print-none">
							<div class="d-flex">
								<ol class="breadcrumb breadcrumb-arrows"
									aria-label="breadcrumbs">
									<li class="breadcrumb-item"><a href="/logout">Login</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a
										href="#">Dashboard</a></li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="page-body">
				<div class="container-xl">
					<div class="row row-deck row-cards">
						<%-- 달력 시작 --%>
						<div class="col-12">
							<div class="card">
								<form action="printpo" method="post">
									<div class="card-header">
										<h3 class="card-title">발주 목록</h3>
									</div>
									<table class="table table-vcenter card-table" id="calendar">
										<caption
											style="caption-side: top; text-align: center; font-size: 30px;">
											<button type="button" id="prev">&lt;</button>
											<span id="year"></span>년 <span id="month"></span>월
											<button type="button" id="next">&gt;</button>
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
						<%-- 달력 끝 --%>
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

		$("td.clickable").on("click", function() {
			inputDay(curYear + "-" + curMonth.toString().padStart(2, "0") + "-" + $(this).children("div.date").text().padStart(2, "0"), "input[name=scheduledDate]");
		});

		$("#prev").on("click", function() {
			clearCalendar();
			
			if (curMonth == 1) {
				curMonth = 12;
				curYear--;
			} else {
				curMonth--;
			}

			$("#year").text(curYear.toString().padStart(4, "0"));
			$("#month").text(curMonth.toString().padStart(2, "0"));

			drawCalendar(curYear, curMonth);

			orderList();
		});

		$("#next").on("click", function() {
			clearCalendar();
			
			if (curMonth == 12) {
				curMonth = 1;
				curYear++;
			} else {
				curMonth++;
			}

			$("#year").text(curYear.toString().padStart(4, "0"));
			$("#month").text(curMonth.toString().padStart(2, "0"));

			drawCalendar(curYear, curMonth);

			orderList();
		});

		orderList();
	</script>
</body>

</html>
