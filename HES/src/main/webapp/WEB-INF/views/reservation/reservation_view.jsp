<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- reservaiton_view.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<div class="py-5" align="center">
<div class="card mb-4">
	<div class="card-header">
		예약 상세 보기
	</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="a" action="treatment_input2.do" method="post">
			<input type="hidden" name="reservation_Code" value="${getReservation.reservation_Code}">
			<table class="table table-bordered dataTable" border="1">
			<tbody>
			<tr>
				<th>예약자명</th>
				<td><input type="text" id="patient_Name" name=patient_Name value="${getReservation.patient_Name}" size="17" readonly></td>
			</tr>
			<tr>
				<th>희망 진료 일자</th>
				<td>
					<input type="date" id="treatment_Date" name="treatment_Date" value="${getReservation.treatment_Date}" readonly>
				</td>
			</tr>
			<tr>
				<th>희망 진료 시간</th>
				<td>
					<input type="text" id="treatment_Time" name="treatment_Time" value="${getReservation.treatment_Time}" size="17" readonly>
				</td>
			</tr>
			<tr>
				<th>진료부서</th>
				<td>
					<input type="text" id="dep_Code" name="dep_Code" size="17" value="${getReservation.dep_Code}" readonly>
				</td>
			</tr>
			<tr>
				<th>진료의사</th>
				<td>
					<input type="text" id="doc_Name" name="doc_Name" size="17" value="${getReservation.doc_Name}" readonly>
				</td>
			</tr>
			<tr>
				<th>증상 및 요청사항</th>
				<td>
					<textarea style="resize: none;" name="reservation_Detail" rows="10" cols="60" class="box" readonly>${getReservation.reservation_Detail}</textarea>
				</td>
			</tr>
			<tr>
				<th>예약 진행 상황</th>
				<td>${getReservation.reservation_Progress}</td>
			</tr>
			<tr>
			<td colspan="2" align="right">
				<input type="submit" value="예약승인">
				<input type="button" value="예약거절" onclick="window.location='reservation_reject.do?reservation_Code=${getReservation.reservation_Code}'">
				<input type="button" value="목록으로" onclick="window.location='reservation.do?'">
			</tr>	
			</tbody>		
			</table>
		</form>
	</div>
	</div>
</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
