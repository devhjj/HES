<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/full-width-pics.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<!-- room_status.jsp -->
<!-- 병실 선택시 팝업창 닫히며 병실 값 전달하기 -->
<script type="text/javascript">
		function setRoomNum(roomName){
			opener.document.getElementById("roomName").value = roomName; 
			window.close();
		}
</script> 

<title>병실조회</title>
<div class="py-5" align="center">
<div class="card mb-4">
		<div class="card-header">
			병실 조회
		</div>
		<div class="card-body">
		<div class="table-responsive">
		<table class="table table-bordered dataTable" width="100%" border="1">
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
					<td>${dto.roomName}호</td>
					<td>${dto.accommodated_number}명</td>
					<td>${dto.accommodated_number_now}명</td>
					<td>${dto.price }원</td>
					<td><c:if test="${dto.accommodated_number_now != 0}"><a href="javascript:setRoomNum('${dto.roomName}')">선택</a></c:if>
						  <c:if test="${dto.accommodated_number_now == 0}">입원불가</c:if></td>
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

