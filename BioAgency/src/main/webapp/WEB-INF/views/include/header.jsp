<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jstl 포맷 태그 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 컨택스트  패스-->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="../resources/bower_components/bootstrap/dist/css/bootstrap.min.css"	rel="stylesheet">
<link href="../resources/bower_components/bootstrap-select/bootstrap-select.min.css"	rel="stylesheet">
<link href="../resources/bower_components/bootstrapValidator/dist/css/bootstrapValidator.min.css" rel="stylesheet">

<script src="../resources/bower_components/jquery/dist/jquery.min.js"></script>
<script src="../resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../resources/bower_components/bootstrap-select/bootstrap-select.min.js"></script>
<script src="../resources/bower_components/bootstrap-paginator/build/bootstrap-paginator.min.js"></script>
<script src="../resources/bower_components/bootstrapValidator/dist/js/bootstrapValidator.min.js"></script>
<style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>