<!-- footer -->
<footer>
    <small>&copy;2023. Donberly. All rights reserved.</small>
</footer>
<script>
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