<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index">구매발주</a>
               	<form action="/logout" method="post" name="logoutForm">
	                <span style="float: right;">
                		<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }" />
                		<a href="#" onclick="document.getElementsByName('logoutForm')[0].submit();">로그아웃</a>
    	            </span>
               	</form>
            </div>
            <!-- /.navbar-header -->
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav in" id="side-menu">
                        <li>
                            <a href="dashboard"><i class="fa fa-dashboard fa-fw"></i>대시보드</a>
                        </li>
                        
                        <li>
                            <a href="plan" class="active"><i class="fa fa-table fa-fw"></i>발주 계획 확인</a>
                        </li>
                        <li>
                            <a href="inspection"><i class="fa fa-edit fa-fw"></i>진척검수</a>
                        </li>
                        <li>
                            <a href="progress"><i class="fa fa-edit fa-fw"></i>납기진도율확인</a>
                        </li><li>
                            <a href="partner"><i class="fa fa-edit fa-fw"></i>출하준비상태</a>
                        </li>
                        
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>