<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link href="../resources/bower_components/bootstrap/dist/css/bootstrap.min.css"	rel="stylesheet">
<link href="../resources/bower_components/bootstrap-select/bootstrap-select.min.css"	rel="stylesheet">
<link href="../resources/bower_components/bootstrapValidator/dist/css/bootstrapValidator.min.css" rel="stylesheet">

<title>회원 찾기</title>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
function setSearchId(userId, userName, upperMember, upperMemberName)
{
	opener.document.form1.sales_member_name.value = userName;
	opener.document.form1.sales_member.value = userId;
	opener.document.form1.upper_member_name.value = upperMemberName;
	opener.document.form1.upper_member.value = upperMember;
	
	window.close();
}

</script>
</head>
<body>
	<table class="table table-striped" >
		<tr>
			<th>등록일</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>1차 후원자</th>
		</tr>
	    <c:forEach var="member" items="${map.list}">
	    <tr>
				<td>${member.userRegdate}</td>
	        	<td><a href="#" onclick="javascript:setSearchId('${member.userId}', '${member.userName}', '${member.upper_member}', '${member.upper_member_name}');">${member.userName}</a></td>
	        	<td>${member.userEmail}</td>
	        	<td> ${member.phone}</td>
	        	<td> ${member.upper_member_name}</td>
	    </tr>
	    </c:forEach>
    </table>
    <button type="button" onClick="javascript:window.close()">닫기</button>
</body>
</html>