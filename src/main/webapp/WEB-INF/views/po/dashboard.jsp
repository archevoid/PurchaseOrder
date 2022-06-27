<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>


<body>
	<div id="wrapper">
		<%@ include file="../includes/nav.jsp"%>
		<div id="page-wrapper" style="min-height: 868px;">
			<div class="row"><span style="display: inline-block; width: 45%; margin-right: 2%;">
				<h3 class="page-header">납기 진도율</h3>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
									 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
			  							<div id="chart_div" style="width: 700px; height: 222px;"></div>
									 <script src="/resources/js/chart.js"></script>
									  
									 <script
									  src="https://code.jquery.com/jquery-2.2.4.min.js"
									  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
									  crossorigin="anonymous">
									 </script>
						  	</table>
						</div>
					</div> <!-- test -->
			</span> 
			<span style="display: inline-block; width: 45%; margin-right: 2%;">
						<h3 class="page-header">구매 발주서</h3>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>NO</th>
											<th>제품명</th>
											<th>수량</th>
											<th>개당 가격</th>
											<th>총액</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>제품A</td>
											<td>a</td>
											<td>b</td>
											<td>a*b</td>
										</tr>
										<tr>
											<td>2</td>
											<td>제품B</td>
											<td>a</td>
											<td>b</td>
											<td>a*b</td>
										</tr>
										<tr>
											<td>3</td>
											<td>제품C</td>
											<td>a</td>
											<td>b</td>
											<td>a*b</td>
										</tr>
										<tr>
											<td>4</td>
											<td>제품D</td>
											<td>a</td>
											<td>b</td>
											<td>a*b</td>
										</tr>
										<tr>
											<td>5</td>
											<td>제품E</td>
											<td>a</td>
											<td>b</td>
											<td>a*b</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
					</span> <span style="display: inline-block; width: 45%; margin-right: 2%;">
						<h3 class="page-header">검수 일정</h3>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>제품명</th>
											<th>수량</th>
											<th>검수 예정일</th>
											<th>협력회사</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>제품A</td>
											<td>100</td>
											<td>2022-06-10</td>
											<td>a회사</td>
										</tr>
										<tr>
											<td>제품B</td>
											<td>200</td>
											<td>2022-06-09</td>
											<td>b회사</td>
										</tr>
										<tr>
											<td>제품C</td>
											<td>300</td>
											<td>2022-06-08</td>
											<td>c회사</td>
										</tr>
										<tr>
											<td>제품A</td>
											<td>100</td>
											<td>2022-06-10</td>
											<td>d회사</td>
										</tr>
										<tr>
											<td>제품A</td>
											<td>100</td>
											<td>2022-06-10</td>
											<td>e회사</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
					</span> <span style="display: inline-block; width: 45%; margin-right: 2%;">
						<h3 class="page-header">협력회사</h3>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>회사명</th>
											<th>주소</th>
											<th>전화번호</th>
											<th>팩스번호</th>
											<th>홈페이지</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>A회사</td>
											<td>경기도 수원시</td>
											<td>000-1111-1234</td>
											<td>1234-5678</td>
											<td><a href="">Teamfos.mit.kr</a></td>
										</tr>
										<tr>
											<td>A회사</td>
											<td>경기도 수원시</td>
											<td>000-1111-1234</td>
											<td>1234-5678</td>
											<td><a href="">Teamfos.mit.kr</a></td>
										</tr>
										<tr>
											<td>A회사</td>
											<td>경기도 수원시</td>
											<td>000-1111-1234</td>
											<td>1234-5678</td>
											<td><a href="">Teamfos.mit.kr</a></td>
										</tr>
										<tr>
											<td>A회사</td>
											<td>경기도 수원시</td>
											<td>000-1111-1234</td>
											<td>1234-5678</td>
											<td><a href="">Teamfos.mit.kr</a></td>
										</tr>
										<tr>
											<td>A회사</td>
											<td>경기도 수원시</td>
											<td>000-1111-1234</td>
											<td>1234-5678</td>
											<td><a href="">Teamfos.mit.kr</a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
					</span> </span style="position: absolute;bottom: 70px; width: 200px;
                            height: 100px; border: 3px solid #8AC007;">
					<h4 class="page-header">관련 프로젝트</h4>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th>프로세스</th>
										<th>주소</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>발주계획</td>
										<td><a href="">order.mit.kr</a></td>
									</tr>
									<tr>
										<td>자재입고</td>
										<td><a href="">minput.mit.kr</a></td>
									</tr>
									<tr>
										<td>자재출고</td>
										<td><a href="">mrelease.mit.kr</a></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- /.table-responsive -->
					</div>
					</span>

				</div>

		</div>
			<!-- /.row (nested) -->
	</div>
		<!-- /.panel-body -->
		<!-- /#wrapper -->

		<!-- jQuery -->
		<script src="../vendor/jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="../vendor/metisMenu/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="../dist/js/sb-admin-2.js"></script>
</body>

</html>