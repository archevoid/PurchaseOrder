<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
						<td></td>
					</tr>
					<tr>
						<th>참조</th>
						<td></td>
					</tr>
					<tr>
						<th>전화</th>
						<td></td>
					</tr>
					<tr>
						<th>팩스</th>
						<td></td>
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
						<td></td>
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
					<td></td>
				</tr>
				<tr>
					<th>납품장소</th>
					<td></td>
				</tr>
				<tr>
					<th>합계금액</th>
					<td></td>
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
				<%
					for (int i = 0; i < 10; i++) {
				%>
				<tr>
					<td><%= i + 1 %></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<%
						}
					%>
				
				<tr>
					<td>합계</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="6" id="etc">※ 비고</td>
			</tbody>
		</table>
	</div>
</body>
</html>