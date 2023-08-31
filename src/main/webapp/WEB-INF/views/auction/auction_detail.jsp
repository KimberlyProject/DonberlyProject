<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
		input {
			width: 100%;
			font-size: 15px;
		}
		#productimg {
			width: 500px;
		}
		textarea {
			width: 100%;
			height: 100%;
		}
		#tb1 {
			margin: 0px;
		}
		#title {
			text-align: center;
			font-size: 30px;
		}
		th {
			font-size: 15px;
		}
		.btn {
			font-color: white;
			color: white;
		}
		#formgroup {
			padding: 0px 40px;
		}
		.row {
			align: center;
		}
		#price1 {
			padding: 0px 0px 0xp 30px;
		}
		#price2 {
			padding: 0px 30px 0px 0px;
		}
		
		.buyBtn {
			width: 100px;
		}
		.saleBtn {
			width: 100px;
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
    <h1 class="pageTitle"><div>경매장</div></h1>
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
		<table id="tb1" class="table table-bordered table-striped">
			<tr><!-- 사진, 제목 -->  
				<th rowspan="7" id="productimg"><img src="#" alt="상품사진"/></th>
				<th class="cate">제목</th>
				<th class="colon">:</th>
				<th colspan="4">${articlesList.title}</th>
			<tr> <!-- 상품번호 -->
				<th class="cate">상품번호</th>
				<th class="colon">:</th>
				<th colspan="4">${articlesList.aucCode}</th>
			</tr>
			<tr> <!-- 판매자 -->
				<th class="cate">판매자</th>
				<th class="colon">:</th>
				<th colspan="4">${articlesList.aucId}</th>
			</tr>
			<tr><!-- 현재입찰가 -->
				<th class="cate">현재입찰가</th>
				<th class="colon">:</th>
				<th colspan="4">${articlesList.nowBid}원
					<c:choose>
					<c:when test="${member.userId != articlesList.aucId}">
						<input type="button" class="btn btn-success buyBtn" onClick="fn_tryBid(${articlesList.aucCode})" style="color:#FFFFFF;" value="입찰하기">  <!-- "background-color:rgb(73, 124, 64); -->
					</c:when>
					</c:choose>
					<c:choose>
					<c:when test="${member.userId == articlesList.aucId}">
						<input type="button" class="btn btn-primary saleBtn" onClick="fn_saleNow(${artiaclesList.aucCode})" style="color:#FFFFFF;" value="바로판매">  <!-- "background-color:rgb(73, 124, 64); -->
					</c:when>
					</c:choose>
				</th>
			</tr>
			<tr><!-- 입찰단위 -->
				<th class="cate">입찰단위</th>
				<th class="colon">:</th>
				<th colspan="4">${articlesList.bidRate}원</th>
			</tr>
			<tr><!-- 상한금액 -->
				<th class="cate">상한금액</th>
				<th class="colon">:</th>
				<th colspan="4">${articlesList.maxPrice}원
					<c:choose>
					<c:when test="${member.userId != articlesList.aucId}">
						<input type="button" class="btn btn-warning buyBtn" onClick="fn_buyNow()" style="color:#FFFFFF;" value="바로구매">
					</c:when>
					</c:choose>
				</th>
			</tr>
			<tr><!-- 경매기간 -->
				<th class="cate">마감기한</th>
				<th class="colon">:</th>
				<th colspan="4">${articlesList.deadline}
					<c:choose>
					<c:when test="${member.userId == articlesList.aucId}">
						<input id="auctionOff" type="button" class="btn btn-danger saleBtn" style="color:#FFFFFF;" value="경매취소">  <!-- "background-color:rgb(73, 124, 64); -->
					</c:when>
					</c:choose>
				</th>
			</tr>
		</table> 
		
		<!-- 글쓰기 -->
		<table id="tb2" class="table table-bordered table-striped table-hover">
			<tr>
				<th id="title" colspan="4" align="center">제품 상세 내용</th><!-- 내용 -->
			</tr>
			<tr>	
				<th id="textbox" colspan="4">
					<textarea rows=15>
						${articlesList.content}
					</textarea>
				</th>
			</tr>
		</table>
	</div> <!-- 컨테이너 -->
		
		
		
					
		
		
	
		

		
		
	
<script>
	
	function fn_tryBid() {
		
	}
	
	function fn_saleNow() {
		
	}
	
	function fn_buyNow() {
		
	}
	
	function fn_off() {
		
	}
	
	$(document).ready(function () {
		
		$("#auctionOff").on("click", function(){
			if(confirm("현재 입찰 중인 상품입니다. 경매를 취소하시겠습니까? 삭제된 게시글은 복원되지 않습니다.")){
				var locateion = "/auction/auctionOff?aucCode=" + ${articlesList.aucCode};
				location.href = location;
			}else{
				return;
			}
		});

	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	$(document).ready(function () {
		
		$("#nowBid").on("click", function(){
			if(confirm(${articlesList.nowBid + articlesList.bidRate} + "원에 입찰하시겠습니까? 입찰 후에는 취소 할 수 없습니다.")){
				var locateion = "/auction_updateBid?aucCode=" + ${articlesList.aucCode} + "&nowBid=" + ${articlesList.nowBid + articlesList.bidRate};
				location.href = location;
			}else{
				return;
			}
		});

		$("#maxPrice").on("click", function(){
			if(confirm(${articlesList.maxPrice} + "원에 입찰하시겠습니까? 입찰 후에는 취소 할 수 없습니다.")){
				var locateion = "/auction_updateMax?aucCode=" + ${articlesList.aucCode} + "&maxPrice=" + ${articlesList.maxPrice};
				location.href = location;
			}else{
				return;
			}
		});
		
	}); //$(document).ready(function () {
	
</script>



	<%@ include file="../include/footer.jsp" %>
</body>
</html>