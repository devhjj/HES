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
		<form name="f" action="" method="post">
		<table class="table table-bordered dataTable" width="100%" border="1">
		<tr align="center">
			<td>
			<select name="filter">
				<option value="patient_Name">입원환자</option>
			    <option value="roomName">입원병실</option>	
			</select>
			<input type="text" name="searchString">
			<input type="submit" value="검색">
			<input type="button" value="전체보기" onclick="window.location='hospitalization.do'">
			</td>
		</tr>
		</table>
		</form>
		<table class="table table-bordered dataTable" width="100%" border="1">
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
		<tr>
			<td align="right" colspan="6"><a href="hospitalization_input.do">입원 추가</a></td>
		</tr>
		<c:choose>
		<c:when test="${!empty searchHospitalization}">
			<c:forEach var="dto" items="${searchHospitalization}">
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
		</c:when>
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