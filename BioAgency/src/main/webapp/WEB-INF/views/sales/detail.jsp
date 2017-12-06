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
	
	// 1.  수정
	$("#btnUpdete").click(function(){
		var purchase_amount = $("#purchase_amount").val();
		if(purchase_amount == ""){
			alert("구매금액 입력하세요");
			document.form1.purchase_amount.focus();
			return;
		}
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
<h1  style="text-align: center">>
	<small>매출 상세 보기</small>
</h1>				

<p>

  <form name="form1" id="form1" method="get">
  <input type="hidden" name="seq" id="seq" value="${dto.seq }">  
    <div class="form-group">
	<label for="name">구매자 이름</label>
	<input type="text" class="form-control" id="purchase_name" name="purchase_name" value="${dto.purchase_name }">
	</div>
	<div class="form-group">
	<label for="sel1">상품명 </label>
	 <select class="form-control" id="pid" name="pid">
	   <option value="1" <c:choose><c:when test="${dto.pid == '1'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>가입금</option>
	   <option value="2" <c:choose><c:when test="${dto.pid == '2'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>바이오가드</option>
	   <option value="3" <c:choose><c:when test="${dto.pid == '3'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>힐링타임</option>
	   <option value="4" <c:choose><c:when test="${dto.pid == '4'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>코클링</option>
	 </select>
	</div>
	<div class="form-group">
	<label for="name">구매 금액(원)</label>
	<input type="text" class="form-control" id="purchase_amount" name="purchase_amount" value="${dto.purchase_amount}">
	</div>
	<div class="form-group row">
	  <div class="col-xs-6">
	    <label for="purchase_date">구매일</label>
	    <input type="datetime" class="form-control" id="purchase_date" name="purchase_date" value="${dto.purchase_date}">
	  </div>
	  <div class="col-xs-6">
	    <label for="expected_date">지급 예상일</label>
	    <input type="datetime" class="form-control" id="expected_date" name="expected_date" value="${dto.expected_date}">
	  </div>
	</div>	
	<div class="form-group row">
		<div class="col-xs-8">
			<label for="name">회원 찾기</label>
			<input type="text" class="form-control" id="sales_member" name="sales_member" value="${dto.sales_member}">
		</div>
		<div class="col-xs-4">	
			<input type="button" class="btn" id="btnIDSearch" value="검색">
		</div>
	</div>
	<div class="form-group">
	<label for="name">1차 후원자</label>
	<input type="text" class="form-control" id="upper_member" name="upper_member" value="${dto.upper_member}">
	</div>
	<div class="form-group">
	<label for="status">구매상태 </label>
	 <select class="form-control" id="status" name="status">
	   <option value="구매" <c:choose><c:when test="${dto.status == '구매'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>구매</option>
	   <option value="환불" <c:choose><c:when test="${dto.status == '환불'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>환불</option>
	   <option value="수당지급" <c:choose><c:when test="${dto.status == '수당지급'}">selected</c:when><c:otherwise></c:otherwise></c:choose>>수당지급</option>
	 </select>
	</div>	
</form>     
<p  style="text-align: center">  
    <button type="button" class="btn btn-primary" id="btnUpdete">매출 수정</button> 
    <button type="button" class="btn btn-danger" id="btnDelete">매출 삭제</button>
</p>							


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