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


<!---->
.chat_title{
	background-color:#3CB371;
	color:#ffffff;
	font-size:20px;
	text-align: center;
	vertical-align: center;
	width:1300px; height: 50px;
}

.chat_area{
	width:700px; height:600px;
	align-content: center;
	background-color: #DCFFDC;
}
.chat_detail{
	width:500px;
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

</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
	<br>
	<div class="container">
	
		<table border="1">
			<tr>
				<td bordercolor="#DCFFDC" class="chat_title" colspan="2">채팅창</td>
			</tr>
			<tr>
				<td class="chat_area">
					채팅치는곳
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
						<a href="#" class="myButton" onclick="submitFunction()" style="text-decoration: none;">전송</a>
						<div class="clearfix"></div>
					</div>
				</div>					
				</td>
			</tr>
		</table>
	</div>
	<br><br>
	
<%@ include file="../include/footer.jsp" %>
</body>
</html>