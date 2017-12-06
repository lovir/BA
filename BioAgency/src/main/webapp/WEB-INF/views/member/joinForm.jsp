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
<div class="container-fluid">
<%@ include file="../include/menu.jsp" %>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">회원 가입</div>
					<div class="panel-body">
						<div class="form-inline">
							<div class="row">
							
		<form action="join.do">
        <input type="hidden" name="uppder_member">
        <input type="hidden" name="status" value="요청">
            <table class="table table-striped">
                <tr>
                    <td>이메일</td>
                    <td><input type="text" name="userId" ></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="userPw"></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="pwd_CHECK" ></td>
                </tr>
                <tr>
                    <td>가입자 이름</td>
                    <td><input type="text" name="userName" ></td>
                </tr>
                <tr>
                    <td>핸드폰 번호</td>
                    <td><input type="text" name="phone" ></td>
                </tr>
                <tr>
                    <td>소개자 성명</td>
                    <td><input type="text" name="upper_name" > <input type="button" name="search" value="검색">
                    </td>
                </tr>
 
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="회원 가입 요청"><input type="reset" value="다시작성"></td>
                </tr>
            </table> 
        </form>							
							
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>	
</body>
</html>							