<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer>
    <small>&copy;2023. Donberly. All rights reserved.</small>
</footer>
<script>
	function action_path(){
		const prevpath = location.pathname;
		const new_prevpath = prevpath.substr(0, prevpath.length-1);
		if("${path}" === new_prevpath){
			location.href = "${path}/member/login?action=/";
			return false;
		}
		location.href = "${path}/member/login?action=" + location.pathname;
		return false;
	}
	 $(function(){
	// 탑메뉴 네비게이션
	   $('header .navbar-nav li').on('mouseover',function(){
	     $(this).children('ul').stop().slideDown(100);
	   })
	   $('header .navbar-nav li').on('mouseout',function(){
	     $('header .navbar-nav li ul').stop().slideUp(100);
	   })
	   $('.nav>li').on('mouseover',function(){
	     $(this).addClass('on');
	   })
	   $('.nav>li').on('mouseout',function(){
	       $(this).removeClass('on');
	   })    
	   
	   // 사이드 메뉴
	   $('#sideMenu_open').on('click',function(){
	     $('#sideMenu').addClass('show');
	   })
	   $('#sideMenu_close').on('click',function(){
	     $('#sideMenu').removeClass('show');
	   })
	 })
</script>