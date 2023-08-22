<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
	<style>
		.colon{
			width: 4px;
		}
		.cate{
			width: 100px;
		}
		input{
			width:500px;
		}
		.pagination {
			color: rgb(73, 124, 64);
		}
		#searchbtn {
			hieght: 80%;
		}
		.searchgroup {
			padding: 3px 3px 6px 3px;
		}
		selectbox {
			margin: 0px;
		}
		.btncolor {
			color: white;
		}
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	
	<div class="container">
		<br/><br/>
		
		<div class="myroot">
			<a href="#">홈</a> >
			<a href="#">경매</a> >
			<a href="#">경매장</a>
		</div>
		<br/><br/>
		
		<img src="/resources/images/banner.jpeg" alt="배너" style="width: 1150px;">
		<br><br><br>
		
		<!-- 검색창 -->
		<div class= "row" align="right" style="vertical-align:middle; float:right;">
			<select class="col-sm-2 searchgroup" id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
				<option value="a" <c:if test="{searchType} == 'a'">selected</c:if>>전체</option>
				<option value="w" <c:if test="{searchType} == 'w'">selected</c:if>>작성자</option>
				<option value="c" <c:if test="{searchType} == 'c'">selected</c:if>>내용</option>
				<option value="p" <c:if test="{searchType} == 'p'">selected</c:if>>상품번호</option>
			</select>
 			<input  class="col-sm-2 searchgroup form-control" type="text" class="form-control" style="width:200px;" placeholder="검색하기">
			<button id ="searchbtn" class="btn btn-secondary" type="button" style="background-color:rgb(73, 124, 64); color:#FFFFFF;">
				<span class="glyphicon glyphicon-search"/>
			</button>	
		</div><!-- 검색창 -->
		<br><br><br>
		
		
		<!-- 경매 게시글 -->
		<%for(int i=0;i<3;i++){ //여기에 디비 갯수 넣으면 됨%>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th rowspan="4"><img src="#" alt="상품사진""/></th><th class="cate">제목</th><th class="colon">:</th><th colspan="4">제목~</th>
			</tr>
			<tr>
				<th class="cate">판매자</th><th class="colon">:</th><th colspan="4">판매자 ID</th>
			</tr>
			<tr>
				<th class="cate">현재 가격</th><th class="colon">:</th><th>999,999</th><th class="cate">상한가</th><th class="colon">:</th><th>999,999</th>
			</tr>
			<tr>
				<th class="cate">마감 기한</th><th class="colon">:</th><th colspan="4">2023.8.10(금) 24:00</th>
			</tr>
		</table>
		<%} %> <!--  경매 게시글 -->
		<button class="btn btn-success col-sm-offset-6"><a class="btncolor" href="/auction/auction_write">상 품 등 록</a></button>
		
		<!-- 페이징 버튼 -->
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
		
		<form id="formList" action="/board/listArticlesPaging.do" method="get">
			<input type="hidden" name="page">
			<input type="hidden" name="searchType">
			<input type="hidden" name="keyword">
		</form>
		
	</div><!-- <div class="container"> -->

<%@ include file="../include/footer.jsp" %>
</body>
</html>