<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/full-width-pics.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<!-- treatment_staus.jsp -->
<!-- 유효성검사 -->
<script type="text/javascript">
		function check(){
			if (f.dep_Code.value=="0"){
				alert("부서를 선택해 주세요.")
				return
			}
			if (f.doc_Name.value==""){
				alert("희망 진료의사를 선택해 주세요.")
				return
			}
			if (f.treatment_Date.value==""){
				alert("희망 진료일자를 선택해 주세요.")
				return
			}
			document.f.submit()
		}				
</script>

<!-- 부서 선택시 해당 의사 호출 -->
<script type="text/javascript">
	function getDoc_Name(dep_Code,mode,treatment_Date){
		location.href="treatment_status.do?dep_Code="+dep_Code+"&mode="+mode+"&treatment_Date="+treatment_Date;
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
			<c:if test="${mode == 'treatment'}">진료 조회</c:if>
			<c:if test="${mode == 'reservation'}">예약 조회</c:if>
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="treatment_status.do" method="post">
		<input type="hidden" name="mode" value="${mode}">
		<table class="table table-bordered dataTable"  border="1">
		<tr align="center">
			<th>진료부서</th>
			<td>
				<select name="dep_Code" onchange="javascript:getDoc_Name(this.value,'${mode}',treatment_Date.value);">
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
			<c:if test="${mode == 'treatment'}"><th>진료일자</th></c:if>
			<c:if test="${mode == 'reservation'}"><th>희망진료일자</th></c:if>
			<td><input type="date" name="treatment_Date" value="${treatment_Date}"></td>
			<td><input type="button" value="조회" onclick="check();"></td>
		</tr>
		</table>
		</form>
		<table class="table table-bordered dataTable" width="100%" border="1">
		<thead>
		<tr>
			<c:if test="${mode == 'treatment'}"><th>진료번호</th></c:if>
			<th>진료일자</th>
			<th>진료시간</th>
			<c:if test="${mode == 'treatment'}"><th>진료환자</th></c:if>
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
				<td><a href="javascript:setTreatment('${treatment_Date}','${time}','${dep_Code2}','${doc_Name}')">선택</a></td>
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
				<c:when test="${checkTreatment == true}">선택불가</c:when>
				<c:when test="${checkReservation == true}"><c:if test="${mode == 'treatment'}">예약대기중</c:if>
																				<c:if test="${mode == 'reservation'}">선택불가</c:if></c:when>
				<c:otherwise><a href="javascript:setTreatment('${treatment_Date}','${time}','${dep_Code2}','${doc_Name}')">선택</a></c:otherwise>
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
