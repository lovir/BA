<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매출 상세 보기</title>
<%@ include file="../include/header.jsp" %>
<script>
$(document).ready(function(){
	
	if (document.form1.pid.value == '6'){
		$("#amountDiv").show();
	}
	
	// 1.  수정
	$("#btnUpdete").click(function(){
		/* var purchase_amount = $("#purchase_amount").val();
		if(purchase_amount == ""){
			alert("구매금액 입력하세요");
			document.form1.purchase_amount.focus();
			return;
		} */
		document.form1.action="update.do";
		document.form1.submit();
	});
	
	// 2. 삭제
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action = "delete.do";
			document.form1.submit();
		}
	});
	
	// 3. 환불
	$("#btnRefund").click(function(){
		document.form1.action="update.do";
		document.form1.status.value="환불";
		// 폼에 입력한 데이터를 서버로 전송
		document.form1.submit();
	});
	
	// 4. 회원 찾기
	$("#btnIDSearch").click(function(){
		var member_name = document.form1.sales_member_name.value;
		var url = '/BioAgency/sales/search.do?name=' + member_name;
		
		window.open(url);
	});
	
	// 5. 상품 선택
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
	<small>매출 상세 보기</small>
</h1>				

<p>

  <form name="form1" id="form1" method="get">
  <input type="hidden" name="seq" id="seq" value="${dto.seq }">  
    <div class="form-group row">
     	<div class="col-xs-6">
			<label for="name">구매자 이름</label>
			<input type="text" class="form-control" id="purchase_name" name="purchase_name" value="${dto.purchase_name }">
		</div>
		<div class="col-xs-6">
		<label for="sel1">상품명 </label>
		 <select class="form-control" id="pid" name="pid">
		   <option value="1" <c:choose><c:when test="${dto.pid == '1'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>가입금</option>
		   <option value="2" <c:choose><c:when test="${dto.pid == '2'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>바이오가드</option>
		   <option value="3" <c:choose><c:when test="${dto.pid == '3'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>힐링타임</option>
		   <option value="4" <c:choose><c:when test="${dto.pid == '4'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>코클링</option>
		   <option value="5" <c:choose><c:when test="${dto.pid == '5'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>코로로</option>
		   <option value="6" <c:choose><c:when test="${dto.pid == '6'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>기타</option>
		   <option value="7" <c:choose><c:when test="${dto.pid == '7'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>인상채득비용</option>	
		 </select>
		</div>
	</div>
	<div class="form-group row" id="amountDiv" style="display:none">
		<div class="col-xs-6">
			<label for="name">구매 금액(원)</label>
			<input type="text" class="form-control" id="purchase_amount" name="purchase_amount" value="${dto.purchase_amount }">
		</div>
		<div class="col-xs-6">
			<label for="name">수당 금액(원)</label>
			<input type="text" class="form-control" id="payment_amount" name="payment_amount" value="${dto.payment_amount }">
		</div>
	</div>
	<div class="form-group row">
	  <div class="col-xs-6">
	    <label for="purchase_date">구매일</label>
	    <!-- <input type="datetime" class="form-control" id="purchase_date" name="purchase_date" value="${dto.purchase_date}"> -->
	     <div class="input-group date">
        <input type="text" class="form-control" id="purchase_date" name="purchase_date" value="${dto.purchase_date}"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	  	</div>
	  </div>
	  <div class="col-xs-6">
	    <label for="expected_date">지급 예상일</label>
	    <!--<input type="datetime" class="form-control" id="expected_date" name="expected_date" value="${dto.expected_date}">  -->
	    <div class="input-group date">
        <input type="text" class="form-control" id="expected_date" name="expected_date" value="${dto.expected_date}"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
	  	</div>
	  </div>
	</div>	
	<div class="form-group row">
		<div class="col-xs-6">
			<label for="name">회원</label>
			<input type="text" class="form-control" id="sales_member_name" name="sales_member_name" value="${dto.sales_member_name }">
			<input type="hidden" class="form-control" id="sales_member" name="sales_member" value="${dto.sales_member }">
		</div>
		<div class="col-xs-6">	
			<label for="name">찾기</label><br>
			<input type="button" class="btn" id="btnIDSearch" value="검색">
		</div>
	</div>
	<div class="form-group row">
		<div class="col-xs-6">
			<label for="name">1차 후원자</label>
			<input type="hidden" class="form-control" id="upper_member" name="upper_member" value="${dto.upper_member}">
			<input type="text" class="form-control" id="upper_member_name" name="upper_member_name" value="${dto.upper_member_name}">
		</div>
		<div class="col-xs-6">
		<label for="status">구매상태 </label>
		 <select class="form-control" id="status" name="status">
		   <option value="구매" <c:choose><c:when test="${dto.status == '구매'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>구매</option>
		   <option value="환불" <c:choose><c:when test="${dto.status == '환불'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>환불</option>
		   <option value="수당지급" <c:choose><c:when test="${dto.status == '수당지급'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>수당지급</option>
		 </select>
		</div>
	</div>	
</form>     
<p  style="text-align: center">  
    <button type="button" class="btn btn-primary" id="btnUpdete">매출 수정</button> 
    <button type="button" class="btn btn-danger" id="btnDelete">매출 삭제</button>
</p>							


	</div>
<%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>						