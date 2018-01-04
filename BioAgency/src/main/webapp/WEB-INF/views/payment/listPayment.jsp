<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수당 지급 목록 보기</title>
<%@ include file="../include/header.jsp" %>
<script>
	// 원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해 
	function list(page, status){
		location.href="${path}/payment/listPayment.do?curPage="+page+"&status=" + encodeURI(status);
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
	<small>수당 지급 목록</small>
</h1>				
</p>
<c:choose>
     	<c:when test="${map.status == '구매'}">
     		<div align="right" ><button type="button" onClick="location.href='listPayment.do'">전체 보기</button></div>
     	</c:when>
	<c:otherwise>
    	<div align="right" ><button type="button" onClick="javascrip:list(1, '구매');">미지급 수당 목록</button></div>
	</c:otherwise>
</c:choose>


<p>				
	<table class="table table-striped" >
		<tr>
			<th>수당 지급일</th>
			<th>지급 수당 금액</th>
			<th>회원명(아이디)</th>
			<th>계좌번호</th>
			<th>수당 지급</th>
		</tr>
	    <c:forEach var="payment" items="${map.list}">
	    <tr>
        	<td>${payment.amount_date}</td>
        	<td align="right"><fmt:formatNumber value="${payment.payment_amount}" pattern="#,###" /> 원</td>
        	<td>${payment.member_name} (${payment.member_id})</td>
        	<td>${payment.account}</td>
        	<c:choose>
	        	<c:when test="${payment.status == '지급완료'}">
	        		<td>지급 완료</td>
	        	</c:when>
				<c:otherwise>
	        		<td><button type="button" class="btn" onClick="location.href='paymentComplete.do?member_id=${payment.member_id}&amount_date=${payment.amount_date}'">수당 지급</button></td>
				</c:otherwise>
        	</c:choose>
	    </tr>
	    </c:forEach>
	    
	    <!-- 페이징 -->
		<tr>
			<td colspan="5">
				<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('1', '${map.status}')">[처음]</a>
				</c:if>
				
				<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock > 1}">
					<a href="javascript:list('${map.boardPager.prevPage}', '${map.status}')">[이전]</a>
				</c:if>
				
				<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
				<c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
					<!-- 현재페이지이면 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == map.boardPager.curPage}">
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}', '${map.status}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
					<a href="javascript:list('${map.boardPager.nextPage}', '${map.status}')">[다음]</a>
				</c:if>
				
				<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
					<a href="javascript:list('${map.boardPager.totPage}', '${map.status}')">[끝]</a>
				</c:if>
			</td>
		</tr>
		<!-- 페이징 -->	        
		
    </table>
</p>  
			
	</div>
	
<%@ include file="../include/right.jsp" %>       
    
  </div>
</div>

<%@ include file="../include/footer.jsp" %>       

</body>
</html>
