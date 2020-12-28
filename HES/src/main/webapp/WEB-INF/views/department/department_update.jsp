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
				<th colspan="2">부서수정</th>
			</tr>
			<tr>
				<th>부서 코드</th>
				<td><input type="number" name="dep_Code" readonly="readonly" value="${dto.dep_Code}"></td>
				
			</tr>
			<tr>
				<th>부서 이름</th>
				<td><input type="text" name="dep_Name" value="${dto.dep_Name }"></td>
			</tr>
			<tr>
				<th>부서장이름</th>
				<td><input type="text" name="dep_Head" value="${dto.dep_Head }"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>