<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!--hosptialization.jsp-->
<div class="py-5" align="center">
<!-- 입원 환자 목록 -->
<div class="card mb-4">
		<div class="card-header">
			입원 관리
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="100%" border="1">
		<tr>
			<td align="right" colspan="6"><a href="hospitalization_input.do">입원 추가</a></td>
		</tr>
		<thead>
		<tr>
			<th>입원번호</th>
			<th>입원환자</th>
			<th>입원병실</th>
			<th>입원일자</th>
			<th>퇴원일자</th>
			<th>비고</th>
		</tr>
		</thead>
		<c:choose>
		<c:when test="${empty listHospitalization}">
			<tbody>
			<tr>
				<td colspan="6" align="center">입력된 입원이 없습니다.</td>
			</tr>
			</tbody>		
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${listHospitalization}">
			<tbody>
				<tr align="center">
					<td>${dto.hplCode}</td>
					<td>${dto.patient_Name}</td>
					<td>${dto.roomName}호</td>
					<td>${dto.joinDate}</td>
					<td>${dto.leaveDate}</td>
					<td><a href="hospitalization_update.do?hplCode=${dto.hplCode}">수정</a>|
						   <a href="hospitalization_delete.do?hplCode=${dto.hplCode}">삭제</a></td>
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