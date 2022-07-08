<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.mit.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>

<link href="/resources/css/customCss.css" rel="stylesheet">

<body>
	<div id="wrapper">
		<%@ include file="../includes/nav.jsp"%>
        <!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">진척검수</h1>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <select class="form-control setPanelHeader" name="orderNum">
                            <option value="0">발주계획번호</option>
                            <c:forEach items="${ orderList }" var="order">
                            	<option value="${ order.orderNum }">${ order.orderNum }.${ order.partName }</option>
                            </c:forEach>
                        </select>
                        <div class="pull-right">
                            <div class="btn-group in-panel-heading">
                                <button type="button" class="btn btn-outline btn-primary" id="inputPlanbtn">계획입력</button>
                                <button type="button" class="btn btn-outline btn-info">일정다운로드</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover centerAll">
                            <thead>
                            	<tr>
	                                <th>담당자</th>
	                                <th>이메일</th>
	                                <th>품목</th>
	                                <th>수량</th>
	                                <th>조달납기</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<tr>
	                                <td>홍길동</td>
	                                <td>hong@hong.ong</td>
	                                <td>동</td>
	                                <td>100</td>
	                                <td>2022-06-06</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="panel panel-default hidden" id="inputPlan">
                    <div class="panel-heading">
                        <span class="setPanelHeader"><b><span id="inputInspectionNum">n+1</span>차 검수 계획 입력</b></span>
                        <input class="form-control setPanelHeader" type="date" name="inspectionDate">
                        <div class="pull-right">
                            <div class="btn-group in-panel-heading">
                                <button type="button" class="btn btn-outline btn-primary">계획등록</button>
                                <button type="reset" class="btn btn-outline btn-danger">초기화</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover" id="calendar">
                            <caption
                                style="caption-side: top; text-align: center; font-size: 30px;">
                                <button type="button" id="prev">&lt;&lt;</button>
                                <span id="year"></span>년 
                                <span id="month"></span>월
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


                <div class="panel panel-default" id="draggable">
                    <div class="panel-heading">
                        <span class="setPanelHeader"><b><span class="inspectionNum">1</span>차 검수</b></span>
                        <div class="pull-right">
                            <div class="btn-group in-panel-heading">
                                <button type="button" class="btn btn-outline btn-primary">결과입력</button>
                                <button type="reset" class="btn btn-outline btn-info">결과다운로드</button>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover centerAll">
                            <thead>
                            	<tr>
	                                <th>검수일자</th>
	                                <th>수량</th>
	                                <th>샘플개수</th>
	                                <th>상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<tr>
	                                <td>2022-06-06</td>
	                                <td>100</td>
	                                <td>10</td>
	                                <td>진행중</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

				
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

    <script src="/resources/js/customScript.js"></script>
    <script>
        var today = new Date();
		var curYear = today.getFullYear();
		var curMonth = today.getMonth() + 1;
		
		$("span#year").text(curYear.toString().padStart(4, "0"));
		$("span#month").text(curMonth.toString().padStart(2, "0"));
		
		
		$("span#year").text(curYear.toString().padStart(4, "0"));
		$("span#month").text(curMonth.toString().padStart(2, "0"));

        drawCalendarSpace();

        drawCalendar(curYear, curMonth);
            
            $("td").on("click", function() {
                inputDay(curYear + "-" + curMonth.toString().padStart(2, "0") + "-" + $(this).text().padStart(2, "0"), "input[name=inspectionDate]");
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

        $("#inputPlanbtn").on("click", function() {
            $("#inputPlan").toggleClass('hidden');
        });
    </script>
    
    <!-- jQuery -->
    

    <!-- Bootstrap Core JavaScript -->
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/dist/js/sb-admin-2.js"></script>
</body>

</html>