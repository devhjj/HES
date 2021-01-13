<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<jsp:include page="../user/user_header.jsp"></jsp:include>
<section class="py-5">
<div align="center">
	<h2>${department.dep_Name } 의료진</h2><br><br>
	
		<c:choose>
		<c:when test="${empty listDoctor }">
			<h2>배정된 의료진이 없습니다.</h2>
		</c:when>
		<c:otherwise>
		<table border="1" width="700" height="300">	
			<c:forEach var="dt" items="${listDoctor }">
				<tr>
					<th rowspan="3" width="300" height="300"><a href="main_view.do?doc_Code=${dt.doc_Code }"><img src="D:/springFile/${dt.doc_Image }" width="100%" height="100%"></a></th>
					<td width="400">${department.dep_Name }</td>
				</tr>
				<tr>
					<td>${dt.doc_Name }</td>
				</tr>
				<tr>
					<td>${dt.doc_Rank }</td>
				</tr>
				<tr></tr><tr></tr>
			</c:forEach>
		</table>
		</c:otherwise>
		</c:choose>
</div>
</section>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>