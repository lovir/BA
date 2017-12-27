<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<%@ include file="../include/header.jsp" %>
<script>
	$(document).ready(function(){
		$("#submitMember").click(function(){
			// 태크.val() : 태그에 입력된 값
			// 태크.val("값") : 태그의 값을 변경 
			var pwd_CHECK = $("#pwd_CHECK").val();
			var userPw = $("#userPw").val();
			var userId = $("#userId").val();
			
			if(userPw == ""){
				alert("아이디를 입력하세요.");
				$("#userPw").focus();
				return;
			}
			
			if(userPw == ""){
				alert("암호를 입력하세요.");
				$("#userPw").focus();
				return;
			}
			
			if(userPw != pwd_CHECK){
				alert("암호 확인해주세요");
				$("#userPw").focus(); // 입력포커스 이동
				return; // 함수 종료
			}			
			
			// 제출
			document.form1.submit();
		});
		
		// 2. 회원 찾기
		$("#btnIDSearch").click(function(){
			var member_name = document.form1.upper_member_name.value;
			var url = '/BioAgency/member/search.do?name=' + member_name;
			
			window.open(url);
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
	<small>회원 가입</small>
</h1>				
<p>
							
		<form  name="form1" action="join.do">
        <input type="hidden" name="status" value="요청">
        <div class="form-group row">
	    	<div class="col-xs-6">
				<label for="name">아이디</label>
				<input type="text" class="form-control" id="userId" name="userId">
			</div>
			<div class="col-xs-6">
				<label for="name">이메일</label>
				<input type="text" class="form-control" id="userEmail" name="userEmail">
			</div>
		</div>	
		<div class="form-group row">
	    	<div class="col-xs-6">
				<label for="name">비밀번호</label>
				<input type="password" class="form-control" id="userPw" name="userPw">
			</div>
			<div class="col-xs-6">
				<label for="name">비밀번호 확인</label>
				<input type="password" class="form-control" id="pwd_CHECK" name="pwd_CHECK">
			</div>
		</div>	
		<div class="form-group row">
	    	<div class="col-xs-6">
				<label for="name">가입자 이름</label>
				<input type="text" class="form-control" id="userName" name="userName">
			</div>
			<div class="col-xs-6">
				<label for="name">핸드폰 번호</label>
				<input type="text" class="form-control" id="phone" name="phone">
			</div>
		</div>	
		<div class="form-group row">
	    	<div class="col-xs-6">
				<label for="name">소개자 성명</label>
				<input type="hidden" class="form-control" id="upper_member" name="upper_member" value="${dto.upper_member }">
				<input type="text" class="form-control" id="upper_member_name" name="upper_member_name" value="${dto.upper_member_name }">
			</div>
			<div class="col-xs-6">
				<label for="name">찾기</label><br/>
				<button type="button" class="btn" id="btnIDSearch">검색</button>
			</div>
		</div>	
		
		<button type="button" id="submitMember" class="btn btn-primary">회원 가입 요청</button>
		<button type="reset" class="btn">다시작성</button>
		
        </form>							
							
	</div>
<%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>			