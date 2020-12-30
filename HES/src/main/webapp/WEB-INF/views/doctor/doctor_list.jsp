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
			�ǻ����
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="70%" border="1">
		<tr>
			<td align="right" colspan="6"><a href="doctor_input.do">�ǻ� �߰�</a></td>
		</tr>
		<thead>
		<tr>
			<th>�μ��ڵ�</th>
			<th>�ǻ��ڵ�</th>
			<th>�о�</th>
			<th>����</th>
			<th>�ǻ��̸�</th>
			<th>���</th>
		</tr>
		</thead>
		<c:choose>
		<c:when test="${empty listDoctor }">
		<tbody>
		<tr>
			<td colspan="6" align="center">�Էµ� �ǻ簡 �����ϴ�.</td>
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
					<td><a href="doctor_update.do?doc_Code=${dto.doc_Code }">����</a>|<a href="doctor_delete.do?doc_Code=${dto.doc_Code }">����</a></td>
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