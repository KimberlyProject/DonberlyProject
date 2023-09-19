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
        .saleBtn {
        	width: 100px;
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
    <c:set var="menu" value="mypage" />
	<%@ include file="../include/sidebar.jsp" %>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <a href="/">홈</a> &gt;
      <a href="#">마이페이지</a> &gt;
       <a href="#">내가 올린 경매 상품</a> &gt;
    </div>
    <h1 class="pageTitle"><div>내가 올린 경매 상품</div></h1>
    
	<%
	//현재시간 밀리초,
	long currentTimeMillis = System.currentTimeMillis();
	//데이터형식 변환
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String formattedDate = dateFormat.format(new java.util.Date(currentTimeMillis));
	%>
	<!-- EL식 조건문을 위한 변수설정 -->
	<c:set var="today" value="<%= formattedDate %>" />
	
	<div class="container">
	<br/><br/>
	<a href="${path}/auction/myBid?cstmId=${member.nickname}"> > 내가 입찰한 경매 상품만 보기</a><br/><br/><br/>

		<!-- 경매 게시글 -->
		<!-- 게시글이 하나도 없는 경우 -->
		<c:choose>
		<c:when test="${empty articles}">
			<div>
				<div>
					<p align="center">
						<b><span style="font-size:22px;">등록한 경매 상품이 없습니다.</span></b>
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
		            <c:set var="firstImg" value="false" />
		            <c:forEach var="img" items="${imgs[articleNum.index]}" varStatus="imgNum"> <!-- 이중리스트 -->
		            <c:if test="${article.aucCode == img.aucCode && !firstImg}">
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
		                    <c:set var="firstImg" value="true" /> <!-- 첫 번째 이미지를 출력한 후 변수 값을 변경 -->
		               	</c:if>
		            </c:forEach>
		            <c:set var="firstImg" value="true" />
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
									<br/>[${article.cstmId}]님
									<!-- hidden 추가 이태림 -->
									<input type="hidden" class="seller" value="${article.aucId }"/>
									<input type="hidden" class="buyer" value="${article.cstmId }"/>
									<input type="hidden" class="artNo" value="${article.aucCode }"/>
									<input id="chat" type="button" class="btn btn-primary saleBtn" style="color:#FFFFFF;" value="채팅하기" onclick="chat('${article.aucId }','${article.cstmId }','${article.aucCode }')">

								</c:when></c:choose>
							</th>
						</c:when></c:choose>
						<!-- 판매 완료 orange-->
						<c:choose><c:when test="${article.status == 1}">
							<!-- hidden 추가 이태림 -->
							<input type="hidden" class="seller" value="${article.aucId }"/>
							<input type="hidden" class="buyer" value="${article.cstmId }"/>
							<input type="hidden" class="artNo" value="${article.aucCode }"/>
							<th colspan="4"><span id="gray"><span class="gray">판매완료</span><br/>[${article.cstmId}]님</span>
							<input type="button" class="btn btn-primary saleBtn chat" style="color:#FFFFFF;" value="채팅하기">
							</th>
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
					<a href='<c:url value="${path}/auction/myAuction?aucId=${member.userId}"/>'>
						<span class="glyphicon glyphicon-chevron-left"></span>
					</a>
				</div>				
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">						
				<div class="item">
					<a href='<c:url value="${path}/auction/myAuction?aucId=${member.userId}"/>'><i>${pageNum}</i></a>
				</div>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<div class="item">
					<a href='<c:url value="${path}/auction/myAuction?aucId=${member.userId}"/>'>
						<span class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
				</c:if>
				</div>
			</div>
		</div>
		
		
		
		<form id="formList" action="${path}/auction/myAuction" method="get">
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
		

		$('#chat').on("click", function(seller,buyer,artNo){
			console.log("판매자 : "+$('.seller').val()+"구매자 : "+$('.buyer').val()+"넘버 : "+$('.artNo').val());
			$.ajax({
				 url:	"/chat/makeRoom2",
				 type:	"post",
				 dataType: "text",
				 contentType: 'application/json',
				 data:	JSON.stringify({"seller":seller,
					 	"buyer" : buyer,
					 	"artNo" : artNo,
					 	"status" : "a"
						 
				 
				 }),	
				 success: function(data){
					 console.log(data);
					 window.open(data, "_blank", "width=940, height=750");
					//location.href=data;
					
				 },
				 error:function(request,status,error){
					 console.log("실패");
					 
					 
				 },
				 complete:function(){
					 $('#chatContent').val('');
				 }
			 });
		})
	});
	
	//경매끝난 게시글 버튼비활성화
	$(document).ready(function() {
	  var detailBtn = $(".detailBtn");
	  detailBtn.css("background-color", "gray");
	  detailBtn.css("color", "white");
	  detailBtn.prop("disabled", true);
	  
	  $('.chat').on("click", function(){
			console.log("판매자 : "+$('.seller').val()+"구매자 : "+$('.buyer').val()+"넘버 : "+$('.artNo').val());
			$.ajax({
				 url:	"/chat/makeRoom2",
				 type:	"post",
				 dataType: "text",
				 contentType: 'application/json',
				 data:	JSON.stringify({"seller":$('.seller').val(),
					 	"buyer" : $('.buyer').val(),
					 	"artNo" : $('.artNo').val(),
					 	"status" : "a"
						 
				 
				 }),	
				 success: function(data){
					 console.log(data);
					 window.open(data, "_blank", "width=940, height=750");
					//location.href=data;
					
				 },
				 error:function(request,status,error){
					 console.log("실패");
					 
					 
				 },
				 complete:function(){
					 $('#chatContent').val('');
				 }
			 });
		})
	});
	
	
	
</script>

</body>
</html>