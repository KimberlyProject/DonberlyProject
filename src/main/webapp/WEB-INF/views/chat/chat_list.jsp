<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style>
table{
	table-layout: fixed;
}
.info-img{
	width:120px;
	height:120px;
}
.new_message{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;

	
}
.row{
	clear: both;
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
label{
	vertical-align: center;
}
.pw{
	vertical-align: center;
}
.hid{
	visibility : hidden;
}

</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<c:set var="menu" value="mypage" />
<%@ include file="../include/sidebar.jsp" %>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
       홈 &gt; 마이페이지 &gt; 채팅창 목록
    </div>
	<h1 class="pageTitle"><div>채팅창 목록</div></h1>
<div class="container">
	<c:if test="${member == null}">
	<script>location.href="/member/login"</script>
	</c:if>   
	<!-- 검색창 --><!-- 
	<div style="width:1000px; height: 50px; margin-left:110px; margin-right: 0px;">
		<div class= "row" align="right" style="vertical-align:middle; float:right;">
			<select class="col-sm-2 searchgroup" id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
				<option value="a" <c:if test="{searchType} == 'a'">selected</c:if>>전체</option>
				<option value="w" <c:if test="{searchType} == 'w'">selected</c:if>>닉네임</option>
				<option value="c" <c:if test="{searchType} == 'c'">selected</c:if>>이메일</option>
				<option value="p" <c:if test="{searchType} == 'p'">selected</c:if>>상품번호</option>
			</select>
 			<input  class="col-sm-2 searchgroup form-control" type="text" class="form-control" style="width:200px;" placeholder="검색하기">
			<button id ="searchbtn" class="btn btn-secondary" type="button" style="background-color:rgb(73, 124, 64); color:#FFFFFF;">
				<span class="glyphicon glyphicon-search"/>
			</button>	
		</div>
	</div> -->
	<!-- 검색창 끝-->
	<br><br>
	<!-- 채팅한 사람들 목록 -->
	<c:forEach var="chatList" items="${chatList }" varStatus="chatId" >
	<div class="col-sm-6">
	<table class="table table-bordered table-striped table-hover" onClick="make_chat('${chatList.chatId}')">
		<tr>
			<th rowspan="2" class="info-img"><img style="width:100px; height:100px;" src="${path}/resources/images/kuromi.png" alt="프로필 사진"></th>
			<th class="pw">
				<label>
				<c:set var="chatid1" value="${chatList.chatId }"/>
				<c:set var="myname" value="${member.userId}"/>
				<c:set var="seller" value="${chatList.seller}"/>
				<c:set var="buyer" value="${chatList.buyer}"/> 
				<c:if test="${myname != seller}">
					<c:set var="othername" value="${chatList.seller }"/>
					<c:forEach var="memList" items="${nickname }">
						<c:if test="${memList.userId eq seller }">
							${memList.nickname }
						</c:if>
					</c:forEach>
					
					<!-- <span class="sellernick" id="${chatList.seller}"></span> -->
					<!-- <input class="nickname" type="hidden" value="${chatList.seller }"> -->	 <!--상대방 닉네임 들어가야함-->
				</c:if>
				<c:if test="${myname != buyer}">
				<c:set var="othername" value="${chatList.buyer }"/>
					<c:forEach var="memList" items="${nickname }">
						<c:if test="${memList.userId eq buyer }">
							${memList.nickname }<c:if test="${chatList.status == 'a' }">&nbsp;(경매장)</c:if>
					
						</c:if>
					</c:forEach>
					<!--<input class="nickname" type="hidden" value="${chatList.buyer } "> -->  <!-- 상대방 닉네임 -->
				</c:if>
				</label>
			</th>
		</tr>
		<tr>
			<c:forEach var="memList" items="${nickname }">
				<c:if test="${memList.userId eq othername }">
					<th class="pw"><label>${memList.email }</label></th>
				</c:if>
			</c:forEach>
		</tr>
		<tr>
			<th colspan="2">
				<div class="row" style="word-break:break-al; margin:0;">
					<div class="col-sm-10 new_message">
					<c:forEach var="lastchat" items="${lastChat }">
					<c:set var="chatid2" value="${lastchat.chatId}"/>
					<c:if test="${chatid1 == chatid2}">
					<div style="height: 25px;">${lastchat.chatContent}</div>
					</c:if>
					</c:forEach>
					</div><!-- 여기에 새로운 메시지 넣으면 됨 -->
					<c:forEach var="count" items="${count }">
					<c:if test="${count.chatId eq chatList.chatId }">
					<c:if test="${ count.chatRead != 0}">
					<button style="float: right;" type="button" class="btn btn-warning" disabled="disabled">${count.chatRead}</button>
					</c:if>
					<c:if test="${ count.chatRead == 0}">
					<button style="float: right;" class="btn btn-warning hid" disabled="disabled">${count.chatRead}</button>
					</c:if>
					</c:if>
					</c:forEach>
				</div>
			</th>
		</tr>
	</table>
	</div>
	</c:forEach>
	<!-- 목록 끝 -->
	<script>
	function make_chat(chatId){	
		//location.href="${path}/chat/chattingview?articleNo="+status+artNo;
	 	window.open("${path}/chat/chattingview?chatId="+chatId , "_blank", "width=940, height=750");
		
	}
	/*
	const sellers = document.querySelectorAll(".sellernick");
	sellers.forEach(item => {
		const userId = item.id;
		console.log(item);
		item.innerText = find_nickname(userId);
		
	})
	*/
	/*
	function find_nickname(memberId){
		
		 $.ajax({
			 url:	"/chat/find_nickname",
			 type:	"post",
			 dataType: "text",
			 
			 data:	{
				 "memberId" : memberId
			 },	
			 success: function(data){
				$('.pw').appeand("<label>"+data+"</label");
			 },
			 error:function(request,status,error){
				console.log(request,status,error);
			 },
			 complete:function(){ 
				
			 }
		 });
		 console.log(dd);
		 return dd;
	}
	
	$(document).ready(function(){
		find_nickname($('.nickname').val());
	});
	*/
	
	</script>

	
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>