<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/full-width-pics.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>HES - Hospital EMS System</title>
</head>
<body>
<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/"><img class="img-fluid d-block mx-auto" src="<%=request.getContextPath()%>/resources/img/hes_logo-rm.png" alt=""></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <sec:authorize access="hasRole('ROLE_ADMIN')">
          <li class="nav-item">
            <a class="nav-link" href="admin">관리자페이지</a>
          </li>
          </sec:authorize>
          <li class="nav-item">
            <a class="nav-link" href="main_department.do">의료진/진료과
              <!-- <span class="sr-only">(current)</span> -->
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reservation_input.do">진료예약/안내</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">건강정보</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="board_list.do">이용안내</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">의학교육</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">병원이야기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">병원소개</a>
          </li>
          <li class="nav-item">
          	<sec:authorize access="isAnonymous()"> 
        		<a class="btn btn-primary" href="<c:url value="/login" />">로그인</a> 
			</sec:authorize> 
		  </li>
        </ul>
        <sec:authorize access="isAuthenticated()"> 
        <form:form action="${pageContext.request.contextPath}/logout" method="POST" id="logout">
        <!-- Navbar-->
        <ul class="navbar-nav ml-auto ml-md-0">
        	<li class="nav-item dropdown">
            	<a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                	<div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">개인정보</a>
                        <a class="dropdown-item" href="#">예약확인</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" onclick="document.getElementById('logout').submit()">로그아웃</a>
                    </div>
        	</li>
        </ul> 
        </form:form> 
        </sec:authorize>
      </div>
    </div>
  </nav>