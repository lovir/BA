<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
<%@ include file="../include/header.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			// 태크.val() : 태그에 입력된 값
			// 태크.val("값") : 태그의 값을 변경 
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			if(userId == ""){
				alert("아이디를 입력하세요.");
				$("#userId").focus(); // 입력포커스 이동
				return; // 함수 종료
			}
			if(userPw == ""){
				alert("아이디를 입력하세요.");
				$("#userPw").focus();
				return;
			}
			// 폼 내부의 데이터를 전송할 주소
			document.form1.action="${path}/member/loginCheck.do"
			// 제출
			document.form1.submit();
		});
	});
</script>
</head>
<body>

<%@ include file="../include/menu.jsp" %>

<div class="container-fluid text-center">    
  <div class="row content">
<%@ include file="../include/left.jsp" %>
    <div class="col-sm-8 text-left"> 
				
<h1>
	<small>로그인</small>
</h1>				
<p>
							
	<form name="form1" method="post">
	<div class="form-group row">
    	<div class="col-xs-6">
			<label for="name">아이디</label>
			<input type="text" class="form-control" id="userId" name="userId">
		</div>
		<div class="col-xs-6">
			<label for="name">비밀번호</label>
			<input type="password" class="form-control" id="userPw" name="userPw">
		</div>
	</div>	
	
	<div class="form-group row">
    	<div class="col-xs-6">
			<button type="button" class="btn" onClick="location.href='joinForm.do'">회원가입</button>
		</div>
		<div class="col-xs-6">
			<button type="button" id="btnLogin"  class="btn btn-primary" >로그인</button><br/>
			<c:if test="${msg == 'failure'}">
					<div style="color: red">
						아이디 또는 비밀번호가 일치하지 않습니다.
					</div>
				</c:if>
				<c:if test="${msg == 'request'}">
					<div style="color: red">
						회원 가입 요청 처리중입니다.
					</div>
				</c:if>
				<c:if test="${param.msg == 'nologin'}">
					<div style="color: red">
						로그인 후 사용이 가능합니다.
					</div>
				</c:if>
				<c:if test="${msg == 'logout'}">
					<div style="color: red">
						로그아웃되었습니다.
					</div>
			</c:if>
		</div>
	</div>	
	</form>
	
	</div>
    <%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>