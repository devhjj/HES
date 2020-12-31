<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--hosptialization_update.jsp-->
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!-- 병실 조회 팝업창 열기 -->
<script type="text/javascript">
		function getRoomNum(){		
			window.open('room_status.do','','width=800,height=600');
		}
</script> 

<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			입원 수정
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="hospitalization_update.do" method="post">
			<input type="hidden" name="hplCode" value="${getHospitalization.hplCode}">
		<table class="table table-bordered dataTable" border="1">
		<tbody>
			<tr><th>입원환자</th><td><input type="text" name="patient_Name" size="15" value="${getHospitalization.patient_Name}">
			<tr><th>현재병실</th><td><input type="text" id="currentRoomName" name="currentRoomName" size="6" value="${getHospitalization.roomName}" readonly>호</td></tr>
			<tr><th>이동할병실</th><td><input type="text" id="roomName" name="roomName" size="6" value="${getHospitalization.roomName}" readonly>호		
										 		<input type="button" value="병실조회" onclick="javascript:getRoomNum()"></td></tr>
			<tr><th>입원일자</th><td><input type="date" name="joinDate" size="15" value="${getHospitalization.joinDate}"></td></tr>
			<tr><th>퇴원일자</th><td><input type="date" name="leaveDate" size="15" value="${getHospitalization.leaveDate}"></td></tr>										 		
			<tr><td colspan="2" align="right">
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="window.location='hospitalization.do'"></td></tr>			
		</tbody>		
		</table>
		</form>
	</div>
	</div>
</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>