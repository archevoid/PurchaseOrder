<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

       

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">출하 준비 상태 입력</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form>
	                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
	                                <tbody>
	                                    <tr class="odd grad">
	                                        <td class="centered">품목명</td>
	                                        <td class="centered">
	                                            <select name="product">
	                                                <option>1</option>
	                                                <option>2</option>
	                                                <option>3</option>
	                                                <option>4</option>
	                                                <option>5</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                    <tr class="odd grad">
	                                        <td class="centered">제작상태</td>
	                                        <td class="centered">
	                                            <select name="productStatus">
	                                                <option>1</option>
	                                                <option>2</option>
	                                                <option>3</option>
	                                                <option>4</option>
	                                                <option>5</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                    <tr class="odd grad">
	                                        <td class="centered">마감일</td>
	                                        <td class="centered">
	                                            <div class="form-group">
	                                                <input type="date" name="dueDate">
	                                          </div>
	                                        </td>
	                                    </tr>
	                                    <tr class="odd grad">
	                                        <td class="centered">수량</td>
	                                        <td class="centered">
	                                            <div class="form-group">
	                                                <input type="number" name="numberOfProducts">
	                                          </div>
	                                        </td>
	                                    </tr>
	                                    <tr class="odd grad">
	                                        <td class="centered">납기일정 준수 여부</td>
	                                        <td class="centered">
	                                         	<!-- Yes or No 출력 -->
	                                        </td>
	                                    </tr>
	                                </tbody>
	                            </table>
                            </form>
                            <button type="submit" style="width:250px;margin:auto;display:block;" class="btn btn-primary btn-lg" >입력</button>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            
            
                          
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
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
