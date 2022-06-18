<%@page import="com.mit.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../includes/header.jsp"%>

<body>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<div id="wrapper">
		<%@ include file="../includes/nav.jsp"%>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">계획 목록</h1>
                        <form action="" method="post" id="planForm">
	                        <table class="table table-striped table-bordered table-hover">
	                            <tbody>
	                                <tr>
	                                	<th>계획번호</th>
	                                	<td>
	                                		<select name="planNum" class="form-control">
	                                			<option value="0">계획 번호</option>
	                                			<c:forEach items="${ planNumList }" var="planNum">
	                                				<option value="${ planNum }"><c:out value="${ planNum }" /></option>
	                                			</c:forEach>
	                                		</select>
                                		</td>
                               		</tr>
                               		<tr>
                               			<th>품목명</th>
                                		<td>
                                			<select name="productNum" class="form-control">
                                				<option value="0">품목 명</option>
                                				<c:forEach items="${ productList }" var="product">
                                					<option value="${ product.productNum }">${ product.productName }</option>
                                				</c:forEach>
                                			</select>
                                		</td>
                               		</tr>
                               		<tr>
                               			<th>수량</th>
                               			<td>
                               				<input type="number" name="quantity" class="form-control" value="${ plan.quantity }">
                           				</td>
                       				</tr>
                       				<tr>
                               			<th>조달 납기</th>
                               			<td>
                               				<input type="date" name="dueDate" class="form-control" value="${ plan.dueDate }">
                           				</td>
                       				</tr>
                       				<tr>
                               			<th>협력 회사</th>
                               			<td>
                               				<input type="text" name="partnerName" class="form-control" value="${ plan.partnerName }">
                           				</td>
                       				</tr>
                       				<tr>
                               			<th>공급 가격</th>
                               			<td>
                               				<input type="number" name="productPrice" class="form-control" value="${ plan.productPrice }">
                           				</td>
                       				</tr>
	                            </tbody>
	                        </table>
	                        <script>
	                        	$("select[name=planNum]").on("change", function() {
	                        		$.ajax({
	                        			url: "ajaxplan",
	                        			type: "POST",
	                        			data: "planNum=" + $('select[name=planNum]').val(),
	                        			success: function(data) {
	                        				$("select[name=productNum]").val(data.productNum).attr("selected", "selected");
	                        				$("input[name=quantity]").val(data.quantity);
	                        				$("input[name=dueDate]").val(data.dueDate);
	                        				$("input[name=partnerName]").val(data.partnerName);
	                        				$("input[name=productPrice]").val(data.productPrice);
	                        			},
	                        			error: function() {
	                        				alert("에러가 발생했습니다. 다시 시도해주세요.");
	                        			}
	                        		});
	                        	});
	                        
	                        	var elem = document.getElementById("planForm");
	                        </script>
	                        <button type="button" class="btn btn-primary" onclick="changeActionAndSubmit(elem, 'inputpo')">입력</button>
	                        <button type="button" class="btn btn-primary" onclick="changeActionAndSubmit(elem, 'updatepo')">수정</button>
	                        <button type="button" class="btn btn-primary" onclick="changeActionAndSubmit(elem, 'inspection')">검수</button>
	                        <button type="button" class="btn btn-primary" onclick="changeActionAndSubmit(elem, 'printpo')">발행</button>
                        </form>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../../resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../../resources/dist/js/sb-admin-2.js"></script>
    
    <script src="../../resources/js/customScript.js" type="text/javascript"></script>

</body>

</html>
