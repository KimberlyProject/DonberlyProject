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
	
	<div class="container">
		<br/><br/>
	
		<div class="myroot">
			<a href="#">홈</a> >
			<a href="#">마이페이지</a> >
			<a href="#">장터</a> >
			<a href="#">거래내역</a>
		</div>
		<br/><br/>
		
		<img src="/resources/images/banner.jpeg" alt="배너" style="width: 1150px;">
		<br><br><br>
		
		<!-- 좌측 상단 팝니다/삽니다 구분 -->
		<div class= "selectBox" align="left" style="vertical-align:middle;">
			<div>
				<select class="searchgroup" id="searchType" style="font-size: 15px; width: 100px;">
					<option value="i" <c:if test="{searchType} == 'i'">selected</c:if>>전체</option>
					<option value="o" <c:if test="{searchType} == 'o'">selected</c:if>>팝니다</option>
					<option value="p" <c:if test="{searchType} == 'p'">selected</c:if>>삽니다</option>
				</select>	
			</div>
			
			<div>
				<select class="searchgroup" id="searchType" style="font-size: 15px; width: 100px;">
					<option value="a" <c:if test="{searchType} == 'a'">selected</c:if>>전체</option>
					<option value="w" <c:if test="{searchType} == 'w'">selected</c:if>>작성자</option>
					<option value="c" <c:if test="{searchType} == 'c'">selected</c:if>>내용</option>
					<option value="p" <c:if test="{searchType} == 'p'">selected</c:if>>상품번호</option>
				</select>
	 			<input  class="searchgroup" type="text" class="form-control" style="width:250px;" placeholder="검색하기">
				<button id ="searchbtn" class="btn btn-secondary" type="button" style="background-color:rgb(73, 124, 64); color:#FFFFFF;">
					<span class="glyphicon glyphicon-search"/>
				</button>	
			</div>
		</div><!-- 검색창 -->
		<br><br><br>
<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->		
		
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
						          	${article.userId}
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
							<c:if test="${pageMaker1.prev}">
								<li>
									<a href='<c:url value="/board/listArticlesPaging.do?page=${pageMaker1.startPage -1}&searchType=${cri.searchType}&keyworad=${cri.keyword}"/>'>
										<span class="glyphicon glyphicon-chevron-left"></span></a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker1.startPage}" end="${pageMaker1.endPage}" var="pageNum">
								<li>
									<a href='<c:url value="/board/listArticlesPaging.do?page=${pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'><i>${pageNum}</i></a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker1.next && pageMaker1.endPage > 0}">
								<li>
									<a href='<c:url value="/board/listArticlesPaging.do?page=${pageMaker1.endPage + 1}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'>
										<span class="glyphicon glyphicon-chevron-right"></span></a>
								</li>
							</c:if>
						</ul>
					</div><!-- 숫자 버튼 -->
				</td>
			</tr>
		</table> <br/>
		
<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->		
		
		
		<br/><br/><hr/><br/><br/>
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
						          	${salearticle.userId}
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
				<table align="center">
			<tr> <!-- 페이징 -->
				<td>
					<div class="col-sm-offset-3"><!-- 숫자 버튼 -->
						<ul class="btn-group pagination">
							<c:if test="${pageMaker2.prev}">
								<li>
									<a href='<c:url value="/board/listArticlesPaging.do?page=${pageMaker2.startPage -1}&searchType=${cri.searchType}&keyworad=${cri.keyword}"/>'>
										<span class="glyphicon glyphicon-chevron-left"></span></a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker2.startPage}" end="${pageMaker2.endPage}" var="pageNum">
								<li>
									<a href='<c:url value="/board/listArticlesPaging.do?page=${pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'><i>${pageNum}</i></a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker2.next && pageMaker2.endPage > 0}">
								<li>
									<a href='<c:url value="/board/listArticlesPaging.do?page=${pageMaker2.endPage + 1}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'>
										<span class="glyphicon glyphicon-chevron-right"></span></a>
								</li>
							</c:if>
						</ul>
					</div><!-- 숫자 버튼 -->
				</td>
			</tr>
		</table> <br/>
		

		
		<form id="formList" action="/board/listArticlesPaging.do" method="get">
			<input type="hidden" name="page">
			<input type="hidden" name="searchType">
			<input type="hidden" name="keyword">
		</form>
	</div><!-- <div class="container"> -->

<%@ include file="../include/footer.jsp" %>
</body>
</html>