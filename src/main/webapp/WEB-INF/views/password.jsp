<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
    <head>
      <meta charset="utf-8" />
	<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Password Reset</title>
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
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
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 재설정</h3></div>
                                    <div class="card-body">
                                        <div class="small mb-3 text-muted">비밀번호 재설정 링크를 받을 이메일을 입력해주세요.</div>
                                        <form action="password" method="POST">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" type="email" name="email" placeholder="name@example.com" />
                                                <label for="inputEmail">Email address</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="login"><h3>돌아가기</h3></a>
                                                <button class="btn btn-primary">메일 발송</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>
