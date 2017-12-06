<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 보기</title>
<%@ include file="../include/header.jsp" %>
<script>
	$(document).ready(function(){
		
		// 1.  수정
		$("#btnUpdete").click(function(){
			/* var title = document.form1.title.value; ==> name속성으로 처리할 경우
			var content = document.form1.content.value;
			var writer = document.form1.writer.value; */
			var phone = $("#phone").val();
			//var content = $("#content").val();
			//var writer = $("#writer").val();
			if(phone == ""){
				alert("전화번호 입력하세요");
				document.form1.phone.focus();
				return;
			}
			/* if(content == ""){
				alert("내용을 입력하세요");
				document.form1.content.focus();
				return;
			} */
			/* if(writer == ""){
				alert("이름을 입력하세요");
				document.form1.writer.focus();
				return;
			} */
			document.form1.action="update.do";
			
			/* // 첨부파일 이름을 form에 추가
			var that = $("#form1");
			var str = "";
			// 태그들.each(함수)
			// id가 uploadedList인 태그 내부에 있는 hidden태그들
			$("#uploadedList .file").each(function(i){
				str += "<input type='hidden' name='files["+i+"]' value='"+$(this).val()+"'>";
			});
			// form에 hidden태그들을 추가
			$("#form1").append(str);
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
			 */
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
		
		// 2. 삭제
		$("#btnDelete").click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.form1.action = "delete.do";
				document.form1.submit();
			}
		});
		
		// 3. 승인
		$("#btnAgree").click(function(){
			document.form1.action="update.do";
			document.form1.status.value="회원";
			//alert(document.form1.status.value);
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
		
		// 4. 거절
		$("#btnDeny").click(function(){
			document.form1.action="update.do";
			document.form1.status.value="거절";
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
		
	});
</script>
</head>

<body>

<%@ include file="../include/menu.jsp" %>

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-8 text-left"> 
				
<h1>
	<small>회원 정보 보기</small>
</h1>				
<p>

  <form name="form1" id="form1" method="get">
  <input type="hidden" name="status" id="status" value="${dto.status }">  
    <div class="form-group">
	<label for="name">가입자 이름</label>
	<input type="text" class="form-control" id="userName" name="userName" value="${dto.userName }">
	</div>
	<div class="form-group">
	<label for="name">생년월일</label>
	<input type="text" class="form-control" id="birthdate" name="birthdate" value="${dto.birthdate }">
	</div>
	<div class="form-group">
	<label for="name">전화번호</label>
	<input type="text" class="form-control" id="phone" name="phone" value="${dto.phone }">
	</div>
	<div class="form-group">
	<label for="name">아이디</label>
	<input type="text" class="form-control" readonly="readonly" id="userId" name="userId" value="${dto.userId }">
	</div>
	<div class="form-group">
	<label for="name">이메일</label>
	<input type="text" class="form-control" id="userEmail" name="userEmail" value="${dto.userEmail }">
	</div>
	<div class="form-group">
	<label for="name">주소</label>
	<input type="text" class="form-control" id="address" name="address" value="${dto.address }">
	</div>
	<div class="form-group">
	<label for="name">계좌번호</label>
	<input type="text" class="form-control" id="account" name="account" value="${dto.account }">
	</div>
	<div class="form-group">
	<label for="name">상위 B.A 후원자</label>
	<input type="text" class="form-control" id="upper_member" name="upper_member" value="${dto.upper_member }">
	</div>
	<div class="form-group">
	<label for="name">계약 시작일</label>
	<input type="text" class="form-control" id="contract_sdate" name="contract_sdate" value="${dto.contract_sdate }">
	</div>
	<div class="form-group">
	<label for="name">관리 B.A </label>
	
	</div>
    <c:choose>
	    <c:when test="${dto.status == '요청'}">
	    <button type="button" class="btn btn-success" id="btnAgree">가입 승인</button>
	    <button type="button" class="btn btn-warning" id="btnDeny">가입 거절</button>
	    </c:when>
	<c:otherwise>
	  <button type="button" class="btn btn-primary" id="btnUpdete">회원 수정</button>
	  <button type="button" class="btn btn-danger" id="btnDelete">회원 삭제</button>
	</c:otherwise>
    </c:choose>
</form>     

    
    
  	</div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>