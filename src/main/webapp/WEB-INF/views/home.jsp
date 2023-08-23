<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>돈벌리</title>
	<%@ include file="./include/header.jsp" %>
    <style>
        #mainBanner{
          height:500px;
          overflow:hidden;
          margin-bottom:30px;
        }
        section>h1 .sig{
          position:relative;
          animation-name:name;
          animation-duration:1s;
          animation-direction:alternate;
          animation-iteration-count: infinite;
          animation-timing-function:ease-in-out;
          bottom:0px;
        }
        section>h1, section>h2{
          font-weight: 700;
        }
        .sig{
          color:rgb(73, 124, 64);
        }
        section{
          padding:50px 0;
          font-family : 'GmarketSansMedium';
          text-align:center;
        }
        .board{
          color:#fff;
          background-image:url("${ path }/resources/images/main_banner04.jpg");
          background-position:center 100px;
          background-attachment: fixed;
        }
        section>p{
          margin:30px 0;
          font-size:18px;
        }
        section h1, .container section h2{
          margin-bottom:30px;
        }
        @keyframes name {
          0%{
            bottom:0px;
          }
          100%{
            bottom:8px;
          }
        }
    </style>
</head>
<body>
	<%@ include file="./include/topMenu.jsp" %>
	<div id="mainBanner" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li data-target="#mainBanner" data-slide-to="0" class="active"></li>
	    <li data-target="#mainBanner" data-slide-to="1"></li>
	    <li data-target="#mainBanner" data-slide-to="2"></li>
	  </ol>
	
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
	    <div class="item active">
	      <img src="${ path }/resources/images/main_banner01.jpg"/>
	    </div>
	    <div class="item">
	      <img src="${ path }/resources/images/main_banner02.jpg"/>
	    </div>
	    <div class="item">
	      <img src="${ path }/resources/images/main_banner03.jpg"/>
	    </div>
	  </div>
	
	  <!-- Controls -->
	  <a class="left carousel-control" href="#mainBanner" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#mainBanner" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	
	<section>
	  <h1>돈이 되는 <span class="sig">돈벌리!</span></h1>
	  <p><span class="sig">중고 거래</span>와 <span class="sig">경매</span>로, 당신의 물건을 <span class="sig">거래</span>해보세요</p>
	</section>
	
	<section class="board">
	  <h2>장터</h2>

	  <p>당신의 물건을 거래 해 보세요</p>

	  <p><a class="btn btn-success btn-lg" href="#" role="button">장터 바로가기</a></p>
	</section>
	
	<section>
	  <h2>경매장</h2>
	  <p>중고 물품을 입찰하거나 판매 해 보세요</p>
	  <p><a class="btn btn-success btn-lg" href="/auction/auction_main" role="button">경매장 바로가기</a></p>
	</section>
	<%@ include file="./include/footer.jsp" %>
</body>
</html>
