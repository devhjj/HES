<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>    
<!-- treatment_input.jsp -->
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			(후에 사용자 페이지로 이동할) 예약 하기 
		</div>
		<div class="card-body">
		<div class="table-responsive">
			<form name="a" action="reservation_input.do" method="post">
			<table class="table table-bordered dataTable" border="1">
			<tbody>
			<tr>
				<th>예약자명</th>
				<td><input type="text" id="patient_Name" name=patient_Name size="17"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="button" value="예약조회" onclick="window.open('treatment_status.do?mode=reservation','','width=1200,height=800')">
				</td>
			</tr>	
			<tr>
				<th>희망 진료 일자</th>
				<td>
					<input type="date" id="treatment_Date" name="treatment_Date" readonly>
				</td>
			</tr>
			<tr>
				<th>희망 진료 시간</th>
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
				<th>증상 및 요청사항</th>
				<td>
					<textarea style="resize: none;" name="reservation_Detail" rows="10" cols="60" class="box"></textarea>
				</td>
			</tr>
			<tr>
			<tr>
			<td colspan="2" align="right">
				<input type="submit" value="예약신청">
			</tr>	
			</tbody>		
			</table>
			</form>
		</div>
		</div>
</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>