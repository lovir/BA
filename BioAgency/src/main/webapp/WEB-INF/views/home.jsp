<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	<title>Home</title>
<%@ include file="include/header.jsp" %>

<c:if test="${sessionScope.userId != null}">
<script>location.href='${path}/board/list.do';</script>
</c:if>
<script>location.href='${path}/member/login.do';</script>

</head>
<div class="jumbotron">
<body>
<%@ include file="include/menu.jsp" %>
	<c:if test="${msg == 'success'}">
	<h2>${sessionScope.userName}(${sessionScope.userId})님 환영합니다.</h2>
	</c:if>
	
	${result}
</body>
</div>
</html>
