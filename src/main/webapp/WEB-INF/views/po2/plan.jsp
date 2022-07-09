<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.mit.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<%@ include file="../includes/header.jsp"%>

<body>
	<div id="wrapper">
		<%@ include file="../includes/nav.jsp"%>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">발주 계획</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<form action="searchPlan" method="post">
					<div class="panel panel-default">
						<div class="panel-heading">
							<select class="form-control setPanelHeader" name="planNum">
								<option value="0">계획번호</option>
								<c:forEach items="${ planNum }" var="num">
									<option value="${ num }">${ num }</option>
								</c:forEach>
							</select>
							<div class="pull-right">
								<div class="btn-group in-panel-heading">
									<button type="button" class="btn btn-outline btn-primary" id="showInputForm">조회</button>
									<button type="reset" class="btn btn-outline btn-danger">초기화</button>
								</div>
							</div>
						</div>
						<div class="panel-body">
							
							<table class="table table-hover centerAll" id="planInfo">
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
										<td id="total_price"></td>
									</tr>
								</tbody>
							</table>
							
						</div>
					</div>
				</form>
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

	<!-- jQuery -->
	

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>
	<script src="/resources/js/customScript.js" type="text/javascript"></script>

	<script>
		$("select[name=planNum]").on("change", function() {
			$("form#orderInputForm").each(function(index, value) {
				$(value).remove();
			});
			
			if($("select[name=planNum]").val() != 0) {
				$.ajax({
					url: "/api/plan",
					type: "GET",
					data: { "planNum" : $("select[name=planNum]").val() },
					success: function(data) {
						if(data == null) {
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
			}
		});
		
		$("button#showInputForm").on("click", function() {
			var emplNumArray = [];
			
			$.ajax({
				url: "/api/empl",
				type: "POST",
				async: false,
				success: function(data) {
					for(var i = 0; i < Object.keys(data).length; i++) {
						var id = "white";
						
						emplNumArray[i] = "<option " + "id=" + id + " value='" + data[i].emplNum + "'>" + data[i].emplName + "(" + data[i].emplNum + ")</option>";
					}
				}
			});
			
			if($("#orderInputForm").length > 0) {
				return;
			} else {
				$.ajax({
					url: "/api/companyInfo",
					type: "GET",
					data: { "planNum" : $("select[name=planNum]").val() },
					success: function(data) {
						
						var empl_temp = 0;
						
						for(var i = 0; i < Object.keys(data).length; i++) {
							
							var elem = makeCompanyPanel(data[i].contractNum, data[i]);
							
							$("form[action=searchPlan]").after(elem);
							
							$("div.panel").draggable();
							
							$("input[name=contractNum]").val($("select[name=planNum]").val());
							
							for(var j = 0; j < emplNumArray.length; j++) {
								var $selectEmplNum = $("select[name=emplNum]").eq(0);
								$selectEmplNum.append(emplNumArray[j]);
							}

							
							if(data[i].existance != 0) {
								$.ajax({
									url: "/api/currentOrder",
									type: "POST",
									data: {
										"planNum" : $("select[name=planNum]").val()
										, "contractNum" : data[i].contractNum
									},
									success: function(data) {
										var $orderDateTag = $("input[name=orderDate]").eq(0);
										var $emplNumTag = $("select[name=emplNum]").eq(0);
										var $emailTag = $("td#email").eq(0);
										var $orderQuantityTag = $("input[name=orderQuantity]").eq(0);
										var $sumTag = $("td#sum").eq(0);
										
										$orderDateTag.val(data.orderDate);
										$emplNumTag.val(data.emplNum);
										$emailTag.text(data.email);
										$orderQuantityTag.val(data.orderQuantity);
										$sumTag.text(parseInt(data.orderQuantity) * parseInt(data.unitPrice));
										
										$orderDateTag.prop("disabled", "true");
										$emplNumTag.prop("disabled", "true");
										$orderQuantityTag.prop("disabled", "true");
									}
								});
							}
						}
						
						$("select[name=emplNum]").on("change", function(event) {
							if($(event.target).val() != '0') {
								$.ajax({
									url: "/api/emplEmail",
									type: "POST",
									data: { "emplNum" : $(this).val() },
									success: function(data) {
										$(event.target).closest("div.panel").find("td#email").text(data);
									}
								});
							}
						});
						
						$("button#inputOrder").on("click", function() {
							var panel = $(this).closest("div.panel");
							$.ajax({
								url: "/api/inputOrder",
								type: "POST",
								data: {
									"planNum" : $("select[name=planNum]").val()
									, "contractNum" : panel.find("span#contractNum").text()
									, "orderDate" : panel.find("input[name=orderDate]").val()
									, "orderQuantity" : panel.find("input[name=orderQuantity]").val()
									, "emplNum" : panel.find("select[name=emplNum]").val()
								},
								success: function(data) {
									remainQuantity();
									refreshTotalPrice();
								}
							});
						});
						
						$("input[name=orderDate]").on("change", function(event) {
							var panel = $(event.target).closest("div.panel");
							$.ajax({
								url: "/api/empl",
								type: "POST",
								data: { "orderDate" : $("input[name=orderDate]").val() },
								success: function(data) {
									panel.find("td#email").text("");
									
									for(var i = 0; i < Object.keys(data).length; i++) {
										
										var id = "white";
										
										if(data[i].sameCompanyAtSameDay > 0) {
											id = "green";
										} else if(data[i].sameDay > 0) {
											id = "red";
										} else if(data[i].sameCompany > 0) {
											id = "blue";
										}
										
										var elem = "<option " + "id=" + id + " value='" + data[i].emplNum + "'>" + data[i].emplName + "(" + data[i].emplNum + ")</option>";
										
										panel.find("select[name=emplNum] option:not([value=0])").remove();
										
										panel.find("select[name=emplNum]").each(function() {
											for(var i = 0; i < Object.keys(data).length; i++) {
												
												var id = "white";
												
												var elem = "<option " + "id=" + id + " value='" + data[i].emplNum + "'>" + data[i].emplName + "(" + data[i].emplNum + ")</option>";
												
												panel.find("select[name=emplNum]").append(elem);
											}
										});
									}
								}
							});
						});
						
						$("input[name=orderQuantity]").on("focus keyup change", function(event) {
							$(event.target).closest("div.panel").find("td#sum").text($(event.target).closest("div.panel").find("td#unitPrice").text() * $(this).val());
						});
					}
				});
			}
		});
	</script>

</body>

</html>
