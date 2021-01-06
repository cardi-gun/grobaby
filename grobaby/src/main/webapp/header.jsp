<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,700"
	rel="stylesheet">
<!-- Animate.css -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/animate.css"/>">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="<c:url value="/resources/css/icomoon.css"/>">
<!-- Themify Icons-->
<link rel="stylesheet"
	href="<c:url value="/resources/css/themify-icons.css"/>">
<!-- Bootstrap  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css"/>">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/magnific-popup.css"/>">
<!-- Owl Carousel  -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.carousel.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/owl.theme.default.min.css"/>">
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
<script
	src="<c:url value="/resources/js/jquery.magnific-popup.min.js"/>"></script>
<script src="<c:url value="/resources/js/magnific-popup-options.js"/>"></script>
<!-- Main -->
<script src="<c:url value="/resources/js/main.js"/>"></script>

<script type="text/javascript">

	$(function() {
		$('#logout').click(function() {
			$.ajax({
				url :"SessionRemove.do",
				success : function(result){
		          	  location.reload(); 
				}
			})//ajax
		})
	})

	</script>

</head>
<body>
	<div class="gtco-loader"></div>

	<div id="page">

		<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">

				<div class="row">
					<div class="col-sm-2 col-xs-12">
						<div id="gtco-logo">
							<a href="<c:url value="/Home.jsp"/>"> <img
								src="<c:url value="/resources/images/logo.png"/>">
							</a>
						</div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<li class="active"><a href="<c:url value="/Home.jsp"/>">Home</a></li>
							<!-- <li><a href="about.html">About</a></li> -->
							<li class="has-dropdown"><a
								href="<c:url value="/Home.jsp"/>">제품</a>
								<ul class="dropdown">
									<li><a href="#">젖병</a></li>
									<li><a href="#">욕조</a></li>
									<li><a href="#">쿠션</a></li>
									<!-- <li><a href="#">카테고리 4</a></li> -->
								</ul></li>
							<%
								if (MID == null) {
							%>
							<li class="has-dropdown"><a href="#">게시판</a>
								<ul class="dropdown">
									<li><a href="board/Board.do">육아 게시판</a></li>
									<!-- <li><a href="#">CSS3</a></li>
									<li><a href="#">Sass</a></li>
									<li><a href="#">jQuery</a></li> -->
								</ul></li>

							<li><a href="<c:url value="/Login.jsp"/>">로그인</a></li>
							<li><a href="<c:url value="/MemberShip.jsp"/>">회원가입</a></li>
							<%
								} else {
							%>
							<li class="has-dropdown"><a href="#">게시판</a>
								<ul class="dropdown">
									<li><a href="../board/Board.do">육아 게시판</a></li>
									<!-- <li><a href="#">CSS3</a></li>
									<li><a href="#">Sass</a></li>
									<li><a href="#">jQuery</a></li> -->
								</ul></li>
							<li>환영합니다. <%=MID%>님
							</li>
							<li><button id="logout">로그아웃</button></li>
							<%
								}
							%>
						</ul>
					</div>
				</div>

			</div>
		</nav>
		<!-- 헤더 경계선 -->
		<header id="gtco-header" class="gtco-cover" role="banner"
			style="height: 100px"> </header>
</body>
</html>