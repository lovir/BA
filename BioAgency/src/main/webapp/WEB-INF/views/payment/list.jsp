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
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-8 text-left"> 
<p>				
<h1  style="text-align: center">
	<small>수당 내역</small>
</h1>				
</p>

<p>
				
	<table class="table table-striped" >
		<tr>
			<td>가입 수당</td>
			<td>${map.sumRegist} 원</td>
			<td><button type="button" class="btn btn-primary" id="btnDetailList1">상세 내역</button></td>
		</tr>
		<tr>
			<td>매출 수당</td>
			<td>${map.sumSales} 원</td>
			<td><button type="button" class="btn btn-primary" id="btnDetailList2">상세 내역</button></td>
		</tr>
		<tr>
			<td>B.A 관리비</td>
			<td>${map.sumPayment} 원</td>
			<td><button type="button" class="btn btn-primary" id="btnDetailList4">상세 내역</button></td>
		</tr>
		<tr>
			<td>기타 수당</td>
			<td>${map.sumEtc} 원</td>
			<td><button type="button" class="btn btn-primary" id="btnDetailList3">상세 내역</button></td>
		</tr>
		<tr>
			<td>합계</td>
			<td>${map.sumTotal} 원</td>
			<td></td>
		</tr>
	</table>
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
