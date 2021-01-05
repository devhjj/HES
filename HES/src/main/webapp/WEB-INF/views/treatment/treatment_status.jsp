<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/full-width-pics.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<!-- treatment_staus.jsp -->
<!-- 부서 선택시 해당 의사 호출 -->
<script type="text/javascript">
		function getDoc_Name(dep_Code){
			window.location="treatment_status.do?dep_Code="+dep_Code;
		}
</script> 

<!-- 최종 선택시 부모창으로 값 넘기기 -->
<script type="text/javascript">
		function setTreatment(treatment_Date,treatment_Time,dep_Code,doc_Name){
			opener.document.getElementById("treatment_Date").value = treatment_Date; 
			opener.document.getElementById("treatment_Time").value = treatment_Time; 
			opener.document.getElementById("dep_Code").value = dep_Code; 
			opener.document.getElementById("doc_Name").value = doc_Name; 
			window.close();
		}
</script> 

<title>진료조회</title>
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			진료 조회
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="" method="post">
		<table class="table table-bordered dataTable"  border="1">
		<tr align="center">
			<th>진료부서</th>
			<td>
				<select name="dep_Code" onchange="getDoc_Name(this.value)">
						<option value="0">전체</option>
					<c:forEach var="dto" items="${listDepartment}">
						<option value="${dto.dep_Code}" <c:if test="${dep_Code==dto.dep_Code}">selected</c:if>>${dto.dep_Name}</option>
					</c:forEach>
				</select>	
			</td>
			<th>진료의사</th>
			<td>
				<select name="doc_Name">
					<c:forEach var="dto" items="${listDoctor}">
						    <option value="${dto.doc_Name}">${dto.doc_Name}</option>
					</c:forEach>	
				</select>
			</td>
			<th>진료일자</th>
			<td>
				<input type="date" name="treatment_Date" value="${treatment_Date}">
			</td>
			<td><input type="submit" value="진료조회"></td>
		</tr>
		</table>
		</form>
		<table class="table table-bordered dataTable" width="100%" border="1">
		<thead>
		<tr>
			<th>진료번호</th>
			<th>진료일자</th>
			<th>진료시간</th>
			<th>진료환자</th>
			<th>진료부서</th>
			<th>진료의사</th>
			<th>비고</th>
		</tr>
		</thead>
		<tbody>
		<c:if test="${dep_Code == null}">
		 <tr>
		 	<td colspan="7" align="center">부서와 의사 진료일자를 선택해주세요</td>
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
				<td><a href="javascript:setTreatment('${treatment_Date}','${time}','${dep_Code2}','${doc_Name}')">선택</a></td>
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
				<c:if test="${check == true}">선택불가</c:if>
				<c:if test="${check == false}"><a href="javascript:setTreatment('${treatment_Date}','${time}','${dep_Code2}','${doc_Name}')">선택</a></c:if>
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
