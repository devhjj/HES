<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writeForm.jsp -->

<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert("이름을 입력해 주세요!!")
			f.writer.focus()
			return false
		}
		if (f.subject.value==""){
			alert("제목을 입력해 주세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<jsp:include page="../../views/user/user_header.jsp"/>
<body>
<div align="center">
	<form name="f" action="board_write.do" method="post"
													onsubmit="return check()">
		<input type="hidden" name="num" value="${param.num}" />		
		<input type="hidden" name="re_step" value="${param.re_step}" />	
		<input type="hidden" name="re_level" value="${param.re_level}" />												
		<table class="table table-bordered dataTable" width="70%" border="1">
			<thead>
		<tr align="center">
				<td align="center" colspan="2">글 쓰 기</td>
			</tr>
			<tr>
				<th width="20%"  >이름</th>
				<td><input type="text" name="writer" class="box"></td>
			</tr>
			<tr>
				<th width="20%"  >제목</th>
				<td><input type="text" name="subject" class="box" size="45"></td>
			</tr>
			<tr>
				<th width="20%"  >Email</th>
				<td><input type="text" name="email" class="box" size="45"></td>
			</tr>
			<tr>
				<th width="20%"  >내용</th>
				<td><textarea name="content" rows="11" cols="45" class="box"></textarea></td>
			</tr>
			<tr>
				<th width="20%"  >비밀번호</th>
				<td><input type="text" name="passwd" class="box"></td>
			</tr>
			<tr  >
				<td colspan="2" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시쓰기">
					<input type="button" value="목록보기" onclick="window.location='board_list.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
<jsp:include page="../../views/common/footer.jsp"/>