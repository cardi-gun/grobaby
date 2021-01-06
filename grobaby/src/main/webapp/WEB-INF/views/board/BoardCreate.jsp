<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 테그 라이브러리 생성, prefix(접두사)="고정이름" uri="주소형 아이디" -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//user 로그인 세션
	String MID = (String) session.getAttribute("MID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>grobaby &mdash; 아이들을 위한 공간 :)</title>

<link href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,700" rel="stylesheet">
<!-- Animate.css -->
<link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="<c:url value="/resources/css/icomoon.css"/>">
<!-- Themify Icons-->
<link rel="stylesheet" href="<c:url value="/resources/css/themify-icons.css"/>">
<!-- Bootstrap  -->
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>">
<!-- Magnific Popup -->
<link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>">
<!-- Owl Carousel  -->
<link rel="stylesheet" href="<c:url value="/resources/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
<!-- Theme style  -->
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
<!-- Modernizr JS -->
<script src="<c:url value="/resources/js/modernizr-2.6.2.min.js"/>"></script>
<!-- jQuery -->
<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<!-- jQuery Easing -->
<script src="<c:url value="/resources/js/jquery.easing.1.3.js"/>"></script>
<!-- Bootstrap -->
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<!-- Waypoints -->
<script src="<c:url value="/resources/js/jquery.waypoints.min.js"/>"></script>
<!-- Carousel -->
<script src="<c:url value="/resources/js/owl.carousel.min.js"/>"></script>
<!-- Magnific Popup -->
<script src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
<script src="<c:url value="/resources/js/magnific-popup-options.js"/>"></script>
<!-- Main -->
<script src="<c:url value="/resources/js/main.js"/>"></script>

<script type="text/javascript">
	$(function() {
		$(document).ready(function(){
			mID = '<%=session.getAttribute("MID")%>' 
				document.getElementById("MID").value = mID;
			});
		$('#create').click(
				function() {
					if ($('#BTITLE').val().length == 0
							|| $('#BCONTENT').val().length == 0) {
						alert("빈칸을 확인해주세요")
					} else {
						alert($('#MID').val()+"님의 글이 작성되었습니다.")
						insertForm.submit()
					}
				})//create.click
	})//function
</script>
</head>
<body>
	<jsp:include page="../../../header.jsp"></jsp:include>
	<div style="width: 1000px; margin: 0px auto;">
		<br>
		<h2>글쓰기 : )</h2>
		<form action="create.do" name="insertForm" id="insertForm"
			method="post">
			<h4>제목</h4>
			<div style="width: 800px">
				<input class="form-control"
					style="text-align: center; display: inline-block; width: 800px"
					type="text" name="BTITLE" id="BTITLE" placeholder="제목을 써주세요"
					maxlength="20">
			</div>
			<br>
			<h4>작성자</h4>
			<div style="width: 800px">
				<input class="form-control" style="text-align: center" type="text"
					maxlength="20" name="MID" id="MID" readonly="readonly"
					placeholder="${MID}">
			</div>
			<br>
			<h4>내용</h4>
			<div style="width: 800px; height: 400px">
				<textarea style="text-align: left; height: 400px; width: 800px"
					name="BCONTENT" id="BCONTENT" placeholder="내용을 써주세요"
					maxlength="200"></textarea>
			</div>
			<br>
			<button class="btn btn-lg btn-primary" id="create" type="button">작성하기</button>
		</form>
	</div>
	<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>