<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
th{ vertical-align: middle !important; }
td{ vertical-align: middle !important; }
</style>
<meta charset="UTF-8">
<title>납기 진도율</title>
</head>
<body>
<div id="wrapper">
		<%@ include file="../includes/nav.jsp"%>
		<div id="page-wrapper" style="min-height: 868px;">
			<div class="row">
				<div class="col-lg-12">
					<table class="table table-striped table-bordered table-hover" style= "width:70%; margin-top:80px; margin-left:100px; margin-bottom:80px;">
	                            <tbody>
	                                <tr style="height:30px;">
	                                	<th>계획번호</th>
	                                	<td colspan="3">
	                                		<select name="planNum" class="form-control">
	                                			<option value="0" class="basicOption">계획 번호</option>
	                                			<c:forEach items="${ planNumList }" var="planNum">
	                                				<option value="${ planNum }"><c:out value="${ planNum }" /></option>
	                                			</c:forEach>
	                                		</select>
                                		</td>
                               		</tr>
									<tr style="height:50px;">
										<th>담당자 이름</th>
										<td>홍길동</td>
										<th>담당자 Email</th>
										<td>hong0123@mit.kr</td>
									</tr>
                               		<tr style="height:50px;">
                               			<th>조달납기</th>
                               			<td>2022-06-27</td>
                               			<th>협력회사</th>
                               			<td>A회사</td>
                               		</tr>
                               		<tr style="height:50px;">
                               			<th>현재수량</th>
                               			<td>1000</td>
                               			<th>목표수량</th>
                               			<td>2000</td>
                               		</tr>
                               	</tbody>
                              </table>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <div id="chart_div" style="width: 1300px; height: 400px;"></div>
  <script src="/resources/js/chart.js"></script>
  
  <script
  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>


<script>
function aaa(){
	$.ajax({
		url:"/api/count",
		type:"get",
		cache:false,
		success:function(data){
			$("#count").text(data);
		}
	});
	
}
</script>
			</div>
		</div>
	</div>
</div>

		<!-- jQuery -->
		<script src="../vendor/jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="../vendor/metisMenu/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="../dist/js/sb-admin-2.js"></script>
</body>