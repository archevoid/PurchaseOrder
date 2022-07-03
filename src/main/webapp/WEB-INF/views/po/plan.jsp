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
							<select class="form-control setPanelHeader">
								<option value="0">계획번호</option>
							</select>
							<div class="pull-right">
								<div class="btn-group in-panel-heading">
									<button type="button" class="btn btn-outline btn-primary">조회</button>
									<button type="reset" class="btn btn-outline btn-danger">초기화</button>
								</div>
							</div>
						</div>
						<div class="panel-body">
							
								<table class="table table-hover centerAll">
									<thead>
									<tr>
										<th>품목명</th>
										<th>조달납기</th>
										<th>담당자 이름</th>
										<th>이메일</th>
										<th>총가격</th>
									</tr>
									</thead>
									<tbody>
										<tr>
											<td>컴퓨터</td>
											<td>2022-06-01</td>
											<td>홍길동</td>
											<td>hong@hong.com</td>
											<td>100,000</td>
										</tr>
									</tbody>
								</table>
							
						</div>
					</div>
				</form>
				<form action="plan" method="post">
					<div class="panel panel-default">
						<div class="panel-heading">
							<span class="setPanelHeader">
								<b>발주 계획 입력</b>
							</span>
							<div class="pull-right">
								<div class="btn-group in-panel-heading">
									<button type="button" class="btn btn-outline btn-primary">입력</button>
									<button type="reset" class="btn btn-outline btn-danger">초기화</button>
								</div>
							</div>
						</div>
						<div class="panel-body">
								<table class="table table-hover centerAll">
									<thead>
										<tr>
											<th>협력회사</th>
											<th>발주일자</th>
											<th>공급가격</th>
											<th>수량</th>
											<th>소계</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Amazon</td>
											<td>2022-06-14</td>
											<td>1000</td>
											<td><input type="number" name="orderQuantity"
												class="form-control middle"></td>
											<td>1000</td>
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

	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>

	<script src="/resources/js/customScript.js" type="text/javascript"></script>
</body>

</html>
