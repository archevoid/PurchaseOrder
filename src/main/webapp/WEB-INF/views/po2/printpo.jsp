<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
	/* 사명, 참조, 전화번호, 팩스번호 */
	String[] aboutUs = new String[] { "Team FoS", "", "010-4242-4242", "031-4242-4242" };
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주서 출력</title>
<link href="../../resources/css/printPO.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div id="content">
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
								<td>${ planData[0].ptnName }</td>
							</tr>
							<tr>
								<th>참조</th>
								<td></td>
							</tr>
							<tr>
								<th>전화</th>
								<td>${ planData[0].ptnTel }</td>
							</tr>
							<tr>
								<th>팩스</th>
								<td>${ planData[0].ptnFax }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="companyInfo">
					<table id="companyTable">
						<thead>
							<tr>
								<th colspan="2" id="title">발주처</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>상호</th>
								<td><%= aboutUs[0] %></td>
							</tr>
							<tr>
								<th>담당자</th>
								<td>${ planData[0].email }</td>
							</tr>
							<tr>
								<th>전화</th>
								<td><%= aboutUs[2] %></td>
							</tr>
							<tr>
								<th>팩스</th>
								<td><%= aboutUs[3] %></td>
		
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
							<td>${ planData[0].dueDate }</td>
						</tr>
						<tr>
							<th>납품장소</th>
							<td></td>
						</tr>
						<tr>
							<th>합계금액</th>
							<td class="total number"></td>
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
								<td><c:out value="${ planData[i].productName }" /></td>
								<td class="number"><c:out value="${ planData[i].quantity }" /></td>
								<td class="number"><c:out value="${ planData[i].productPrice }" /></td>
								<td class="totalPrice number">
									<c:if test="${ (planData[i].quantity ne null) or (planData[i].productPrice ne null) }">
										<c:out value="${ planData[i].quantity * planData[i].productPrice }" />
									</c:if>
								</td>
								<td></td>
							</tr>	
						</c:forEach>
						
						<tr>
							<th>합계</th>
							<td></td>
							<td></td>
							<td></td>
							<td class="total number"></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="6" id="etc">※ 비고</td>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			let sum = 0;
			$(".totalPrice").each(function() {
				if((!isNaN($(this).text()) && (!$(this).text().trim() == ""))) {
					sum += parseInt($(this).text());
				}
			});
			
			$(".total").each(function() {
				$(this).text(sum);
			});
			
			
			$(".number").each(function() {
				if((!isNaN($(this).text()) && (!$(this).text().trim() == ""))) {
					$(this).text(parseInt($(this).text()).toLocaleString('ko-KR'));
				}
			});
		});
	</script>
</body>
</html>