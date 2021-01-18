<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:include page="../../views/user/user_header.jsp"/>
<body>	
<div align="center">
	<b>글삭제</b>
	<form name="f" action="board_delete.do" method="post">
		<input type="hidden" name="num" value="${param.num}"/>
		<table class="table table-bordered dataTable" width="70%" border="1">
		<thead>
		<tr align="center">
				<th>비밀번호를 입력해 주세요</th>			
			</tr>
			<tr>
				<td align="center">비밀번호 : 
					<input type="password" name="passwd" class="box">
				</td>
			</tr>
			<tr align="center">
				<td align="center">
					<input type="submit" value="글삭제">
					<input type="button" value="글목록" onclick="window.location='board_list.do'">
				</td> 
			</tr>
	 	</table>
	</form>
</div>
</body>

<jsp:include page="../../views/common/footer.jsp"/>