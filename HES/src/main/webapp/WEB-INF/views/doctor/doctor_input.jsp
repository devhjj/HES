<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�μ��Է�</title>
<c:if test="${empty getDepartment }">
	<script type="text/javascript">
		alert("�Էµ� �μ��� �����ϴ�. �μ��� ������ּ���");
		history.back();
	</script>
</c:if>
</head>
<body>
<div align="center">
	<form action="doctor_input.do" method="post">
		<table border="1">
			<tr>
				<th colspan="2">�ǻ��Է�</th>
			</tr>
			<tr>
				<th>�ǻ� �̸�</th>
				<td><input type="text" name="doc_Name"></td>
			</tr>
			<tr>
				<th>�μ�</th>
				<td>
				<select name="dep_Code">
				<c:forEach var="dep" items="${getDepartment }">
					<option value="${dep.dep_Code }">${dep.dep_Name }</option>
				</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th>����</th>
				<td><input type="text" name="doc_Rank"></td>
			</tr>
			<tr>
				<th>�о�</th>
				<td><input type="text" name="doc_Major"></td>
			</tr>
			<tr>
				<th>�ֹι�ȣ</th>
				<td><input type="text" name="resident_Num"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="����"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>