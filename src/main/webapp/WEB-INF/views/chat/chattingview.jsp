<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
.wrap .ch1 .textbox {		/*텍스트 박스*/
    margin-left: 20px;
    background-color: #ddd;
    float: right;
    
    
}

.wrap .ch1 .textbox::before {
    left: -15px;
    
    color: #ddd;
}

.wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 20px;
    
    border-radius: 10px;
    font-size: 13px;
    background-color: #ddd;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
   
    top: 0;
    left: -15px;
    font-size: 1.5rem;
    color: #ddd;
}
.wrap .ch2 {
    flex-direction: row-reverse;
}

.wrap .ch2 .textbox {
    margin-right: 20px;
    background-color: #F9EB54;
    float: left;
}

.wrap .ch2 .textbox::before {
    right: -15px;
    
    color: #F9EB54;
}

.textbox{
	margin: 0;
	padding: 0;
}

.time{
	float: right;
	position: relative;
	top:60px;
}
</style>
</head>
<body>

	
	<div class="container">
	
		<table border="1" style="margin: 0px; padding: 0px;">
			<tr>
				<td bordercolor="#DCFFDC" class="chat_title" colspan="2">채팅창</td>
			</tr>
			<tr>
				<td class="chat_area">
					<div class="wrap"  style="overflow:auto; width:599px; height:600px;">
	        			<div class="chat ch1">
	            			<div class="icon"><i class="fa-solid fa-user"></i></div>
	            			<div class="textbox">안녕하세요. 반갑습니다.</div>
	            			<div class="time">2023</div>
	        			</div>
	        			<br><br><br>
	        			
	        			<div class="chat ch2">
	            			<div class="icon"><i class="fa-solid fa-user"></i></div>
	            			<div class="textbox">안녕하세요. 16일 거래 가능하신가요?</div>
	            			<div class="time">2023</div>
	        			</div>
	        			<br><br><br>
	        			
	        			<div class="chat ch1">
	            			<div class="icon"><i class="fa-solid fa-user"></i></div>
	            			<div class="textbox">네 그럼 16일 종각역에서 3시에 어떠신가요?</div>
	        			</div>
	        			<br><br><br>
        			
				        <div class="chat ch2">
				            <div class="icon"><i class="fa-solid fa-user"></i></div>
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <br><br><br>
				        <div class="chat ch2">
				            <div class="icon"><i class="fa-solid fa-user"></i></div>
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <br><br><br>
				        <div class="chat ch2">
				            <div class="icon"><i class="fa-solid fa-user"></i></div>
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <br><br><br>
				        <div class="chat ch2">
				            <div class="icon"><i class="fa-solid fa-user"></i></div>
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <br><br><br>
				        <div class="chat ch2">
				            <div class="icon"><i class="fa-solid fa-user"></i></div>
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <br><br><br>
				        <div class="chat ch2">
				            <div class="icon"><i class="fa-solid fa-user"></i></div>
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <br><br><br>
				        <div class="chat ch2">
				            <div class="icon"><i class="fa-solid fa-user"></i></div>
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <br><br><br>
				        <div class="chat ch2">
				            <div class="icon"><i class="fa-solid fa-user"></i></div>
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <br><br><br>
				        <div class="chat ch2">
				            <div class="icon"><i class="fa-solid fa-user"></i></div>
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <br><br><br>
				        <div class="chat ch2">
				            <div class="icon"><i class="fa-solid fa-user"></i></div>
				            <div class="textbox">좋습니다~ 그때 뵙겠습니다~!</div>
				        </div>
				        <br><br><br>
    				</div>
				</td>
				<td class="chat_detail" rowspan="2">
					<div>제목: 물건 팝니다.</div>
					<div>판매자: 이태림</div>
					<div>구매자: 사람</div>
					<div>상품코드: 123456</div>
					<div style="padding-bottom: 10px;">가격: 10,000원</div>
					
					<br><br><br><br><br><br><br><br>
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
						<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요" maxlength="100"></textarea>
					</div>
					<div class="form-group col-xs-3" >
						<button class="btn btn-success btn-lg" style="height:80px; width:120px;">전송</button>
						
						<div class="clearfix"></div>
					</div>
				</div>					
				</td>
			</tr>
		</table>
	</div>
	<br><br>
	

</body>
</html>