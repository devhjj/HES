<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!-- updateForm.jsp -->
<jsp:include page="../../views/user/user_header.jsp"/>
<div align="center">
	<form name="f" action="board_updatePro.do" method="post"
													onsubmit="return check()">
		<b>�� �� ��</b>
		<input type="hidden" name="num" value="${getBoard.num}" />													
		<table class="table table-bordered dataTable" width="70%" border="1">
			<tr>
				<th width="20%" bgcolor="yellow">�̸�</th>
				<td><input type="text" name="writer" class="box" value="${getBoard.writer}" required></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">����</th>
				<td><input type="text" name="subject" class="box" size="45" value="${getBoard.subject}" required></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">Email</th>
				<td><input type="text" name="email" class="box" size="45" value="${getBoard.email}" required></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">����</th>
				<td><textarea name="content" rows="11" cols="45" class="box">${getBoard.content}</textarea></td>
			</tr>
			<tr>
				<th width="20%" bgcolor="yellow">��й�ȣ</th>
				<td><input type="password" name="passwd" class="box" required></td>
			</tr>
			<tr bgcolor="yellow">
				<td colspan="2" align="center">
					<input type="submit" value="�ۼ���">
					<input type="reset" value="�ٽþ���">
					<input type="button" value="��Ϻ���" onclick="window.location='board_list.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>

<jsp:include page="../../views/common/footer.jsp"/><body>









