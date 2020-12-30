<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!-- room.jsp -->
<div class="py-5" align="center">
<!-- ���� select -->
<!-- �����̸�, �����ο�, ���� ���� ���� �ο�, 1�� �Կ��� -->	
	<div class="card mb-4">
		<div class="card-header">
			���� ����
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="100%" border="1">
		<tr>
			<td align="right" colspan="6"><a href="room_input.do">���� �߰�</a></td>
		</tr>
		<thead>
		<tr>
			<th>�����̸�</th>
			<th>�����ο�</th>
			<th>���� ���� ���� �ο�</th>
			<th>1�� �Կ���</th>
			<th>���</th>
		</tr>
		</thead>
		<c:choose>
		<c:when test="${empty listRoom}">
			<tbody>
			<tr>
				<td colspan="6" align="center">�Էµ� ������ �����ϴ�.</td>
			</tr>
			</tbody>		
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${listRoom}">
			<tbody>
				<tr align="center">
					<td>${dto.roomName }</td>
					<td>${dto.accommodated_number }</td>
					<td>${dto.doc_Major }</td>
					<td>${dto.price }</td>
					<td><a href="room_update.do?roomNum=${dto.roomNum}">����</a>|<a href="room_delete.do?roomNum=${dto.roomNum}">����</a></td>
				</tr>
			</tbody>
			</c:forEach>
		</c:otherwise>
	</c:choose>
		</table>
		</div></div>
	</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>

