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
		if (document.form1.pid.value != '6'){
			document.form1.purchase_amount.value=0;
			document.form1.payment_amount.value=0;
		}
		document.form1.action="insert.do";
	
		document.form1.submit();
	});	
	
	// 2. 회원 찾기
	$("#btnIDSearch").click(function(){
		var member_name = document.form1.sales_member_name.value;
		var url = '/BioAgency/sales/search.do?name=' + member_name;
		
		window.open(url);
	});
	
	// 3. 상품 선택
	$("#pid").change(function(){
		if (document.form1.pid.value == '6'){
			$("#amountDiv").show();
		} else {
			$("#amountDiv").hide();
		}
	});
});
</script>
<<body>

<%@ include file="../include/menu.jsp" %>

<div class="container-fluid text-center">    
  <div class="row content">
<%@ include file="../include/left.jsp" %>

    <div class="col-sm-8 text-left"> 
<h1  style="text-align: center">
	<small>매출 등록</small>
</h1>				

<p>

  <form name="form1" id="form1" method="get">
  <input type="hidden" name="status" id="status" value="구매">  
    <div class="form-group row">
	    <div class="col-xs-6">
			<label for="name">구매자 이름</label>
			<input type="text" class="form-control" id="purchase_name" name="purchase_name">
		</div>
		<div class="col-xs-6">
		<label for="sel1">상품명 </label>
		 <select class="form-control" id="pid" name="pid">
		   <option value="1">가입금 (3,000,000 원  / 700,000 원)</option>
		   <option value="2">바이오가드 (1,500,000 원 / 500,000 원)</option>
		   <option value="3">힐링타임 (198,000 원 / 60,000 원)</option>
		   <option value="4">코클링 (49,000 원 / 18,000 원)</option>
		   <option value="5">코로로 (20,000 원 / 10,000 원)</option>
		   <option value="6">기타 (직접입력)</option>
		   <option value="7">인상채득비용 ( 0원 / -100,000원)</option>
		 </select>
		</div>
	</div>
	<div class="form-group row" id="amountDiv" style="display:none">
		<div class="col-xs-6">
			<label for="name">구매 금액(원)</label>
			<input type="text" class="form-control" id="purchase_amount" name="purchase_amount">
		</div>
		<div class="col-xs-6">
			<label for="name">수당 금액(원)</label>
			<input type="text" class="form-control" id="payment_amount" name="payment_amount">
		</div>
	</div>
	<div class="form-group row">
	  <div class="col-xs-6">
	    <label for="purchase_date">구매일</label>
<!-- 	    <input type="datetime" class="form-control" id="purchase_date" name="purchase_date">
 -->	    <div class="input-group date">
        <input type="text" class="form-control" id="purchase_date" name="purchase_date"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	  	</div>
	  </div>
	  <div class="col-xs-6">
	    <label for="expected_date">지급 예상일</label>
	    <!-- <input type="datetime" class="form-control" id="expected_date" name="expected_date"> -->
	    <div class="input-group date">
        <input type="text" class="form-control" id="expected_date" name="expected_date"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	  	</div>
	  </div>
	</div>
	<div class="form-group row">
		<div class="col-xs-6">
			<label for="name">회원</label>
			<input type="text" class="form-control" id="sales_member_name" name="sales_member_name">
			<input type="hidden" class="form-control" id="sales_member" name="sales_member">
		</div>
		<div class="col-xs-6">	
			<label for="name">찾기</label><br>
			<button type="button" class="btn" id="btnIDSearch">검색</button>
		</div>
	</div>
	<div class="form-group row">
		<div class="col-xs-6">
			<label for="name">1차 후원자</label>
			<input type="hidden" class="form-control" id="upper_member" name="upper_member">
			<input type="text" class="form-control" id="upper_member_name" name="upper_member_name">
		</div>
	</div>
</form>     
<p  style="text-align: right">    <button type="button" class="btn btn-primary" id="btnRegist">매출 등록</button> </p>							

	</div>
<%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>			