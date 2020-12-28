<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ǻ���� ������</title>
</head>
<body>
<div align="center">
<table width="50%" border="1">
	<tr>
		<th ><a href="">Ȩ</a>|
		<a href="department.do">�μ�����</a>|
		<a href="doctor.do">�ǻ����</a></th>
	</tr>
</table>
</div>
<br><br>
<div align="center">
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
<table width="70%" border="1">
	<tr>
		<th colspan="6">�ǻ����</th>
	</tr>
	<tr>
		<td align="right" colspan="6"><a href="doctor_input.do">�ǻ� �߰�</a></td>
	</tr>
	<tr>
		<th>�μ��ڵ�</th>
		<th>�ǻ��ڵ�</th>
		<th>�о�</th>
		<th>����</th>
		<th>�ǻ��̸�</th>
		<th>���</th>
	</tr>
	<c:choose>
	<c:when test="${empty listDoctor }">
	<tr>
		<td colspan="6" align="center">�Էµ� �ǻ簡 �����ϴ�.</td>
	</tr>		
		</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${listDoctor}">
			<tr align="center">
				<td>${dto.dep_Code }</td>
				<td>${dto.doc_Code }</td>
				<td>${dto.doc_Major }</td>
				<td>${dto.doc_Rank }</td>
				<td><a href="doctor_info.do?doc_Code">${dto.doc_Name }</a></td>
				<td><a href="doctor_update.do?doc_Code=${dto.doc_Code }">����</a>|<a href="doctor_delete.do?doc_Code=${dto.doc_Code }">����</a></td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>
</div>
</body>
</html>