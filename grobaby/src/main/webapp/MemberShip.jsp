<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>grobaby &mdash; 아이들을 위한 공간 :)</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet" href="resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="resources/css/icomoon.css">
<!-- Themify Icons-->
<link rel="stylesheet" href="resources/css/themify-icons.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="resources/css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<!-- Owl Carousel  -->
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">

<!-- Theme style  -->
<link rel="stylesheet" href="resources/css/style.css">

<!-- Modernizr JS -->
<script src="resources/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

<!-- jQuery -->
<script src="resources/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="resources/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="resources/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="resources/js/jquery.waypoints.min.js"></script>
<!-- Carousel -->
<script src="resources/js/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="resources/js/jquery.magnific-popup.min.js"></script>
<script src="resources/js/magnific-popup-options.js"></script>
<!-- Main -->
<script src="resources/js/main.js"></script>

<!-- 주소찾기 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	function searchAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("MADDRESS2").value = extraAddr;

				} else {
					document.getElementById("MADDRESS2").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("MADDRESS").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("MADDRESS1").focus();
			}
		}).open();
	}//searchAddress

	$(function() {
		var idBoolean = false;
		var pwBoolean = false;
		var pwValue = null;

		var spe = /[~!@#$%^&*()_+|<>?:{}]/; //특수문자확인을 위한 변수

		$('#MID').keyup(
				function() { //id 자리수 확인
					if ($(this).val().length < 4 || $(this).val().length > 10) {
						$('.idcheck').html(
								"<font color=red>4자 이상, 10자 이하만 가능합니다</font>")
					} else {
						$('.idcheck').html("")
					}
				})//keyup

		$("#checkID").click(function() {
			$.ajax({
				url : "user/checkID.do",
				data : {
					MID : $("#MID").val()
				},
				success : function(result) {
					if (result == "1" ) {
						console.log(result)
						alert("아이디 중복")
					} else {
						console.log(result)
						alert("아이디 사용가능")
						idBoolean = true;
					}
				}//success
			})//ajax
		})//checkID.click

		$('#MPW').keyup(
				function() { //pw 자리수 확인
					if ($(this).val().length < 6 || $(this).val().length > 10) {
						$('.pwcheck1').html(
								"<font color=red>6자 이상 10자 이하만 가능합니다.</font>")
					} else {
						if (!(spe.test($(this).val()))) { //특수문자입력안했을때
							$('.pwcheck1').html(
									"<font color=red>특수문자를포함해주세요</font>")
						} else {
							$('.pwcheck1').html("")
							pwValue = $(this).val() //pwcheck 와 비교를 위해 해당 값 저장
						}
					}
				})//keyup

		$('#pwcheck').keyup(function() { //pw 와 pwcheck 일치 여부 확인
			if ($(this).val() != pwValue) {
				$('.pwcheck2').html("<font color=red>비밀번호가 일치하지 않습니다.</font>")
			} else {
				$('.pwcheck2').html("")
				pwBoolean = true; // pw와 pwcheck 일치 시 true 저장
			}
		})//keyup

		$('#signUP').click(
				function() { // 유효성검사
					if (idBoolean == false) {
						alert("중복 확인 해주세요")
					} else {
						if (idBoolean == false || pwBoolean == false
								|| $('#MNAME').val().length == 0
								|| $('#MBIRTH').val().length == 0
								|| $('#MTEL').val().length == 0
								|| $('#MADDRESS').val().length == 0
								|| $('#MEMAIL').val().length == 0) {
							alert("빈칸을 확인해주세요")
						} else {
							alert("회원가입이 완료되었습니다.")
							insertForm.submit() // 유효성 검사 완료 후 create.do 호출
							session.removeAttribute("result1");
							session.removeAttribute("result2");
						}
					}

				})//signUP.click
	});//$function
</script>



</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>



	<div class="gtco-services gtco-section">
		<div class="gtco-container">
			<div class="row row-pb-sm">
				<div class="col-md-8 col-md-offset-2 gtco-heading text-center"
					style="width: 800px;">
					<h2>회원가입 : )</h2>
					<div class="membership">
						<form action="user/create.do" name="insertForm" id="insertForm"
							method="post">
							<h4>아이디</h4>
							<div style="width: 800px; margin: 0px auto">
								<input
									style="text-align: center; display: inline-block; width: 500px"
									class="form-control" type="text" name="MID" id="MID"
									placeholder="4~10자리" maxlength="10"
									oninput="this.value = this.value.replace(/[^a-z|A-Z|0-9]/g, '')">
								<button class="btn btn-sm btn-primary" type="button"
									id="checkID" style="display: inline-block">중복확인</button>
							</div>
							<div class="idcheck"></div>
							<br>
							<h4 style="text-align: center">비밀번호</h4>
							<div style="width: 800px">
								<input
									style="text-align: center; display: inline-block; width: 640px"
									class="form-control" type="password" name="MPW" id="MPW"
									placeholder="6~10자리" maxlength="10"
									oninput="this.value = this.value.replace(/[^a-z|A-Z|0-9|~!@#$%^&*()_+|<>?:{}]/g, '')">
							</div>
							<div class="pwcheck1"></div>
							<br>
							<h4 style="text-align: center">비밀번호 확인</h4>
							<div style="width: 800px">
								<input class="form-control"
									style="text-align: center; display: inline-block; width: 640px"
									type="password" name="pwcheck" id="pwcheck"
									placeholder="비밀번호 확인" maxlength="10" maxlength="10"
									oninput="this.value = this.value.replace(/[^a-z|A-Z|0-9|~!@#$%^&*()_+|<>?:{}]/g, '')">
								<div class="pwcheck2"></div>
							</div>
							<br>
							<h4 style="text-align: center">이름</h4>
							<div style="width: 800px">
								<input class="form-control"
									style="text-align: center; display: inline-block; width: 640px"
									type="text" name="MNAME" id="MNAME" placeholder="이름"
									maxlength="4"
									oninput="this.value = this.value.replace(/[^ㄱ-ㅎ|가-힣]/g, '')"
									<c:if test="${result1 ne 'null'}">value=${result1 }</c:if>>
							</div>
							<div class="namecheck"></div>
							<br>
							<h4 style="text-align: center">생년월일</h4>
							<div style="width: 800px">

								<input class="form-control"
									style="text-align: center; display: inline-block; width: 640px"
									type="text" name="MBIRTH" id="MBIRTH"
									placeholder="생년월일  ex) 19980919" maxlength="8"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							</div>
							<br>
							<div style="display: inline-block">
								<h4 style="text-align: center;">주소 &nbsp;&nbsp;&nbsp;&nbsp;</h4>
							</div>
							<button style="display: inline-block"
								class="btn btn-sm btn-primary" type="button"
								onclick="searchAddress()" value="주소 찾기" readonly="readonly">주소찾기</button>
							<div style="width: 800px">
								<!-- <input class="btn btn-sm btn-primary" type="button"
									onclick="searchAddress()" value="주소 찾기" readonly="readonly"><br> -->
								<input class="form-control" style="text-align: center"
									type="text" name="MADDRESS" id="MADDRESS" placeholder="주소"
									readonly="readonly"><br> <input
									class="form-control" style="text-align: center" type="text"
									name="MADDRESS1" id="MADDRESS1" placeholder="상세주소"
									oninput="this.value = this.value.replace(/[^ㄱ-ㅎ|가-힣|0-9|-]/g, '')"><br>
								<input class="form-control" style="text-align: center"
									type="text" name="MADDRESS2" id="MADDRESS2" placeholder="참고항목"
									readonly="readonly"><br>
							</div>
							<h4 style="text-align: center">전화번호</h4>
							<div style="width: 800px">
								<input class="form-control" style="text-align: center"
									type="text" maxlength="11" name="MTEL" id="MTEL"
									placeholder="전화번호 ex) 01012345678"
									oninput="this.value = this.value.replace(/[^0-9]/g, '')" />
							</div>
							<br>
							<h4 style="text-align: center">이메일</h4>
							<div style="width: 800px">
								<input class="form-control" style="text-align: center"
									type="text" maxlength="25" name="MEMAIL" id="MEMAIL"
									placeholder="이메일 ex) abcdef@gamil.com"
									oninput="this.value = this.value.replace(/[^a-z|A-Z|0-9|@.]/g, '')"
									<c:if test="${result2 ne 'null'}">value=${result2 }</c:if>>
							</div>
							<br>
							<button class="btn btn-lg btn-primary" id="signUP" type="button">회원가입</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>