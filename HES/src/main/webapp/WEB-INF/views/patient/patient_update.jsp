<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../user/user_header.jsp"></jsp:include>
<div class="py-5" align="center">
	<form action="patient_update.do" method="post">
		<table border="1">
			<tr align=center>
				<th colspan="2">마이페이지</th>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="patient_id" value="${dto.patient_id }" readonly></td>
				
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="patient_passwd" ></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="patient_name" value="${dto.patient_name }" readonly></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="patient_call" value="${dto.patient_call }" ></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="patient_address" value="${dto.patient_address }" ></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="patient_email" value="${dto.patient_email }" ></td>
			</tr>

			<tr align=center>
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>