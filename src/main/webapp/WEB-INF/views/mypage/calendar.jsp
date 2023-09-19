<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>calendar.jsp</title>	
	<%@ include file="../include/header.jsp" %>	
	<style>      
		#calendarPage .calHeader{
		  position:relative;
		  margin-bottom:30px;
		}
		#calendarPage .calHeader>h2{
		  text-align:center;
		  color:rgb(63, 102, 56);
		}
		#calendarPage .calHeader .btn{
		  position:absolute;
		  top:0px;
		}
		#calendarPage .calHeader .prevDay{
		  position:absolute;
		  left:10px;
		}
		#calendarPage .calHeader .nextDay{
		  position:absolute;
		  right:10px;
		}
		#calendarPage .calendar{
		  margin-bottom:50px;
		}
		#calendarPage .calendar>div{
		  display:grid;
		  grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
		}
		#calendarPage .calendar>.dataHead{
		  background-color:rgb(63, 102, 56);
		  color:#fff;
		  text-align:center;
		  font-size:21px;
		  font-weight:bold;
		}
		#calendarPage .calendar>.dataHead>div:first-child{
		  border-left:1px solid #333;
		}
		
		#calendarPage .calendar>.dateBoard>div{    
		  font-size:16px;        
		  height:200px;        
		  transition:0.3s;
		  border-radius:10px;
		  overflow-y:auto;
		  word-break:break-all;
		}
		#calendarPage .calendar>.dateBoard>div:hover{
		   background-color:rgb(234, 255, 228);
		 } 
		 #calendarPage .calendar>.dateBoard>div.week{    
		   background-color:rgb(253, 243, 237);
		 }
		 #calendarPage .calendar>.dateBoard>div.week:hover{
		   background-color:rgb(240, 204, 204)       
		 }
		 #calendarPage .calendar>.dateBoard>div.date{
		   border:2px solid red;
		   background-color:rgb(238, 253, 255); 
		 }
		 #calendarPage .calendar>.dateBoard>div.date:hover{
		   background-color:rgb(211, 250, 255);     
		 }
		 #calendarPage .calendar>.dateBoard>div.nodata:hover{    
		   background-color:#ddd;
		 }
		#calendarPage .calendar>.dateBoard>div:nth-of-type(1){    
		  border-left:1px solid #333;
		}
		#calendarPage .calendar>.dateBoard>div:nth-of-type(8){    
		  border-left:1px solid #333;
		}
		#calendarPage .calendar>.dateBoard>div:nth-of-type(15){    
		  border-left:1px solid #333;
		}
		#calendarPage .calendar>.dateBoard>div:nth-of-type(22){    
		  border-left:1px solid #333;
		}
		#calendarPage .calendar>.dateBoard>div:nth-of-type(29){    
		  border-left:1px solid #333;
		}
		#calendarPage .calendar>.dateBoard>div:nth-of-type(36){    
		  border-left:1px solid #333;
		}
		#calendarPage .calendar>.dateBoard .nodata{              
		  background-color:#ddd;
		}
		#calendarPage .calendar>div>div{
		  padding:10px;  
		  border-top:1px solid #333;
		  border-right:1px solid #333;
		  border-bottom:1px solid #333;
		}
		#calendarPage .calendar>div>div
		#calendarPage .calendar>div>div .date{ 
		  font-size:18px;
		  color:rgb(63, 102, 56);
		  font-weight:bold;
		}
		#calendarPage .calendar>div>div>div>p>a{
			text-decoration:underline;			
		}
		#calendarPage .calendar .glyphicon{
			border:0;
			background:none;
			color:#aaa;
			font-size:14px;
		}
		@media all and (max-width:760px) {
	      	#calendarPage .calendar>.dataHead, #calendarPage .calendar>.dateBoard .nodata{
		      	display:none;
	      	}
	      	#calendarPage .calendar>div{
	      		grid-template-columns: 1fr;
	      	}	      	
	      	#calendarPage .calendar>.dateBoard>div{
	      		height:100px;
	      	}
	      	#calendarPage .calendar>div>div{
	      		border-left:1px solid #333;
	      	}
   		}      
	</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<c:set var="menu" value="mypage" />
<%@ include file="../include/sidebar.jsp" %>

    <div class="page_dir container">
      <button id="sideMenu_open"><span class="glyphicon glyphicon-th-large"></span></button>
      홈 &gt; 마이페이지 &gt; 캘린더
    </div>
    <h1 class="pageTitle"><div>캘린더</div></h1>
	
	<div class="container" id="calendarPage">     
	   <div class="calHeader">
	     <div class="btn prevDay"><span class="glyphicon glyphicon-chevron-left"></span></div>
	     <h2 class='dateTitle'></h2>
	     <div class="btn nextDay"><span class="glyphicon glyphicon-chevron-right"></span></div>
	   </div>
	   <article class="calendar">
	     <div class="dataHead">
	       <div>일</div>
	       <div>월</div>
	       <div>화</div>
	       <div>수</div>
	       <div>목</div>
	       <div>금</div>
	       <div>토</div>
	     </div>
	     <div class="dateBoard"></div>
	   </article> 
	 </div>
	<script>	   
	  const calendar = ${calendar};	  
	  let weekCount = 1;
	  const makeCalendar = (date) => {
	    
	  // 파라미터로 받아온 날짜 조회
	  document.querySelector(".dateBoard").innerHTML = '';
	  const currentYear = new Date(date).getFullYear();
	  const currentMonth = new Date(date).getMonth() + 1;
	  let currentDate = new Date(date).getDate();
	  // 받아온 날짜와 현재날짜 비교해서 일치하지않으면 date 0으로 고정
	  if(currentMonth != new Date().getMonth() + 1){
	    currentDate = 0;
	  }else{    
	    currentDate = new Date().getDate();
	  }
	  // 이번 달 시작하는 요일과 마지막일 조회
	  const firstDay = new Date(date.setDate(1)).getDay();
	  const lastDay = new Date(currentYear, currentMonth, 0).getDate();
	
	  const limitDay = firstDay + lastDay;
	  const nextDay = Math.ceil(limitDay / 7) * 7;	  
	  // 이번 달 시작하는 요일까지는 더미데이터생성 
	  for (let i = 0; i < firstDay; i++) {
	    let nodata = document.createElement("div");
	    nodata.classList.add('nodata');
	    document.querySelector(".dateBoard").appendChild(nodata);
	    weekCount ++;
	  }
	  //weekCount(주말체크 변수) 
	  // 이 달의 마지막 일수까지 캘린더 생성
	  for (let i = 1; i <= lastDay; i++) {    
	    if(weekCount > 7){
	      weekCount = 1
	    }
	    let cell = document.createElement("div");
	    let datetag = document.createElement("p");
	    let contentstag = document.createElement("div");
	 	// 오늘이면 강조, 주말이면 색 변형
	    if(i == currentDate){
	      cell.classList.add('date'); 
	    }
	    if(weekCount == 1 || weekCount == 7){      
	      cell.classList.add('week'); 
	    }
	 	// 날짜 html에 데이터 삽입
	    datetag.innerText = i;

	  // 데이터 일치하는 날짜에 컨텐츠, 링크 표시  
	  calendar.forEach(list => {
		
		const insertYear = new Date(list.schedule).getFullYear();
		const insertMonth = new Date(list.schedule).getMonth() + 1;
		let insertDate = new Date(list.schedule).getDate();      
		if(currentYear == insertYear && currentMonth == insertMonth && i == insertDate){
			if(list.status == 'a'){				
				contentstag.innerHTML += "<p>"
									  + "<a href=${path}/auction/auction_detail?aucCode=" + list.articleId + ">" + list.contents + "</a>"
									  + "<button class='glyphicon glyphicon-remove' onClick='delete_calrender(" + list.calendarId + ")'></button>"
									  + "</p>";
			}else{
				contentstag.innerHTML += "<p>"
									  + "<a href=${path}/" + (list.status == 's' ? 'sale' : 'buy') + "/viewArticle.do?articleNO=" + list.articleId + ">" + list.contents + "</a>"
									  + "<button class='glyphicon glyphicon-remove' onClick='delete_calrender(" + list.calendarId + ")'></button>"
									  + "</p>";	
			}
			
		}
	  })
		  
	    cell.appendChild(datetag);
	    cell.appendChild(contentstag);
	    document.querySelector(".dateBoard").appendChild(cell);
	
	    weekCount++
	  }
	    
	  // 이번 달 끝나고 남은 캘린더 더미데이터로
	  for (let i = limitDay; i < nextDay; i++) {
	    let nodata = document.createElement("div");
	    nodata.classList.add('nodata');
	    document.querySelector(".dateBoard").appendChild(nodata);    
	    weekCount ++;
	  }
	  // 제목에 날짜 넣고 주말체크 변수 초기화
	  document.querySelector(".dateTitle").innerText = currentYear + "년" + currentMonth + "월";
	  weekCount = 1;
	  }
	  
	  const date = new Date();
	  makeCalendar(date);
	
	  // 이전달 이동
	  document.querySelector(".prevDay").onclick = () => {
	  makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
	  }	
	  // 다음달 이동
	  document.querySelector(".nextDay").onclick = () => {
	  makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
	  }
	  
	  function delete_calrender(calId){
		  //console.log(calId, typeof calId);
		  if(confirm("메모를 삭제하시겠습니까?")){
			  $.ajax({
				 url:	"/mypage/calendarDelete",
				 type:	"post",
				 data:	{ "calId" :  calId },	
				 success: function(data){
					//console.log(data);
					alert("메모가 삭제되었습니다.");
					location.href = location.href;
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

	<%@ include file="../include/footer.jsp" %>
</body>
</html>