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
	
	</div>
	<div class="col-8 border">
	<div class="table-responsive">
		<table class="table table-bordered dataTable" border="1" width="500" height="300">
			<tr>
				<th rowspan="3" width="300" height="300"><img src="D:/springFile/${dto.doc_Image }" width="100%" height="100%"></th>
				<td>${department.dep_Name } ������</td>
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
			<tr>
				<th>�ǻ�Ұ�</th><!-- <th>��������</th> --><th>�м�Ȱ��</th><th>�м�/���</th>
			</tr>
		</table>
		<br><br>
		<table class="table table-bordered dataTable" width="500">
			<tr>
				<th align="left">�ǻ�Ұ�</th>
			</tr>
			<tr>
				<td align="left">${dto.doc_Coment }</td>
			</tr>
			<!-- 
			<tr>
				<th align="left">��������</th>
			</tr>
			<tr>
				<td align="left"></td>
			</tr> -->
			<tr>
				<th align="left">�м�Ȱ��</th>
			</tr>
			<tr>
				<td align="left">${dto.doc_Thesis }</td>
			</tr>
			<tr>
				<th align="left">�з�</th>
			</tr>
			<tr>
				<td align="left">${dto.doc_FinalDegree }</td>
			</tr>
			<tr>
				<th align="left">���</th>
			</tr>
			<tr>
				<td align="left">${dto.doc_Career }</td>
			</tr>
		</table>
		</div>
	</div>
	</div></div></div>
</body>
</html>
