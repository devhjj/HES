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
      <a class="navbar-brand" href="admin"><img class="img-fluid d-block mx-auto" src="<%=request.getContextPath()%>/resources/img/hes_logo-rm.png" alt=""></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="treatment.do">진료관리
              <!-- <span class="sr-only">(current)</span> -->
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="patient.do">환자관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="doctor.do">의사관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="department.do">부서관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="room.do">병실관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="hospitalization.do">입원관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reservation_input.do">예약하기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reservation.do">예약관리</a>
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
                		<span class="dropdown-item"><sec:authentication property="name"/> 님</span>
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