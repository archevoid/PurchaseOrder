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
		<div id="company">
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
					<td class="total"></td>
				</tr>
			</tbody>
		</table>
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
				<% int num = 1; %>
				<c:forEach items="${ planData }" var="plan">
					<tr>
						<td><%= num++ %></td>
						<td><c:out value="${ plan.productName }" /></td>
						<td><c:out value="${ plan.quantity }" /></td>
						<td><c:out value="${ plan.productPrice }" /></td>
						<td class="totalPrice"><c:out value="${ plan.quantity * plan.productPrice }" /></td>
						<td></td>
					</tr>	
				</c:forEach>
				
				
				<tr>
					<td>합계</td>
					<td></td>
					<td></td>
					<td></td>
					<td class="total"></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="6" id="etc">※ 비고</td>
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function() {
			let sum = 0;
			$(".totalPrice").each(function() {
				if(!isNaN($(this).text())) {
					sum += parseInt($(this).text());
				}
			});
			$(".total").each(function() {
				$(this).text(sum);
			});
			
		});
	</script>
</body>
</html>