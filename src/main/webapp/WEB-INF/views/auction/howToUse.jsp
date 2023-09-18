<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>경매장 이용방법</title>
	<%@ include file="../include/header.jsp" %>
	<style>
		.content {
			text-align: center;
			vertical-align: middle;
		}
		.title {
			color: rgb(73, 124, 64);
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
      <a href="#">경매장 이용방법</a> &gt;
    </div>
    <h1 class="pageTitle"><div>경매장 이용방법</div></h1>
    
    <div class="content">
    	
    	<h1>돈벌리 경매장에 오신 것을 환영합니다!<br/><br/></h1>
    	
    	<h3>경매란?<br/><br/></h3>
    	<h3>상품의 가격을 판매자가 미리 정하지 않고,<br/><br/>
    		구매 희망자(입찰자)들이 희망하는 가격을 적어내면<br/><br/>
    		그 중 최고가를 적은 입찰자에게 판매(낙찰)하는 방식을 말합니다. <br/><br/>
    		우리, 돈벌리에서는 빠르고 안전한 경매중고거래를 제공하고 있습니다.<br/><br/>
    	</h3>
    	
    	<h2>[경매 상품 올리기]</h2>
    	<div class="title">
			<h4>1. 모든 게시글은 업로드와 동시에 경매가 시작됩니다.</h4>
			<h4>2. 실시간으로 입찰이 진행되므로, 게시글은 수정할 수 없습니다.</h4>
			<h4>3. 상품의 첫번째 사진이 썸네일로 보여집니다.</h4>
			<h4>4. 경매 마감기한 내에 입찰자가 없어도 경매 마감기한을 연장할 수 없습니다.</h4>
			<h4>5. 마감 전 ‘바로판매’ 버튼을 누르지 않으면 마지막 입찰자에게 판매됩니다.</h4>
			<h4>6. 내가 올린 상품에 입찰/구매한 사람과의 채팅은 <a href="${path}/mypage/myInfo.do">마이페이지</a> > <a href="${path}/auction/myAuction">경매내역</a>에서 가능합니다.</h4>
		</div>
		<br/><br/><br/>
		
		<h2>[경매 참여하기]</h2>
		<div class="title">
			<h4>1. ‘입찰하기’를 누르면 입찰자의 닉네임과 현재 입찰가가 즉시 변경됩니다.</h4>
			<h4>2. ‘바로구매’를 누르면 판매자가 설정한 상한금액으로 구매가 이루어집니다.</h4>
			<h4>3. 경매에 참여하는 ‘입찰하기’와 ‘바로구매’가 완료되면 취소할 수 없습니다.</h4>
		</div>
		<br/><br/><br/>
		
		<h2>[경매 관리하기]</h2>
		<div class="title">
			<h4>1. <a href="${path}/mypage/myInfo.do">마이페이지</a>로 이동하면 내가 올린 경매상품 및 입찰에 참여한 상품을 보실 수 있습니다.</h4>
			<h4>2. 중고상품의 직접 거래를 원하시면 <a href="${path}/sale/listArticles.do">장터</a>를 이용해 주세요.</h4>
		</div>
		<br/><br/><br/>
		<h3>추가로 궁금하신 사항은 <a href="${path}/ccenter/notice">고객센터</a>를 통해 문의주시면 빠르게 도와드릴 수 있습니다.<br/>
		'돈이되는 돈벌리'를 이용해주셔서 감사합니다.</h3><br/><br/><br/>
		
		 <p><a class="btn btn-success btn-lg" href="${path}/auction/auction_main" role="button">경매장 바로가기</a></p>
    </div>
    
    <br/><br/><br/>
    
    
    



<%@ include file="../include/footer.jsp" %>
</body>
</html>