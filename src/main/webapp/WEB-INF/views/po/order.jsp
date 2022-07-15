<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../includes/header.jsp"%>
<title>계획 검수 - TeamFoS</title>

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
							<h2 class="page-title">발주 확인</h2>
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
					<div class="row g-4">
						<div class="col-3 searcher" id="order-searcher">
							<div class="subheader mb-2">발주품목</div>
							<div class="row row-searcher">
								<div class="col-6">
									<div class="mb-3">
										<select id="part" class="form-select" name="partNum">
											<option value="0">선택</option>
										</select>
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<input type="text" id="part-selector" class="form-control select-searcher" name="partName" value="${ param.partName }">
									</div>
								</div>
							</div>
							<div class="subheader mb-2">회사</div>
							<div class="row row-searcher">
								<div class="col-6">
									<div class="mb-3">
										<select id="company" class="form-select" name="companyCode">
											<option value="0">선택</option>
											<%-- foreach문 으로 가져오기 --%>
										</select>
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<input type="text" id="company-selector" class="form-control select-searcher" name="companyName" value="${ param.companyName }">
									</div>
								</div>
							</div>
							<div class="subheader mb-2">담당자</div>
							<div class="row row-searcher">
								<div class="col-6">
									<div class="mb-3">
										<select id="employee" class="form-select" name="emplNum">
											<option value="0">선택</option>
											<%-- foreach문 으로 가져오기 --%>
										</select>
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<input type="text" id="employee-selecotr" class="form-control select-searcher" name="emplName" value="${ param.emplName }">
									</div>
								</div>
							</div>
							<div class="subheader mb-2">발주일자</div>
							<div class="row row-searcher">
								<div class="col-6">
									<div class="mb-3">
										<input type="date" id="initialOrderDate" class="form-control" name="initialOrderDate" value="${ param.initialOrderDate }">
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<input type="date" id="finalOrderDate" class="form-control" name="finalOrderDate" value="${ param.finalOrderDate }">
									</div>
								</div>
							</div>
							<div class="subheader mb-2">조달납기</div>
							<div class="row row-searcher">
								<div class="col-6">
									<div class="mb-3">
										<input type="date" id="initialDueDate" class="form-control" name="initialDueDate" value="${ param.initialDueDate }">
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<input type="date" id="finalDueDate" class="form-control" name="finalDueDate" value="${ param.finalDueDate }">
									</div>
								</div>
							</div>
							<div class="mt-5">
								<button type="button" class="btn btn-primary w-100"
									id="search-button">Confirm changes</button>
								<a href="order" class="btn btn-link w-100"> Reset to
									defaults </a>
							</div>
						</div>
						<div class="col-9 row row-cards" id="data-area">
							<div class="col-12">
								<div class="card" id="data-order">
									<div class="card-header">
										<h3 class="card-title">발주 확인</h3>
									</div>
									<div class="card-body">
										<div id="table-default">
											<table class="table">
												<thead>
													<tr>
														<th><button class="table-sort"
																data-sort="sort-orderNum">발주번호</button></th>
														<th><button class="table-sort"
																data-sort="sort-emplName">발주담당자</button></th>
														<th><button class="table-sort"
																data-sort="sort-partName">품목명</button></th>
														<th><button class="table-sort"
																data-sort="sort-companyName">회사명</button></th>
														<th><button class="table-sort"
																data-sort="sort-leadTime">Lead Time</button></th>
														<th><button class="table-sort"
																data-sort="sort-orderQuantity">발주수량</button></th>
														<th><button class="table-sort"
																data-sort="sort-orderDate">발주일자</button></th>
														<th><button class="table-sort"
																data-sort="sort-dueDate">조달납기</button></th>
														<th><button class="table-sort"
																data-sort="sort-price">총 금액</button></th>
														<th><button class="table-sort"
																data-sort="sort-print">발주서 상태</button></th>
														<th></th>
													</tr>
												</thead>
												<tbody class="table-tbody">
													<c:forEach items="${ orderList }" var="order">
														<form action="printpo" method="post">
														<tr class="plan-data">
															<td class="sort-orderNum" id="orderNum">${ order.orderNum }</td>
															<td class="sort-emplName" id="emplName">${ order.emplName }</td>
															<td class="sort-partName" id="partName">${ order.partName }</td>
															<td class="sort-companyName" id="companyName">${ order.companyName }</td>
															<td class="sort-leadTime" id="leadTime">${ order.leadTime }</td>
															<td class="sort-orderQuantity" id="orderQuantity">${ order.orderQuantity }</td>
															<td class="sort-orderDate" id="orderDate">${ order.orderDate }</td>
															<td class="sort-dueDate" id="dueDate">${ order.dueDate }</td>
															<td class="sort-price" id="price"></td>
															<td class="sort-status" id="status"></td> 
															<td class="text-end">
																<button type="submit" class="btn" id="show-order-page">
																	<img src="/resources/img/row-insert-top.svg"
																		class="icon"> 발주서 발행
																</button>
															</td>
														</tr>
														<input type="hidden" name="companyCode" value="${ order.companyCode }">
														<input type="hidden" name="orderDate" value="${ order.orderDate }">
														</form>
													</c:forEach>
												</tbody>
											</table>
										</div>
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
											of <span>${ numberOfOrder }</span> entries
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
												<c:if test="${ num eq pageInfo.curPageDto.pageNum }">

												</c:if>
												<c:choose>
													<c:when test="${ num eq pageInfo.curPageDto.pageNum }">
														<li class="page-item active"><button
																class="page-link page-number">${ num }</button></li>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when
																test="${ pageInfo.curLastPage le pageInfo.lastPage }">
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
					if (!$(value).text().includes($(event.target).val()) && $(value).val != 0) {
						$(value).wrap('<span class="hidden-option" style="display: none;" />');
					}
				});
			}
		});
		
		$("button#search-button").on("click", function() {
			// var url = window.location.href;
			var url = window.location.protocol + "//" + window.location.host + window.location.pathname;
			
			$("div.row-searcher select").each(function(index, value) {
				if ($(value).val() != 0 && $(value).val() != null) {
					var inputName = $(value).attr("name");
					
					if (url.indexOf(inputName) != -1) {
						var regex = new RegExp(inputName + "=[^&]+", "g");
						url = url.replace(regex, inputName + "=" + $(value).val());
					} else if (url.match(/[?].+[=].+/)) {
						url = url + "&" + inputName + "=" + $(value).val();
					} else {
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
					} else if (url.match(/[?].+[=].+/)) {
						url = url + "&" + inputName + "=" + $(value).val();
					} else {
						url = url + "?" + inputName + "=" + $(value).val();
					}
				}
			});
			location.href = url;
		});
	
		$("button#show-order-page").on("click", function(event) {
			
		});
		
		
		$("button.page-number").on("click", function(event) {
			var url = window.location.href;
			
			if (url.indexOf("pageNum=") != -1) {
				url = url.replace(/pageNum=\d+/, "pageNum=" + $(event.target).text());
			} else if (url.match("/[?].+[=].+")) {
				url = url + "&pageNum=" + $(event.target).text();
			} else {
				url = url + "?pageNum=" + $(event.target).text();
			}
			
			location.href = url;
		});
		
		$("button.page-prev").on("click", function(event) {
			var url = window.location.href;
			

			if (url.indexOf("pageNum=") != -1) {
				url = url.replace(/pageNum=\d+/, "pageNum=" + "${ pageInfo.curFirstPage - 1 }");
			} else if (url.match("/[?].+[=].+")) {
				url = url + "&pageNum=" + "${ pageInfo.curFirstPage - 1 }";
			} else {
				url = url + "?pageNum=" + "${ pageInfo.curFirstPage - 1 }";
			}
			
			location.href = url;
		});
		
		$("button.page-next").on("click", function(event) {
			var url = window.location.href;
			

			if (url.indexOf("pageNum=") != -1) {
				url = url.replace(/pageNum=\d+/, "pageNum=" + "${ pageInfo.curLastPage + 1 }");
			} else if (url.match("/[?].+[=].+")) {
				url = url + "&pageNum=" + "${ pageInfo.curLastPage + 1 }";
			} else {
				url = url + "?pageNum=" + "${ pageInfo.curLastPage + 1 }";
			}
			
			location.href = url;
		});
		
		
		
		
		
		

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
							$("#dueDate").text("");
						}

						$("#partName").text(data.partName);
						$("#dueDate").text(data.dueDate);
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