<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="../resources/bower_components/bootstrap/dist/css/bootstrap.min.css"	rel="stylesheet">
<link href="../resources/bower_components/bootstrap-select/bootstrap-select.min.css"	rel="stylesheet">
<link href="../resources/bower_components/bootstrapValidator/dist/css/bootstrapValidator.min.css" rel="stylesheet">

<title>관리 B.A 명단</title>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body>
	<table class="table table-striped" >
		<tr>
			<th>회원 상태</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>계약 시작일</th>
		</tr>
	    <c:forEach var="member" items="${map.list}">
	    <tr>
				<td>${member.status}</td>
	        	<td>${member.userName}</td>
	        	<td>${member.userEmail}</td>
	        	<td>${member.phone}</td>
				<td>${member.contract_sdate}</td>
	    </tr>
	    </c:forEach>
    </table>
    <button type="button" onClick="javascript:window.close()">닫기</button>
    
</body>
</html>