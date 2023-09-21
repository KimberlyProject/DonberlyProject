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
	
	
	.more {
		display : block;
		border-top : 3px solid rgb(73, 124, 64);
		border-bottom : 3px solid rgb(73, 124, 64);
		border-left : 0;
		border-right : 0;
		outline : none;
		background : none;
		width : 100%;
		padding : 10px 0;
		color: rgb(73, 124, 64);
		
	}
	</style>
	
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
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
	
		<h2>팝니다에 올린 ${member.nickname }님의 글</h2>
		<c:choose>
			<c:when test="${articlesList2 == null}"> <!-- 게시글이 하나도 없는 경우 -->
				<c:if test="${member.userId != articlesList2.userId}">
				<div>
					<div>
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
		
			<button class="more" onClick="moreCount('sale')">더보기</button>
		
<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->		
		<h2>삽니다에 올린 ${member.nickname }님의 글</h2>
		<c:choose>
			<c:when test="${articlesList1 == null}"> <!-- 게시글이 하나도 없는 경우 -->
			<c:if test="${member.userId != articlesList1.userId}">
				<div>
					<div>
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
		
		
			<button class="more" onClick="moreCount('buy')">더보기</button>

<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->		

		<br/><br/><br/>


	</div><!-- <div class="container"> -->

<%@ include file="../include/footer.jsp" %>



<script>


let bc = ${market.buycount};
let sc = ${market.salecount};
console.log(bc);
console.log(sc);
function moreCount(type){
	if (type == 'buy'){
		bc ++;
		location.href = "${path}/mypage/marketInfo.do?buycount=" + bc + "&salecount=" + sc;
	} else if(type == 'sale')
		sc ++;
		location.href = "${path}/mypage/marketInfo.do?buycount=" + bc + "&salecount=" + sc;
}


</script>
</body>
</html>