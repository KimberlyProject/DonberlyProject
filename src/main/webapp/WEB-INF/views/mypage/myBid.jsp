<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
            <li><a href="/auction/myAuction">내가 올린 상품만 보기</a></li>
            <li><a href="/auction/myBid">내가 입찰한 상품만 보기</a></li>
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
       <a href="#">경매내역</a> &gt;
    </div>
    <h1 class="pageTitle"><div>경매내역</div></h1>
    
    
    <%
	//로그인 세션 없으면 로그인을 먼저 하도록 한다.
	if(session.getAttribute("isLogOn") == null) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('로그인이 필요합니다.');");
		pw.println("location.href='/member/login?action=/auction/auction_wirte';");
		pw.println("</script>");
		pw.flush();
		pw.close();
	}
	%>
    
    
	<div class="container">
		<br/><br/>
		
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
		<c:when test="${empty article.cstmId == member.userId}">
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
				<c:choose>
				<c:when test="${article.cstmId == member.userId}"> <!-- 내가 입찰한 글만 보여주기 -->
			    <tr>
			        <th rowspan="4" class="innerimg">
			            <c:forEach var="img" items="${imgs}" varStatus="imgNum">
			                <c:if test="${articleNum.index == imgNum.index}"> <!-- 첫번째 사진만 출력 -->
			                    <div class="item">
			                        <img id="i" src="${path}/auction/pullAuctionImges?imgName=${img.imgName}&aucCode=${img.aucCode}"/>
			                    </div>
			                </c:if>
			            </c:forEach>
			        </th>
					<th class="cate">제목</th><th class="colon">:</th><th colspan="4">${article.title}</th>
					<th rowspan="4" id="detailarea">
						<br/>
						<form action="${path}auction_detail" method="get">
							<input type="hidden" name="aucCode" value="${article.aucCode}"/>
							<c:choose>
							<c:when test="${article.status == 0 }">
								<button  class="btn btn-warning" type="submit">자세히 보기</button>
							</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${article.status == 1 }">
								<button class="btn detailBtn" type="submit">자세히 보기</button>
							</c:when>
							</c:choose>
						</form>
					</th>
				</tr>
				<tr>
					<th class="cate">판매자</th><th class="colon">:</th><th colspan="4">[${article.aucId}]님</th>
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
						<c:choose><c:when test="${article.status == 0}"> 
							<th clospan="4"><span class="blue">입찰 진행중</span>
								<c:choose><c:when test="${article.cstmId != null}">
									&nbsp;&nbsp;&nbsp;[${article.cstmId}]님
								</c:when></c:choose>
							</th>
						</c:when></c:choose>
						<!-- 판매 완료 orange-->
						<c:choose><c:when test="${article.status == 1}">
							<th colspan="4"><span id="gray"><span class="gray">판매완료</span>&nbsp;&nbsp;&nbsp;[${article.cstmId}]님</span></th>
						</c:when></c:choose>	
				</tr>
				</c:when>
				</c:choose>
				</c:forEach>
			</table><br/><br/><!--  경매 게시글 -->
		</c:when>
		</c:choose>
	
		<table>
			<tr> <!-- 페이징 -->
 				<td>
					<div class="col-sm-offset-3"><!-- 숫자 버튼 -->
						<ul class="btn-group pagination">
							<c:if test="${pageMaker.prev}">
								<li>
									<a href='<c:url value="/auction/auction_main.do?page=${pageMaker.startPage -1}&searchType=${cri.searchType}&keyworad=${cri.keyword}"/>'>
										<span class="glyphicon glyphicon-chevron-left"></span></a>
								</li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
								<li>
									<a href='<c:url value="/auction/auction_main.do?page=${pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'><i>${pageNum}</i></a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li>
									<a href='<c:url value="/auction/auction_main.do?page=${pageMaker.endPage + 1}&searchType=${cri.searchType}&keyword=${cri.keyword}"/>'>
										<span class="glyphicon glyphicon-chevron-right"></span></a>
								</li>
							</c:if>
						</ul>
					</div><!-- 숫자 버튼 -->
				</td>
			</tr>
		</table> <br/>
	
		<br/><br/>
		
		<form id="formList" action="/auction/auction_main.do" method="get">
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
	

</script>

</body>
</html>