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
function setSearchId(userid, username)
{
	opener.document.form1.upper_member_name.value = username;
	opener.document.form1.upper_member.value = userid;
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
		</tr>
	    <c:forEach var="member" items="${map.list}">
	    <tr>
				<td>${member.userRegdate}</td>
	        	<td><a href="#" onclick="javascript:setSearchId('${member.userId}', '${member.userName}');">${member.userName}</a></td>
	        	<td>${member.userEmail}</td>
	        	<td> ${member.phone}</td>
	    </tr>
	    </c:forEach>
    </table>
    <button type="button" onClick="javascript:window.close()">닫기</button>
</body>
</html>