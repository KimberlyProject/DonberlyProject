<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<style>
.myButton {
	box-shadow: 0px 10px 14px -7px #3e7327;
	background-color:#77b55a;
	border-radius:4px;
	border:1px solid #4b8f29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:16px;
	font-weight:bold;
	padding:20px 30px;
	text-decoration:none;
	text-shadow:0px 1px 0px #5b8a3c;
}
.myButton:hover {
	background-color:#72b352;
}
.myButton:active {
	position:relative;
	top:1px;
}

table{
	border-radius: 10px;
}     

a {
    text-decoration: none;
}
.container{
	margin:0;
	padding:0;
}
body{
	padding:0;
	margin-right:0px;
	width: 969px;
	overflow: hidden;
}
html{
	width: 969px;
	margin: 0;
	padding:0;
	overflow: hidden;
}

<!-- -->
.chat_title{
	background-color:rgb(73, 124, 64);
	color:#ffffff;
	font-size:20px;
	text-align: center;
	vertical-align: center;
	width:998px; height: 50px;
}

.chat_area{
	width:599px; height:600px;
	align-content: center;
	background-color: #DCFFDC;
}
.chat_detail{
	width:399px;
	vertical-align:top;
	text-align: center;
	font-size: 20px;
	
}

.chat_text{
	height: 100px;
}
.chat_text>textarea{
	
	width: 400px; height:60px;
	float:left;
	
}
.chat_text>a{
	vertical-align: center;
}

.form-group{
	margin: 5px 0 0 10px;
	
}

.col-xs-6{
	margin-left: 0px; padding-left:0;
}

.chat_detail>div{
	text-align:left;
	padding-left:20px;
	padding-top: 20px;
}
.chat_detail>button, .chat_detail>.dropdown>button{
	text-align: center;
	width:300px;	
}

.chat_detail>.dropdown>div{
	padding:10px;
	left:20px;
	width:300px;
}
.chat_detail>.dropdown>div>input, .chat_detail>.dropdown>div>textarea, .chat_detail>.dropdown>div>button{
	display:block;
	width:100%;
}
.chat_detail>.dropdown>div>textarea{
	margin:10px 0;
}
.col-xs-3{
	margin-left: 0;
	padding-left: 10px;
}

.ballon {
    display: none;
    position: absolute;
    width: 205px;
    height: 40px;
    left: 448px;
    bottom: 62px;
    background: #484848;
    color: white;
    border-radius: 5px;
    padding: 12px 12.8px;
}


.ballon:a {
    border-top: 10px solid #484848;
    border-left: 10px solid transparent;
    border-right: 10px solid transparent;
    border-bottom: 0px solid transparent;
    content: "";
    position: absolute;
    top: 40px;
    left: 160px;
}
.row{
	width:969px;
}
<!---->

a {
    text-decoration: none;
}

.wrap {
    padding: 40px 0;
    background-color: #A8C0D6;
}

.wrap .chat {
    display: flex;
    align-items: flex-start;
    padding: 20px;
}

.wrap .chat .icon {
    position: relative;
    overflow: hidden;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background-color: #eee;
}

.wrap .chat .icon i {
    position: absolute;
    top: 10px;
    left: 50%;
    font-size: 2.5rem;
    color: #aaa;
    transform: translateX(-50%);
}

.wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    font-size: 13px;
    border-radius: 10px;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.wrap .ch1 .textbox {
    margin-left: 20px;
    background-color: #ddd;
}

.wrap .ch1 .textbox::before {
    left: -15px;
    /*content: "◀";*/
    color: #ddd;
}

.wrap .ch2 {
    flex-direction: row-reverse;
}

.wrap .ch2 .textbox {
    margin-right: 20px;
    background-color: #F9EB54;
}

.wrap .ch2 .textbox::before {
    right: -15px;
    /*content: "▶";*/
    color: #F9EB54;
}
.time2{
	vertical-align: bottom;
	text-align: right;
	padding-right: 40px;
}
.time1{
	padding-left:30px;
}
div.chat.ch1, div.chat.ch2{
	padding-bottom: 0px;
}
div.chat.ch1{
	padding-left: 0;
}
div.chat.ch2{
	padding-right: 0;
}
.chat_date{
	text-align:center;
	background-color: #F0FFF0;
}

.chat_detail{
	position: relative;
	z-index: 10;
}
span{
	color:yellow;
}
</style>
</head>
<body>

	
	<div class="container">
					<c:set var="s" value="s"/>
					<c:set var="b" value="b"/>
					<c:set var="a" value="a"/>
	
		<table border="1" style="margin: 0px; padding: 0px;">
			<tr>
					<c:forEach var="ni" items="${findNickname }">
						<c:if test="${ni.userId == chatList.buyer }">
							<c:set var="buy" value="${ni.nickname }"/>
						</c:if>
						<c:if test="${ni.userId == chatList.seller }">
							<c:set var="sel" value="${ni.nickname }"/>
						</c:if>
					</c:forEach>
				<c:if test="${chatList.status eq 's' || chatList.status eq 'b'}"><!-- 상대방 닉네임을 가져와야함 -->
					<c:if test="${member.userId == chatList.seller}">
						<td bordercolor="#DCFFDC" class="chat_title" colspan="2">&lt;${buy }&gt;님과의 채팅창</td>
						<input type="hidden" class="nicknick" value="${buy }"/>
					</c:if>
					<c:if test="${member.userId == chatList.buyer}">
						<td bordercolor="#DCFFDC" class="chat_title" colspan="2">&lt;${sel }&gt;님과의 채팅창</td>
						<input type="hidden" class="nicknick" value="${sel }"/>
					</c:if>
				</c:if>
				<c:if test="${chatList.status eq 'a'}"><!-- 상대방 닉네임을 가져와야함 -->
					<c:if test="${member.userId == chatList.seller}">
						<td bordercolor="#DCFFDC" class="chat_title" colspan="2">&lt;${buy }&gt;님과의 채팅창</td>
						<input type="hidden" class="nicknick" value="${buy }"/>
					</c:if>
					<c:if test="${member.userId == chatList.buyer}">
						<td bordercolor="#DCFFDC" class="chat_title" colspan="2">&lt;${sel }&gt;님과의 채팅창</td>
						<input type="hidden" class="nicknick" value="${sel }"/>
					</c:if>
				</c:if>
			</tr>
			<tr>
				<td class="chat_area">
					<div class="wrap"  style="overflow:auto; width:599px; height:600px;">
						
    				</div>
				</td>
				<td class="chat_detail" rowspan="2">
					<!-- 게시판에서 만들어진 채팅방일 때 -->
					<c:if test="${chatList.status eq 's' || chatList.status eq 'b'}">
					<c:set var="userId" value="${session.userId }"/>
					<c:set var="seller" value="${chatList.seller}"/>
					<c:set var="buyer" value="${chatList.buyer }"/>
					<div>제목 : ${session.title} (게시판)</div>
						<div>판매자: ${sel}</div>
						<div>구매자: ${buy}</div>
					<div>코드 : ${session.p_code }</div>
					<div style="padding-bottom: 10px;">가격: ${session.price}원</div>
					<input type="hidden" value="${session.articleNO}" class="code">
					<img src="${path}/resources/images/board/article_image/${session.articleNO }/${session.thumbnail}" alt="사진" width="200px;" height="200px;"/>
					<br>
					</c:if>
					<!-- 경매장에서 만들어진 채팅방일 때 -->
					<c:if test="${chatList.status eq 'a'}">
					<c:set var="userId" value="${session.aucId }"/>
					<c:set var="seller" value="${chatList.seller}"/>
					<c:set var="buyer" value="${chatList.buyer }"/>
					<div>제목 : ${session.title} (경매장)</div>
					<c:if test="${seller eq  userId}"><!-- 판매자 시점에서 현재 채팅자는 chatList에 들어있는 buyer -->
						<div>판매자: ${session.aucNick}</div>
						<c:if test="${session.cstmId == null }">
						<div>현재 구매자: 없음</div>
						</c:if>
						<c:if test="${session.cstmId != null }">
						<div>현재 구매자: ${session.cstmId }</div>
						</c:if>
						<c:forEach var="nickname" items="${findNickname}">
							<c:if test="${chatList.buyer == nickname.userId }">
								<div>현재 채팅자: ${nickname.nickname }</div><!-- 여기만 닉네임으로 바꿔주면됨 -->
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${buyer eq userId}"> <!-- 구매자 시점에서 현재 채팅자는 본인 -->
						<div>판매자: ${session.aucNick }</div>
						<div>현재 구매자: ${session.cstmId }</div>
						<div>현재 채팅자: ${member.nickname }</div>
					</c:if>

					<!-- <div>코드 : ${session.aucCode }--><input type="hidden" value="${session.aucCode}" class="code">
					<div style="padding-bottom: 10px;">가격: ${session.nowBid}원</div>
					<!-- 경은 테스트 -->	
					<img id="i" src="${path}/auction/pullAuctionImges?imgName=${aucimgsession.imgName}&aucCode=${session.aucCode}"/>			   
					<!-- 경은 테스트 끝 -->
					<br>
					</c:if>
					<!-- 끝 -->
					

					<div class="dropdown">
						<button type="button" class="btn btn-success btn-lg" id="schedule" data-toggle="dropdown">일정 추가</button>
						<div class="dropdown-menu" aria-labelledby="schedule">
						  <input type="date" id="scheduleData">
						  <textarea id="contents"></textarea>
						  <button class="btn btn-success" onClick="calendar_insert()">일정 추가</button>
						</div>
					</div>
					<br>
					<button type="button" class="btn btn-danger btn-lg" onclick="reportPerson()">신고 하기</button>
					<br><br>
					<button type="button" class="btn btn-warning btn-lg" id="getin" onClick="chatOut()">채팅방 나가기</button>
				</td>
			</tr>
			<tr>
				<td class="chat_text"  colspan="2">
				<div class="row" style="height: 90px;">
					
						<div class="form-group col-xs-5">
							<textarea style="height: 80px; width:440px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요" maxlength="100"></textarea>
							<input id="userId" type="hidden" value="${member.userId}">
							<input id="chatId" type="hidden" value="<%=request.getParameter("chatId")%>">
							
						</div>
						<div class="form-group col-xs-4" style="padding-left:55px;">
							<button class="btn btn-success btn-lg sendText" style="height:80px; width:120px;">전송</button>
							<div class="clearfix"></div>
						</div>
				</div>
				</td>
			</tr>
		</table>
	</div>
	<br><br>
<script>
</script>
<script>



function reportPerson(){
	var nickname = $('.nicknick').val();
	if (confirm("신고하시겠습니까?") == true){//확인
		if (window.opener && !window.opener.closed){
			window.opener.location = "${path}/ccenter/report?report="+nickname;
		}
		else{
			window.open("${path}/ccenter/report?report="+nickname);
		}
		window.close();
	 }else{   //취소
	     return false;
	 }
	
}





function getChat(){
	 $.ajax({
		 url:	"${path}/chat/getChat",
		 type:	"post",
		 dataType: "json",
		 data:	{
			 "fromId" : $('#userId').val(),
			 "chatId" : $('#chatId').val()
		 },	
		 success: function(data){
			 var html="";
			 
			 for(var i=0 ; i<data.length;i++){
				 	var dd = data[i].chatTime;
				 	var read = "";
				 	const date = new Date(dd);
				 	
				 	if(data[i].chatRead==0){
				 		read = "";
				 	}
				 	else{
				 		read=data[i].chatRead;
				 	}
				 	
					if(data[i].fromId == $('#userId').val()){
						html+=
						"<div class='chat ch2'><div class='textbox'>"+data[i].chatContent+"</div></div>"+
						"<div class='time2' ><span>"+read+"</span> &nbsp;&nbsp;"+date.getHours()+"시"+date.getMinutes()+"분</div>";
					}
					else{
						html+=
						"<div class='chat ch1'><div class='textbox'>"+data[i].chatContent+"</div></div>"+
						"<div class='time1' >"+date.getHours()+"시"+date.getMinutes()+"분<span>&nbsp;&nbsp;"+read+"</span></div>";
					}
			 }
			 
			 $('.wrap').html(
				html
			 );
			 const chatbox = document.querySelector(".wrap");
			 chatbox.scrollTop = chatbox.scrollHeight;
		 },
		 error:function(request,status,error){
			 console.log("실패");
		 },
		 complete:function(){ 
			
		 }
	 });
}

$(document).ready(function(){
	
	setInterval(getChat,500);
	
	var sin = $('#chatContent').val();
	let count = 0;
	setInterval(() => console.log(sin), 2000);
	
	$('.sendText').on('click',function(){ //전송 버튼을 눌렀을 때
		
		var con = $('#chatContent').val();
		var now = new Date();
		
		if($('#chatContent').val()){ //텍스트 박스에 값이 있을 때
			 $.ajax({
				 url:	"${path}/chat/chattingview",
				 type:	"post",
				 dataType:"text",
				 data:	{"content" : $('#chatContent').val(),
						 "fromId" : $('#userId').val(),
						 "chatId" : $('#chatId').val()
				 },	
				 success: function(){
					
				 },
				 error:function(request,status,error){
					 console.log("실패");
				 },
				 complete:function(){
					 $('#chatContent').val('');	//텍스트 박스 비우기
				 }
			 });
		}else{
			alert("내용을 입력해주세요.");
		}
		
	});
});

function chatOut(){
	 if (confirm("채팅방에서 나가시겠습니까? 나가면 모든 대화기록이 삭제 됩니다.") == true){    //확인
		$.ajax({
			 url:	"${path}/chat/outChat",
			 type:	"post",
			 dataType:"text",
			 data:	{
					 "chatId" : $('#chatId').val()
			 },	
			 success: function(){
				window.close();
			 },
			 error:function(request,status,error){
				 console.log("실패");
			 },
			 complete:function(){
				 $('#chatContent').val('');
			 }
		 });
 
	 }else{   //취소

	     return false;

	 }
	 
	
}

function calendar_insert(){
	
	if(!$('#scheduleData').val()){
		alert("날짜를 선택해 주세요.");
		return false;		
	}
	if(!$('#contents').val()){
		alert("일정 내용을 입력해 주세요.");
		return false;		
	}
	 
	if(confirm("일정을 등록하시겠습니까?")){
		$.ajax({
			 url:	"${path}/mypage/calendar",
			 type:	"post",
			 data:	{					 
					 "userId" :  $('#userId').val(),
					 "articleId" : $('.code').val(),
					 "status" : "${chatList.status}",
					 "schedule" : $('#scheduleData').val(),
					 "contents" : $('#contents').val()
			 },	
			 success: function(data){
				 console.log(data);
				alert("일정에 추가되었습니다.");
			 },
			 error:function(request,status,error){
				 console.log("실패");
			 },
			 complete:function(){
			 }
		 });		
	}
}



</script>

</body>
</html>