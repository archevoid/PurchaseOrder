<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.mit.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>


<script>
	var today = new Date();
	var curYear = today.getFullYear();
	var curMonth = today.getMonth() + 1;
</script>

<body>
	<div id="wrapper">
		<%@ include file="../includes/nav.jsp"%>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">발주서 발행</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<form action="printpo" method="post">
					<div class="panel panel-default">
						<div class="panel-heading">
							<select class="form-control setPanelHeader">
								<option value="0">협력업체</option>
							</select> <input type="date" class="form-control setPanelHeader"
								name="orderDate">
							<div class="pull-right">
								<div class="btn-group in-panel-heading">
									<button class="btn btn-outline btn-primary">발행</button>
									<button type="reset" class="btn btn-outline btn-danger">초기화</button>
								</div>
							</div>
						</div>
						<div class="panel-body">

							

							<table class="table table-hover" id="calendar">
								<caption
									style="caption-side: top; text-align: center; font-size: 30px;">
									<button type="button" id="prev">&lt;&lt;</button>
									<span id="year"><script>
										document.write(curYear.toString()
												.padStart(4, "0"));
									</script></span>년 <span id="month"><script>
										document.write(curMonth.toString()
												.padStart(2, "0"));
									</script></span>월
									<button type="button" id="next">&gt;&gt;</button>
								</caption>
								<thead>
									<tr>
										<th class="sun">SUN</th>
										<th>MON</th>
										<th>TUE</th>
										<th>WED</th>
										<th>THU</th>
										<th>FRI</th>
										<th class="sat">SAT</th>
									</tr>
								</thead>
								<tbody>
									
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
	<script src="/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/dist/js/sb-admin-2.js"></script>
	
	<!-- custom JS -->
	<script src="/resources/js/customScript.js"></script>

	<script>
		drawCalendarSpace();
		drawCalendar(curYear, curMonth);
		
		$("td").on("click", function() {
		    inputDay(curYear + "-" + curMonth.toString().padStart(2, "0") + "-" + $(this).text().padStart(2, "0"));
		});
		
		$("#prev").on("click", function() {
		    if(curMonth == 1) {
		        curMonth = 12;
		        curYear--;
		    } else {
		        curMonth--;
		    }
		
		    $("#year").text(curYear.toString().padStart(4, "0"));
		    $("#month").text(curMonth.toString().padStart(2, "0"));
		
		    clearCalendar();
		    drawCalendar(curYear, curMonth);
		});
		
		$("#next").on("click", function() {
		    if(curMonth == 12) {
		        curMonth = 1;
		        curYear++;
		    } else {
		        curMonth++;
		    }
		
		    $("#year").text(curYear.toString().padStart(4, "0"));
		    $("#month").text(curMonth.toString().padStart(2, "0"));
		
		    clearCalendar();
		    drawCalendar(curYear, curMonth);
		});
	</script>
</body>

</html>
