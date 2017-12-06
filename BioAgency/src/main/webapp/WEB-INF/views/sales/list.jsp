<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 보기</title>
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
<h1  style="text-align: center">
	<small>매출 관리</small>
</h1>				
</p>

<p>				
	<table class="table table-striped" >
		<tr>
			<th>구매 번호</th>
			<th>구매자 성명</th>
			<th>상품명</th>
			<th>구매금액(원)</th>
			<th>구매일</th>
			<th>지급 예상일</th>
			<th>현재 상태</th>
		</tr>
	    <c:forEach var="sales" items="${map.list}">
	    <tr>
	    		<td><a href="#" onclick="location.href='detail.do?seq=${sales.seq}'">${sales.seq}</a></td>	
				<td><a href="#" onclick="location.href='detail.do?seq=${sales.seq}'">${sales.purchase_name}</a></td>
	        	<td><a href="#" onclick="location.href='detail.do?seq=${sales.seq}'">${sales.product_name}</a></td>
	        	<td>${sales.purchase_amount}</td>
	        	<td>${sales.purchase_date}</td>
	        	<td>${sales.expected_date}</td>
	        	<td>${sales.status}</td>
	    </tr>
	    </c:forEach>
    </table>
</p>    
    
	<p style="text-align: right">
	<button type="button" class="btn" onClick="location.href='insertForm.do'">매출 등록</button>
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
