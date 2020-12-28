<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<form action="doctor_update.do" method="post">
		<table border="1">
			<tr>
				<th colspan="2">의사수정</th>
			</tr>
			<tr>
				<th>의사 이름</th>
				<td><input type="text" name="doc_Name" value="${dto.doc_Name }" ></td>
			</tr>
			<tr>
				<th>의사 코드</th>
				<td><input type="number" name="doc_Code" readonly="readonly" value="${dto.doc_Code }"></td>
			</tr>
			<tr>
				<th>부서</th>
				<td>
				<select name="dep_Code">
				<c:forEach var="dep" items="${getDepartment }">
					<option value="${dep.dep_Code }">${dep.dep_Name }</option>
				</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<th>직급</th>
				<td><input type="text" name="doc_Rank" value="${dto.doc_Rank }"></td>
			</tr>
			<tr>
				<th>분야</th>
				<td><input type="text" name="doc_Major" value="${dto.doc_Major }"></td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td><input type="text" name="resident_Num" value="${dto.resident_Num }"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>