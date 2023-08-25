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
		   border:2px solid rgb(63, 102, 56);
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
		#calendarPage .calendar>div>div .contents{}
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
      <a href="#">마이페이지</a> &gt;
      <a href="./">캘린더</a>
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
	  let weekCount = 1;
	  const makeCalendar = (date) => {
	    
	  document.querySelector(`.dateBoard`).innerHTML = '';
	  const currentYear = new Date(date).getFullYear();
	  const currentMonth = new Date(date).getMonth() + 1;
	  let currentDate = new Date(date).getDate();
	  if(currentMonth != new Date().getMonth() + 1){
	    currentDate = 0;
	  }else{    
	    currentDate = new Date().getDate();
	    console.log(currentDate)
	  }
	  const firstDay = new Date(date.setDate(1)).getDay();
	  const lastDay = new Date(currentYear, currentMonth, 0).getDate();
	
	  const limitDay = firstDay + lastDay;
	  const nextDay = Math.ceil(limitDay / 7) * 7;
	
	  for (let i = 0; i < firstDay; i++) {
	    let nodata = document.createElement("div");
	    nodata.classList.add('nodata');
	    document.querySelector(`.dateBoard`).appendChild(nodata);
	    weekCount ++;
	  }
	  for (let i = 1; i <= lastDay; i++) {    
	    if(weekCount > 7){
	      weekCount = 1
	    }
	    let cell = document.createElement("div");
	    let datetag = document.createElement("p");
	    let contentstag = document.createElement("div");
	    if(i == currentDate){
	      cell.classList.add('date'); 
	    }
	    if(weekCount == 1 || weekCount == 7){      
	      cell.classList.add('week'); 
	    }
	   
	    datetag.innerText = i;
	    cell.appendChild(datetag);
	    cell.appendChild(contentstag);
	    document.querySelector(`.dateBoard`).appendChild(cell);
	
	    // htmlDummy += `<div>
	    //                 <p class="date">${i}</p>
	    //                 <div class="contents">일정</div>
	    //               </div>`;
	    weekCount++
	  }
	  
	  for (let i = limitDay; i < nextDay; i++) {
	    let nodata = document.createElement("div");
	    nodata.classList.add('nodata');
	    document.querySelector(`.dateBoard`).appendChild(nodata);    
	    weekCount ++;
	  }
	  document.querySelector(`.dateTitle`).innerText = `\${currentYear}년 \${currentMonth}월`;
	  weekCount = 1;
	  }
	  const date = new Date();
	  makeCalendar(date);
	
	  // 이전달 이동
	  document.querySelector(`.prevDay`).onclick = () => {
	  makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
	  }	
	  // 다음달 이동
	  document.querySelector(`.nextDay`).onclick = () => {
	  makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
	  }
	</script>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>