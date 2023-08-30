<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
	
	<style>
		#i{
			width:80px; 
			height:100px;		
			}
		#a {
			border: 2px solid rgb(73, 124, 64);
			text-align : center;
			vertical-align: middle;
		}
		#b {
			border: 2px solid rgb(73, 124, 64);
		}
		
		
	</style>
	
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>

		 <aside id="sideMenu">
    	<h2>장터</h2>
    		<ul>
        		<li><a href="#">장터</a></li>
        		<li>
          			<a href="#">팝니다</a>
		          		<ul>
		            		<li><a href="#">목록</a></li>
		            
		          		</ul>
        		</li>
        		<li><a href="#">삽니다</a>          
          			<ul>
            			<li><a href="#">목록</a></li> 
          			</ul>
        		</li>
      		</ul>
      	<button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <a href="/">홈</a> &gt;
      <a href="#">마이페이지</a> &gt;
      <a href="./">장터</a>
    </div> 
    <h1 class="pageTitle">
    	<div>장터</div>
    </h1>


<%
	// 세션이 없으면 먼저 로그인을 한 다음에 글쓰기 페이지로 이동시킨다.
	if(session.getAttribute("isLogOn") == null) {
		/*
		<script>
			alert('먼저 로그인을 하셔야 글을 쓰실 수 있습니다!');
			location.href="/member/login";
		</script>
		*/
		// http://localhost:8097/sale/articleForm.do
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('먼저 로그인을 하셔야 글을 쓰실 수 있습니다!!!');");
		pw.println("location.href='/member/login?action=/sale/articleForm.do';");
		pw.println("</script>");
		pw.flush();
		pw.close();
		//response.sendRedirect("/member/login"); 스크립트를 무시하고 진행된다.
	}
%>
<div class="container">
	<a href="#" class="text-left">홈</a>><a href="#" class="text-left">장터</a>><a href="#" class="text-left">팝니다</a>><a href="#" class="text-left">상세화면</a>
	<h1 style="text-align:center">게시글쓰기</h1>
	<form name="articleForm" method="post" action="${path}/sale/addNewArticle.do" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td id="a" align="right">글제목</td>
				<td id="b" colspan="2" align="left">
					<input type="text" size="70" maxlength="500" id="title" name="title"/>
				</td>
			</tr>
			<tr>
				<td id="a" align="right">작성자</td>
				<td id="b" colspan="2" align="left">
					<input type="text" size="50" maxlength="50" value="${member.nickname}" readonly/>
					<input type="hidden" size="50" maxlength="50" value="${userId}" readonly/>
				</td>
			</tr>			
			<tr>
				<td id="a" align="right" valign="top">글내용</td>
				<td id="b" colspan="2" align="left">
					<textarea id="content" name="content" rows="10" cols="100" maxlength="4000"></textarea>
				</td>
			</tr>
			<tr>
				<td id="a" align="right">가격</td>
				<td id="b" colspan="2" align="left">
					<input type="text" size="50" maxlength="500" id="price" name="price"/>
				</td>
			</tr>
			<tr>
				<td id="a" align="right">이미지파일 첨부</td>
				<td id="b">
					<input type="file" id="thumbnail" name="thumbnail" onchange="readURL(this);"/><br/>
					<img id="preview" src="#" width="200" height="200"/>
				</td>
			</tr>
			<tr>
				<td align="right"></td>
				<td colspan="2">
					<input class="btn btn-primary" type="submit" id="submit" value="글쓰기"/>
					<input class="btn btn-warning" type="button" value="목록보기" onClick="backToList(this.form)"/>
					<input class="btn btn-danger"  type="reset"  value="다시작성하기"/>
				</td>
			</tr>
		</table>
	</form>
</div>


<script>
function readURL(input) {	// 파일을 선택해서 변화가 생겼을 때
	// 파일을 선택해서 파일이 있는 경우. files[0] : 선택한 첫번째 파일
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#preview').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

function backToList(obj) { // 게시글 목록 페이지로 이동한다.
	location.href = "${path}/sale/listArticles.do";

}


	$("#submit").on("click", function() {			
		if($("#title").val() == "" || $("#title").val() == null ) {
			alert("제목을 작성해주세요.");
			$("#title").focus();
			return false;
		}
		if($("#content").val() == "" || $("#content").val() == null ) {
			alert("내용을 작성해주세요.");
			$("#content").focus();
			return false;
		}
		if($("#price").val() == "" || $("#price").val() == null ) {
			alert("가격을 작성해주세요.");
			$("#price").focus();
			return false;
		}
		if($("#thumbnail").val() == "" || $("#thumbnail").val() == null ) {
			alert("이미지를 올려주세요.");
			$("#thumbnail").focus();
			return false;
		}
		
});




</script>
<%@ include file="../include/footer.jsp" %>

</body>
</html>









