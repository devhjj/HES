<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<div class="py-5" align="center">
	<form action="doctor.do" method="post">
	<table width="100" border="1" align="left">
		<tr>
			<th>����</th>
		</tr>
		<tr>
			<th>
				<select name="filter">
					<option value="0">��ü</option>
				<c:forEach var="dto" items="${setFilter }">
					<option value="${dto.dep_Code }">${dto.dep_Name }</option>
				</c:forEach>
				</select>
			</th>
		</tr>
		<tr>
			<td align="center"><input type="submit" value="����"></td>
		</tr>
	</table>
	</form>
	
	<div class="card mb-4">
		<div class="card-header">
			ȯ������
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="70%" border="1">
		<thead>
		<tr align="center">
			<th>ȯ���ڵ�</th>
			<th>�̸�</th>
			<th>��ȭ��ȣ</th>
			<th>�ּ�</th>
			<th>���</th>
		</tr>
		</thead>
		<c:choose>
		<c:when test="${empty listPatient }">
		<tbody>
		<tr>
			<td colspan="5" align="center">�Էµ� ȯ�ڰ� �����ϴ�.</td>
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
					<td><a href="patient_update.do?patient_code=${dto.patient_code }">����(������������ �ű濹��)</a>|<a href="patient_delete.do?patient_code=${dto.patient_code }">����</a></td>
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