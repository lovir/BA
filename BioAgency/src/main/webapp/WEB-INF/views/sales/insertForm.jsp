<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매출 등록</title>
<%@ include file="../include/header.jsp" %>
<script>
$(document).ready(function(){
	
	// 1.  등록
	$("#btnRegist").click(function(){
		var sales_member = $("#sales_member").val();
		if(sales_member == ""){
			alert("회원 ID를 입력하세요");
			document.form1.sales_member.focus();
			return;
		}
		document.form1.action="insert.do";
		
		document.form1.submit();
	});	
});
</script>
<<body>

<%@ include file="../include/menu.jsp" %>

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-8 text-left"> 
<h1  style="text-align: center">
	<small>매출 등록</small>
</h1>				

<p>

  <form name="form1" id="form1" method="get">
  <input type="hidden" name="status" id="status" value="구매">  
    <div class="form-group">
	<label for="name">구매자 이름</label>
	<input type="text" class="form-control" id="purchase_name" name="purchase_name">
	</div>
	<div class="form-group">
	<label for="sel1">상품명 </label>
	 <select class="form-control" id="pid" name="pid">
	   <option value="1">가입금</option>
	   <option value="2">바이오가드</option>
	   <option value="3">힐링타임</option>
	   <option value="4">코클링</option>
	   <option value="5">코로로</option>
	   <option value="6">기타</option>
	 </select>
	</div>
	<!-- <div class="form-group">
	<label for="name">구매 금액(원)</label>
	<input type="text" class="form-control" id="purchase_amount" name="purchase_amount">
	</div> -->
	<div class="form-group">
	<label for="name">구매일</label>
	<input type="datetime" class="form-control" id="purchase_date" name="purchase_date">
	<label for="name">지급 예상일</label>
	<input type="datetime" class="form-control" id="expected_date" name="expected_date">
	</div>
	<div class="form-group row">
		<div class="col-xs-8">
			<label for="name">회원</label>
			<input type="text" class="form-control" id="sales_member" name="sales_member">
		</div>
		<div class="col-xs-4">	
			<label for="name">찾기</label>
			<input type="button" class="btn" id="btnIDSearch" value="검색">
		</div>
	</div>	
	<div class="form-group">
	<label for="name">1차 후원자</label>
	<input type="text" class="form-control" id="upper_member" name="upper_member">
	</div>
</form>     
<p  style="text-align: right">    <button type="button" class="btn btn-primary" id="btnRegist">매출 등록</button> </p>							

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