<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>    
<!-- treatment_input.jsp -->
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			진료 추가
		</div>
		<div class="card-body">
		<div class="table-responsive">
			<form name="a" action="treatment_input.do" method="post">
			<table class="table table-bordered dataTable" border="1">
			<tbody>
			<tr>
				<th>진료환자</th>
				<td><input type="text" id="patient_Name" name=patient_Name size="17"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="button" value="진료조회" onclick="window.open('treatment_status.do','','width=1200,height=800')">
				</td>
			</tr>	
			<tr>
				<th>진료일자</th>
				<td>
					<input type="date" id="treatment_Date" name="treatment_Date" readonly>
				</td>
			</tr>
			<tr>
				<th>진료시간</th>
				<td>
					<input type="text" id="treatment_Time" name="treatment_Time" size="17" readonly>
				</td>
			</tr>
			<tr>
				<th>진료부서</th>
				<td>
					<input type="text" id="dep_Code" name="dep_Code" size="17" readonly>
				</td>
			</tr>
			<tr>
				<th>진료의사</th>
				<td>
					<input type="text" id="doc_Name" name="doc_Name" size="17" readonly>
				</td>
			</tr>
			<tr>
			<td colspan="2" align="right">
				<input type="submit" value="추가">
				<input type="button" value="목록" onclick="window.location='treatment.do'"></td>
			</tr>	
			</tbody>		
			</table>
			</form>
		</div>
		</div>
</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>