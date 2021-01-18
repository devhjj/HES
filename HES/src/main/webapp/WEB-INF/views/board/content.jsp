<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!-- content.jsp -->
<jsp:include page="../../views/user/user_header.jsp"/>
<div align="center">
<br><br><br>
	<b>글내용 보기</b>
	<table class="table table-bordered dataTable" width="70%" border="1">
		<thead>
		<tr align="center">
			<th width="20%">글번호</th>
			<td width="30%" align="center">${getBoard.num}</td>
			<th width="20%">조회수</th>
			<td width="30%" align="center">${getBoard.readcount}</td>
		</tr>
		<tr>
			<th width="20%">작성자</th>
			<td width="30%" align="center">${getBoard.writer}</td>
			<th width="20%">작성일</th>
			<td width="30%" align="center">${getBoard.reg_date}</td>
		</tr>
		<tr>
			<th width="20%">글제목</th>
			<td width="80%" align="center" colspan="3">${getBoard.subject}</td>
		</tr>
		<tr>
			<th   width="20%">글내용</th>
			<td width="80%" align="center" colspan="3">${getBoard.content}</td>
		</tr>
		<tr>
			<td width="80%" align="right" colspan="4">
				<input type="button" value="답글쓰기" 
				onclick="window.location='board_writeForm.do?num=${getBoard.num}&re_step=${getBoard.re_step}&re_level=${getBoard.re_level}'">
				<input type="button" value="글수정" onclick="window.location='board_update.do?num=${getBoard.num}'">
				<input type="button" value="글삭제" onclick="window.location='board_delete.do?num=${getBoard.num}'">
				<input type="button" value="글목록" onclick="window.location='board_list.do'">
			</td>
		</tr>
	</table>
</div>


<jsp:include page="../../views/common/footer.jsp"/>








