<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="/${path}"><img src="../resources/images/logo.jpg" width="100" height="30"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
        
	<c:choose>
      	<c:when test="${sessionScope.userId == 'admin'}">
	      
       		<li><a href="${path}/board/list.do">공지사항</a></li>
	        <li><a href="${path}/member/list.do">회원관리</a></li>
	        <li><a href="${path}/sales/list.do">매출관리</a></li>
	        <li><a href="${path}/payment/listPayment.do">수당 지급 목록</a></li>
	        
        </c:when>
		<c:otherwise>	
			<c:choose>
			<c:when test="${sessionScope.userId != null}">
				<li><a href="${path}/board/list.do">공지사항</a></li>
		        <li><a href="${path}/member/myInfo.do">내 정보 보기</a></li>        
		        <li><a href="${path}/payment/list.do">수당 내역</a></li>
		        <li><a href="${path}/payment/calendar.do">B.A 달력</a></li>
	        </c:when>
	        </c:choose>	        
		</c:otherwise>
	</c:choose>	        
      </ul>
      <ul class="nav navbar-nav navbar-right">
<c:choose>
	<c:when test="${sessionScope.userId == null}">
        <li><a href="${path}/member/login.do">로그인</a></li>
	</c:when>
	<c:otherwise>		
		<li><a href="${path}/member/logout.do">[${sessionScope.userName}]님 로그아웃</a></li>
	</c:otherwise>
</c:choose>	
	  </ul>
	</div>
  </div>      
</nav>
