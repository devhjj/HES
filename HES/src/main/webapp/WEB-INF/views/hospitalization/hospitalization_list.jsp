<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!--hosptialization.jsp-->
<div class="py-5" align="center">
<!-- �Կ� ȯ�� ��� -->
<div class="card mb-4">
		<div class="card-header">
			�Կ� ����
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<form name="f" action="" method="post">
		<table class="table table-bordered dataTable" width="100%" border="1">
		<tr align="center">
			<td>
			<select name="filter">
				<option value="patient_Name">�Կ�ȯ��</option>
			    <option value="roomName">�Կ�����</option>	
			</select>
			<input type="text" name="searchString">
			<input type="submit" value="�˻�">
			<input type="button" value="��ü����" onclick="window.location='hospitalization.do'">
			</td>
		</tr>
		</table>
		</form>
		<table class="table table-bordered dataTable" width="100%" border="1">
		<thead>
		<tr>
			<th>�Կ���ȣ</th>
			<th>�Կ�ȯ��</th>
			<th>�Կ�����</th>
			<th>�Կ�����</th>
			<th>�������</th>
			<th>���</th>
		</tr>
		</thead>
		<tr>
			<td align="right" colspan="6"><a href="hospitalization_input.do">�Կ� �߰�</a></td>
		</tr>
		<c:choose>
		<c:when test="${!empty searchHospitalization}">
			<c:forEach var="dto" items="${searchHospitalization}">
			<tbody>
				<tr align="center">
					<td>${dto.hplCode}</td>
					<td>${dto.patient_Name}</td>
					<td>${dto.roomName}ȣ</td>
					<td>${dto.joinDate}</td>
					<td>${dto.leaveDate}</td>
					<td><a href="hospitalization_update.do?hplCode=${dto.hplCode}">����</a>|
						   <a href="hospitalization_delete.do?hplCode=${dto.hplCode}">����</a></td>
				</tr>
			</tbody>
			</c:forEach>
		</c:when>
		<c:when test="${empty listHospitalization}">
			<tbody>
			<tr>
				<td colspan="6" align="center">�Էµ� �Կ��� �����ϴ�.</td>
			</tr>
			</tbody>		
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${listHospitalization}">
			<tbody>
				<tr align="center">
					<td>${dto.hplCode}</td>
					<td>${dto.patient_Name}</td>
					<td>${dto.roomName}ȣ</td>
					<td>${dto.joinDate}</td>
					<td>${dto.leaveDate}</td>
					<td><a href="hospitalization_update.do?hplCode=${dto.hplCode}">����</a>|
						   <a href="hospitalization_delete.do?hplCode=${dto.hplCode}">����</a></td>
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