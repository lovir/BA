<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당 상세 내역</title>
<%@ include file="../include/header.jsp" %>
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
<p>				
	<c:choose>
	    <c:when test="${map.pid == 1}">
			<h1  style="text-align: center">
	    	<small>가입 수당 상세 내역</small>
	    	</h1>				
<p>				
	<table class="table table-striped" >
		<tr>
			<th>구매 번호</th>
			<th>구매자 성명</th>
			<th>수당 금액(원)</th>
			<th>구매일</th>
			<th>지급 예상일</th>
			<th>현재 상태</th>
		</tr>
	    <c:forEach var="sales" items="${map.list}">
	    <tr>
	    		<td>${sales.seq}</a></td>	
				<td>${sales.purchase_name}</a></td>
	        	<td>${sales.payment_amount}</td>
	        	<td>${sales.purchase_date}</td>
	        	<td>${sales.expected_date}</td>
	        	<td>${sales.status}</td>
	    </tr>
	    </c:forEach>
    </table>
</p>    	    	
	    </c:when>
	    <c:when test="${map.pid == 2}">
			<h1  style="text-align: center">
	    	<small>매출 수당 상세 내역</small>
	    	</h1>				
	    	
<p>				
	<table class="table table-striped" >
		<tr>
			<th>구매 번호</th>
			<th>구매자 성명</th>
			<th>상품명</th>
			<th>수당 금액(원)</th>
			<th>구매일</th>
			<th>지급 예상일</th>
			<th>현재 상태</th>
		</tr>
	    <c:forEach var="sales" items="${map.list}">
	    <tr>
	    		<td>${sales.seq}</a></td>	
				<td>${sales.purchase_name}</a></td>
				<td>${sales.product_name}</a></td>
	        	<td>${sales.payment_amount}</td>
	        	<td>${sales.purchase_date}</td>
	        	<td>${sales.expected_date}</td>
	        	<td>${sales.status}</td>
	    </tr>
	    </c:forEach>
    </table>
</p>    	    		    	
	    </c:when>
	    <c:when test="${map.pid == 4}">
			<h1  style="text-align: center">
	    	<small>B.A 관리비 상세 내역</small>
	    	</h1>				
	    </c:when>
	    <c:when test="${map.pid == 3}">
			<h1  style="text-align: center">
	    	<small>기타 수당 상세 내역</small>
	    	</h1>				
<p>				
	<table class="table table-striped" >
		<tr>
			<th>구매 번호</th>
			<th>구매자 성명</th>
			<th>내역</th>
			<th>수당 금액(원)</th>
			<th>구매일</th>
			<th>지급 예상일</th>
			<th>현재 상태</th>
		</tr>
	    <c:forEach var="sales" items="${map.list}">
	    <tr>
	    		<td>${sales.seq}</a></td>	
				<td>${sales.purchase_name}</a></td>
				<td>${sales.product_name}</a></td>
	        	<td>${sales.payment_amount}</td>
	        	<td>${sales.purchase_date}</td>
	        	<td>${sales.expected_date}</td>
	        	<td>${sales.status}</td>
	    </tr>
	    </c:forEach>
    </table>
</p>    	    		  
	    </c:when>
		<c:otherwise>
			<h1  style="text-align: center">
	    	<small>상세 내역이 없습니다.</small>
	    	</h1>				
		</c:otherwise>
    </c:choose>
</h1>				
		
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
