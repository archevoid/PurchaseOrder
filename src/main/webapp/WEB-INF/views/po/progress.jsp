<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>납기 진도율</title>
</head>
<body>
<div id="wrapper">
		<%@ include file="../includes/nav.jsp"%>
		<div id="page-wrapper" style="min-height: 868px;">
			<div class="row">
				<div class="col-lg-12">
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <div id="chart_div" style="width: 1100px; height: 600px;"></div>
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