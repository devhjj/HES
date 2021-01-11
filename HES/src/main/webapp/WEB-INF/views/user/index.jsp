<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page="user_header.jsp"></jsp:include>
<!-- Content section -->
<section class="py-5">
	<table class="table table-bordered dataTable" width="100%" border="1">
		<tr align=center>
			<td width ="33%">
				<div class="container">
					<h2>진료를 위해</h2>
					<br>
					<h3>오셨나요?</h3>
					<hr color="green">
				</div>
			</td>
			<td width ="33%">
				<div class="container">
					<h2>건강정보가</h2>
					<br>
					<h3>궁금하신가요?</h3>
					<hr color="green">
				</div>
			</td>
				<td>
				<div class="container">
					<h2>병원방문을</h2>
					<br>
					<h3>도와드릴까요?</h3>
					<hr color="green">
				</div>
			</td>
		</tr>
		<tr align=center>
			<td>
				<div class="container">
					<h2><a href ="#">의료진 소개</a></h2>
					<br>
					<p>더 큰 사랑을 실천하는 전문 의료진</p>
					<div class="py-5 bg-image-full"
	style="background-image: url('https://images.unsplash.com/photo-1579684453401-966b11832744?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1368&q=80');">
	<!-- Put anything you want here! There is just a spacer below for demo purposes! -->
	<div style="height: 50px;"></div>
</div>
				</div>
			</td>
			<td>
				<div class="container">
					<h2><a href ="reservation_input.do">진료예약</a></h2>
					<br>
					<p>쉽고 빠른 온라인 진료예약</p>
					<hr color="green">
				</div>
			</td>
			<td>
				<div class="container">
					<h2><a href ="#">진료과안내</a></h2>
					<br>
					<table class="table table-bordered dataTable" width="100%" border="1">
					<tr>
						<td><a href ="#">산부인과</a></td>
						<td><a href ="#">내과</a></td>
					</tr>
					<tr>
						<td><a href ="#">소아과</a></td>
						<td><a href ="#">외과</a></td>
					</tr>
					<hr color="green">
					</table>
				</div>
			</td>
		</tr>
		<tr align=center>
			<td width ="33%">
				<div class="container">
					<h2>여기엔</h2>
					<br>
					<h3>무엇을?</h3>
					<hr color="green">
				</div>
			</td>
			<td width ="33%">
				<div class="container">
					<h2>채우면</h2>
					<br>
					<h3>좋을까요?</h3>
					<hr color="green">
				</div>
			</td>
				<td>
				<div class="container">
					<h2>흐음</h2>
					<br>
					<h3>비뇨기과?</h3>
					<hr color="green">
				</div>
			</td>
		</tr>

	</table>
</section>

<!-- Image element - set the background image for the header in the line below -->
<div class="py-5 bg-image-full"
	style="background-image: url('https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1335&q=80');">
	<!-- Put anything you want here! There is just a spacer below for demo purposes! -->
	<div style="height: 200px;"></div>
</div>

<jsp:include page="../../views/common/footer.jsp"></jsp:include>
