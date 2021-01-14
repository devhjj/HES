<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>    
<!-- treatment_input.jsp -->
<!-- 유효성 검사 -->
<script type="text/javascript">
		function check(){
			if (f.patient_Name.value==""){
				alert("예약자명을 입력해 주세요.")
				f.patient_Name.focus()
				return
			}
			if (f.treatment_Date.value==""){
				alert("예약조회를 통해 예약 세부 사항을 선택해 주세요.")
				f.paswd.focus()
				return
			}
			document.f.submit()
		}
</script>
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			진료 예약
		</div>
		<div class="card-body">
		<div class="table-responsive">
			<form name="f" action="reservation_input.do" method="post">
			<table class="table table-bordered dataTable" border="1">
			<tbody>
			<tr>
				<th>*예약자명</th>
				<td><input type="text" id="patient_Name" name=patient_Name size="17"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				*예약조회를 통해 예약 세부 사항을 선택해 주세요*		<input type="button" value="예약조회" onclick="window.open('treatment_status.do?mode=reservation','','width=1200,height=800')">
				</td>
			</tr>	
			<tr>
				<th>*희망 진료 일자</th>
				<td>
					<input type="date" id="treatment_Date" name="treatment_Date" readonly>
				</td>
			</tr>
			<tr>
				<th>*희망 진료 시간</th>
				<td>
					<input type="text" id="treatment_Time" name="treatment_Time" size="17" readonly>
				</td>
			</tr>
			<tr>
				<th>*진료부서</th>
				<td>
					<input type="text" id="dep_Code" name="dep_Code" size="17" readonly>
				</td>
			</tr>
			<tr>
				<th>*진료의사</th>
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
				<input type="button" value="예약신청" onclick="check();">
			</tr>	
			</tbody>		
			</table>
			</form>
		</div>
		</div>
</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>