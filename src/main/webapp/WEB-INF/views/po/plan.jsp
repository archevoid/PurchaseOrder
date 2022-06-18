<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<body>
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
	                                		<select name="planNum">
	                                			<option value="0">&lt;&lt;&nbsp;계획 번호&nbsp;&gt;&gt;</option>
	                                			<%-- plan 테이블에서 가져옴 --%>
	                                		</select>
                                		</td>
                               		</tr>
                               		<tr>
                               			<th>품목명</th>
                                		<td>
                                			<input type="text" name="productName" value="">
                                		</td>
                               		</tr>
                               		<tr>
                               			<th>수량</th>
                               			<td>
                               				<input type="number" name="quantity" value="">
                           				</td>
                       				</tr>
                       				<tr>
                               			<th>조달 납기</th>
                               			<td>
                               				<input type="date" name="dueDate" value="">
                           				</td>
                       				</tr>
                       				<tr>
                               			<th>협력 회사</th>
                               			<td>
                               				<input type="text" name="partner" value="">
                           				</td>
                       				</tr>
                       				<tr>
                               			<th>공급 가격</th>
                               			<td>
                               				<input type="number" name="productPrice" value="">
                           				</td>
                       				</tr>
	                            </tbody>
	                        </table>
	                        <script>
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
    <script src="../../resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../../resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../../resources/dist/js/sb-admin-2.js"></script>
    
    <script src="../../resources/js/customScript.js" type="text/javascript"></script>

</body>

</html>
