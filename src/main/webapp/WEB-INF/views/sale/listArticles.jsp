<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
	<%@ include file="../member/profileModal.jsp" %>
	<style>
		.imgsize {
		width: 180px;
		height: 155px;
		
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
	    border-radius: 20px;
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
	
	.jung{
		text-align: center;
		font-size: 20px;
		margin-bottom: 20px;
	}
	.searchgroup {
	padding: 5px;
	}
	
	.arti {
		margin-top : 50px;
	}
			
	</style>
	
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>

	<c:set var="menu" value="board" />
	<%@ include file="../include/sidebar.jsp" %>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      홈 &gt;
      장터
    </div> 
    <h1 class="pageTitle">
    	<div>판매장터</div>
    </h1>


<div class="container">
	
	<p style="float: left;">
		<a class="btn btn-primary" 
		href="javascript:fn_articleForm('${isLogOn}', '${page}/sale/articleForm.do', '${page}/member/login')">상품등록</a>
	</p>
	
	
	<!-- 검색 조건 -->
	<div style="float: right;">
		
		<select id="searchType" style="font-size:18px;">
			<option>검색종류</option>
			<option value="t" <c:if test="{pageVO.type} == 't'">selected</c:if>>제목</option>
			<option value="c" <c:if test="{pageVO.type} == 'c'">selected</c:if>>내용</option>
			<option value="w" <c:if test="{pageVO.type} == 'w'">selected</c:if>>글쓴이</option>
		</select>
		<input type="text" id="searchKeyword" value="${pageVO.keyword }" placeholder="검색값"/>
		<button id="searchBtn" class="btn btn-warning btn-sm">검&nbsp;색</button>
	</div>
		<div class="arti">
		<c:choose>
			<c:when test="${saleArticlesList == null}"> <!-- 게시글이 하나도 없는 경우 -->
				<div>
					<div>
						<p align="center">
							<b><span style="font-size:22px;">등록된 게시글이 없습니다.</span></b>
						</p>
					</div>
				</div>
			</c:when>
			<c:when test="${saleArticlesList != null}"> <!-- 게시글이 하나라도 있는 경우 -->
						<div class="products">
				<c:forEach var="article" items="${saleArticlesList }" varStatus="articleNum">
					<!-- 게시글 목록에서 한 건씩 추출하여 화면에 출력시킨다. -->
					<c:choose>
						<c:when test = "${article.purpose == 1 }">
							<ul class="product">
					          <li>
					            <a>
									<img id="i" style="border-radius: 50%;" src="${path}/download.do?articleNO=${article.articleNO }&thumbnail=${article.thumbnail}" class="imgsize"/>
								</a><br/>
					          </li>
					          <li class="product-title">
					            <a>${article.title}</a><br/>
					          </li>
					          <li class="product-price">
					            구매완료!
					          </li>
					          <li class="product-seller">
					          	<a>${article.nickname}</a>
					          </li>
					          <li class="product-date">
					          	${article.write_date}
					          </li>
					        </ul>	
						</c:when>
						<c:otherwise>
							<ul class="product">
					          <li>
					            <a href="${page}/sale/viewArticle.do?articleNO=${article.articleNO}">
									<img id="i" style="border-radius: 50%;" src="${path}/download.do?articleNO=${article.articleNO }&thumbnail=${article.thumbnail}" class="imgsize"/>
								</a><br/>
					          </li>
					          <li class="product-title">
					            <a href="${page}/sale/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a><br/>
					          </li>
					          <li class="product-price">
					            ${article.price}원 <!-- 여기에 가격 표시 -->
					          </li>
					          <li class="product-seller">
					          	<a href="javascript:void(0);" onclick="openModal({nickname: '${article.nickname}', email: '${article.email}'})">${article.nickname}</a>
					          </li>
					          <li class="product-date">
					          	${article.write_date}
					          </li>
					        </ul>
						</c:otherwise>
					</c:choose>
				</c:forEach>
						</div>
			</c:when>
		</c:choose>
	</div>
	
	
	<!-- 화면 하단의 페이지 영역 -->
	<div class="jung">
		<ul class="btn-group">
			<c:if test="${pageMaker.prev }"><!-- 이전 -->
				<li>
					<a href='<c:url value="/sale/listArticles.do?page=${pageMaker.startPage-1 }&searchType=${cri.searchType }&keyword=${cri.keyword }"/>'><span class="glyphicon glyphicon-chevron-left"></span></a>
				</li>
			</c:if>
		
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
				<li>
					<a href='<c:url value="/sale/listArticles.do?page=${pageNum }&searchType=${cri.searchType }&keyword=${cri.keyword }"/>'><i></i>${pageNum }</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li>
					<a href='<c:url value="/sale/listArticles.do?page=${pageMaker.endPage+1 }&searchType=${cri.searchType }&keyword=${cri.keyword }"/>'><span class="glyphicon glyphicon-chevron-right"></span></a>
				</li>
			</c:if>
		
		</ul>
	</div>
	
	
	<form id="formList" action="/sale/listArticles.do" method="get">
		<input type="hidden" name="page"		value="${result.currentPageNum }">
		<input type="hidden" name="size"		value="${result.currentPage.pageSize }">
		<input type="hidden" name="searchType"	value="${pageVO.type }">
		<input type="hidden" name="keyword"		value="${pageVO.keyword }">
	</form>
	
		
		
		
		<!-- 로그인이 되었나? 않되었나? 에 따라서 넘어가는 페이지가 다르도록 하기위해서 function()에 세가지 값을 넘겨준다. -->
	
	</div>

<%@ include file="../include/footer.jsp" %>

<script>
// 로그인 정보가 있으면 새로운 게시글을 쓰는 페이지로, 
// 로그인 정보가 없으면 로그인 화면으로 보낸다.
function fn_articleForm(isLogOn, articleForm, loginForm) {
	if(isLogOn != '' && isLogOn != false) {
		location.href = articleForm;
	} else {
		alert("로그인을 하신 후에 글쓰기가 가능합니다!");
		location.href = loginForm + '?action=/sale/articleForm.do';
	}
}

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

</body>
</html>



