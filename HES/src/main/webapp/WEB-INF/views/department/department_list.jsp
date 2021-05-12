<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<div class="py-5" align="center">
<form action="department.do" method="post">
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
		<div class="card-header">�μ�����</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="70%" border="1">
		<tr>
			<td align="right" colspan="4"><a href="department_input.do">�μ� �߰�</a></td>
		</tr>
		<thead>
		<tr>
			<th width="20%">�μ��ڵ�</th>
			<th width="40%">�μ��̸�</th>
			<th width="20%">�μ���</th>
			<th width="20%">���</th>
		</tr>
		</thead>
		<c:choose>
		<c:when test="${empty listDepartment }">
		<tbody>
		<tr>
			<td colspan="4" align="center">������ �μ��� �����ϴ�.</td>
		</tr>
		</tbody>
			</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${listDepartment }">
			<tbody>
				<tr align="center">
					<td>${dto.dep_Code }</td>
					<td>${dto.dep_Name }</td>
					<td>${dto.dep_Head }</td>
					<td><a href="department_update.do?dep_Code=${dto.dep_Code }">����</a>|<a href="department_delete.do?dep_Code=${dto.dep_Code }">����</a></td>
				</tr>
			</tbody>
			</c:forEach>
		</c:otherwise>
		
	</c:choose>
	</table></div></div></div>
	</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>