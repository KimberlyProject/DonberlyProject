<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header -->
<script>
$(document).ready(function(){
	console.log("시작");
	alarm();
	//setInterval(alarm,500);
});
function gochat(chatId){
	window.open("${path}/chat/chattingview?chatId="+chatId , "_blank", "width=940, height=750");
}
function alarm(){
	$.ajax({
		 url:	"${path}/chat/alarm",
		 type:	"post",
		 dataType: "json",
		 data:	{
			 
		 },	
		 success: function(data){
			 //console.log(data);
			 var html="";
			 var cnt = data.length;
			 for(var i=0 ; i<data.length;i++){
				html+=
					"<li><a onClick='gochat("+data[i].chatId+")'>"+ data[i].fromId +"님이 메시지를 보내셨습니다.</a></li>";
			 }
			 if(cnt==0){
				 $('.chatAlarm').html(
							html
					  );
			 }
			 else{
				 $('.chatAlarm').html(
					html
				 );	 
			 }
			 
			 if(cnt==0){
				 cnt=null;
			 }
			 
			 $('.alerm_num').html(
				cnt
			 );
		 },
		 error:function(request,status,error){
			 console.log("실패");
			 
		 },
		 complete:function(){ 
			
		 }
	 });
}
</script>
<script>
if("${memberlevel.userStatus}" == "N1"){
	alert("${memberlevel.downTime}까지 정지상태입니다.");
	location.href = '${path}/member/logout';
}else if("${memberlevel.userStatus}" == "N2"){
	alert("영구 정지 처리 되셨습니다.");
	location.href = '${path}/member/logout';
}

</script>

<header>
    <nav class="navbar navbar-fixed-top">
        <div class="container-fluid">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${path}/"><img src="${path}/resources/images/logo.png" alt="logo"/></a>
          </div>
      
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li class="active">
                <a href="${path}/sale/listArticles.do">장터 <span class="sr-only">(current)</span></a>
                <ul>
                    <li><a href="${path}/sale/listArticles.do">팝니다</a></li>
                    <li><a href="${path}/buy/listArticles.do">삽니다</a></li>                   
                </ul>
              </li>
              <li>
                <a href="${path}/auction/auction_maintosearch?page=1&searchType=&keyword=">경매장</a>
                <ul>
                	<li><a href="${path}/auction/howToUse">경매장 이용방법</a></li>
                    <li><a href="${path}/auction/auction_write">경매상품 올리기</a></li>
              	</ul>
              </li>                  
              <li>
                <a href="${path}/ccenter/notice">고객센터</a>                
                <ul> 
                    <li><a href="${path}/ccenter/notice">공지사항</a></li>
                    <li><a href="${path}/ccenter/qna">Q & A</a></li>
                    <li><a href="${path}/ccenter/askOnetoOne">1:1 문의하기</a></li>
                    <li><a href="${path}/ccenter/report">신고하기</a></li>
                </ul>
              </li>              
              <c:if test="${ member != null }">
              <li>
                <a href="${path}/mypage/myInfo.do">마이페이지</a>                
                <ul> 
                	<li><a href="${path}/mypage/myInfo.do">내 정보 보기</a></li>
                	<li><a href="${path}/auction/myAuction?aucId=${member.userId}">내 경매</a></li>
                    <li><a href="${path}/mypage/salesHistory">입찰내역</a></li>
                    <li><a href="${path}/mypage/marketInfo.do">내 장터</a></li>
                    <li><a href="${path}/chat/chat_list">채팅 리스트</a></li>
                    <li><a href="${path}/mypage/calendar">캘린더</a></li>
                </ul>
              </li>
              </c:if>
              <c:if test="${ memberlevel.userStatus == 'A' }">
              <li>
                <a href="${path}/admin/oneOnOneInquiry">관리자</a>                
                <ul> 
                    <li><a href="${path}/admin/oneOnOneInquiry">1:1 문의 내역</a></li>                    
                    <li><a href="${path}/admin/memberList">회원 목록</a></li>
                    <li><a href="${path}/admin/reportAnswer">신고 내역</a></li>
                </ul>
              </li>
              </c:if>
            </ul>               
            <!-- 로그인안 했을 때  -->
            <c:if test="${ member == null }">
            	<p class="navbar-text navbar-right loginbtn"><a href="#" class="navbar-link" onClick="return action_path();"><span class="glyphicon glyphicon-user"></span> 로그인</a></p>            	 
            </c:if>
            <c:if test="${ member != null }">
            <!-- 로그인 했을 때 -->
	            <div class="navbar-text navbar-right loginbtn">
	            
                   	<a href="${path}/mypage/calendar"><span class="glyphicon glyphicon-calendar"></span></a>    
	
	                <div class="dropdown alermicon">
	                    <button class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	                        <span class="glyphicon glyphicon-envelope"></span>                               
	                        <small class="alerm_num" style="margin-left:-3px;"></small>  <!-- 알람 갯수 -->                     
	                    </button>
	                    <ul class="dropdown-menu chatAlarm" aria-labelledby="dropdownMenu1"><!-- 알람 들어가는 곳 -->
	                    </ul>
	                </div>
                    <div class="dropdown myinfo">
	                   <button class="dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	                       ${ member.nickname } 님                     
	                   </button>
	                   <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
	                     <li><a href="${path}/mypage/myInfo.do">내 정보 보기</a></li>                          
	                     <li><a href="${path}/member/logout">로그 아웃</a></li>          
	                   </ul>
	               </div>
	                
	                
	                
	                <%-- <a href="${path}/myPage/myPage" class="navbar-link"></span><span class="glyphicon glyphicon-user"></span> ${ member.nickname } 님</a> --%>
	            </div>
            </c:if>
          </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
      </nav>
</header>

<!-- header End -->
