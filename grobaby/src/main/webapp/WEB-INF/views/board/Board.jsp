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

</head>
<body>
	<script type="text/javascript">
		$(function() {
			mID = null;
			
			if(<%=MID != null%>){
				mID = '<%=session.getAttribute("MID")%>' 
			}
			
			$("#create").click(function(){
				if(mID != null){
					location.href ="/mvc00/board/BoardCreate.do?MID="+mID;
				}else{
					alert("회원 가입을 해주세요")
					location.href ="/mvc00/MemberShip.jsp"
				}
				
			})//create.click
			
			$('.post').click(function() { 
				//글 클릭했을때
				BCODE = $(this).attr('id')
				location.href = "/mvc00/board/BoardOne.do?BCODE="+BCODE;
			})//post.click
			
		})//function
	</script>
	<jsp:include page="../../../header.jsp"></jsp:include>

	<!-- 반복문 해당 게시판 출력 -->
	<div style="width: 1000px; margin: 0px auto;">
		<h2>게시판 : )</h2>
		<button id="create">글쓰기</button>
		<br>
		<table>
			<tr>
				<th width="100px" align="center">번호</th>
				<th width="450px" align="center">제목</th>
				<th width="150px" align="center">작성자</th>
				<th width="300px" align="center">작성시간</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<c:set var="i" value="${i+1}" />
				<tr height="50px" class="post" id="${vo.BCODE}">
					<td>${vo.BCODE}</td>
					<td class="title" id="${vo.BCODE}">${vo.BTITLE}</td>
					<td>${vo.MID}</td>
					<td>${vo.BDATE}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<jsp:include page="../../../footer.jsp"></jsp:include>


</body>
</html>