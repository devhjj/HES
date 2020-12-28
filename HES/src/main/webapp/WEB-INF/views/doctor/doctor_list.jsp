<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>의사관리 페이지</title>
</head>
<body>
<div align="center">
<table width="50%" border="1">
	<tr>
		<th ><a href="">홈</a>|
		<a href="department.do">부서관리</a>|
		<a href="doctor.do">의사관리</a></th>
	</tr>
</table>
</div>
<br><br>
<div align="center">
<form action="doctor.do" method="post">
<table width="100" border="1" align="left">
	<tr>
		<th>필터</th>
	</tr>
	<tr>
		<th>
			<select name="filter">
				<option value="0">전체</option>
			<c:forEach var="dto" items="${setFilter }">
				<option value="${dto.dep_Code }">${dto.dep_Name }</option>
			</c:forEach>
			</select>
		</th>
	</tr>
	<tr>
		<td align="center"><input type="submit" value="선택"></td>
	</tr>
</table>
</form>
<table width="70%" border="1">
	<tr>
		<th colspan="6">의사관리</th>
	</tr>
	<tr>
		<td align="right" colspan="6"><a href="doctor_input.do">의사 추가</a></td>
	</tr>
	<tr>
		<th>부서코드</th>
		<th>의사코드</th>
		<th>분야</th>
		<th>직급</th>
		<th>의사이름</th>
		<th>비고</th>
	</tr>
	<c:choose>
	<c:when test="${empty listDoctor }">
	<tr>
		<td colspan="6" align="center">입력된 의사가 없습니다.</td>
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
				<td><a href="doctor_update.do?doc_Code=${dto.doc_Code }">수정</a>|<a href="doctor_delete.do?doc_Code=${dto.doc_Code }">삭제</a></td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</table>
</div>
</body>
</html>