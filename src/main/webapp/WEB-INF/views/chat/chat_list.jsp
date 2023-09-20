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

h2{
	text-align: center;
	vertical-align: center;
	height: 340px;
}
</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<c:set var="menu" value="mypage" />
<%@ include file="../include/sidebar.jsp" %>
    <div class="page_dir container">
      <button id="sideMenu_open"><span class="glyphicon glyphicon-th-large"></span></button>
       홈 &gt; 마이페이지 &gt; 채팅창 목록
    </div>
	<h1 class="pageTitle"><div>채팅창 목록</div></h1>
<div class="container">
	<c:if test="${member == null}">
	<script>location.href="/member/login"</script>
	</c:if>
	<br><br>
	<!-- 채팅한 사람들 목록 -->
	<c:if test="${empty chatList}">
		<h2>현재 채팅 중인 채팅방이 없습니다.</h2>
	</c:if>
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
							${memList.nickname }<c:if test="${chatList.status == 'a' }"></c:if>
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
			<th colspan="2" height=50 style="word-break:break-all;">
				<div class="row" style="word-break:break-al; margin:0; vertical-align:center;">
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
					<!-- <button style="float: right;" type="button" class="btn btn-warning" disabled="disabled">${count.chatRead}</button>--><!-- 알람 디자인 -->
						<div style="vertical-align:center; color:white; background-color: orange; display: inline-block; border-radius: 15px;" >&nbsp;&nbsp;${count.chatRead}&nbsp;&nbsp;</div>
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
	</script>

	
	
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>