<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ǻ��Է�</title>
<c:if test="${empty getDepartment }">
	<script type="text/javascript">
		alert("�Էµ� �μ��� �����ϴ�. �μ��� ������ּ���");
		history.back();
	</script>
</c:if>
</head>
<body>
<div align="center">
	<form action="doctor_input.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th colspan="2">�ǻ��Է�</th>
			</tr>
			<tr>
				<th>������ ����</th>
				<td><input type="file" name="doc_Image"></td>
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
				<th>�̸���</th>
				<td><input type="email" name="doc_Email"></td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><input type="number" name="doc_Tel1" maxlength="3" size="3">-
				<input type="number" name="doc_Tel2" maxlength="4" size="4">-
				<input type="number" name="doc_Tel3" maxlength="4" size="4"></td>
			</tr>
			<tr>
				<th>�ǻ� ����</th>
				<td><input type="number" name="doc_License1" maxlength="2" size="2">-
				<input type="number" name="doc_License2" maxlength="2" size="2">-
				<input type="number" name="doc_License3" maxlength="5" size="7">
				</td>
			</tr>
			<tr>
				<th>�Ұ� ��</th>
				<td><textarea name="doc_Coment" maxlength="2000"></textarea></td>
			</tr>
			<tr>
				<th>�м�Ȱ��</th>
				<td><textarea name="doc_Thesis" maxlength="2000">��</textarea></td>
			</tr>
			<tr>
				<th>�з�</th>
				<td><input type="text" name="doc_FinalDegree"></td>
			</tr>
			<tr>
				<th>���</th>
				<td><textarea name="doc_Career" maxlength="2000"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="����"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>