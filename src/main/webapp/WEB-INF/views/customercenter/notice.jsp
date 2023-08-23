<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- header -->
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
            <a class="navbar-brand" href="/"><img src="/resources/images/logo.png" alt="logo"/></a>
          </div>
      
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li class="active">
                <a href="#">장터 <span class="sr-only">(current)</span></a>
                <ul>
                    <li><a href="#">삽니다</a></li>
                    <li><a href="#">팝니다</a></li>                   
                </ul>
              </li>
              <li>
                <a href="#">경매장</a>
              </li>                  
              <li>
                <a href="#">고객센터</a>                
                <ul>
                    <li><a href="../ccenter/notice.jsp">공지사항</a></li>
                    <li><a href="../ccenter/qna.jsp">Q&A</a></li>
                    <li><a href="../ccenter/1on1qna.jsp">1:1 문의하기</a></li>
                    <li><a href="../ccenter/report.jsp">신고하기</a></li>
                </ul></li>
            </ul>               
            <!-- 로그인 안 했을 때  -->
            <c:if test="${ member == null }">
            	<p class="navbar-text navbar-right loginbtn"><a href="${path}/member/login" class="navbar-link"><span class="glyphicon glyphicon-user"></span> 로그인</a></p>
            </c:if>
            <c:if test="${ member != null }">
            <!-- 로그인 했을 때 -->
	            <div class="navbar-text navbar-right loginbtn">
	                <div class="dropdown calicon">
	                    <button class="dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	                        <span class="glyphicon glyphicon-calendar"></span>                     
	                    </button>
	                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
	                      <li><img src="./images/cal.jpeg" alt="달력"></li>                          
	                    </ul>
	                </div>
	
	                <div class="dropdown alermicon">
	                    <button class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
	                        <span class="glyphicon glyphicon-envelope"></span>                               
	                        <small class="alerm_num" style="margin-left:-3px;">12</small>                       
	                    </button>
	                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
	                      <li><a href="#">''님이 댓글을 달았습니다</a></li>                          
	                      <li><a href="#">''님이 댓글을 달았습니다</a></li>                          
	                      <li><a href="#">''님이 댓글을 달았습니다</a></li>                          
	                      <li><a href="#">''님이 댓글을 달았습니다</a></li>                          
	                      <li><a href="#">''님이 댓글을 달았습니다</a></li>                          
	                      <li><a href="#">''님이 댓글을 달았습니다</a></li>                          
	                      <li><a href="#">''님이 댓글을 달았습니다</a></li>                          
	                      <li><a href="#">''님이 댓글을 달았습니다</a></li>                          
	                      <li><a href="#">''님이 댓글을 달았습니다</a></li>                          
	                    </ul>
	                </div>
	                <a href="${path}/member/login" class="navbar-link"></span><span class="glyphicon glyphicon-user"></span> ${ member.name } 님</a>
	            </div>
            </c:if>
          </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
      </nav>
</header>
<!-- header End -->


</head>
<body>

<h1>공지사항 목록</h1>
    
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
        </tr>
        
        <c:forEach items="${noticeList}" var="notice">
            <tr>
                <td>${notice.id}</td>
                <td>${notice.title}</td>
                <td>${notice.author}</td>
                <td>${notice.date}</td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>