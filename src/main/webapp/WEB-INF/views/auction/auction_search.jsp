<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
	<%@ include file="../member/profileModal.jsp" %>
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
        #keywordBtn {
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
        table-spacing {
        	margin-bottom: 20px;
        }
        .red {
        	color: red;
        }
        .blue {
        	color: blue;
        }
        .orange {
        	color: orange;
        }
        .gray {
        	color: gray;
        }
        #i {
        	width: 200px;
        	height: 200px;
        }
        #imgNull {
        	text-align: center;
        }
        .middlecenter{
			text-align: center;
			font-size: 20px;
			margin-bottom: 20px;
		}
		.btngroup {
		 	display: flex;
		 	justify-content: center;
		 	gap: 20px;
		}
     

	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	  <c:set var="menu" value="auction" />
	<%@ include file="../include/sidebar.jsp" %>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <a href="/">홈</a> &gt;
      <a href="#">경매장</a> &gt;
    </div>
    <h1 class="pageTitle"><div>경매장</div></h1>
    
	<div class="container">
		<br/><br/>
	
		<!-- 검색창 -->
      <div class= "row" align="right" style=" vertical-align:middle; float:right;">
         <select class="col-sm-2 searchgroup" id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
            <option value="t" <c:if test="{searchType} == 't'">selected</c:if>>제목</option>
            <option value="c" <c:if test="{searchType} == 'c'">selected</c:if>>내용</option>
            <option value="w" <c:if test="{searchType} == 'w'">selected</c:if>>작성자</option>
            <option value="p" <c:if test="{searchType} == 'p'">selected</c:if>>글번호</option>
         </select>
         <input  id="searchKeyword" value="${keyword}" class="col-sm-2 searchgroup form-control" type="text" class="form-control" style="width:200px;" placeholder="검색하기"/>
         <button id ="keywordBtn" class="btn btn-secondary" type="button">
            <span class="glyphicon glyphicon-search"/>
         </button>   
      </div><br><br><br>
		
		<%
		//현재시간 밀리초,
		long currentTimeMillis = System.currentTimeMillis();
		//데이터형식 변환
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDate = dateFormat.format(new java.util.Date(currentTimeMillis));
		%>
		<!-- EL식 조건문을 위한 변수설정 -->
		<c:set var="today" value="<%= formattedDate %>" />
		
		<!-- 경매 게시글 -->
		<!-- 게시글이 하나도 없는 경우 -->
		<c:choose>
		<c:when test="${empty articles}">
			<div>
				<div>
					<p align="center">
						<b><span style="font-size:22px;">등록된 게시글이 없습니다.</span></b>
					</p>
				</div>
			</div>
		</c:when>
		</c:choose>
		
		<!-- 게시글이 있는 경우 -->
		<c:choose>
		<c:when test="${articles != null}">
			<!-- 경매게시글 -->
			<table class="table table-bordered table-striped" id="ta">
		    <c:forEach var="article" items="${articles}" varStatus="articleNum">
		        <tr>
		           <c:forEach var="img" items="${imgs[articleNum.index]}" varStatus="imgNum"> <!-- 이중리스트 -->
		            <c:if test="${article.aucCode == img.aucCode}">
		                    <th rowspan="4" class="innerimg">
		                        <div class="item">
		                            <c:choose><c:when test="${img.imgName == null}">
					       				<div><br><br/><br/><br/><p id="imgNull">등록된 사진이 없습니다.</p></div>
					               	</c:when></c:choose>
					               	<c:choose><c:when test="${img.imgName != null}">
					               	<img id="i" src="${path}/auction/pullAuctionImges?imgName=${img.imgName}&aucCode=${img.aucCode}"/>
					               	</c:when></c:choose>
		                        </div>
		                    </th>    
                    </c:if>	
		            </c:forEach>
					<th class="cate">제목</th><th class="colon">:</th><th colspan="4">${article.title}</th>
					<th rowspan="4" id="detailarea">
						<br/>
						<form action="${path}auction_detail" method="get">
							<input type="hidden" name="aucCode" value="${article.aucCode}"/>
							<c:choose>
							<c:when test="${article.status == 0 && (article.deadline > today || article.deadline == today)}">
								<button  class="btn btn-warning" type="submit">자세히 보기</button>
							</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${article.deadline < today || article.status == 1 }">
								<button class="btn detailBtn" type="submit">자세히 보기</button> 
							</c:when>
							</c:choose>
						</form>
					</th>
				</tr>
				<tr>
					<th class="cate">판매자</th>
					<th class="colon">:</th>
					<th colspan="4">[<a href="javascript:void(0);" onclick="openModal({nickname: '${article.nickname}', email: '${article.email}'})">${article.aucNick}</a>]님
				</tr>
				<tr>
					<th class="cate">현재 입찰가</th><th class="colon">:</th>
						<th><fmt:formatNumber type="number" value="${article.nowBid}" pattern="#,##0"/> 원</th>
					<th class="cate">상한가</th><th class="colon">:</th>
						<th><fmt:formatNumber type="number" value="${article.maxPrice}" pattern="#,##0"/> 원</th>
				</tr>
				<tr>					 													
					<th class="cate">마감 기한</th><th class="colon">:</th>
					<th>${article.writeDate}<br/>
						<!-- 판매완료 또는 마감 -->
						<c:choose><c:when test="${article.deadline < today || article.status == 1}">
					    	~ ${article.deadline}
						</c:when></c:choose>
						<!-- 입찰중, 오늘마감  -->
					 	<c:choose><c:when test="${article.deadline == today && article.status == 0}">
					 		<span class="red">~ ${article.deadline} (오늘마감)</span>
					 	</c:when></c:choose>
					 	<!-- 입찰중, 마감 전-->
					 	<c:choose><c:when test="${article.deadline > today && article.status == 0}">
					 		<span class="orange">~ ${article.deadline}</span>
					 	</c:when></c:choose>
					</th>
					<th class="cate">진행상태</th><th class="colon">:</th>
						<!-- 입찰 진행중 blue -->
						<c:choose><c:when test="${article.status == 0 && (article.deadline > today || article.deadline == today)}"> 
							<th clospan="4"><span class="blue">입찰 진행중</span>
								<c:choose><c:when test="${article.cstmId != null}">
									&nbsp;&nbsp;&nbsp;[${article.cstmId}]님
								</c:when></c:choose>
							</th>
						</c:when></c:choose>
						<!-- 판매 완료 gray-->    <!-- 마감지났는데 입찰중인 경우 -->
						<c:choose><c:when test="${article.status == 1 || (article.deadline < today && article.cstmId != null)}">
							<th colspan="4"><span class="gray"><span class="gray">판매완료</span>&nbsp;&nbsp;&nbsp;[${article.cstmId}]님</span></th>
						</c:when></c:choose>	
						<!-- 경매 종료 gray-->    <!-- 마감지났는데 입찰안된 경우 -->
						<c:choose><c:when test="${article.deadline < today && article.cstmId == null}">
							<th colspan="4"><span class="gray">경매종료</span></th>
						</c:when></c:choose>
				</tr>
			</c:forEach>
			</table>
			<br/><br/><!--  경매 게시글 -->
		</c:when>
		</c:choose>
	
		<div class="middlecenter"> <!-- 페이징 -->
				<div class="btngroup">
				<c:if test="${pageMaker.prev}">					
				<div class="item"><!-- 숫자 버튼 -->
					<a href='<c:url value="${path}/auction/auction_maintosearch?page=${pageMaker.startPage -1}&searchType=${cri.searchType}&keyworad=${cri.keyword}"/>'>
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
				</div>				
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">							
				<div class="item">
					<a href='<c:url value="${path}/auction/auction_maintosearch?page=${pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'><i>${pageNum}</i>
					</a>
				</div>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<div class="item">
					<a href='<c:url value="${path}/auction/auction_maintosearch?page=${pageMaker.endPage + 1}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'>
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
				</c:if>
				</div>
			</div>
		</div>
		
		<button class="btn btn-success col-sm-offset-6"><a style="color:#FFFFFF;" href="${path}/auction/auction_write">상품 등록</a></button>
		<br/><br/>
		
		<form id="formList" action="${path}/auction/auction_maintosearch" method="get">
			<input type="hidden" name="page" value="${result.currentPageNum}">
			<input type="hidden" name="size" value="${result.currentPage.pageSize}">
			<input type="hidden" name="searchType" value="${searchType}">
			<input type="hidden" name="keyword" value="${keyword}">
		</form>
	</div><!-- <div class="container"> -->



<%@ include file="../include/footer.jsp" %>

<script>
	$(document).ready(function() {
		var form = $("#formList");
		
		$("#keywordBtn").click(function(e) {
			var searchType = $("#searchType").find(":selected").val();
			var keyword = $("#searchKeyword").val();
			console.log(searchType, "", keyword);
			
			form.find("[name='searchType']").val(searchType);
			form.find("[name='keyword']").val(keyword);
			form.find("[name='page']").val("1");
			form.submit();
		});
	});
	
	//경매끝난 게시글 버튼비활성화
	$(document).ready(function() {
	  var detailBtn = $(".detailBtn");
	  detailBtn.css("background-color", "gray");
	  detailBtn.css("color", "white");
	  detailBtn.prop("disabled", true);
	});
	
</script>

</body>
</html>