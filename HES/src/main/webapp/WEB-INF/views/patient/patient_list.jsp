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
			환자정보
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="70%" border="1">
		<thead>
		<tr align="center">
			<th>환자코드</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>비고</th>
		</tr>
		</thead>
		<c:choose>
		<c:when test="${empty listPatient }">
		<tbody>
		<tr>
			<td colspan="5" align="center">입력된 환자가 없습니다.</td>
		</tr>
		</tbody>		
			</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${listPatient}">
			<tbody>
				<tr align="center">
					<td>${dto.patient_code }</td>
					<td>${dto.patient_name }</td>
					<td>${dto.patient_call }</td>
					<td>${dto.patient_address }</td>
					<td><a href="patient_update.do?patient_code=${dto.patient_code }">수정(마이페이지로 옮길예정)</a>|<a href="patient_delete.do?patient_code=${dto.patient_code }">삭제</a></td>
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