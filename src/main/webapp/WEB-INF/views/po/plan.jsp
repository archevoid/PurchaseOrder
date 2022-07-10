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
							<h2 class="page-title">Plan</h2>
						</div>
						<div class="col-12 col-md-auto ms-auto d-print-none">
							<div class="d-flex">
								<ol class="breadcrumb breadcrumb-arrows"
									aria-label="breadcrumbs">
									<li class="breadcrumb-item"><a href="dashboard">Purchase
											Order</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a
										href="#">Plan</a></li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="page-body">
				<div class="container-xl">
					<div class="row row-cards">
						<div class="col-12" id="orders">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">발주 계획 입력</h3>
									<div class="ms-auto">
										<select class="form-select" name="planNum">
											<option value="0">계획번호</option>
											<c:forEach items="${ planNum }" var="num">
												<option value="${ num }">${ num }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="card-body">

									<table class="table table-vcenter card-table" id="planInfo">
										<thead>
											<tr>
												<th>품목명</th>
												<th>남은 개수</th>
												<th>총 개수</th>
												<th>조달납기</th>
												<th>입력가격</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td id="partName"></td>
												<td id="remainQuantity"></td>
												<td id="requirement"></td>
												<td id="deliveryDate"></td>
												<td id="inputPrice"></td>
											</tr>
										</tbody>
									</table>
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
		$("select[name=planNum]").on("change", function() {
			$("div.col-company-card").each(function(index, value) {
				$(value).remove();
			});

			if ($("select[name=planNum]").val() != 0) {
				$.ajax({
					url : "/api/plan",
					type : "GET",
					data : {
						"planNum" : $("select[name=planNum]").val()
					},
					success : function(data) {
						if (data == null) {
							$("#partName").text("");
							$("#deliveryDate").text("");
						}

						$("#partName").text(data.partName);
						$("#deliveryDate").text(data.deliveryDate);
						$("#requirement").text(data.requirement);

						remainQuantity();
						refreshTotalPrice();
					}
				})

				var emplNumArray = [];

				$.ajax({
					url : "/api/empl",
					type : "POST",
					async : false,
					success : function(data) {
						for (var i = 0; i < Object.keys(data).length; i++) {
							var id = "white";

							emplNumArray[i] = "<option " + "id=" + id + " value='" + data[i].emplNum + "'>" + data[i].emplName + " (" + data[i].emplNum + ") " + data[i].email + "</option>";
						}
					}
				});

				if ($("div.col-company-card").length > 0) {
					return;
				} else {
					$.ajax({
						url : "/api/companyInfo",
						type : "GET",
						data : {
							"planNum" : $("select[name=planNum]").val()
						},
						success : function(data) {

							for (var i = 0; i < Object.keys(data).length; i++) {

								var elem = makeCompanyCard(data[i]);

								$("div#orders").after(elem);
								
								var companyName = data[i].companyName;

								for (var j = 0; j < emplNumArray.length; j++) {
									var $selectEmplNum = $('#' + companyName + " select[name=emplNum]");
									$selectEmplNum.append(emplNumArray[j]);
								}

								if (data[i].existance != 0) {
									$("#" + companyName + " div.card-plan").addClass("bg-primary-lt");
									$.ajax({
										url : "/api/currentOrder",
										type : "POST",
										async : false,
										data : {
											"planNum" : $("select[name=planNum]").val(),
											"contractNum" : data[i].contractNum
										},
										success : function(data) {
											var $orderDateTag = $("#" + companyName + " input[name=orderDate]");
											var $dueDateTag = $("#" + companyName + " input[name=dueDate]");
											var $emplNumTag = $("#" + companyName + " select[name=emplNum]");
											var $emailTag = $("#" + companyName + " div#email");
											var $orderQuantityTag = $("#" + companyName + " input[name=orderQuantity]");
											var $sumTag = $("#" + companyName + " span#sum");
											
											$orderDateTag.val(data.orderDate);
											$dueDateTag.val(data.dueDate);
											$emplNumTag.val(data.emplNum);
											$emailTag.text(data.email);
											$orderQuantityTag.val(data.orderQuantity);
											$sumTag.text(parseInt(data.orderQuantity) * parseInt(data.unitPrice));

											$orderDateTag.prop("disabled", "true");
											$dueDateTag.prop("disabled", "true");
											$emplNumTag.prop("disabled", "true");
											$orderQuantityTag.prop("disabled", "true");
										}
									});
								}
							}

							$("select[name=emplNum]").on("change", function(event) {
								if ($(event.target).val() != '0') {
									$.ajax({
										url : "/api/emplEmail",
										type : "POST",
										data : {
											"emplNum" : $(this).val()
										},
										success : function(data) {
											$(event.target).closest("div.card-plan").find("div#email").text(data);
										}
									});
								}
							});

							$("button#inputOrder").on("click", function() {
								var closeCard = $(this).closest("div.card-plan");
								$.ajax({
									url : "/api/inputOrder",
									type : "POST",
									data : {
										"planNum" : $("select[name=planNum]").val(),
										"contractNum" : closeCard.find("input[name=contractNum]").val(),
										"orderDate" : closeCard.find("input[name=orderDate]").val(),
										"dueDate" : closeCard.find("input[name=dueDate]").val(),
										"orderQuantity" : closeCard.find("input[name=orderQuantity]").val(),
										"emplNum" : closeCard.find("select[name=emplNum]").val()
									},
									success : function(data) {
										remainQuantity();
										refreshTotalPrice();
									}
								});
							});

							$("input[name=orderDate]").on("change", function(event) {
								var closeCard = $(event.target).closest("div.card-plan");
								$.ajax({
									url : "/api/empl",
									type : "POST",
									data : {
										"orderDate" : $("input[name=orderDate]").val()
									},
									success : function(data) {
										closeCard.find("div#email").text("");

										for (var i = 0; i < Object.keys(data).length; i++) {

											var id = "white";

											if (data[i].sameCompanyAtSameDay > 0) {
												id = "green";
											} else if (data[i].sameDay > 0) {
												id = "red";
											} else if (data[i].sameCompany > 0) {
												id = "blue";
											}

											var elem = "<option " + "id=" + id + " value='" + data[i].emplNum + "'>" + data[i].emplName + "(" + data[i].emplNum + ")</option>";

											closeCard.find("select[name=emplNum] option:not([value=0])").remove();

											closeCard.find("select[name=emplNum]").each(function() {
												for (var i = 0; i < Object.keys(data).length; i++) {

													var id = "white";

													var elem = "<option " + "id=" + id + " value='" + data[i].emplNum + "'>" + data[i].emplName + "(" + data[i].emplNum + ")</option>";

													closeCard.find("select[name=emplNum]").append(elem);
												}
											});
										}
									}
								});
							});

							$("input[name=orderQuantity]").on("focus keyup change", function(event) {
								var $thisCard = $(event.target).closest("div.card-plan");
								
								$thisCard.find("span#sum").text($thisCard.find("span#unitPrice").text() * $(event.target).val());
							});
						}
					});
				}
			}
		});
	</script>


</body>

</html>