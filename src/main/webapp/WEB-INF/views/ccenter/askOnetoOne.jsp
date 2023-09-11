<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="java.io.*" %>
    <%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의하기</title>
    <%@ include file="../include/header.jsp" %>

<style>
   	.container table tr>td:nth-child(1){
   		text-align: center; 
   		width: 20%;
   	}
   	.container table tr>td:nth-child(2) input {
   		width: 100%;
   	}
   	.container table tr>td:nth-child(2) textarea{
   		width: 100%;
   		height: 200px;
   	}
   	
   	#title::placeholder, #content::placeholder {
       color: lightgray; /* 연한 회색으로 변경 */
   	}
   	
    
   
</style>

</head>
<body>

<%@ include file="../include/topMenu.jsp" %>

<!-- 비로그인 상태에서 1:1 문의하기 클릭했을 때 로그인 창으로 보내는 펑션 -->
<%
	if(session.getAttribute("isLogOn") == null) {%>
	<!-- 
		<script>
			alert("먼저 로그인을 하셔야 글을 쓰실 수 있습니다!");
			location.href="/member/login";
		</script>
	 -->	
		<%
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('먼저 로그인을 하셔야 글을 쓰실 수 있습니다!');");
		pw.println("location.href='/member/login?action=/ccenter/askOnetoOne';");
		pw.println("</script>");
		pw.flush();
		pw.close();
		// out.println("<script>alert("먼저 로그인을 해주세요!");</script>");
		// response.sendRedirect("/member/login");
	}
%>

   <aside id="sideMenu">
      <ul>
        <li><a href="./notice">공지사항</a></li>
        <li><a href="./qna">Q & A</a></li>
        <li><a href="./askOnetoOne">1:1 문의하기</a></li>
        <li><a href="./report">신고하기</a></li>
      </ul>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    
    <div class="page_dir container">

	<c:set var="menu" value="ccenter" />
	<%@ include file="../include/sidebar.jsp" %>
     <div class="page_dir container">

      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      홈 &gt; 고객센터 &gt; 1:1 문의하기
    </div>
    <h1 class="pageTitle"><div>1:1 문의하기</div></h1>
    
    <div class="container">
        <form name="askOnetoOne" method="post" action="${path }/ccenter/addNewAsk.do" enctype="multipart/form-data">
            <table style="width: 100%;" class="table" id="table" >
                            
                <tr>
                    <td><label for="title">제목</label></td>
                    <td><input type="text" id="title" name="title" placeholder="제목을 입력하세요"></td>
                </tr>
                <tr>
                    <td><label for="nickname">작성자</label></td>
                    <td><input type="text" id="nickname" name="nickname" value="${member.userId}" readonly></td>
                </tr>
                <tr>
                    <td><label for="email">답변 받으실 e-mail</label></td>
                    <td><input type="text" id="email" name="email" value="${member.email}" ></td>
                </tr>
                <tr>
                    <td><label for="content">문의내용</label></td>
                    <td><textarea id="content" 
                    name="content" 
                    placeholder="자세한 내용을 함께 보내주시면 더욱 신속히 답변드릴수 있습니다.&#13;&#10;&#13;&#10;10월 18일부터 산업안전보건법에 고객응대 근로자 보호조치가 시행됩니다. 고객응대근로자에게 폭언, 욕설 등을 하지 말아주세요." rows="4" style="resize: none;"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <button class="btn btn-success" type="submit" id="submit-button">문의하기</button>
                        <button class="btn btn-danger" type="reset" id="reset-button">취소</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>


<script>
	$(document).ready(function() {
	    
		// 문의하기 버튼을 눌렀을 경우 공백있을 때 채워달라는 알림
	    $("#submit-button").on("click", function() {
	    	
	       if($("#title").val() == "") {
	          alert("제목을 입력해주세요.");
	          $("#title").focus();
	          return false;
	       }
	       if($("#email").val() == "") {
	          alert("email을 입력해주세요.");
	          $("#email").focus();
	          return false;
	       }
	       if($("#content").val() == "") {
	          alert("내용을 입력해주세요.");
	          $("#content").focus();
	          return false;
	       }
	       
	      
	    });
	    
	    
	 });
</script>



<%@ include file="../include/footer.jsp" %>
</body>
</html>

