<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<div class="py-5" align="center">
	<form action="doctor.do" method="post">
	<table width="100" border="1" align="left">
		<tr>
			<th>필터</th>
		</tr>
		<tr>
			<th>
				<select name="filter">
					<option value="0">전체</option>
				<c:forEach var="dto" items="${setFilter }">
					<option value="${dto.dep_Code }">${dto.dep_Name }</option>
				</c:forEach>
				</select>
			</th>
		</tr>
		<tr>
			<td align="center"><input type="submit" value="선택"></td>
		</tr>
	</table>
	</form>
	
	<div class="card mb-4">
		<div class="card-header">
			의사관리
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="70%" border="1">
		<tr>
			<td align="right" colspan="6"><a href="doctor_input.do">의사 추가</a></td>
		</tr>
		<thead>
		<tr>
			<th>부서코드</th>
			<th>의사코드</th>
			<th>분야</th>
			<th>직급</th>
			<th>의사이름</th>
			<th>비고</th>
		</tr>
		</thead>
		<c:choose>
		<c:when test="${empty listDoctor }">
		<tbody>
		<tr>
			<td colspan="6" align="center">입력된 의사가 없습니다.</td>
		</tr>
		</tbody>		
			</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${listDoctor}">
			<tbody>
				<tr align="center">
					<td>${dto.dep_Code }</td>
					<td>${dto.doc_Code }</td>
					<td>${dto.doc_Major }</td>
					<td>${dto.doc_Rank }</td>
					<td><a href="doctor_info.do?doc_Code">${dto.doc_Name }</a></td>
					<td><a href="doctor_update.do?doc_Code=${dto.doc_Code }">수정</a>|<a href="doctor_delete.do?doc_Code=${dto.doc_Code }">삭제</a></td>
				</tr>
			</tbody>
			</c:forEach>
		</c:otherwise>
	</c:choose>
		</table>
		</div></div>
	</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>