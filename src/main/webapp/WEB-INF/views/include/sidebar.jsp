<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:if test="${menu == 'board'}">
<aside id="sideMenu">
	<h2>장터</h2>
	<ul>	
		<li><a href="${path}/sale/listArticles.do">삽니다</a></li> 
		<li><a href="${path}/board/listArticles.do#">팝니다</a></li>	
	</ul>
  	<button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
</aside>
</c:if>

<c:if test="${menu == 'auction'}">
<aside id="sideMenu">
	<h2>경매</h2>
	<ul>	
		<li><a href="${path}/auction/">?</a></li> 
		<li><a href="${path}/auction/">?</a></li>	
	</ul>
  	<button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
</aside>
</c:if>

<c:if test="${menu == 'mypage'}">
<aside id="sideMenu">
	<h2>마이페이지</h2>
	<ul>
	  <li><a href="${path}/myPage/myInfo">내 정보</a></li>
	  <li><a href="${path}/myPage/marketInfo.do">내 장터</a></li>
	  <li><a href="${path}/auction/">내 경매</a>          
	    <ul>
	      <li><a href="${path}/auction/">판매</a></li>
	      <li><a href="${path}/auction/">구매</a></li>
	    </ul>
	  </li>
	  <li><a href="${path}/myPage/calendar">캘린더</a></li>
	  <li><a href="${path}/chat/chat_list">채팅목록</a></li>
	</ul>
	<button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
</aside>
</c:if>

<c:if test="${menu == 'ccenter'}">
<aside id="sideMenu">
  <h2>고객센터</h2>
  <ul>
    <li><a href="${path}/ccenter/notice">공지사항</a></li>
    <li><a href="${path}/ccenter/qna">Q & A</a></li>
    <li><a href="${path}/ccenter/askOnetoOne">1:1문의하기</a></li>
    <li><a href="${path}/ccenter/report">신고하기</a></li>
  </ul>
  <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
</aside>
</c:if>

<c:if test="${menu == 'admin'}">
<aside id="sideMenu">
  <h2>관리자 페이지</h2>
  <ul>
    <li><a href="${path}/admin/oneOnOneInquiry">1:1 문의</a></li>
    <li><a href="${path}/admin/memberList">회원 목록</a></li>
  </ul>
  <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
</aside>
</c:if>

<c:if test="${menu == 'member'}">
<aside id="sideMenu">
  <ul>
    <li><a href="${path}/member/membership">회원가입</a></li>
    <li><a href="${path}/member/login">로그인</a></li>
  </ul>
  <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
</aside>
</c:if>