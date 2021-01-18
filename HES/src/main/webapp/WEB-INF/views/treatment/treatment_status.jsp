<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/full-width-pics.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<!-- treatment_staus.jsp -->
<!-- ��ȿ���˻� -->
<script type="text/javascript">
		function check(){
			if (f.dep_Code.value=="0"){
				alert("�μ��� ������ �ּ���.")
				return
			}
			if (f.doc_Name.value==""){
				alert("��� �����ǻ縦 ������ �ּ���.")
				return
			}
			if (f.treatment_Date.value==""){
				alert("��� �������ڸ� ������ �ּ���.")
				return
			}
			document.f.submit()
		}				
</script>

<!-- �μ� ���ý� �ش� �ǻ� ȣ�� -->
<script type="text/javascript">
	function getDoc_Name(dep_Code,mode,treatment_Date){
		location.href="treatment_status.do?dep_Code="+dep_Code+"&mode="+mode+"&treatment_Date="+treatment_Date;
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
			<c:if test="${mode == 'treatment'}">���� ��ȸ</c:if>
			<c:if test="${mode == 'reservation'}">���� ��ȸ</c:if>
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="treatment_status.do" method="post">
		<input type="hidden" name="mode" value="${mode}">
		<table class="table table-bordered dataTable"  border="1">
		<tr align="center">
			<th>����μ�</th>
			<td>
				<select name="dep_Code" onchange="javascript:getDoc_Name(this.value,'${mode}',treatment_Date.value);">
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
			<c:if test="${mode == 'treatment'}"><th>��������</th></c:if>
			<c:if test="${mode == 'reservation'}"><th>�����������</th></c:if>
			<td><input type="date" name="treatment_Date" value="${treatment_Date}"></td>
			<td><input type="button" value="��ȸ" onclick="check();"></td>
		</tr>
		</table>
		</form>
		<table class="table table-bordered dataTable" width="100%" border="1">
		<thead>
		<tr>
			<c:if test="${mode == 'treatment'}"><th>�����ȣ</th></c:if>
			<th>��������</th>
			<th>����ð�</th>
			<c:if test="${mode == 'treatment'}"><th>����ȯ��</th></c:if>
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
		
		<c:if test="${dep_Code!=null && doc_Name!=null && treatment_Date !=null}">
		 <c:choose>
		    <c:when test="${empty searchTreatment && empty searchReservation}">
		    <c:forTokens var="time" items="10:00,10:30,11:00,11:30,13:00,13:30,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30" delims=",">
	    	 <tr align="center">
	    		<c:if test="${mode == 'treatment'}"><td></td></c:if>
				<td>${treatment_Date}</td>
				<td>${time}</td>
				<c:if test="${mode == 'treatment'}"><td></td></c:if>
				<td>${dep_Code2}</td>
				<td>${doc_Name}</td>
				<td><a href="javascript:setTreatment('${treatment_Date}','${time}','${dep_Code2}','${doc_Name}')">����</a></td>
			 </tr>
			</c:forTokens>
		    </c:when>
		<c:otherwise>
			<c:forTokens var="time" items="10:00,10:30,11:00,11:30,13:00,13:30,14:00,14:30,15:00,15:30,16:00,16:30,17:00,17:30" delims=",">
			<tr align="center">
				<c:if test="${mode == 'treatment'}"><td><c:forEach var="dto" items="${searchTreatment}"><c:if test="${dto.treatment_Time == time}">${dto.treatment_Code}</c:if></c:forEach></td></c:if>
				<td>${treatment_Date}</td>
				<td>${time}</td>
				<c:if test="${mode == 'treatment'}"><td><c:forEach var="dto" items="${searchTreatment}"><c:if test="${dto.treatment_Time == time}">${dto.patient_Name}</c:if></c:forEach></td></c:if>
				<td>${dep_Code2}</td>
				<td>${doc_Name}</td>
				<td>
				<c:set var="checkTreatment" value="false"/>
				<c:set var="checkReservation" value="false"/>
				<c:forEach var="dto" items="${searchTreatment}">
				<c:if test="${dto.treatment_Time == time}"><c:set var="checkTreatment" value="true"/></c:if>
				</c:forEach>
				<c:forEach var="dto" items="${searchReservation}">
				<c:if test="${dto.treatment_Time == time}"><c:set var="checkReservation" value="true"/></c:if>
				</c:forEach>
				<c:choose>
				<c:when test="${checkTreatment == true}">���úҰ�</c:when>
				<c:when test="${checkReservation == true}"><c:if test="${mode == 'treatment'}">��������</c:if>
																				<c:if test="${mode == 'reservation'}">���úҰ�</c:if></c:when>
				<c:otherwise><a href="javascript:setTreatment('${treatment_Date}','${time}','${dep_Code2}','${doc_Name}')">����</a></c:otherwise>
				</c:choose>
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
