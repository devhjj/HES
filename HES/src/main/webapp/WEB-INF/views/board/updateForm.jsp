<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!-- updateForm.jsp -->
<jsp:include page="../../views/user/user_header.jsp"/>
<div align="center">
	<form name="f" action="board_updatePro.do" method="post"
													onsubmit="return check()">
		<b>글 수 정</b>
		<input type="hidden" name="num" value="${getBoard.num}" />													
		<table class="table table-bordered dataTable" width="70%" border="1">
			<tr>
				<th width="20%" bgcolor="yellow">이름</th>
				<td><input type="text" name="writer" class="box" value="${getBoard.writer}" required></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">제목</th>
				<td><input type="text" name="subject" class="box" size="45" value="${getBoard.subject}" required></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">Email</th>
				<td><input type="text" name="email" class="box" size="45" value="${getBoard.email}" required></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">내용</th>
				<td><textarea name="content" rows="11" cols="45" class="box">${getBoard.content}</textarea></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">비밀번호</th>
				<td><input type="password" name="passwd" class="box" required></td>
			</tr>
			<tr bgcolor="yellow">
				<td colspan="2" align="center">
					<input type="submit" value="글수정">
					<input type="reset" value="다시쓰기">
					<input type="button" value="목록보기" onclick="window.location='board_list.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>

<jsp:include page="../../views/common/footer.jsp"/><body>









