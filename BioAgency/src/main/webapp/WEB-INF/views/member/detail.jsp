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
		
		// 5. 회원 찾기
		$("#btnIDSearch").click(function(){
			var member_name = document.form1.upper_member_name.value;
			var url = '/BioAgency/member/search.do?name=' + member_name;
			
			window.open(url);
		});
		
		// 6. 하위 회원 리스트
		$("#subMemberList").click(function(){
			var userid = document.form1.userId.value;
			var url = '/BioAgency/member/subMemberList.do?userid=' + userid;
			
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
	<small>회원 정보 보기</small>
</h1>				
<p>

  <form name="form1" id="form1" method="get">
  <input type="hidden" name="status" id="status" value="${dto.status }">  
    <div class="form-group row">
    	<div class="col-xs-6">
			<label for="name">가입자 이름</label>
			<input type="text" class="form-control" id="userName" name="userName" value="${dto.userName }">
		</div>
		<div class="col-xs-6">
			<label for="name">생년 월일</label>
			<!-- <input type="text" class="form-control" id="birthdate" name="birthdate" value="${dto.birthdate }"> -->
			<div class="input-group date">
	        <input type="text" class="form-control" id="birthdate" name="birthdate" value="${dto.birthdate }"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		  	</div>
		</div>
	</div>	
	<div class="form-group row">
    	<div class="col-xs-6">
			<label for="name">전화번호</label>
			<input type="text" class="form-control" id="phone" name="phone" value="${dto.phone }">
		</div>
		<div class="col-xs-6">
			<label for="name">아이디</label>
			<input type="text" class="form-control" readonly="readonly" id="userId" name="userId" value="${dto.userId }">
		</div>
	</div>	
	<div class="form-group row">
    	<div class="col-xs-6">
			<label for="name">이메일</label>
			<input type="text" class="form-control" id="userEmail" name="userEmail" value="${dto.userEmail }">
		</div>
		<div class="col-xs-6">
			<label for="name">계좌번호</label>
			<input type="text" class="form-control" id="account" name="account" value="${dto.account }">		
		</div>
	</div>	
	<div class="form-group">
	<label for="name">주소</label>
	<input type="text" class="form-control" id="address" name="address" value="${dto.address }">
	</div>
	<div class="form-group row">
		<div class="col-xs-6">
			<label for="name">상위 B.A 후원자</label>
			<input type="hidden" class="form-control" id="upper_member" name="upper_member" value="${dto.upper_member }">
			<input type="text" class="form-control" id="upper_member_name" name="upper_member_name" value="${dto.upper_member_name }">
		</div>
		<div class="col-xs-6">	
			<label for="name">찾기</label><br/>
			<input type="button" class="btn" id="btnIDSearch" value="검색">
		</div>
	</div>  	
	<div class="form-group row">
    	<div class="col-xs-6">
			<label for="name">계약 시작일</label>
			<!-- <input type="text" class="form-control" id="contract_sdate" name="contract_sdate" value="${dto.contract_sdate }"> -->
			<div class="input-group date">
	        <input type="text" class="form-control" id="contract_sdate" name="contract_sdate" value="${dto.contract_sdate }"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		  	</div>
		</div>
		<div class="col-xs-6">
			<label for="name">관리 B.A </label> : 
			<a href="#" id="subMemberList">${dto.sub_member_cnt} 명</a>
		</div>
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
    <%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>