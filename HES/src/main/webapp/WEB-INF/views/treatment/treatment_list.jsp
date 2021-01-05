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
			<th>��������</th>
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
			<td>
				<form name="c" action="" method="post">
				<select name="filter">
					<option value="patient_Name">����ȯ��</option>
				    <option value="doc_Name">�����ǻ�</option>
				</select>	
				<input type="text" name="searchString">
				<input type="submit" value="�˻�">
				</form>
			</td>
			<td>
			<input type="button" value="��ü����" onclick="window.location='treatment.do'">
			</td>
		</tr>
		</table>
		<table class="table table-bordered dataTable" width="100%" border="1">
		<thead>
		<tr>
			<th>�����ȣ</th>
			<th>��������</th>
			<th>����ð�</th>
			<th>����ȯ��</th>
			<th>����μ�</th>
			<th>�����ǻ�</th>
			<th>���</th>
		</tr>
		</thead>
		<tr>
			<td align="right" colspan="7"><a href="treatment_input.do">���� �߰�</a></td>
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
					<td><a href="treatment_update.do?treatment_Code=${dto.treatment_Code}">����</a>|
						   <a href="treatment_delete.do?treatment_Code=${dto.treatment_Code}">����</a></td>
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
					<td><a href="treatment_update.do?treatment_Code=${dto.treatment_Code}">����</a>|
						   <a href="treatment_delete.do?treatment_Code=${dto.treatment_Code}">����</a></td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="7" align="center">�Էµ� ���ᰡ �����ϴ�.</td>
			</tr>		
		</c:otherwise>
		</c:choose>
		</tbody>
		</table>
		</div></div>
	</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>


