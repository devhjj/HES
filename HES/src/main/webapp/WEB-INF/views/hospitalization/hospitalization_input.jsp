<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!--hosptialization_input.jsp-->
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			�Կ� �߰�
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="hospitalization_input.do" method="post">
		<table class="table table-bordered dataTable" border="1">
		<tbody>
			<tr><th>�Կ�ȯ��</th><td><input type="text" id="patient_Name" name="patient_Name" size="17">
												<input type="button" value="ȯ����ȸ" onclick="window.open('patient_search.do','','width=1200,height=800')"></td>
			<tr><th>�Կ�����</th><td><input type="text" id="roomName" name="roomName" size="17" readonly>ȣ		
										 		<input type="button" value="������ȸ" onclick="window.open('room_status.do','','width=800,height=600')"></td></tr>
			<tr><th>�Կ�����</th><td><input type="date" name="joinDate" size="10"></td></tr>
			<tr><td colspan="2" align="right">
					<input type="submit" value="�߰�">
					<input type="button" value="���" onclick="window.location='hospitalization.do'"></td></tr>			
		</tbody>		
		</table>
		</form>
	</div>
	</div>
</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>
