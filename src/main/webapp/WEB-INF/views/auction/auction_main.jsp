<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
		selectbox {
			margin: 0px;
		}
		.btncolor {
			color: white;
		}
		input {
           width:            500px;
        }
        .pagination {
           color:             rgb(73, 124, 64);
        }
        #searchbtn {
           height:          2.4em;
           background-color:   rgb(73, 124, 64);
           color:            #FFFFFF;
           margin-right:      15px;   
        }
        .searchgroup {
           padding:         3px 3px 6px 3px;
        }
        .innerimg {
        	width: 200px;
        	height: 200px;
        }
        #detailarea {
        	vertical-align: middle;
        	text-align: center;
        }
        
        #ta {
        	border : 1px;
        }

	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	    <aside id="sideMenu">
      <h2>마이페이지</h2>
      <ul>
        <li><a href="#">내 정보 수정</a></li>
        <li>
          <a href="#">거래내역</a>
          <ul>
            <li><a href="#">삽니다</a></li>
            <li><a href="#">팝니다</a></li>
          </ul>
        </li>
        <li><a href="#">경매</a>          
          <ul>
            <li><a href="#">판매</a></li>
            <li><a href="#">구매</a></li>
          </ul>
        </li>
        <li><a href="#">캘린더</a></li>
        <li><a href="#">채팅목록</a></li>
      </ul>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <a href="/">홈</a> &gt;
      <a href="#">마이페이지</a> &gt;
      <a href="./">캘린더</a>
    </div>
    <h1 class="pageTitle"><div>캘린더</div></h1>
    
	<div class="container">
		<br/><br/>
	
		<!-- 검색창 -->
      <div class= "row" align="right" style=" vertical-align:middle; float:right;">
         <select class="col-sm-2 searchgroup" id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
            <option value="a" <c:if test="{searchType} == 'a'">selected</c:if>>전체</option>
            <option value="w" <c:if test="{searchType} == 't'">selected</c:if>>제목</option>
            <option value="c" <c:if test="{searchType} == 'c'">selected</c:if>>내용</option>
            <option value="w" <c:if test="{searchType} == 'w'">selected</c:if>>작성자</option>
            <option value="p" <c:if test="{searchType} == 'p'">selected</c:if>>상품번호</option>
         </select>
         <input  class="col-sm-2 searchgroup form-control" type="text" class="form-control" style="width:200px;" placeholder="검색하기">
         <button id ="searchbtn" class="btn btn-secondary" type="button"">
            <span class="glyphicon glyphicon-search"/>
         </button>   
      </div>
         <!-- 검색창 -->
		<br><br><br>
		
		<!-- 경매 게시글 -->
		<!-- 게시글이 하나도 없는 경우 -->
		<c:choose>
		<c:when test="${articlesList == null}">
			<div>
				<div colspan="4">
					<p align="center">
						<b><span style="font-size:22px;">등록된 게시글이 없습니다.</span></b>
						</p>
				</div>
			</div>
		</c:when>
		</c:choose>
		<!-- 게시글이 있는 경우 -->
		<c:choose>
		<c:when test="${articlesList != null}">
			<!-- 경매게시글 -->
			<table class="table table-bordered table-striped" id="ta">
				<c:forEach var="article" items="${articlesList}" varStatus="articleNum">
				<tr>
					<th rowspan="4"  class="innerimg">
							<div>
								<img src="${page}/board/viewArticle.do?articleNO=${article.aucCode}&thumbnail=${articles.imgNo}" arl="auc1" width="200" height="200"/>
							</div>
					</th>
					<th class="cate">제목</th><th class="colon">:</th><th colspan="4">${article.title}</th>
					<th rowspan="4" id="detailarea">
						<br/>
						<form action="${path}auction_detail" method="get">
							<input type="hidden" name="aucCode" value="${article.aucCode}"/>
							<button class="btn btn-warning" type="submit">자세히 보기</button>
						</form>
					</th>
				</tr>
				<tr>
					<th class="cate">판매자</th><th class="colon">:</th><th colspan="4">${article.aucId}</th>
				</tr>
				<tr>
					<th class="cate">현재 가격</th><th class="colon">:</th><th>999,999</th><th class="cate">상한가</th><th class="colon">:</th><th>${article.maxPrice}</th>
				</tr>
				<tr>
					<th class="cate">마감 기한</th><th class="colon">:</th><th colspan="4">${article.deadline}</th>
				</tr>
				</c:forEach>
			</table><!--  경매 게시글 -->
		</c:when>
		</c:choose>
		
		
	
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
		<button class="btn btn-success col-sm-offset-6"><a style="color:#FFFFFF;" href="/auction/auction_write">상품 등록</a></button>
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