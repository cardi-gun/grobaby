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

<script type="text/javascript">
	$(function() {
		
		mID = '<%=session.getAttribute("MID")%>'
		postID = '${result.MID}' 
		BCODE = '${result.BCODE}'
		
		$('#update').click(function() {
			if(mID != postID){
				alert('해당 권한이 없습니다.')
			}else if(mID == postID){
				alert('수정 하기로 넘어갑니다.')
				location.href = "/mvc00/board/UpdateFormat.do?BCODE="+BCODE;
			}
		})//update
		
		$('#delete').click(function() {
			if(mID != postID){
				alert('해당 권한이 없습니다.')
			}else{
				alert('삭제합니다.')
				location.href = "/mvc00/board/delete.do?BCODE="+BCODE;
			}
			
		})//delete
	})
</script>
</head>
<body>
	<jsp:include page="../../../header.jsp"></jsp:include>
	<div style="width: 1000px; margin: 0px auto;">
		<br>
		<h2>게시글 상세 : )</h2>
		<br>
		<div style="width: 1000px">
			<div style="display: inline-block; width: 140px">번호 :</div>
			<div style="display: inline-block; width: 190px" name="BCODE" id="BCODE">${result.BCODE}</div>
			<div style="display: inline-block; width: 140px">제목 :</div>
			<div style="display: inline-block; width: 490px" name="BTITLE" id="BTITLE">${result.BTITLE}</div>
		</div>
		<br>
		<div style="width: 1000px">
			<div style="display: inline-block; width: 140px">작성자 :</div>
			<div style="display: inline-block; width: 290px" name="MID" id="MID">${result.MID}</div>
			<div style="display: inline-block; width: 190px">작성일자 :</div>
			<div style="display: inline-block; width: 340px" name="BDATE" id="BDATE">${result.BDATE}</div>
		</div>
		<br>
		<div style="width: 1000px; height: 400px">
			<div style="display: inline-block; width: 190px">내용 :</div>
			<div style="display: inline-block; width: 790px; height: 400px; " name="BCONTENT" id="BCONTENT">${result.BCONTENT}</div>
		</div>
		<br>
		<button id="update">수정</button>
		<button id="delete">삭제</button>
	</div>
	<jsp:include page="../../../footer.jsp"></jsp:include>
</body>
</html>