<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<form action="department_update.do" method="post">
		<table border="1">
			<tr>
				<th colspan="2">�μ�����</th>
			</tr>
			<tr>
				<th>�μ� �ڵ�</th>
				<td><input type="number" name="dep_Code" readonly="readonly" value="${dto.dep_Code}"></td>
				
			</tr>
			<tr>
				<th>�μ� �̸�</th>
				<td><input type="text" name="dep_Name" value="${dto.dep_Name }"></td>
			</tr>
			<tr>
				<th>�μ����̸�</th>
				<td><input type="text" name="dep_Head" value="${dto.dep_Head }"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="����"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>