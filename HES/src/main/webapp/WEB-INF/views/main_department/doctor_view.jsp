<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<div class="card mb-4">
<br><br>
	
<br><br><br>
	<div class="card-body">
	<div class="row">
	<div class="col-2 border">
	<table class="table table-bordered dataTable" border="1" >
			<tr>
				<th><a href="main_department.do">전체부서</a></th>
			</tr>
			<tr>
				<th><a href="main_doctor.do?dep_Code=${department.dep_Code }">${department.dep_Name }</a></th>
			</tr>
			<tr>
				<th><a href="search_doctor.do">의료진 찾기</a></th>
			</tr>
		</table>
	</div>
	<div class="col-8 border">
	<div class="table-responsive">
		<table class="table table-bordered dataTable" border="1" width="500" height="300">
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
		<table class="table table-bordered dataTable" border="1" width="500">
			<tr align="right">
				<th colspan="3" ><a href="reservation_input.do">예약하기</a></th>
			</tr>
			<tr>
				<th>의사소개</th><!-- <th>진료일정</th> --><th>학술활동</th><th>학술/경력</th>
			</tr>
			<tr>
				<th colspan="3"></th>
			</tr>
				
			<tr>
				<th colspan="3" align="left">의사소개</th>
			</tr>
			<tr>
				<td colspan="3" align="left">${dto.doc_Coment }</td>
			</tr>
			<!-- 
			<tr>
				<th align="left">진료일정</th>
			</tr>
			<tr>
				<td align="left"></td>
			</tr> -->
			<tr>
				<th colspan="3" align="left">학술활동</th>
			</tr>
			<tr>
				<td colspan="3" align="left">${dto.doc_Thesis }</td>
			</tr>
			<tr>
				<th colspan="3" align="left">학력</th>
			</tr>
			<tr>
				<td colspan="3" align="left">${dto.doc_FinalDegree }</td>
			</tr>
			<tr>
				<th colspan="3" align="left">경력</th>
			</tr>
			<tr>
				<td colspan="3" align="left">${dto.doc_Career }</td>
			</tr>
		</table>
		</div>
	</div>
	</div></div></div>
</body>
</html>
