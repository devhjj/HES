<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>부서입력</title>
<c:if test="${empty getDepartment }">
	<script type="text/javascript">
		alert("입력된 부서가 없습니다. 부서를 만들어주세요");
		history.back();
	</script>
</c:if>
</head>
<body>
<div align="center">
	<form action="doctor_input.do" method="post">
		<table border="1">
			<tr>
				<th colspan="2">의사입력</th>
			</tr>
			<tr>
				<th>의사 이름</th>
				<td><input type="text" name="doc_Name"></td>
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
				<td><input type="text" name="doc_Rank"></td>
			</tr>
			<tr>
				<th>분야</th>
				<td><input type="text" name="doc_Major"></td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td><input type="text" name="resident_Num"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>