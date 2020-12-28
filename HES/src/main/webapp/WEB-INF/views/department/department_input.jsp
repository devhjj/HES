<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>부서입력</title>
</head>
<body>
<div align="center">
	<form action="department_input.do" method="post">
		<table border="1">
			<tr>
				<th colspan="2">부서입력</th>
			</tr>
			<tr>
				<th>부서 코드</th>
				<td><input type="number" name="dep_Code"></td>
				
			</tr>
			<tr>
				<th>부서 이름</th>
				<td><input type="text" name="dep_Name"></td>
			</tr>
			<tr>
				<th>부서장이름</th>
				<td><input type="text" name="dep_Head"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>