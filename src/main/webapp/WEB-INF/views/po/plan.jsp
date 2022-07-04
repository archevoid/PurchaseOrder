<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.mit.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
									<th>총 개수</th>
									<th>조달납기</th>
									<th>담당자 이름</th>
									<th>이메일</th>
									<th>총가격</th>
								</tr>
								</thead>
								<tbody>
									<tr>
										<td id="partName"></td>
										<td id="requirement"></td>
										<td id="deliveryDate"></td>
										<td id="empl_num"></td>
										<td id="empl_email"></td>
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
			$.ajax({
				url: "/api/plan",
				type: "GET",
				data: { "planNum" : + $("select[name=planNum]").val() },
				success: function(data) {
					$("#orderInputForm").remove();
					
					if(data == null) {
						$("#partName").text("");
						$("#deliveryDate").text("");
					}
					
					$("#partName").text(data.partName);
					$("#deliveryDate").text(data.deliveryDate);
					$("#requirement").text(data.requirement);
				}
			})
		});
		
		$("button#showInputForm").on("click", function() {
			if($("#orderInputForm").length > 0) {
				return;
			} else {
				$.ajax({
					url: "/api/companyInfo",
					type: "GET",
					data: { "partName" : $("td#partName").text()},
					success: function(data) {
						for(var i = 0; i < Object.keys(data).length; i++) {
							var elem = makeCompanyPanel($(data)[i].contractNum, $(data)[i]);
							
							$("form[action=searchPlan]").after(elem);
							
							
							$("div.panel").draggable();
						}
						
					}
				});
			}
		});
	</script>

</body>

</html>
