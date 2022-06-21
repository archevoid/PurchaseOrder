<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@ include file="../includes/header.jsp"%>
<body>
        <div id="page-wrapper">
        <%@ include file="../includes/nav.jsp"%>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">납기 진도율 확인</h1>
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
	                                <table class="table table-striped table-bordered table-hover">
										<tbody>
											<tr>
												<td>계획</td>
												<td>
													<select name="plan">
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
													</select>
												</td>
											</tr>
											<tr>
												<td>품목</td>
												<td>
													<div class="form-group">
	                                                	<input type="text" name="subject">
	                                          		</div>
												</td>
											</tr>
											<tr>
												<td>목표 수량</td>
												<td>
													<div class="form-group">
	                                                	<input type="number" name="targetquantity">
	                                        		</div>
												</td>
											</tr>
											<tr>
												<td>목표 일자</td>
												<td>
													<div class="form-group">
														<input type="date" name="targetdate">
												    </div>
												</td>
											</tr>
										</tbody>
	                            </table>
                            </form>
                            <button type="submit" style="width:250px;margin:auto;display:block;" class="btn btn-primary btn-lg" >그래프를 이용해 표시</button>
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
