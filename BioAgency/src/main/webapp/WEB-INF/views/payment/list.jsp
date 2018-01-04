<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당 내역</title>
<%@ include file="../include/header.jsp" %>
</head>
<script>
	$(document).ready(function(){

		$("#btnDetailList1").click(function(){
			var url = 'detailList.do?pid=1';
			location.href = url;
		});
		
		$("#btnDetailList2").click(function(){
			var url = 'detailList.do?pid=2';
			location.href = url;
		});
		
		$("#btnDetailList3").click(function(){
			var url = 'detailList.do?pid=3';
			location.href = url;
		});
		
		$("#btnDetailList4").click(function(){
			var url = 'detailList.do?pid=4';
			location.href = url;
		});
	});
</script>
<body>

<%@ include file="../include/menu.jsp" %>

<div class="container-fluid text-center">    
  <div class="row content">
<%@ include file="../include/left.jsp" %>

    <div class="col-sm-8 text-left"> 
<p>				
<h1  style="text-align: center">
	<small>수당 내역</small>
</h1>				
</p>

<p>
				
	<table class="table table-striped" >
		<tr>
			<th>구 분</th>
			<th>수당 금액</th>
			<th>상세 내역 보기</th>
		</tr>
		<!-- 
		<tr>
			<td>매출 수당</td>
			<td><fmt:formatNumber value="${map.sumSales}" pattern="#,###" /> 원</td>
			<td><button type="button" class="btn btn-primary" id="btnDetailList2">상세 내역</button></td>
		</tr>
		 -->			
		<tr>
			<td>가입 수당</td>
			<td align="right">
			<c:forEach var="Rsum" items="${map.Rlist}">
			${Rsum.status } : <fmt:formatNumber value="${Rsum.cnt}" pattern="#,###" /> 원  <br>
			</c:forEach>
			</td>
			<td><button type="button" class="btn btn-primary" id="btnDetailList1">상세 내역</button></td>
		</tr>
		<tr>
			<td>매출 수당</td>
			<td align="right">
			<c:forEach var="Ssum" items="${map.Slist}">
			${Ssum.status } : <fmt:formatNumber value="${Ssum.cnt}" pattern="#,###" /> 원  <br>
			</c:forEach>
			</td>
			<td><button type="button" class="btn btn-primary" id="btnDetailList2">상세 내역</button></td>
		</tr>
		<tr>
			<td>B.A 관리비</td>
			<td align="right">
			<c:forEach var="Psum" items="${map.Plist}">
			${Psum.status } : <fmt:formatNumber value="${Psum.cnt}" pattern="#,###" /> 원  <br>
			</c:forEach>
			</td>
			<td><button type="button" class="btn btn-primary" id="btnDetailList4">상세 내역</button></td>
		</tr>
		<tr>
			<td>기타 수당</td>
			<td align="right">
			<c:forEach var="Esum" items="${map.Elist}">
			${Esum.status } : <fmt:formatNumber value="${Esum.cnt}" pattern="#,###" /> 원  <br>
			</c:forEach>
			</td>			
			<td><button type="button" class="btn btn-primary" id="btnDetailList3">상세 내역</button></td>
		</tr>
	</table>
   			 </p>
   			 	
	</div>
    <%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>