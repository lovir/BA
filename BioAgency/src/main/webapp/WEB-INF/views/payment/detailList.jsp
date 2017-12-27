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
<%@ include file="../include/left.jsp" %>

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
	    		<td>${sales.seq}</td>	
				<td>${sales.purchase_name}</td>
	        	<td align="right"><fmt:formatNumber value="${sales.payment_amount}" pattern="#,###" /></td>
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
	    		<td>${sales.seq}</td>	
				<td>${sales.purchase_name}</td>
				<td>${sales.product_name}</td>
	        	<td align="right"><fmt:formatNumber value="${sales.payment_amount}" pattern="#,###" /></td>
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

<p>				
	<table class="table table-striped" >
		<tr>
			<th>구매 번호</th>
			<th>관리 B.A</th>
			<th>구매자 성명</th>
			<th>상품명</th>
			<th>수당 금액(원)</th>
			<th>구매일</th>
			<th>지급 예상일</th>
			<th>현재 상태</th>
		</tr>
	    <c:forEach var="payment" items="${map.list}">
	    <tr>
	    		<td>${payment.sales_seq}</td>	
				<td>${payment.sales_member_name}</td>
				<td>${payment.purchase_name}</td>
				<td>${payment.product_name}</td>
	        	<td align="right"><fmt:formatNumber value="${payment.payment_amount}" pattern="#,###" /></td>
	        	<td>${payment.purchase_date}</td>
	        	<td>${payment.amount_date}</td>
	        	<td>${payment.status}</td>
	    </tr>
	    </c:forEach>
    </table>
</p>
	    		
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
	    		<td>${sales.seq}</td>	
				<td>${sales.purchase_name}</td>
				<td>${sales.product_name}</td>
	        	<td align="right"><fmt:formatNumber value="${sales.payment_amount}" pattern="#,###" /></td>
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
    <%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>