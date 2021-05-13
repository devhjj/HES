<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>HES - 로그인 또는 가입</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/full-width-pics.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
		<!-- Bootstrap core JavaScript -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-light">
    <div class="container">
    <a class="navbar-brand" href="/"><img class="img-fluid d-block mx-auto" src="<%=request.getContextPath()%>/resources/img/hes_logo-rm.png" alt=""></a>
  	</div>
    
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3></div>
                                    <div class="card-body">
                                        <form action="/login" id="login" method="post">
	                                        <c:if test="${param.error != null}"> 
	                                        <p>아이디 또는 비밀번호가 잘못되었습니다.</p> 
	                                        </c:if> 
	                                        <c:if test="${param.logout != null}"> 
	                                        <p>로그아웃 하였습니다.</p> 
	                                        </c:if>
	                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
											<input type="hidden" name ="loginRedirect" value="${loginRedirect}" />
                                            <div class="form-group">
                                                <input class="form-control py-4" name="inputEmail" id="inputEmail" type="email" placeholder="이메일" />
                                            </div>
                                            <div class="form-group">
                                                <input class="form-control py-4" name="inputPassword" id="inputPassword" type="password" placeholder="비밀번호" />
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input" name="remember-me" id="remember-me" type="checkbox" />
                                                    <label class="custom-control-label" for="remember-me">자동로그인</label>
                                                </div>
                                            </div>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="password.html">비밀번호를 잊으셨나요?</a>
                                                <sec:authorize access="isAnonymous()">
                                                <a class="btn btn-primary" onclick="document.getElementById('login').submit()">로그인</a>
                                                </sec:authorize>
                                            <%-- <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}"> --%>
											<c:if test="${not empty exceptionMsgName}" ><br>
											<font color="red">
												<p>${exceptionMsgName}
											<%-- ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} --%>
												</p> 
											</font>
											<%-- </c:if> --%>
										</c:if>
										</div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="/member/join">새 계정 만들기</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            </div>
<jsp:include page="../views/common/footer.jsp"></jsp:include>
