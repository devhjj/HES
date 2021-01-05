<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!-- treatment_list.jsp -->
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			진료 관리
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="100%" border="1">
		<tr align="center">
			<th>진료일자</th>
			<td>
				<form name="a" action="" method="post">
				<input type="date" name="treatment_Date">
				<input type="submit" value="검색">
				</form>
			</td>
			<th>진료부서</th>
			<td>
				<form name="b" action="" method="post">
				<select name="dep_Code">
					<c:forEach var="dto" items="${listDepartment}">
						<option value="${dto.dep_Code}">${dto.dep_Name}</option>
					</c:forEach>
				</select>	
				<input type="submit" value="검색">
				</form>
			</td>
			<td>
				<form name="c" action="" method="post">
				<select name="filter">
					<option value="patient_Name">진료환자</option>
				    <option value="doc_Name">진료의사</option>
				</select>	
				<input type="text" name="searchString">
				<input type="submit" value="검색">
				</form>
			</td>
			<td>
			<input type="button" value="전체보기" onclick="window.location='treatment.do'">
			</td>
		</tr>
		</table>
		<table class="table table-bordered dataTable" width="100%" border="1">
		<thead>
		<tr>
			<th>진료번호</th>
			<th>진료일자</th>
			<th>진료시간</th>
			<th>진료환자</th>
			<th>진료부서</th>
			<th>진료의사</th>
			<th>비고</th>
		</tr>
		</thead>
		<tr>
			<td align="right" colspan="7"><a href="treatment_input.do">진료 추가</a></td>
		</tr>
		<tbody>
		<c:choose>
		<c:when test="${!empty searchTreatment}">
			<c:forEach var="dto" items="${searchTreatment}">	
				<tr align="center">
					<td>${dto.treatment_Code}</td>
					<td>${dto.treatment_Date}</td>
					<td>${dto.treatment_Time}</td>
					<td>${dto.patient_Name}</td>
					<td>${dto.dep_Code}</td>
					<td>${dto.doc_Name}</td>
					<td><a href="treatment_update.do?treatment_Code=${dto.treatment_Code}">수정</a>|
						   <a href="treatment_delete.do?treatment_Code=${dto.treatment_Code}">삭제</a></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:when test="${!empty listTreatment}">
			<c:forEach var="dto" items="${listTreatment}">
				<tr align="center">
					<td>${dto.treatment_Code}</td>
					<td>${dto.treatment_Date}</td>
					<td>${dto.treatment_Time}</td>
					<td>${dto.patient_Name}</td>
					<td>${dto.dep_Code}</td>
					<td>${dto.doc_Name}</td>
					<td><a href="treatment_update.do?treatment_Code=${dto.treatment_Code}">수정</a>|
						   <a href="treatment_delete.do?treatment_Code=${dto.treatment_Code}">삭제</a></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="7" align="center">입력된 진료가 없습니다.</td>
			</tr>		
		</c:otherwise>
		</c:choose>
		</tbody>
		</table>
		</div></div>
	</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>


