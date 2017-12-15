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
      <a class="navbar-brand" href="/">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="${path}/member/list.do">회원관리</a></li>
        <li><a href="${path}/board/list.do">게시판</a></li>
        <li><a href="${path}/member/myInfo.do">내 정보 보기</a></li>        
        <li><a href="${path}/payment/list.do">수당</a></li>
        <li><a href="${path}/sales/list.do">매출관리</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
<c:choose>
	<c:when test="${sessionScope.userId == null}">
        <li><a href="${path}/member/login.do">로그인</a></li>
	</c:when>
	<c:otherwise>
		[${sessionScope.userName}]님
		<li><a href="${path}/member/logout.do">로그아웃</a></li>
	</c:otherwise>
</c:choose>	
	  </ul>
	</div>
  </div>      
</nav>
