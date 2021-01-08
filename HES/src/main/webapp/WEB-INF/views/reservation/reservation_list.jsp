<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!-- treatment_list.jsp -->
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			���� ����
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="100%" border="1">
		<tr align="center">
			<th>�����������</th>
			<td>
				<form name="a" action="" method="post">
				<input type="date" name="treatment_Date">
				<input type="submit" value="�˻�">
				</form>
			</td>
			<th>����μ�</th>
			<td>
				<form name="b" action="" method="post">
				<select name="dep_Code">
					<c:forEach var="dto" items="${listDepartment}">
						<option value="${dto.dep_Code}">${dto.dep_Name}</option>
					</c:forEach>
				</select>	
				<input type="submit" value="�˻�">
				</form>
			</td>
			<td rowspan="2">
				<input type="button" value="��ü����" onclick="window.location='reservation.do'">
			</td>
		</tr>
		<tr align="center">
			<th>��������</th>
			<td>
				<form name="a" action="" method="post">
				<input type="date" name="reservation_Date">
				<input type="submit" value="�˻�">
				</form>
			</td>
			<td colspan="2">
				<form name="c" action="" method="post">
				<select name="filter">
					<option value="patient_Name">�����ڸ�</option>
				    <option value="doc_Name">�����ǻ�</option>
				</select>		
				<input type="text" name="searchString">
				<input type="submit" value="�˻�">
				</form>
			</td>
		</tr>
		</table>
		<table class="table table-bordered dataTable" width="100%" border="1">
		<thead>
		<tr>
			<th>�����ȣ</th>
			<th>��������</th>
			<th>�����ڸ�</th>
			<th>�����������</th>
			<th>�������ð�</th>
			<th>����μ�</th>
			<th>�����ǻ�</th>
			<th>�����Ȳ</th>
			<th>���</th>
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
					<td><a href="reservation_view.do?reservation_Code=${dto.reservation_Code}">�󼼺���</a></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="9" align="center">������ �����ϴ�.</td>
			</tr>		
		</c:otherwise>
		</c:choose>
		</tbody>
		</table>
		</div></div>
	</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>


