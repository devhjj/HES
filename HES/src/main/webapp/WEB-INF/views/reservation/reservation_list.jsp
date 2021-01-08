<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!-- treatment_list.jsp -->
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			예약 관리
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="100%" border="1">
		<tr align="center">
			<th>희망진료일자</th>
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
			<td rowspan="2">
				<input type="button" value="전체보기" onclick="window.location='reservation.do'">
			</td>
		</tr>
		<tr align="center">
			<th>예약일자</th>
			<td>
				<form name="a" action="" method="post">
				<input type="date" name="reservation_Date">
				<input type="submit" value="검색">
				</form>
			</td>
			<td colspan="2">
				<form name="c" action="" method="post">
				<select name="filter">
					<option value="patient_Name">예약자명</option>
				    <option value="doc_Name">진료의사</option>
				</select>		
				<input type="text" name="searchString">
				<input type="submit" value="검색">
				</form>
			</td>
		</tr>
		</table>
		<table class="table table-bordered dataTable" width="100%" border="1">
		<thead>
		<tr>
			<th>예약번호</th>
			<th>예약일자</th>
			<th>예약자명</th>
			<th>희망진료일자</th>
			<th>희망진료시간</th>
			<th>진료부서</th>
			<th>진료의사</th>
			<th>예약상황</th>
			<th>비고</th>
		</tr>
		</thead>
		<tbody>
		<c:choose>
		<c:when test="${!empty searchReservation}">
			<c:forEach var="dto" items="${searchReservation}">	
				<tr align="center">
					<td>${dto.reservation_Code}</td>
					<td>${dto.reservation_Date}</td>
					<td>${dto.patient_Name}</td>
					<td>${dto.treatment_Date}</td>
					<td>${dto.treatment_Time}</td>
					<td>${dto.dep_Code }</td>
					<td>${dto.doc_Name }</td>
					<td>${dto.reservation_Progress}</td>
					<td></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:when test="${!empty listReservation}">
			<c:forEach var="dto" items="${listReservation}">
				<tr align="center">
					<td>${dto.reservation_Code}</td>
					<td>${dto.reservation_Date}</td>
					<td>${dto.patient_Name}</td>
					<td>${dto.treatment_Date}</td>
					<td>${dto.treatment_Time}</td>
					<td>${dto.dep_Code }</td>
					<td>${dto.doc_Name }</td>
					<td>${dto.reservation_Progress}</td>
					<td><a href="reservation_view.do?reservation_Code=${dto.reservation_Code}">상세보기</a></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="9" align="center">예약이 없습니다.</td>
			</tr>		
		</c:otherwise>
		</c:choose>
		</tbody>
		</table>
		</div></div>
	</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>


