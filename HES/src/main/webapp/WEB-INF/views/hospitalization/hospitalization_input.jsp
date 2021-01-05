<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!--hosptialization_input.jsp-->
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			입원 추가
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="hospitalization_input.do" method="post">
		<table class="table table-bordered dataTable" border="1">
		<tbody>
			<tr><th>입원환자</th><td><input type="text" name="patient_Name" size="17"></td>
			<tr><th>입원병실</th><td><input type="text" id="roomName" name="roomName" size="17" readonly>호		
										 		<input type="button" value="병실조회" onclick="window.open('room_status.do','','width=800,height=600')"></td></tr>
			<tr><th>입원일자</th><td><input type="date" name="joinDate" size="10"></td></tr>
			<tr><td colspan="2" align="right">
					<input type="submit" value="추가">
					<input type="button" value="목록" onclick="window.location='hospitalization.do'"></td></tr>			
		</tbody>		
		</table>
		</form>
	</div>
	</div>
</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
