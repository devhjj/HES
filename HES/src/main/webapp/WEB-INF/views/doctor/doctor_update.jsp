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
	<form action="doctor_update.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th colspan="2">의사수정</th>
			</tr>
			<tr>
				<th>프로필사진</th>
				<td><input type="file" name="doc_Image" value="${dto.doc_Image }"></td>
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
				<th>이메일</th>
				<td><input type="email" name="doc_Email" value="${dto.doc_Email}"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="number" name="doc_Tel1" value="${doc_TelArray[0] }" size="3" maxlength="3">-
				<input type="number" name="doc_Tel2" value="${doc_TelArray[1] }" size="4" maxlength="4">-
				<input type="number" name="doc_Tel3" value="${doc_TelArray[2] }" size="4" maxlength="4">
				</td>
			</tr>
			<tr>
				<th>의사 면허</th>
				<td><input type="number" name="doc_License1" value="${doc_LicenseArray[0] }" readonly="readonly" size="2">-
				<input type="number" name="doc_License2" value="${doc_LicenseArray[1] }" readonly="readonly" size="2">-
				<input type="number" name="doc_License3" value="${doc_LicenseArray[2] }" readonly="readonly" size="7">
				</td>
			</tr>
			<tr>
				<th>소개 글</th>
				<td><textarea name="doc_Coment" maxlength="2000">${dto.doc_Coment }</textarea></td>
			</tr>
			<tr>
				<th>학술활동</th>
				<td><textarea name="doc_Thesis" maxlength="2000">${dto.doc_Thesis }</textarea></td>
			</tr>
			<tr>
				<th>학력</th>
				<td><input type="text" value="${dto.doc_FinalDegree }" name="doc_FinalDegree"></td>
			</tr>
			<tr>
				<th>경력</th>
				<td><textarea name="doc_Career" maxlength="2000">${dto.doc_Career}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>