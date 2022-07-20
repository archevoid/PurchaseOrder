<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%--
	/* 사명, 참조, 전화번호, 팩스번호, 주소 */
String[] aboutUs = new String[]{"Team FoS", "", "010-4242-4242", "031-4242-4242", "대한민국 경기도 수원시 권선구 1234-1234"};
--%>


<!DOCTYPE html>
<html lang="ko">

<head>

<%-- header --%>
<meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <!-- CSS files -->
    <link href="/resources/dist/css/tabler.min.css" rel="stylesheet"/>
    <link href="/resources/dist/css/tabler-flags.min.css" rel="stylesheet"/>
    <link href="/resources/dist/css/tabler-payments.min.css" rel="stylesheet"/>
    <link href="/resources/dist/css/tabler-vendors.min.css" rel="stylesheet"/>
    <link href="/resources/dist/css/demo.min.css" rel="stylesheet"/>
    
    <link href="/resources/css/css.css" rel="stylesheet">

	<meta name="_csrf" content="${ _csrf.token }">
<%-- header 끝 --%>
<title>발주서 출력 - TeamFoS</title>
<link href="/resources/css/printpo.css" rel="stylesheet">
<link href="/resources/dist/css/demo.min.css" rel="stylesheet" />
</head>

<body>
	<div class="page">
		<%-- include file="../includes/horizontalNav.jsp"--%>
		<header class="navbar navbar-expand-md navbar-dark d-print-none">
        <div class="container-xl">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu">
            <span class="navbar-toggler-icon"></span>
          </button>
          <h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
            <a href="./dashboard">
            </a>
          </h1>
          <div class="navbar-nav flex-row order-md-last">
            <div class="d-none d-md-flex nav-link">
              <a href="?theme=dark" class="nav-link px-0 hide-theme-dark" title="Enable dark mode" data-bs-toggle="tooltip" data-bs-placement="bottom">
                <!-- Download SVG icon from http://tabler-icons.io/i/moon -->
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 3c.132 0 .263 0 .393 0a7.5 7.5 0 0 0 7.92 12.446a9 9 0 1 1 -8.313 -12.454z" /></svg>
                	다크모드
              </a>
              <a href="?theme=light" class="nav-link px-0 hide-theme-light" title="Enable light mode" data-bs-toggle="tooltip" data-bs-placement="bottom">
                <!-- Download SVG icon from http://tabler-icons.io/i/sun -->
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="12" cy="12" r="4" /><path d="M3 12h1m8 -9v1m8 8h1m-9 8v1m-6.4 -15.4l.7 .7m12.1 -.7l-.7 .7m0 11.4l.7 .7m-12.1 -.7l-.7 .7" /></svg>
                	다크모드 해제
              </a>
            </div>
            <div class="d-none d-md-flex">
	            <a href="/logout" class="nav-link d-flex lh-1 text-reset p-0">Logout</a>
            </div>
          </div>
        </div>
      </header>
      <div class="navbar-expand-md">
        <div class="collapse navbar-collapse" id="navbar-menu">
          <div class="navbar navbar-light">
            <div class="container-xl">
              <ul class="navbar-nav">
              <li class="nav-item">
                  <a class="nav-link" href="./dashboard" >
                    <span class="nav-link-icon d-md-none d-lg-inline-block"><!-- Download SVG icon from http://tabler-icons.io/i/home -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="5 12 3 12 12 3 21 12 19 12" /><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" /><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg>
                    </span>
                    <span class="nav-link-title">
                      Home
                    </span>
                  </a>
                </li>
              <li class="nav-item">
                  <a class="nav-link" href="http://192.168.0.104:8888/index/board" >
                    <span class="nav-link-icon d-md-none d-lg-inline-block"><!-- Download SVG icon from http://tabler-icons.io/i/home -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="5 12 3 12 12 3 21 12 19 12" /><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" /><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg>
                    </span>
                    <span class="nav-link-title">
                      	발주 계획	
                    </span>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#navbar-base" data-bs-toggle="dropdown" data-bs-auto-close="outside" role="button" aria-expanded="false" >
                    <span class="nav-link-icon d-md-none d-lg-inline-block"><!-- Download SVG icon from http://tabler-icons.io/i/package -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="12 3 20 7.5 20 16.5 12 21 4 16.5 4 7.5 12 3" /><line x1="12" y1="12" x2="20" y2="7.5" /><line x1="12" y1="12" x2="12" y2="21" /><line x1="12" y1="12" x2="4" y2="7.5" /><line x1="16" y1="5.25" x2="8" y2="9.75" /></svg>
                    </span>
                    <span class="nav-link-title">
                      		구매발주
                    </span>
                  </a>
                  	<div class="dropdown-menu">
						<div class="dropdown-menu-columns">
							<div class="dropdown-menu-column">
								<a class="dropdown-item" href="/po/plan"> 발주 계획 입력 </a> <a
								class="dropdown-item" href="/po/order"> 발주 진행 </a> <a
								class="dropdown-item" href="/po/inspection"> 진척 검수 </a> <a
								class="dropdown-item" href="/po/progress"> 납기진도율 </a>
                            </div>
                        </div>
                    </div>
                </li>
                
                <li class="nav-item">
                  <a class="nav-link" href="http://192.168.0.115:8081/orderStatus" >
                    <span class="nav-link-icon d-md-none d-lg-inline-block"><!-- Download SVG icon from http://tabler-icons.io/i/home -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="5 12 3 12 12 3 21 12 19 12" /><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" /><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg>
                    </span>
                    <span class="nav-link-title">
                      	자재 입고
                    </span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="http://192.168.0.108:8081/export/stock" >
                    <span class="nav-link-icon d-md-none d-lg-inline-block"><!-- Download SVG icon from http://tabler-icons.io/i/home -->
                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="5 12 3 12 12 3 21 12 19 12" /><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" /><path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" /></svg>
                    </span>
                    <span class="nav-link-title">
                      	자재 출고	
                    </span>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <%-- 끝 --%>
		<div class="page-wrapper">
			<div class="container-xl">
				<!-- Page title -->
				<div class="page-header d-print-none">
					<div class="row g-2 align-items-center">
						<div class="col">
							<div class="page-pretitle tx-l">Purchase Order</div>
							<h2 class="page-title">Print Order</h2>
						</div>
						<div class="col-12 col-md-auto ms-auto d-print-none">
							<div class="d-flex">
								<ol class="breadcrumb breadcrumb-arrows"
									aria-label="breadcrumbs">
									<li class="breadcrumb-item"><a href="dashboard">Purchase
											Order</a></li>
									<li class="breadcrumb-item"><a href="order">Order</a></li>
									<li class="breadcrumb-item active" aria-current="page"><a
										href="#">Print Order</a></li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="page-body">
				<div class="container-xl">
					<div class="row row-cards">
						<div class="col-12">
							<div class="card">
								<div class="card-header d-print-none">
									<h3 class="card-title">계획 선택</h3>
									<div class="ms-auto d-print-none btn-list">
										<span class="d-none d-sm-inline">
											<button type="button" class="btn btn-danger"
												onclick="history.go(-1);">
												<img src="/resources/img/download.svg" class="icon">
												뒤로가기
											</button>
										</span>
										<button type="button"
											class="btn btn-primary d-none d-sm-inline-block"
											onclick="window.print();">
											<img src="/resources/img/upload.svg" class="icon"> 출력
										</button>
									</div>
								</div>

								<div id="content" class="document-order">
									<h1 id="documentName">발주서</h1>
									<div id="planContent">
										<div id="company">
											<div id="companyInfo">
												<!-- company information -->
												<table id="companyTable">
													<thead>
														<tr>
															<th colspan="2" id="title">수주처</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th>상호</th>
															<td>${ orderInfo[0].companyName }</td>
														</tr>
														<tr>
															<th>사업자번호</th>
															<td>${ orderInfo[0].businessNumber }</td>
														</tr>
														<tr>
															<th>담당자</th>
															<td>${ orderInfo[0].comEmployee }</td>
														</tr>
														<tr>
															<th>이메일</th>
															<td>${ orderInfo[0].comEmail }</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div id="companyInfo">
												<table id="companyTable">
													<caption id="paperNum">발주번호: ${ paperNum }</caption>
													<thead>
														<tr>
															<th colspan="2" id="title">발주처</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th>상호</th>
															<td>${ ourCompany.companyName }</td>
														</tr>
														<tr>
															<th>전화</th>
															<td>${ ourCompany.contact }</td>
														</tr>
														<tr>
															<th>담당자</th>
															<td>${ orderInfo[0].emplName }</td>
														</tr>
														<tr>
															<th>이메일</th>
															<td>${ orderInfo[0].email }</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div id="planInfo">
											<table id="planTable">
												<tbody>
													<tr>
														<th>납기일자</th>
														<td>${ orderInfo[0].dueDate }</td>
													</tr>
													<tr>
														<th>납품장소</th>
														<td>${ ourCompany.companyAddress }</td>
													</tr>
													<tr>
														<th>합계금액</th>
														<td><span id="currency"> <c:set var="curr"
																	value="${ fn:toUpperCase(orderInfo[0].currency) }" />
																<c:choose>
																	<c:when test="${ not empty currency[curr] }">
																		<c:out value="${ currency[curr] }" />
																	</c:when>
																	<c:otherwise>
																		<c:out value="${ currency.other }" />
																	</c:otherwise>
																</c:choose>
														</span> <span class="number total"></span></td>
													</tr>
												</tbody>
											</table>
										</div>
										<div id="productInfo">
											<table id="productTable">
												<thead>
													<tr>
														<th>No</th>
														<th>품명</th>
														<th>수량</th>
														<th>개당 가격</th>
														<th>총 가격</th>
														<th>비고</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach begin="0" end="9" var="i">
														<tr>
															<th>${ i + 1 }</th>
															<td><c:out value="${ orderInfo[i].partName }" /></td>
															<td class="number"><c:out
																	value="${ orderInfo[i].orderQuantity }" /></td>
															<td class="number"><c:out
																	value="${ orderInfo[i].unitPrice }" /></td>
															<td class="totalPrice number"><c:if
																	test="${ (orderInfo[i].orderQuantity ne null) or (orderInfo[i].unitPrice ne null) }">
																	<c:out
																		value="${ orderInfo[i].orderQuantity * orderInfo[i].unitPrice }" />
																</c:if></td>
															<td></td>
														</tr>
													</c:forEach>

													<tr>
														<th>합계</th>
														<td></td>
														<td></td>
														<td></td>
														<td class="number total"></td>
														<td></td>
													</tr>
													<tr>
														<td colspan="6" id="etc">※ 비고</td>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

			<%--@ include file="../includes/footer.jsp"--%>
			<footer class="footer footer-transparent d-print-none">
	<div class="container-xl">
		<div class="row text-center align-items-center flex-row-reverse">
			<div class="col-lg-auto ms-lg-auto">
				<ul class="list-inline list-inline-dots mb-0">
					<li class="list-inline-item"><a href="./docs/index.html"
						class="link-secondary">Documentation</a></li>
					<li class="list-inline-item"><a href="./license.html"
						class="link-secondary">License</a></li>
					<li class="list-inline-item"><a
						href="https://github.com/tabler/tabler" target="_blank"
						class="link-secondary" rel="noopener">Source code</a></li>
					<li class="list-inline-item"><a
						href="https://github.com/sponsors/codecalm" target="_blank"
						class="link-secondary" rel="noopener"> <!-- Download SVG icon from http://tabler-icons.io/i/heart -->
							<svg xmlns="http://www.w3.org/2000/svg"
								class="icon text-pink icon-filled icon-inline" width="24"
								height="24" viewBox="0 0 24 24" stroke-width="2"
								stroke="currentColor" fill="none" stroke-linecap="round"
								stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										<path
									d="M19.5 13.572l-7.5 7.428l-7.5 -7.428m0 0a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572" /></svg>
							Sponsor
					</a></li>
				</ul>
			</div>
			<div class="col-12 col-lg-auto mt-3 mt-lg-0">
				<ul class="list-inline list-inline-dots mb-0">
					<li class="list-inline-item">Copyright &copy; 2022 <a href="."
						class="link-secondary">Tabler</a>. All rights reserved.
					</li>
					<li class="list-inline-item"><a href="./changelog.html"
						class="link-secondary" rel="noopener"> v1.0.0-beta10 </a></li>
				</ul>
			</div>
		</div>
	</div>
</footer>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script src="https://unpkg.com/@tabler/core@latest/dist/js/tabler.min.js"></script>
<script src="/resources/js/script.js"></script>
<script src="/resources/dist/js/demo.min.js"></script>
<%-- 끝 --%>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			let sum = 0;
			$(".totalPrice").each(function() {
				if ((!isNaN($(this).text()) && (!$(this).text().trim() == ""))) {
					sum += parseInt($(this).text());
				}
			});

			$(".total").each(function() {
				$(this).text(sum);
			});

			$(".number").each(function() {
				if ((!isNaN($(this).text()) && (!$(this).text().trim() == ""))) {
					$(this).text(parseInt($(this).text()).toLocaleString('ko-KR'));
				}
			});

			$("table#companyTable tbody th").each(function() {
				if ($(this).text().length > 3) {
					$(this).addClass("longWord");
				}
			});
		});
		
		
		/* $.ajax({
			url : "/api/sendOrder",
			type : "post",
			data : {
				"elem" : $("div.document-order").html()
			},
			success : function(data) {
				
			}
		}); */
		

		function htmlToFile(file) {
			var header = "<html>"+
	            "<head><meta charset='utf-8'></head><body>";
			var footer = "</body></html>";
			var sourceHTML = header + $("div.document-order").html() + footer;

			var source = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(sourceHTML);
			var fileDownload = document.createElement("a");
			document.body.appendChild(fileDownload);
			fileDownload.href = source;
			fileDownload.download = 'hi098123file.'+file;
			fileDownload.click();
			document.body.removeChild(fileDownload);
		}
		

	</script>

</body>
</html>