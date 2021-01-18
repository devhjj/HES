<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- list.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../views/user/user_header.jsp"/>
<div align="center">
<br><br><br>
	<b>공지사항</b>
	<table class="table table-bordered dataTable" width="70%" border="1">
		<thead>
		<tr align="center">
			<td align="right"><a href="board_write.do">(관리자라면)글쓰기</a></td>
		</tr>
	</table>
<table class="table table-bordered dataTable" width="70%" border="1">
		<thead>
		<tr align="center">
			<th>번호</th>
			<th width="30%">제 목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
		</tr>
<c:if test="${empty listBoard}">		
		<tr>
			<td colspan="6">등록된 게시글이 없습니다.</td>
		</tr>
</c:if>		
<c:forEach var="dto" items="${listBoard}">
		<tr>
			<td align="center"><c:out value="${startNum}" /></td>
			<c:set var="startNum" value="${startNum-1}"/>
			<td>
<c:if test="${dto.re_level > 0}">			
				<img src="${pageContext.request.contextPath }/resources/img/level.gif" width="${dto.re_level*10}" height="15"/>
				<img src="${pageContext.request.contextPath }/resources/img/re.gif">
</c:if>				
				<a href="board_content.do?num=${dto.num}">
					${dto.subject}
				</a>	
<c:if test="${dto.readcount > 10}">				
				<img src="${pageContext.request.contextPath }/resources/img/hot.gif">
</c:if>
			</td>
			<td align="center">${dto.writer}</td>
			<td align="center">${dto.reg_date}</td>
			<td align="center">${dto.readcount}</td>
			<td align="center">${dto.ip}</td>
		</tr>
</c:forEach>
	</table>
	<br>
<c:if test="${count>0}">
	<c:if test="${startPage > pageBlock}">	
		[<a href="board_list.do?pageNum=${startPage-pageBlock}">이전</a>]
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
			[<a href="board_list.do?pageNum=${i}">${i}</a>]
		</c:forEach>
	<c:if test="${endPage < pageCount}">
		[<a href="board_list.do?pageNum=${endPage+pageBlock}">다음</a>]
	</c:if>
</c:if>
</div>
<jsp:include page="../../views/common/footer.jsp"/>