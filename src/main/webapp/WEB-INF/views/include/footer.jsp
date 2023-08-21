<!-- footer -->
<footer>
    <small>&copy;2023. Donberly. All rights reserved.</small>
</footer>
<script>
  $(function(){
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
  })
</script>