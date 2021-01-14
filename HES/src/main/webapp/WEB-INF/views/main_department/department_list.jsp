<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<jsp:include page="../user/user_header.jsp"></jsp:include>
<section class="py-5">
<div align="center">
<br>
<br>
	<table border="1">
		<tr>
			<c:choose>
			<c:when test="${empty listDepartment }">
				<h2>페이지 준비중입니다.</h2>
			</c:when>
			<c:otherwise>
			<c:set var="count" value="0"/>
			<tr>
			<c:forEach var="dp" items="${listDepartment }">
				<th width="100" height="100" align="center"><a href="main_doctor.do?dep_Code=${dp.dep_Code }">${dp.dep_Name }</a></th>
				<c:set var="count" value="${count+1 }"/>
				<c:if test="${count%4==0 }">
				</tr>
				<tr>
				</c:if>
			</c:forEach>
			</tr>
			</c:otherwise>
			</c:choose>
		</tr>
	</table>
</div>
</section>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>