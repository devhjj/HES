<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="right">
		<table border="1" width="300">
			<tr>
				<th><a href="main_department.do">전체부서</a></th>
				<th><a href="main_doctor.do?dep_Code=${department.dep_Code }">${department.dep_Name }</a></th>
				<th><a href="search_doctor.do">의료진 찾기</a></th>
			</tr>
		</table>
</div>
<br><br><br>
<div align="center">
		<table border="1" width="500" height="300">
			<tr>
				<th rowspan="3" width="300" height="300"><img src="D:/springFile/${dto.doc_Image }" width="100%" height="100%"></th>
				<td>${department.dep_Name } 전문의</td>
			</tr>
			<tr>
				<td>${dto.doc_Name }</td>
			</tr>
			<tr>
				<td>${dto.doc_Major }</td>
			</tr>
		</table>
		<br><br>
		<table border="1" width="500">
			<tr>
				<th>의사소개</th><th>진료일정</th><th>학술활동</th><th>학술/경력</th>
			</tr>
		</table>
		<br><br>
		<table width="500">
			<tr>
				<th align="left">의사소개</th>
			</tr>
			<tr>
				<td align="left">${dto.doc_Coment }</td>
			</tr>
			<tr>
				<th align="left">진료일정</th>
			</tr>
			<tr>
				<td align="left"><%@ include file="schedule.jsp" %></td>
			</tr>
			<tr>
				<th align="left">학술활동</th>
			</tr>
			<tr>
				<td align="left">${dto.doc_Thesis }</td>
			</tr>
			<tr>
				<th align="left">학력</th>
			</tr>
			<tr>
				<td align="left">${dto.doc_FinalDegree }</td>
			</tr>
			<tr>
				<th align="left">경력</th>
			</tr>
			<tr>
				<td align="left">${dto.doc_Career }</td>
			</tr>
		</table>
	</div>
</body>
</html>
