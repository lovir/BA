<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당 지급 목록 보기</title>
<%@ include file="../include/header.jsp" %>
</head>

<body>

<%@ include file="../include/menu.jsp" %>

<div class="container-fluid text-center">    
  <div class="row content">
  
<%@ include file="../include/left.jsp" %>

    <div class="col-sm-8 text-left"> 
<p>				
<h1  style="text-align: center">
	<small>수당 지급 목록</small>
</h1>				
</p>

<p>				
	<table class="table table-striped" >
		<tr>
			<th>수당 지급일</th>
			<th>지급 수당 금액</th>
			<th>회원명(아이디)</th>
			<th>계좌번호</th>
			<th>수당 지급</th>
		</tr>
	    <c:forEach var="payment" items="${map.list}">
	    <tr>
        	<td>${payment.amount_date}</td>
        	<td>${payment.payment_amount} 원</td>
        	<td>${payment.member_name} (${payment.member_id})</td>
        	<td>${payment.account}</td>
        	<td><button type="button" class="btn" onClick="location.href='paymentComplete.do?member_id=${payment.member_id}&amount_date=${payment.amount_date}'">수당 지급</button></td>
	    </tr>
	    </c:forEach>
    </table>
</p>  
			
	</div>
	
<%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>