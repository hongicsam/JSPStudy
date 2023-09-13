<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>
$(function() {
	// 두번쨰 로그인 버튼을 누르면 서버로 비동기 요청을 한다.
	$('#btnLogin2').click(function() {
		// 요청할 서버의 URL(요청명)
		var s_url = "../realproject/PostLogin.do";
		/* JQuery의 Ajax관련 함수의 파라미터는 JSON 형태로 조립한 후 서버로 전송한다.
		이때 <form> 태그 하위의 모든 폼값을 한꺼번에 JSON으로 만들고 싶다면 serialize() 함수를 사용하면 된다. */
		var s_params = $('#loginFrm').serialize();
		console.log("폼값", s_params);
		// post방식으로 서버로 요청한다.
		$.post(
			s_url,
			s_params,
			// 콜백함수 정의(콜백된 데이터는 resData로 전달된다.)
			function(resData) {
				/* 
				$.ajax() 함수는 콜백데이터의 형식을 지정할 수 있지만
				$.post() 함수는 형식을 지정할 수 없어 무조건 text형식으로만 콜백받을 수 있다.
				따라서 JSON데이터를 콜백 받았다면 파싱(Parsing)을 위해 JSON.parse() 함수를 먼저 실행한 후 진행해야한다.
				*/
				var d = JSON.parse(resData);
				if(d.result==1){
					// 로그인에 성공한 경우
					console.log(d.message);
					// 콜백받은 HTML태그를 해당 위치에 삽입한다.
					$('#loginFrm').html(d.html);
					// 로그인 버튼은 숨김처리한다.
					$('#btnLogin2').hide();
					// 성공메세지를 알림창으로 출력한다.
					alert(d.message);
				}else{
					alert(d.message);
				}
			}
		);
	});
	
	// $.ajax() 함수로 구현하기
	$('#btnLogin3').click(function() {
		$.ajax({
			url : "../realproject/PostLogin.do",
			type : "post",
			data : $('#loginFrm').serialize(),
			dataType : "json",
			success : function (d) {
				console.log(d);
				if(d.result==1){
					console.log(d.message);
					$('#loginFrm').html(d.html);
					$('#btnLogin3').hide();
					alert(d.message);
				}else{
					alert(d.message);
				}
			},
			error : function (e) {
				alert("실패: " + e.status);
			}
		});
	});
});

/* function checkFrm() {
	var f = document.getElementById("loginFrm");
	f.method = "post";
	f.action = "../realproject/PostLogin.do";
} */
</script>
</head>
<body>
<div class="container">
	<h2>$.post() : 비동기 로그인 구현하기</h2>
	<div class="row" id="loginTable">
		<form id="loginFrm" method="post" action="../realproject/PostLogin.do">
			<table class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="user_id" value="" />
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td>
						<input type="password" name="user_pw" value="" />
					</td>
				</tr>
			</table>
			<div>
				<button type="submit" class="btn btn-danger" id="btnLogin1">
					로그인하기(HTML의submit사용)</button>				
				<button type="button" class="btn btn-success" id="btnLogin2">
					로그인하기(jQuery의 $.post()사용)</button>
				<!-- 연습문제] $.ajax() 함수로 동일하게 구현하시오. -->
				<button type="button" class="btn btn-primary" id="btnLogin3">
					로그인하기(jQuery의 $.ajax()사용)</button>
			</div>						 
		</form>
	</div> 
</div>	
</body>
</html>