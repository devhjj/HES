<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../views/common/header.jsp"></jsp:include>
<div class="py-5" align="center">
	<form action ="login.do"  method ="post">
		<table class="table table-bordered dataTable" width="100%" border="1">
			<tr align=center>
				<th colspan="2">�α���</th>
			</tr>
			<tr>
				<th>���̵�</th>
				<td><input type="text" placeholder ="ID" name="id" maxlength="20" required></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" placeholder ="password" name="passwd" maxlength="20" required></td>
			</tr>
			<tr align=center>
				<td colspan="2"><input type="submit" value="�α���"></td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="../../views/common/footer.jsp"></jsp:include>