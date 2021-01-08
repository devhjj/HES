<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/full-width-pics.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<!-- room_status.jsp -->
<!-- ���� ���ý� �˾�â ������ ���� �� �����ϱ� -->
<script type="text/javascript">
		function setRoomNum(roomName){
			opener.document.getElementById("roomName").value = roomName; 
			window.close();
		}
</script> 

<title>������ȸ</title>
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			���� ��ȸ
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="100%" border="1">
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
					<td>${dto.roomName}ȣ</td>
					<td>${dto.accommodated_number}��</td>
					<td>${dto.accommodated_number_now}��</td>
					<td>${dto.price }��</td>
					<td><c:if test="${dto.accommodated_number_now != 0}"><a href="javascript:setRoomNum('${dto.roomName}')">����</a></c:if>
						  <c:if test="${dto.accommodated_number_now == 0}">�Կ��Ұ�</c:if></td>
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

