<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
        <title>HES - 로그인 또는 가입</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/full-width-pics.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
		<!-- Bootstrap core JavaScript -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script	src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>
		<script>
		$(document).ready(function(){
			
			$('#div_load_image').hide(); //첫 시작시 로딩바를 숨겨준다.
			$("form").on("submit", function(e) {
				var btn = document.querySelector("#btn_back");
			    btn.addEventListener("click", function (e) {
			        this.setAttribute("disabled", "disabled");
			    })
				e.preventDefault();
				// var $form = $(this).closest("form");
				var formData = $form.serializeObject();
				var token = $("meta[name='_csrf']").attr("content");
			    var header = $("meta[name='_csrf_header']").attr("content");
				
				$("section div:eq(0)").append('<div id="d-spin" class="spinner-border">');
				$("#div_load_image").show();
				
				$.ajax({
					async : true,
					type : $form.attr("method"),
					dataType : 'json',
					contentType : 'application/json',
					data : JSON.stringify(formData),
					url : $form.attr("action"),
					beforeSend : function(xhr){
						if(token && header) {
				            xhr.setRequestHeader(header, token);
				        }
						///*데이터 확인*/alert(JSON.stringify(formData));
						$("#div_load_image").show();
					},
					success : function(res) {
						$("#d-spin").remove();
						$("#div_load_image").hide();
						if (res.email){
							$.notify("이메일은 네이버 메일만 가능합니다.");
							alert("이메일은 네이버 메일만 가능합니다.");
							$("input[name='patient_email']").focus();
						} else if (res.password){
							$.notify("비밀번호는 영문, 숫자, 특수문자 포함 8~15 자리로 해주세요.");
							alert("비밀번호는 영문, 숫자, 특수문자 포함 8~15 자리로 해주세요.");
							$("input[name='patient_password']").val("");
							$("input[name='patient_password']").focus();
						} else if (res.duplicate) {
							$.notify("중복된 이메일 입니다.");
							alert("중복된 이메일 입니다.");
							$("input[name='patient_email']").val("");
							$("input[name='patient_email']").focus();
						} else if (res.success) {
							$.notify("가입 완료. 메일 인증 후 로그인이 가능합니다.");
							alert("가입 완료. 메일 인증 후 로그인이 가능합니다.");
							setTimeout(function() {window.location = document.referrer}, 800);
						} else {
							$("#d-spin").hide();
							$.notify("관리자에게 문의해주세요. (문의: hjjdev@gmail.com)");
						}
					},
					error : function(error) {
						$("#div_load_image").hide();
						alert(error.errorMsg);
					}
				});
			});	
		})
		
		</script>
    </head>
<body class="bg-light">
	<!-- 로딩바 -->
	<div id="div_load_image"
		style="position: absolute; top: 50%; left: 50%; width: 0px; height: 0px; z-index: 9999; background: #f0f0f0; filter: alpha(opacity = 50); opacity: alpha*0.5; margin: auto; padding: 0; text-align: center">
		<img src="../img/loading.gif" style="width: 100px; height: 100px;">
	</div>
	<div class="container">
		<a class="navbar-brand" href="/"><img
			class="img-fluid d-block mx-auto"
			src="<%=request.getContextPath()%>/resources/img/hes_logo-rm.png"
			alt=""></a>
	</div>
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">가입하기</h3>
								</div>
								<div class="card-body">
									<form id="joinForm" action="/member/join" method="post">
										<sec:csrfInput></sec:csrfInput>
										<div class="form-group">
											<input class="form-control py-4" id="patient_email"
												type="email" aria-describedby="emailHelp"
												placeholder="이메일 인증 후 로그인이 가능합니다." />
										</div>
										<div class="form-row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="patient_password">비밀번호</label>
													<input class="form-control py-4" id="patient_password"
														type="password" placeholder="비밀번호" autocomplete="off" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="small mb-1" for="inputConfirmPassword">비밀번호
														확인</label> <input class="form-control py-4"
														id="inputConfirmPassword" type="password"
														placeholder="비밀번호 확인" autocomplete="off" />
												</div>
											</div>
										</div>
										<div class="form-group mt-4 mb-0">
											<button type="submit" class="btn btn-primary btn-block">Create
												Account</button>
										</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="/login">아이디가 있다면 로그인하러 가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<jsp:include page="../views/common/footer.jsp"></jsp:include>