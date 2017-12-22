<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 보기</title>
<%@ include file="../include/header.jsp" %>
<script>
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page){
		location.href="${path}/sales/list.do?curPage="+page;
	}
</script>
</head>

<body>

<%@ include file="../include/menu.jsp" %>

<div class="container-fluid text-center">    
  <div class="row content">
<%@ include file="../include/left.jsp" %>
    <div class="col-sm-8 text-left"> 
<p>				
<h1  style="text-align: center">
	<small>매출 관리</small>
</h1>				
</p>

<p>				
	<table class="table table-striped" >
		<tr>
			<th>구매 번호</th>
			<th>구매자 성명</th>
			<th>상품명</th>
			<th>구매금액(원)</th>
			<th>구매일</th>
			<th>지급 예상일</th>
			<th>현재 상태</th>
		</tr>
	    <c:forEach var="sales" items="${map.list}">
	    <tr>
	    		<td><a href="#" onclick="location.href='detail.do?seq=${sales.seq}'">${sales.seq}</a></td>	
				<td><a href="#" onclick="location.href='detail.do?seq=${sales.seq}'">${sales.purchase_name}</a></td>
	        	<td><a href="#" onclick="location.href='detail.do?seq=${sales.seq}'">${sales.product_name}</a></td>
	        	<td align="right"><fmt:formatNumber value="${sales.purchase_amount}" pattern="#,###" /></td>
	        	<td>${sales.purchase_date}</td>
	        	<td>${sales.expected_date}</td>
	        	<td>${sales.status}</td>
	    </tr>
	    </c:forEach>
	    
		<!-- 페이징 -->
		<tr>
			<td colspan="7">
				<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('1')">[처음]</a>
				</c:if>
				
				<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('${map.boardPager.prevPage}')">[이전]</a>
				</c:if>
				
				<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<!-- 현재페이지이면 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == map.boardPager.curPage}">
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
				</c:if>
				
				<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
					<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
		<!-- 페이징 -->	    
    </table>
</p>    
    
	<p style="text-align: right">
	<button type="button" class="btn" onClick="location.href='insertForm.do'">매출 등록</button>
	</p>
	
		
	</div>
    <%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>