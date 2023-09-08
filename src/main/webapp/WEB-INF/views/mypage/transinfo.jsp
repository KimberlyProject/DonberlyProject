<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장터 팝니다/삽니다</title>
	<%@ include file="../include/header.jsp" %>
	
	<style>
	.imgsize {
	width: 300px;
	height: 255px;
	
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
    margin-left: 10px;
    margin-right: 10px;
    margin-bottom: 30px;
    
	}
	
	/* 상품 글 제목 */
	.product-title {
	font-size: 17px;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 10px;
	}
	
	/* 상품 글 가격 */
	.product-price {
	text-align: right;
	margin-top: 10px;
	margin-bottom: 10px;
	}
	
	/* 상품 글 판매자 */
	.product-seller {
	text-align: right;
	margin-top: 10px;
	margin-bottom: 10px;
	}
	
	/* 상품 글 작성일자 */
	.product-date {
	font-size: 11px;
	text-align: right;
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
		</div><!--  -->
		<br><br><br>
		
		<!-- 장터 팝니다/삽니다 게시글 -->
		<div class="products">
		  <% for (int i = 0; i < 15; i++) { %>
		    <div>
		      <a href="#" class="product">
		        <ul class="product">
		          <li>
		            <a href="#">
		              <img src="resources/images/apple.jpg" alt="상품사진" class="imgsize"/>
		            </a>
		          </li>
		          <li class="product-title">
		            <a href="#">
		              사과 팝니다. (판매/구매글 제목)
		            </a>
		          </li>
		          <li class="product-price">
		            <a href="#">
		              100,000원
		            </a>
		          </li>
		          <li class="product-seller">
		            판매자 ID
		          </li>
		          <li class="product-date">
		            2023-08-29
		          </li>
		        </ul>
		      </a>
		    </div>		   
		  <% } %>
		</div>

		<!-- End - 장터 팝니다/삽니다 게시글 -->

		
		<table align="center">
			<tr> <!-- 페이징 -->
				<td>
					<div class="col-sm-offset-3"><!-- 숫자 버튼 -->
						<ul class="btn-group pagination">
							<c:if test="${pageMaker.prev}">
								<li>
									<a href='<c:url value="/board/listArticlesPaging.do?page=${pageMaker.startPage -1}&searchType=${cri.searchType}&keyworad=${cri.keyword}"/>'>
										<span class="glyphicon glyphicon-chevron-left"></span></a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
								<li>
									<a href='<c:url value="/board/listArticlesPaging.do?page=${pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'><i>${pageNum}</i></a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li>
									<a href='<c:url value="/board/listArticlesPaging.do?page=${pageMaker.endPage + 1}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'>
										<span class="glyphicon glyphicon-chevron-right"></span></a>
								</li>
							</c:if>
						</ul>
					</div><!-- 숫자 버튼 -->
				</td>
			</tr>
		</table> <br/>
		<button class="btn btn-success col-sm-offset-6"><a style="color:#FFFFFF;" href="#">상품 등록</a></button>
		<br/><br/>
		
		<form id="formList" action="/board/listArticlesPaging.do" method="get">
			<input type="hidden" name="page">
			<input type="hidden" name="searchType">
			<input type="hidden" name="keyword">
		</form>
	</div><!-- <div class="container"> -->

<%@ include file="../include/footer.jsp" %>
</body>
</html>