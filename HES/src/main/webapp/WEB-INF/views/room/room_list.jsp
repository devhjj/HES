<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<!-- room.jsp -->
<div class="py-5" align="center">
<!-- 병실 select -->
<!-- 병실이름, 수용인원, 현재 수용 가능 인원, 1일 입원비 -->	
	<div class="card mb-4">
		<div class="card-header">
			병실 관리
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="100%" border="1">
		<tr>
			<td align="right" colspan="6"><a href="room_input.do">병실 추가</a></td>
		</tr>
		<thead>
		<tr>
			<th>병실이름</th>
			<th>수용인원</th>
			<th>현재 수용 가능 인원</th>
			<th>1일 입원비</th>
			<th>비고</th>
		</tr>
		</thead>
		<c:choose>
		<c:when test="${empty listRoom}">
			<tbody>
			<tr>
				<td colspan="6" align="center">입력된 병실이 없습니다.</td>
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
					<td><a href="room_update.do?roomNum=${dto.roomNum}">수정</a>|<a href="room_delete.do?roomNum=${dto.roomNum}">삭제</a></td>
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

