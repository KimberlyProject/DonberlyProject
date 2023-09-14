<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
	
	<style>
	.imgsize {
	width: 150px;
	height: 125px;
	
	}
	
	.selectBox{
	display: flex;
	justify-content:space-between;
	}
	/* 제일 상위 */
	.products {
	display:grid;
	grid-template-columns: 1fr 1fr 1fr;
    border: 1px solid #ccc; /* 테이블 경계 설정 */
    padding: 10px; /* 테이블 내부 여백 설정 */
    margin-bottom: 20px; /* 테이블 간격 설정 */
  	}
	/* products 하위 */
	.product {	
    display: block;
    text-align: center;
    text-decoration:none;
    color: black;
    margin-left: 5px;
    margin-right: 5px;
    margin-bottom: 15px;
    
	}
	
	/* 상품 글 제목 */
	.product-title {
	font-size: 18px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	}
	
	/* 상품 글 가격 */
	.product-price {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
	}
	
	/* 상품 글 판매자 */
	.product-seller {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
	}
	
	/* 상품 글 작성일자 */
	.product-date {
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
	}
	
	.searchgroup {
	padding: 5px;
	}
	
	</style>
	
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	
		<br/><br/>
	
		 	<c:set var="menu" value="mypage" />
	<%@ include file="../include/sidebar.jsp" %>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      홈 &gt;
      내정보보기
    </div> 
		
	<!-- 배너 타이틀 -->
  <h1 class="pageTitle"><div>내정보</div></h1>
  
		<br><br><br>
		<div class="container">
			<!-- 좌측 상단 팝니다/삽니다 구분 -->
			<div style="float: right;">
			
			<select id="searchType" style="font-size:18px;">
				<option>검색종류</option>
				<option value="t" <c:if test="{pageVO.type} == 't'">selected</c:if>>제목</option>
				<option value="c" <c:if test="{pageVO.type} == 'c'">selected</c:if>>내용</option>
				<option value="w" <c:if test="{pageVO.type} == 'w'">selected</c:if>>글쓴이</option>
			</select>
			<input type="text" id="searchKeyword" value="${pageVO.keyword }" placeholder="검색값"/>
			<button id="searchBtn" class="btn btn-warning btn-sm">검&nbsp;색</button>
		</div><!-- 검색창 -->
			<br><br><br>
	
		<h2>팝니다에 올린 ${member.nickname }님의 글</h2>
		<c:choose>
			<c:when test="${articlesList2 == null}"> <!-- 게시글이 하나도 없는 경우 -->
				<c:if test="${member.userId != articlesList2.userId}">
				<div>
					<div colspan="4">
						<p align="center">
							<b><span style="font-size:22px;">등록된 게시글이 없습니다.</span></b>
						</p>
					</div>
				</div>
				</c:if>
			</c:when>
			<c:when test="${articlesList2 != null}"> <!-- 게시글이 하나라도 있는 경우 -->
				<div class="products">
					<c:forEach var="salearticle" items="${articlesList2 }" varStatus="articleNum">
						<c:if test="${member.userId == salearticle.userId}">
						<!-- 게시글 목록에서 한 건씩 추출하여 화면에 출력시킨다. -->
						
								<ul class="product">
						          <li>
						            <img src="${path}/download.do?articleNO=${salearticle.articleNO }&thumbnail=${salearticle.thumbnail}" class="imgsize"/>
						          </li>
						          <li class="product-title">
						            ${salearticle.title} <!-- 여기에 게시글 제목 -->
						          </li>
						          <li class="product-price">
						            ${salearticle.price}원 <!-- 여기에 가격 표시 -->
						          </li>
						          <li class="product-seller">
						          	${salearticle.nickname}
						          </li>
						          <li class="product-date">
						          	${salearticle.write_date}
						          </li>
						        </ul>
						</c:if>
					</c:forEach>
				</div>
			</c:when>
		</c:choose>
		
							<button onClick="moreCount('sale')">더보기</button>
				<table align="center">
			<tr> <!-- 페이징 -->
				<td>
					<div class="col-sm-offset-3"><!-- 숫자 버튼 -->
						<ul class="btn-group pagination">
							<c:if test="${pageMaker2.prev}">
								<li>
									<a href='<c:url value="/mypage/marketInfo.do?page=${pageMaker2.startPage -1}&searchType=${cri.searchType}&keyworad=${cri.keyword}"/>'>
										<span class="glyphicon glyphicon-chevron-left"></span></a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker2.startPage}" end="${pageMaker2.endPage}" var="pageNum">
								<li>
									<a href='<c:url value="/mypage/marketInfo.do?page=${pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'><i>${pageNum}</i></a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker2.next && pageMaker2.endPage > 0}">
								<li>
									<a href='<c:url value="/mypage/marketInfo.do?page=${pageMaker2.endPage + 1}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'>
										<span class="glyphicon glyphicon-chevron-right"></span></a>
								</li>
							</c:if>
						</ul>
					</div><!-- 숫자 버튼 -->
				</td>
			</tr>
		</table> <br/><hr>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->		
		<h2>삽니다에 올린 ${member.nickname }님의 글</h2>
		<c:choose>
			<c:when test="${articlesList1 == null}"> <!-- 게시글이 하나도 없는 경우 -->
			<c:if test="${member.userId != articlesList1.userId}">
				<div>
					<div colspan="4">
						<p align="center">
							<b><span style="font-size:22px;">등록된 게시글이 없습니다.</span></b>
						</p>
					</div>
				</div>
			</c:if>
			</c:when>
			<c:when test="${articlesList1 != null}"> <!-- 게시글이 하나라도 있는 경우 -->
				<div class="products">
					<c:forEach var="article" items="${articlesList1 }" varStatus="articleNum">
						<!-- 게시글 목록에서 한 건씩 추출하여 화면에 출력시킨다. -->
						<c:if test="${member.userId == article.userId}">
								<ul class="product">
						          <li>
						            <img src="${path}/download.do?articleNO=${article.articleNO }&thumbnail=${article.thumbnail}" class="imgsize"/>
						          </li>
						          <li class="product-title">
						            ${article.title} <!-- 여기에 게시글 제목 -->
						          </li>
						          <li class="product-price">
						            ${article.price}원 <!-- 여기에 가격 표시 -->
						          </li>
						          <li class="product-seller">
						          	${article.nickname}
						          </li>
						          <li class="product-date">
						          	${article.write_date}
						          </li>
						        </ul>
						</c:if>
					</c:forEach>
				</div>
			</c:when>
		</c:choose>
		<table align="center">
			<tr> <!-- 페이징 -->
				<td>
					<div class="col-sm-offset-3"><!-- 숫자 버튼 -->
						<ul class="btn-group pagination">
							
						<li>
							<button onClick="moreCount('buy')">더보기</button>
						</li>
							
							
						</ul>
					</div><!-- 숫자 버튼 -->
				</td>
			</tr>
		</table> <br/>
		
<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->		

		<br/><br/><br/>

		
		<form id="formList" action="/mypage/marketInfo.do" method="get">
			<input type="hidden" name="userId">
			<input type="hidden" name="page">
			<input type="hidden" name="searchType">
			<input type="hidden" name="keyword">
		</form>
	</div><!-- <div class="container"> -->

<%@ include file="../include/footer.jsp" %>


<script>
$(document).ready(function() {
	var formObj = $("#formList");
	
	// 검색버튼을 눌렀을 경우
	$("#searchBtn").click(function(e) {
		var	typeStr		= $("#searchType").find(":selected").val();
		var	keywordStr	= $("#searchKeyword").val();
		console.log(typeStr, "", keywordStr);
		
		formObj.find("[name='searchType']").val(typeStr);
		formObj.find("[name='keyword']").val(keywordStr);
		formObj.find("[name='page']").val("1");
		formObj.submit();
	});
});
</script>

<script>
let bc = ${buycount};
let sc = ${salecount};

function moreCount(type){
	if (type == 'buy'){
		bc ++;
		location.href = "/mypage/marketInfo.do?buycount=" + bc + "&salecount=" + sc;
	} else if(type == 'sale')
		sc ++;
		location.href = "/mypage/marketInfo.do?buycount=" + bc + "&salecount=" + sc;
}
</script>
</body>
</html>