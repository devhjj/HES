<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- room_input.jsp -->
<jsp:include page="../../views/common/header.jsp"></jsp:include>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- �����̸�, �����ο�, 1�� �Կ��� -->
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			���� �߰�
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="room_update.do" method="post">
			<input type="hidden" name="roomNum" value="${getRoom.roomNum}">
		<table class="table table-bordered dataTable" border="1">
		<tbody>
			<tr><th>�����̸�</th><td><input type="text" name="roomName" size="5" value="${getRoom.roomName}">ȣ</td></tr>
			<tr><th>��������ο�</th><td><input type="text" name="currentAccommodated_number" size="3" value="${getRoom.accommodated_number}">��</td></tr>
			<tr><th>��������ο�</th><td><input type="text" name="accommodated_number" size="3" value="${getRoom.accommodated_number}">��</td></tr>
			<tr><th>1�� �Կ���</th><td><input type="text" name="price" size="20" value="${getRoom.price}">��</td></tr>
			<tr><td colspan="2" align="right">
					<input type="submit" value="����">
					<input type="button" value="���" onclick="window.location='room.do'"></td></tr>			
		</tbody>		
		</table>
		</form>
	</div>
	</div>
</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>




