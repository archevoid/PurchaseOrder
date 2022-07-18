<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<!--
* Tabler - Premium and Open Source dashboard template with responsive and high quality UI.
* @version 1.0.0-beta10
* @link https://tabler.io
* Copyright 2018-2022 The Tabler Authors
* Copyright 2018-2022 codecalm.net Paweł Kuna
* Licensed under MIT (https://github.com/tabler/tabler/blob/master/LICENSE)
-->
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Sign in - Tabler - Premium and Open Source dashboard
	template with responsive and high quality UI.</title>
<!-- CSS files -->
<link href="/resources/dist/css/tabler.min.css" rel="stylesheet" />
<link href="/resources/dist/css/tabler-flags.min.css" rel="stylesheet" />
<link href="/resources/dist/css/tabler-payments.min.css"
	rel="stylesheet" />
<link href="/resources/dist/css/tabler-vendors.min.css" rel="stylesheet" />
<link href="/resources/dist/css/demo.min.css" rel="stylesheet" />
</head>
<body class=" border-top-wide border-primary d-flex flex-column">
	<div class="page page-center">
		<div class="container-tight py-4">
			<div class="text-center mb-4">
				<a href="." class="navbar-brand navbar-brand-autodark"><img
					src="/resources/static/logo.svg" height="36" alt=""></a>
			</div>
			<form class="card card-md" action="/login" method="post"
				autocomplete="off">
				<div class="card-body">
					<h2 class="card-title text-center mb-4">사원 정보입력</h2>
					<div class="mb-3">
						<label class="form-label">사원번호</label> <input
							type="text" class="form-control"
							placeholder="사원번호를 입력하세요" autocomplete="off"
							name="emplNum">
					</div>
					<div class="mb-2">
						<label class="form-label"> 비밀번호 <span
							class="form-label-description"> <a href="/password">비밀번호 찾기</a>
						</span>
						</label>
						<div class="input-group input-group-flat">
							<input type="password" class="form-control"
								placeholder="비밀번호를 입력하세요" autocomplete="off" name="password">
						</div>
					</div>
					<div class="form-footer">
						<button type="submit" class="btn btn-primary w-100">로그인</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Libs JS -->
	<!-- Tabler Core -->
	<script src="/resources/dist/js/tabler.min.js" defer></script>
	<script src="/resources/dist/js/demo.min.js" defer></script>
</body>
</html>