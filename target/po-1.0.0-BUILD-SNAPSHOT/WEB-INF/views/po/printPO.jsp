<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
	-moz-box-sizing: border-box;
	text-align: center;
}

body {
	margin: 0;
	padding: 0;
}

div#content {
	width: 21cm;
	min-height: 29.7cm;
	padding: 1.5cm 1.5cm 2cm 1.5cm;
}

h1#documentName {
	font-size: 33px;
	text-align: center;
	margin: 15px 0 1.5cm 0;
	letter-spacing: 20px
}

table {
	border-spacing: 0;
	margin: 0 auto 0.5cm auto;
	table-layout: fixed;
	word-break: break-all;
	width: 100%;
}

table#companyTable {
	display: inline;
}

div#company {
	margin-bottom: 0.5cm;
}

div#company thead th {
	letter-spacing: 7px;
}

div#company tbody th {
	letter-spacing: 20px;
	text-indent: 12.5px;
}

div#company tbody td {
	width: 5.44cm;
}

th, td {
	border: 0.5px solid;
	height: 1cm;
}

thead th {
	background-color: #D3D3D3;
}

tbody th {
	background-color: #F5F5F5;
	width: 3.5cm;
}

td#etc {
	height: 3cm;
	text-align: left;
	vertical-align: top;
}

@page {
	size: A4;
	maring: 0;
}

@media print {
	#page {
		margin: 0;
		border: initial;
		border-radius: initial;
		width: initial;
		min-height: initial;
		box-shadow: initial;
		background: initial;
		page-break-after: always;
	}
}
</style>
<title>발주서 출력</title>
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
						<td></td>
					</tr>
					<tr>
						<th>담당자</th>
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