<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!-- content.jsp -->
<jsp:include page="../../views/user/user_header.jsp"/>
<div align="center">
<br><br><br>
	<b>�۳��� ����</b>
	<table class="table table-bordered dataTable" width="70%" border="1">
		<thead>
		<tr align="center">
			<th width="20%">�۹�ȣ</th>
			<td width="30%" align="center">${getBoard.num}</td>
			<th width="20%">��ȸ��</th>
			<td width="30%" align="center">${getBoard.readcount}</td>
		</tr>
		<tr>
			<th width="20%">�ۼ���</th>
			<td width="30%" align="center">${getBoard.writer}</td>
			<th width="20%">�ۼ���</th>
			<td width="30%" align="center">${getBoard.reg_date}</td>
		</tr>
		<tr>
			<th width="20%">������</th>
			<td width="80%" align="center" colspan="3">${getBoard.subject}</td>
		</tr>
		<tr>
			<th   width="20%">�۳���</th>
			<td width="80%" align="center" colspan="3">${getBoard.content}</td>
		</tr>
		<tr>
			<td width="80%" align="right" colspan="4">
				<input type="button" value="��۾���" 
				onclick="window.location='board_writeForm.do?num=${getBoard.num}&re_step=${getBoard.re_step}&re_level=${getBoard.re_level}'">
				<input type="button" value="�ۼ���" onclick="window.location='board_update.do?num=${getBoard.num}'">
				<input type="button" value="�ۻ���" onclick="window.location='board_delete.do?num=${getBoard.num}'">
				<input type="button" value="�۸��" onclick="window.location='board_list.do'">
			</td>
		</tr>
	</table>
</div>


<jsp:include page="../../views/common/footer.jsp"/>








