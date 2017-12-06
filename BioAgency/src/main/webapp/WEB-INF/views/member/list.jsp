<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<title>회원 관리</title>
<%@ include file="../include/header.jsp" %>
</head>
<div class="jumbotron">
<body>
<%@ include file="../include/menu.jsp" %>
	<div class="container-fluid">
		<div class="page-header">
			<h1>
				회원 관리</small>
			</h1>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					
	<table class="table table-striped" >
		<tr>
			<th>등록일</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>회원상태</th>
		</tr>
	    <c:forEach var="member" items="${map.list}">
	    <tr>
				<td>${member.userRegdate}</td>
	        	<td><a href="#" onclick="location.href='detail.do?userid=${member.userId}'">${member.userName}</a></td>
	        	<td>${member.userEmail}</td>
	        	<td> ${member.phone}</td>
	        	<td> ${member.status}</td>
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
