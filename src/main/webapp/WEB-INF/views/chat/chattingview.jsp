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

<!---->
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
.chat_detail>button{
	text-align: center;
	width:300px;
	
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

</style>
</head>
<body>

	
	<div class="container">
	
		<table border="1" style="margin: 0px; padding: 0px;">
			<tr>
				<td bordercolor="#DCFFDC" class="chat_title" colspan="2">과의 채팅창</td>
			</tr>
			<tr>
				<td class="chat_area">
					<div class="wrap"  style="overflow:auto; width:599px; height:600px;">
						<!-- 시작 날짜! -->
						<div class="chat_date">
							<div class="textbox">2023년 8월 28일</div>
						</div>
						<!-- 날짜 끝! -->
						<!-- 상대방이 ch1 -->
	        			<div class="chat ch1">
	            			<div class="textbox">안녕하세요. 반갑습니다.</div>
	        			</div>
	            		<div class="time1" >20시30분</div>
	        			<!-- 묶음 끝 -->
	        			
	        			<!-- 내가 ch2 -->
	        			<div class="chat ch2">
	            			<div class="textbox">안녕하세요. 16일 거래 가능하신가요? 제가 1212121212121212121212ㅇㅎㄶㄶ55555555555555555555ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ5ㄶㄶㄷㄴㄷㅎㄴㅇㄹㄹㄹㄹㅇㅎㅇㅀㅇㅎㄹㅇㅀㅇㅀㅇㅀㅇㅀㅇㅎㄹㄹㄹㄹㄹㄹㄹㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㅎㅎㅎㅎㅎㅎㅎㅎ1212</div>
	        			</div>
	            		<div class="time2" >20시30분</div>
	        			<!-- 묶음 끝 -->
	        			
	        			<div class="chat ch1">
	            			<div class="textbox">네 그럼 16일 종각역에서 3시에 어떠신가요?</div>
	        			</div>
	            		<div class="time1" >20시30분</div>
	        			
        			
				        <div class="chat ch2">
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <div class="time2" >20시30분</div>
				        
				        <div class="chat ch2">
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <div class="time2" >20시30분</div>
				        
				        <div class="chat ch2">
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <div class="time2" >20시30분</div>
				        
				        <div class="chat ch2">
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <div class="time2" >20시30분</div>
				        
				        
				        
    				</div>
				</td>
				<td class="chat_detail" rowspan="2">
					
					<div>${a.title}</div>
					<div>${chat.seller} 판매자사람(글작성자)</div>
					<div>${chat.buyer}</div>
					<div>${a.p_code}</div>
					<div style="padding-bottom: 10px;">${a.price}</div>
					
					<img src="${path}/resources/images/kuromi.png" alt="사진" width="200px;" height="200px;"/>
					<br><br>
					<button type="button" class="btn btn-success btn-lg">일정 추가</button>
					<br><br>
					<button type="button" class="btn btn-danger btn-lg">신고 하기</button>
					<br><br>
					<button type="button" class="btn btn-warning btn-lg">나가기</button>
				</td>
			</tr>
			<tr>
				<td class="chat_text"  colspan="2">
				<div class="row" style="height: 90px;">
					
						<div class="form-group col-xs-5">
							<textarea style="height: 80px; width:440px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요" maxlength="100"></textarea>
							<input id="userId" type="hidden" value="${member.userId}">
							<input id="articleNo" type="hidden" value="<%=request.getParameter("articleNo")%>">
							
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
$(document).ready(function(){
	
	
	
	
	$('.sendText').on('click',function(){
		
		var con = $('#chatContent').val();
		var now = new Date();
		console.log($('#chatContent').val());
		//예약 확정/취소를 선택한다.
		if($('#chatContent').val()){
			 $.ajax({
				 url:	"/chat/chattingview",
				 type:	"post",
				 dataType:	"text",
				 data:	{"content" : $('#chatContent').val(),
						 "fromId" : $('#userId').val(),
						 "articleNo" : $('#articleNo').val()
				 
				 },	//클릭한 좌석번호
				 success: function(data){
					$(".wrap").append(
						"<div class='chat ch2'><div class='textbox'>"+$('#chatContent').val()+"</div></div>"+
						"<div class='time2' >"+now.getHours()+"시"+now.getMinutes()+"분"+"</div>"
					);
					
				 },
				 error:function(request,status,error){
					 console.log("실패");
					 
				 },
				 complete:function(){
					 $('#chatContent').val('');
				 }
			 });
		}else{//취소(아니오) 버튼을 눌렀을 경우
			alert("예약을 취소합니다.");
		}
		
	});
});
</script>

</body>
</html>