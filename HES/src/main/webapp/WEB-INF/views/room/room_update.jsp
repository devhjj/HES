<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- room_input.jsp -->
<jsp:include page="../../views/common/header.jsp"></jsp:include>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 병실이름, 수용인원, 1일 입원비 -->
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			병실 추가
		</div>
	<div class="card-body">
	<div class="table-responsive">
		<form name="f" action="room_update.do" method="post">
			<input type="hidden" name="roomNum" value="${getRoom.roomNum}">
		<table class="table table-bordered dataTable" border="1">
		<tbody>
			<tr><th>병실이름</th><td><input type="text" name="roomName" size="5" value="${getRoom.roomName}">호</td></tr>
			<tr><th>현재수용인원</th><td><input type="text" name="currentAccommodated_number" size="3" value="${getRoom.accommodated_number}">명</td></tr>
			<tr><th>변경수용인원</th><td><input type="text" name="accommodated_number" size="3" value="${getRoom.accommodated_number}">명</td></tr>
			<tr><th>1일 입원비</th><td><input type="text" name="price" size="20" value="${getRoom.price}">원</td></tr>
			<tr><td colspan="2" align="right">
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="window.location='room.do'"></td></tr>			
		</tbody>		
		</table>
		</form>
	</div>
	</div>
</div>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>




