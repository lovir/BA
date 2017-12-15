<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
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
				
<h1>
	<small>회원 목록</small>
</h1>				
<p>
					
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