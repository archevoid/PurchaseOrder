<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.mit.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>

<style>
	#card {
		background-color: white;
		display: inline-block;
		height: 10%;
		width: 100%;
	}
	
	.card-header {
		padding-bottom: 9px;
		margin: 0px 0 20px;
		border-bottom: 1px solid #eee;
	}
	
	#button-area {
		float: right;
	}
	
	button#rightbutton {
		float: right;
	}
	
	div.in-panel-heading {
		top: -7px;
		background-color: white;
	}
	
	th, td {
		text-align: center;
		vertical-align: middle !important;
		font-size: 15px;
	}
	
	.middle {
		width: 100px;
		margin: auto;
	}
</style>

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

				<div class="panel panel-default">
					<div class="panel-heading">
						계획 선택
						<div class="pull-right">
							<div class="btn-group in-panel-heading">
								<button type="button" class="btn btn-outline btn-primary">조회</button>
								<button type="button" class="btn btn-outline btn-danger">초기화</button>
							</div>
						</div>
					</div>
					<div class="panel-body">
						<form>
							<table class="table">
								<tr>
									<th>계획번호</th>
									<td><select class="form-control">
											<option value="0">계획번호</option>
									</select></td>
									<th>품목명</th>
									<td><select class="form-control">
											<option value="0">품목명</option>
									</select></td>
								</tr>
								<tr>
									<th>담당자 이름</th>
									<td>홍길동</td>
									<th>이메일</th>
									<td>hong@hong.com</td>
									<th>조달납기</th>
									<td>2022-06-01</td>
									<th>총가격</th>
									<td>100,000</td>
								</tr>
							</table>
						</form>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">발주 계획 입력</div>
					<div class="panel-body">
						<form action="plan" method="post">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>협력회사</th>
										<th>발주일자</th>
										<th>공급가격</th>
										<th>수량</th>
										<th>소계</th>
										<th></th>
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
										<td><button class="btn btn-primary btn-sm"
												style="width: 100%;">입력</button></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>


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
