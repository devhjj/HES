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
<table width="600" border="1">
	<tr>
		<th colspan="4">�μ�����</th>
	</tr>
	<tr>
		<td align="right" colspan="4"><a href="department_input.do">�μ� �߰�</a></td>
	</tr>
	<tr>
		<th width="20%">�μ��ڵ�</th>
		<th width="40%">�μ��̸�</th>
		<th width="20%">�μ���</th>
		<th width="20%">���</th>
	</tr>
	<c:choose>
	<c:when test="${empty listDepartment }">
	<tr>
		<td colspan="4" align="center">������ �μ��� �����ϴ�.</td>
	</tr>		
		</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${listDepartment }">
			<tr align="center">
				<td>${dto.dep_Code }</td>
				<td>${dto.dep_Name }</td>
				<td>${dto.dep_Head }</td>
				<td><a href="department_update.do?dep_Code=${dto.dep_Code }">����</a>|<a href="department_delete.do?dep_Code=${dto.dep_Code }">����</a></td>
			</tr>
		</c:forEach>
	</c:otherwise>
	
</c:choose>
</table>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>