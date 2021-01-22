<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/full-width-pics.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<!-- patient_search.jsp -->
<!-- ȯ���̸� �θ������� �ѱ�� -->
<script type="text/javascript">
		function setPatient(patient_Name){
			opener.document.getElementById("patient_Name").value = patient_Name; 
			window.close();
		}
</script>

<title>ȯ����ȸ</title>
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			ȯ�� ��ȸ
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="patient_search.do" method="post">
		<table class="table table-bordered dataTable"  border="1">
		<tr>
		<th>ȯ�� �̸�</th>
		<td><input type="text" name="patient_Name" size="17">
			   <input type="submit" value="�˻�"></td>
		</tr>
		</table>
		</form>
		<table class="table table-bordered dataTable"  border="1">
		<thead>
		<tr align="center">
			<th>ȯ���ڵ�</th>
			<th>�̸�</th>
			<th>��ȭ��ȣ</th>
			<th>�ּ�</th>
			<th>���</th>
		</tr>
		<c:if test="${!empty searchPatient}">
		<c:forEach var="dto" items="${searchPatient}">
		<tr align="center">
			<td>${dto.patient_code }</td>
			<td>${dto.patient_name }</td>
			<td>${dto.patient_call }</td>
			<td>${dto.patient_address }</td>
			<td><a href="javascript:setPatient('${dto.patient_name}')">����</a></td>
		</tr>
		</c:forEach>
		</c:if>
		</thead>
		<tbody>
		</tbody>
		</table>
	</div>
	</div>
	</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>