<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
							<h2 class="page-title">발주 입력</h2>
							<%-- <div class="text-muted mt-1">About 2,410 result (0.19
								seconds)</div>--%>
						</div>
						<div class="col-12 col-md-auto ms-auto d-print-none">
							<div class="d-flex">
								<ol class="breadcrumb breadcrumb-arrows"
									aria-label="breadcrumbs">
									<li class="breadcrumb-item"><a href="dashboard">Purchase Order</a></li>
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
					<div class="row g-4">
						<div class="col-3 searcher" id="plan-searcher">
							<div class="subheader mb-2">품목</div>
							<div class="row row-searcher">
								<div class="col-6">
									<div class="mb-3">
										<select id="product-narrowest" class="form-select" name="partCode">
											<option value="0">선택</option>
											<c:forEach items="${ partList }" var="part">
												<option value="${ part.partCode }" <c:if test="${ param.partCode eq part.partCode }">selected</c:if>>
													${ part.partName }
												</option>
											</c:forEach>
											
										</select>
									</div>
								</div>
								<div class="col-6">
									<div class="mb-3">
										<input type="text" id="product-selector-narrowest" class="form-control select-searcher" name="partName" value="${ param.partName }" placeholder="선택 목록 검색">
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
									id="search-button">조회하기</button>
								<a href="plan" class="btn btn-link w-100"> 초기화 </a>
							</div>
						</div>
						<div class="col-9 row row-cards" id="data-area">
							<div class="col-12">
								<div class="card" id="data-plan">
									<div class="card-header">
										<h3 class="card-title">조달계획</h3>
									</div>
									<div class="card-body">
										<div id="table-default">
											<table class="table">
												<thead>
													<tr>
														<th><button class="table-sort"
																data-sort="sort-partCode">계획번호</button></th>
														<th><button class="table-sort"
																data-sort="sort-emplName">품목명</button></th>
														<th><button class="table-sort"
																data-sort="sort-companyName">조달납기</button></th>
														<th><button class="table-sort"
																data-sort="sort-scheduledDate">소요량</button></th>
														<th></th>
													</tr>
												</thead>
												<tbody class="table-tbody">
													<c:forEach items="${ planList }" var="plan">
														<tr class="plan-data">
															<td class="sort-planNum" id="planNum">${ plan.planNum }</td>
															<td class="sort-partName" id="partName">${ plan.partName }</td>
															<td class="sort-dueDate" id="dueDate">${ plan.dueDate }</td>
															<td class="sort-requirement" id="requirement">${ plan.requirement }</td>
															<td class="text-end">
																<c:if test="${ plan.inputQuantity eq plan.requirement }">
																	<button type="button" class="btn" id="show-input" disabled>
																		<img src="/resources/img/row-insert-top.svg"
																			class="icon"> 입력 완료
																	</button>
																</c:if>
																<c:if test="${ plan.inputQuantity ne plan.requirement }">
																	<button type="button" class="btn" id="show-input">
																			<img src="/resources/img/row-insert-top.svg"
																				class="icon"> 발주 입력
																	</button>
																</c:if>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="card-footer d-flex align-items-center">
										<p class="m-0 text-muted">
											Showing <span>
												<c:choose>
													<c:when test="${ (pageNum - 1) * amount + planList.size() eq 0}">
														0
													</c:when>
													<c:otherwise>
														${ (pageNum - 1) * amount + 1  }
													</c:otherwise>
												</c:choose>
											</span> to <span>${ (pageNum - 1) * amount + planList.size() }</span>
											of <span>${ numberOfPlan }</span> entries
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
					if (!$(value).text().includes($(event.target).val()) && $(value).val() != 0) {
						$(value).wrap('<span class="hidden-option" style="display: none;" />');
					}
				});
			}
			
			$selectTag.addClass("is-valid");
			setTimeout(function() { $selectTag.removeClass("is-valid") }, 500);
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
	
		$("button#show-input").on("click", function(event) {
			$("div#data-plan").addClass("hidden");
			
			var elem = '<div class="col-12">'
		        + '<div class="card" id="order-input">' 
		        + ' <div class="card-header">' 
		        + ' <h3 class="card-title"><span id="input-form-planNum"></span>번 계획 발주</h3>' 
		        + ' </div>' 
		        + ' <div class="card-body">' 
		        + ' <div class="form-group mb-4 row border-bottom p-3">' 
		        + ' <div class="col-lg-3">' 
		        + ' <label class="form-label col-3 col-form-label">품목</label>' 
		        + ' <input type="text" id="partName" class="form-control" value="" readonly>' 
		        + ' </div>' 
		        + ' <div class="col-lg-3">' 
		        + ' <label class="form-label col-3 col-form-label">납기</label>' 
		        + ' <input type="date" id="dueDate" class="form-control" value="" name="dueDate" readonly>' 
		        + ' </div>' 
		        + ' <div class="col-lg-3">' 
		        + ' <label class="form-label col-3 col-form-label">잔여량</label>' 
		        + ' <input type="number" id="remainQuantity" class="form-control" value="" name="remainQuantity" readonly>' 
		        + ' </div>' 
		        + ' <div class="col-lg-3">' 
		        + ' <label class="form-label col-3 col-form-label">요구량</label>' 
		        + ' <input type="number" id="requirement" class="form-control" value="" readonly>' 
		        + ' </div>'
		        + ' </div>' 
		        + ' <div class="form-group mb-3 row">' 
		        + ' <label class="form-label col-3 col-form-label">업체</label>' 
		        + ' <div class="col" id="company-container">' 
		        + ' <button type="button" id="company-selector" class="btn w-100">업체 확인</button>' 
		        + ' <!-- ' + '                업체 선택시 업체 이름으로 바뀜' + '                <input type="text" id="companyName" class="form-control" value="" readonly>' + '                <input type="hidden" id="companyCode" value="">' + '            -->'
		        + ' <small class="form-hint">클릭시 업체 선택으로 이동합니다.</small>' 
		        + ' </div>' 
		        + ' </div>' 
		        + ' <div class="form-group mb-3 row">' 
		        + ' <label class="form-label col-3 col-form-label">담당자</label>' 
		        + ' <div class="col">' 
		        + ' <select id="emplNum" class="form-select" name="emplNum">' 
		        + ' <option value="0">선택</option>' 
		        + ' </select>' 
		        + ' </div>' 
		        + ' </div>'
		        + ' <div class="form-group mb-3 row">' 
		        + ' <label class="form-label col-3 col-form-label">발주일자</label>' 
		        + ' <div class="col">' 
		        + ' <input type="date" id="scheduledDate" class="form-control" name="scheduledDate">' 
		        + ' </div>' 
		        + ' </div>' 
		        + ' <div class="form-group mb-3 row">'
		        + ' <label class="form-label col-3 col-form-label">발주수량</label>' 
		        + ' <div class="col">' 
		        + ' <input type="number" id="orderQuantity" class="form-control" name="orderQuantity">' 
		        + ' </div>' 
		        + ' </div>' 
		        + ' <div class="form-footer">' 
		        + ' <div class="card-body py-3 ms-auto d-print-none btn-list float-end px-0">' 
		        + ' <span class="d-none d-sm-inline">' 
		        + ' <button type="button" class="btn btn-white" id="order-cancel">' 
		        + ' <img src="/resources/img/x.svg" class="icon"> 입력 취소' 
		        + ' </button>'
		        + ' </span>' 
		        + ' <button type="button" class="btn btn-primary d-none d-sm-inline-block" id="order-insert">' 
		        + ' <img src="/resources/img/row-insert-top.svg" class="icon"> 입력' 
		        + ' </button>' 
		        + ' </div>' 
		        + ' </div>' 
		        + ' </div>' 
		        + '</div>' 
		        + '</div>';


			$("div#data-area").append(elem);
			$("div#plan-input").focus();
			
			var emplNumArray = [];
			
			$.ajax({
				url : "/api/empl",
				type : "POST",
				async : false,
				success : function(data) {
					for (var i = 0; i < Object.keys(data).length; i++) {
						var id = "white";
		
						emplNumArray[i] = "<option " + "id=" + id + " value='" + data[i].emplNum + "'>" + data[i].emplName + " (" + data[i].emplNum + ") " + data[i].email + "</option>";
						
						$("select#emplNum").append(emplNumArray[i]);
					}
				}
			});
			
			$curPlan = $(event.target).closest("tr.plan-data");
			
			const planNum = $curPlan.find("td#planNum").text();
			const partName = $curPlan.find("td#partName").text();
			const dueDate = $curPlan.find("td#dueDate").text();
			const requirement = $curPlan.find("td#requirement").text();
			
			$("span#input-form-planNum").text(planNum);
			$("input#partName").val(partName);
			$("input#dueDate").val(dueDate);
			$("input#requirement").val(requirement);

			$("button#order-cancel").on("click", function() {
				$("div#order-input").remove();
				$("div.col-company-card").remove();
				$("div#data-plan").removeClass("hidden");

			});
			
			remainQuantity();
			
			$("button#order-insert").on("click", function(event) {
				var $closeCard = $(event.target).closest("div#order-input");
				
				if ($("input#companyName").length == 0) {
					alert("협력회사를 선택해주세요");
					return;
				} else if ($closeCard.find("select[name=emplNum]").val() == 0) {
					alert("담당자를 선택해주세요");
					return;
				} else if ($closeCard.find("input[name=scheduledDate]").val() == null || $closeCard.find("input[name=scheduledDate]").val() == "") {
					alert("발주일자를 입력해주세요");
					return;
				} else if ($closeCard.find("input[name=orderQuantity]").val() == null || $closeCard.find("input[name=orderQuantity]").val() == "") {
					alert("발주수량을 입력해주세요");
					return;
				} 
				
				$.ajax({
					url : "/api/inputOrder",
					type : "POST",
					data : {
						"planNum" : planNum,
						"contractNum" : $closeCard.find("input[name=contractNum]").val(),
						"scheduledDate" : $closeCard.find("input[name=scheduledDate]").val(),
						"orderQuantity" : $closeCard.find("input[name=orderQuantity]").val(),
						"emplNum" : $closeCard.find("select[name=emplNum]").val()
					},
					success : function(data) {
						$closeCard.addClass("bg-primary-lt");
						
						setTimeout(function() { $closeCard.removeClass("bg-primary-lt") }, 1000);
						
						remainQuantity();
					}
				});
			});

			$("button#company-selector").on("click", function(event) {
				if ($("div.col-company-card").length != 0) {
					$("div.col-company-card").remove();
					$(event.target).text("업체 확인");
				} else {
					$(event.target).text("접기");
					$.ajax({
						url : "/api/companyInfo",
						type : "get",
						data : {
							"planNum" : $("span#input-form-planNum").text()
						},
						success : function(data) {
							if (Object.keys(data).length == 0) {
								alert("해당물품을 계약한 회사가 없습니다.");
							}
							
							
							for (var i = 0; i < Object.keys(data).length; i++) {
	
								var elem = makeCompanyCard(data[i]);
	
								$("div#data-area").append(elem);
								
								var offset = $("div.col-company-card").offset();
								
								$("html").animate({scrollTop : offset.top}, 100);
								
								$("button#inputOrder").on("click", function(event) {
									$selectedCompany = $(event.target).closest("div.card-plan");
									
									var companyName = $selectedCompany.find("h3.card-title").text();
									var contractNum = $selectedCompany.find("input[name=contractNum]").val();
									var unitPrice = $selectedCompany.find("span#unitPrice").text();
									
									var companyNameTag = '<input type="text" id="companyName" class="form-control" value="' + companyName + '" name="companyName" readonly>'
									var contractNumTag = '<input type="hidden" id="contractNum" value="' + contractNum + '" name="contractNum">';
									var unitPriceTag = '<input type="hidden" name="unitPrice" value="' + unitPrice + '">';
									
									$("div#company-container").children().remove();
									$("div#company-container").append(companyNameTag + contractNumTag);
									
									$("div.col-company-card").remove();
								});
							}
						}
					});
				}
			});
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
											var $scheduledDateTag = $("#" + companyName + " input[name=scheduledDate]");
											var $dueDateTag = $("#" + companyName + " input[name=dueDate]");
											var $emplNumTag = $("#" + companyName + " select[name=emplNum]");
											var $emailTag = $("#" + companyName + " div#email");
											var $orderQuantityTag = $("#" + companyName + " input[name=orderQuantity]");
											var $sumTag = $("#" + companyName + " span#sum");

											$scheduledDateTag.val(data.scheduledDate);
											$dueDateTag.val(data.dueDate);
											$emplNumTag.val(data.emplNum);
											$emailTag.text(data.email);
											$orderQuantityTag.val(data.orderQuantity);
											$sumTag.text(parseInt(data.orderQuantity) * parseInt(data.unitPrice));

											$scheduledDateTag.prop("disabled", "true");
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
										"scheduledDate" : closeCard.find("input[name=scheduledDate]").val(),
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

							$("input[name=scheduledDate]").on("change", function(event) {
								var closeCard = $(event.target).closest("div.card-plan");
								$.ajax({
									url : "/api/empl",
									type : "POST",
									data : {
										"scheduledDate" : $("input[name=scheduledDate]").val()
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