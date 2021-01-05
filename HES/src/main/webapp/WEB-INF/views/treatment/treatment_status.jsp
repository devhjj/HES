<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/full-width-pics.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<!-- treatment_staus.jsp -->
<!-- �μ� ���ý� �ش� �ǻ� ȣ�� -->
<script type="text/javascript">
		function getDoc_Name(dep_Code){
			window.location="treatment_status.do?dep_Code="+dep_Code;
		}
</script> 

<!-- ���� ���ý� �θ�â���� �� �ѱ�� -->
<script type="text/javascript">
		function setTreatment(treatment_Date,treatment_Time,dep_Code,doc_Name){
			opener.document.getElementById("treatment_Date").value = treatment_Date; 
			opener.document.getElementById("treatment_Time").value = treatment_Time; 
			opener.document.getElementById("dep_Code").value = dep_Code; 
			opener.document.getElementById("doc_Name").value = doc_Name; 
			window.close();
		}
</script> 

<title>������ȸ</title>
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			���� ��ȸ
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="" method="post">
		<table class="table table-bordered dataTable"  border="1">
		<tr align="center">
			<th>����μ�</th>
			<td>
				<select name="dep_Code" onchange="getDoc_Name(this.value)">
						<option value="0">��ü</option>
					<c:forEach var="dto" items="${listDepartment}">
						<option value="${dto.dep_Code}" <c:if test="${dep_Code==dto.dep_Code}">selected</c:if>>${dto.dep_Name}</option>
					</c:forEach>
				</select>	
			</td>
			<th>�����ǻ�</th>
			<td>
				<select name="doc_Name">
					<c:forEach var="dto" items="${listDoctor}">
						    <option value="${dto.doc_Name}">${dto.doc_Name}</option>
					</c:forEach>	
				</select>
			</td>
			<th>��������</th>
			<td>
				<input type="date" name="treatment_Date" value="${treatment_Date}">
			</td>
			<td><input type="submit" value="������ȸ"></td>
		</tr>
		</table>
		</form>
		<table class="table table-bordered dataTable" width="100%" border="1">
		<thead>
		<tr>
			<th>�����ȣ</th>
			<th>��������</th>
			<th>����ð�</th>
			<th>����ȯ��</th>
			<th>����μ�</th>
			<th>�����ǻ�</th>
			<th>���</th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${dep_Code == null}">
		 <tr>
		 	<td colspan="7" align="center">�μ��� �ǻ� �������ڸ� �������ּ���</td>
		 </tr>
		</c:if>
		
		<c:if test="${treatment_Date !=null}">
		 <c:choose>
		    <c:when test="${empty searchTreatment}">
		    <c:forTokens var="time" items="10:00,10:30,11:00,11:30,13:00,13:30,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30" delims=",">
	    	 <tr align="center">
	    		<td></td>
				<td>${treatment_Date}</td>
				<td>${time}</td>
				<td></td>
				<td>${dep_Code2}</td>
				<td>${doc_Name}</td>
				<td><a href="javascript:setTreatment('${treatment_Date}','${time}','${dep_Code2}','${doc_Name}')">����</a></td>
			 </tr>
			</c:forTokens>
		    </c:when>
		<c:otherwise>
			<c:forTokens var="time" items="10:00,10:30,11:00,11:30,13:00,13:30,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30" delims=",">
			<tr align="center">
				<td><c:forEach var="dto" items="${searchTreatment}"><c:if test="${dto.treatment_Time == time}">${dto.treatment_Code}</c:if></c:forEach></td>
				<td>${treatment_Date}</td>
				<td>${time}</td>
				<td><c:forEach var="dto" items="${searchTreatment}"><c:if test="${dto.treatment_Time == time}">${dto.patient_Name}</c:if></c:forEach></td>
				<td>${dep_Code2}</td>
				<td>${doc_Name}</td>
				<td>
				<c:set var="check" value="false"/>
				<c:forEach var="dto" items="${searchTreatment}">
				<c:if test="${dto.treatment_Time == time}"><c:set var="check" value="true"/></c:if>
				</c:forEach>
				<c:if test="${check == true}">���úҰ�</c:if>
				<c:if test="${check == false}"><a href="javascript:setTreatment('${treatment_Date}','${time}','${dep_Code2}','${doc_Name}')">����</a></c:if>
				</td>
			</tr>
			</c:forTokens>
		</c:otherwise>
		 </c:choose>
		</c:if>
		</tbody>
		</table>
	</div>
	</div>
	</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
