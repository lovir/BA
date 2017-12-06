<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<title>수당 관리</title>
<%@ include file="../include/header.jsp" %>
</head>
<div class="jumbotron">
<body>
<%@ include file="../include/menu.jsp" %>
	<div class="container-fluid">
		<div class="page-header">
			<h1>
				수당 관리</small>
			</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
				
	<table class="table table-striped" >
		<tr>
			<th>구매자 성명</th>
			<th>상품명</th>
			<th>구매금액(원)</th>
			<th>구매일</th>
			<th>지급 예상일</th>
			<th>현재 상태</th>
		</tr>
	    <c:forEach var="payment" items="${map.list}">
	    <tr>
				<td>${payment.member_name}</td>
	        	<td><a href="#" onclick="location.href='detail.do?userid=${payment.seq}'">${payment.seq}</a></td>
	        	<td>${payment.payment_amount}</td>
	        	<td>${payment.amount_date}</td>
	        	<td>${payment.amount_date}</td>
	        	<td>${payment.status}</td>
	    </tr>
	    </c:forEach>
    </table>
    
   			 </div>
		</div>
	</div>
    </div>
</body>
</div>
</html>
