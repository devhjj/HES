<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- room_input.jsp -->
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!-- �����̸�, �����ο�, 1�� �Կ��� -->
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			���� �߰�
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="room_input.do" method="post">
		<table class="table table-bordered dataTable" border="1">
		<tbody>
			<tr><th>�����̸�</th><td><input type="text" name="roomName" size="5">ȣ</td></tr>
			<tr><th>�����ο�</th><td><input type="text" name="accommodated_number" size="3">��</td></tr>
			<tr><th>1�� �Կ���</th><td><input type="text" name="price" size="20">��</td></tr>
			<tr><td colspan="2" align="right">
					<input type="submit" value="�߰�">
					<input type="button" value="���" onclick="window.location='room.do'"></td></tr>			
		</tbody>		
		</table>
		</form>
	</div>
	</div>
</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>




