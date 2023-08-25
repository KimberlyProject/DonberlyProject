<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
	<style>
	#trBtn_modify {
		display:	none;
	}
	
	#a {
		border: 2px solid rgb(73, 124, 64);
		vertical-align: middle;
	}
	
	#b {
		border-top: 2px solid rgb(73, 124, 64);
		border-bottom: none;
		border-right: 2px solid rgb(73, 124, 64);
	}
	
	#c {
		border-top: none;
		border-right: 2px solid rgb(73, 124, 64);
	}
	#n {
		display: none;
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
<br/><br/>
<div class="container">
	<a href="#" class="text-left">홈</a>><a href="#" class="text-left">장터</a>><a href="#" class="text-left">팝니다</a>><a href="#" class="text-left">상세화면</a>
		
	<form name="formArticle" method="post" action="${path}" enctype="multipart/form-data">
	<table class="table table-bordered table-hover table-condensed">
	<c:choose>
		<c:when test="${not empty article.thumbnail && article.thumbnail != 'null'}">
		<!-- 이미지를 가져오는 메서드는 FileDownloadController 클래스에 있다. -->
			<tr>
				<td id="a" width="150" align="center" rowspan="1">&nbsp;&nbsp;이미지</td>
				<td id="b" colspan="2">
					<input type="hidden" name="originalFileName" value="${article.thumbnail }"/>
					<img src="${path}/download.do?articleNO=${article.articleNO}&thumbnail=${article.thumbnail}" id="preview"/><br/>
				</td>
			</tr>
			<tr>
				<td id="a"><input type="file" class="btn btn-primary" name="thumbnail" id="i_thumbnail" disabled onchange="readURL(this);" /></td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr id="tr_fileUpload"> 
				<td id="a" width="150" align="center"  rowspan="2">이미지</td>
				<td id="b"><input type="hidden" name="originalFileName" value="${article.thumbnail }"/></td>
			</tr>
			<tr>
				<td id="c">
					<img id="preview"/><br/>
					<input type="file" name="thumbnail" id="i_thumbnail" disabled onchange="readURL(this);"/>
				</td>
			</tr>
		</c:otherwise>
	</c:choose>	
			
			<tr id = "n" >
				<td id="a" width="150" align="center" >글번호</td>
				<td id="a">
					<input type="text"   value="${article.articleNO }" disabled/>
					<input type="hidden" value="${article.articleNO }" name="articleNO"/>
				</td>
			</tr> 
			
			<tr>
				<td id="a" width="200" align="center" >글제목</td>
				<td id="a"><input type="text"   value="${article.title }" name="title" id="i_title" disabled/></td>
			</tr> 
			<tr>
				<td id="a" width="150" align="center" >상품번호</td>
				<td id="a">
					<input type="text"   value="${article.p_code }" disabled/>
					<input type="hidden" value="${article.p_code }" name="p_code"/>
				</td>
			</tr> 
			<tr>
				<td id="a" width="150" align="center" >작성자</td>
				<td id="a"><input type="text"   value="${member.nickname }" name="writer" disabled/></td>
			</tr>
			
			<tr>
				<td id="a" width="150" align="center" >작성자</td>
				<td id="a"><input type="text"   value="${article.userId }" name="writer" disabled/></td>
			</tr> 
			
			<tr>
				<td id="a" width="150" align="center" >내  용</td>
				<td id="a"><textarea rows="5" cols="50" name="content" id="i_content" disabled>${article.content }</textarea></td>
			</tr>
			<tr>
				<td id="a" width="20" align="center" >가  격</td>
				<td id="a"><input type="text"   value="${article.price }" name="price" id="i_price" disabled>원</td>
			</tr>
			
			<tr>
				<td id="a" width="150" align="center" >등록일자</td>
				<td id="a">
					<input type="text" size="30" value="<fmt:formatDate value="${article.write_date }" pattern='yyyy년 MM월 dd일 HH시 mm분'/>" disabled/>
				</td>
				
			</tr> 
			
			<tr id="trBtn_modify">
				<td colspan="2" align="center">
					<input type="button" class="btn btn-primary" value="수정반영하기" onClick="fn_modify_article(formArticle)"/>
					<input type="button" class="btn btn-warning" value="취소" onClick="backToList(formArticle)"/>
				</td>
			</tr>
			
			<tr id="trBtn">
				<td id="a" colspan="2" align="center">
					<input type="button" class="btn btn-info" value="목록으로 돌아가기" onClick="backToList(this.form)"/>
					<input type="button" class="btn btn-primary" value="1:1채팅" onClick="fn_reply_form('${path}/board/replyForm.do)', ${article.articleNO})"/>
					<!-- 로그인한 아이디와 게시글을 쓴 사람의 아이디가 같다면, 글쓴 본인이므로 수정/삭제가 가능하다. -->
					<c:if test="${member.userId == article.userId}">
						<input type="button" class="btn btn-warning" value="수정하기" onClick="fn_enable(this.form)"/>
						<input type="button" class="btn btn-danger"  value="삭제하기" onClick="fn_remove('${path}/board/removeArticle.do', ${article.articleNO})"/>
					</c:if>
				</td>
			</tr>
			
		</table>
	</form>
</div>
<br/><br/><br/><br/>

<%@ include file="../include/footer.jsp" %>

<script>
// 게시글 목록으로 돌아가기
function backToList(obj) {
	obj.action="${path}/board/listArticles.do";
	obj.submit();
}

// 게시글을 쓴 사람이 본인이면 화면이 수정할 수 있도록 변경시킨다.
function fn_enable(obj) {
	document.getElementById("i_title").disabled				= false;
	document.getElementById("i_content").disabled			= false;
	document.getElementById("i_price").disabled				= false;
	document.getElementById("i_thumbnail").disabled			= false;
	
	document.getElementById("trBtn").style.display			= "none";
	document.getElementById("trBtn_modify").style.display	= "block";
	//document.getElementById("tr_fileUpload").style.display	= "block";
	
}

// 게시글 삭제하기
function fn_remove(url, articleNO) {
	alert('게시글 삭제하기');
	var form	= document.createElement("form");
	form.setAttribute("method",	"post");
	form.setAttribute("action", url);
	
	var articleNOInput = document.createElement("input");
	articleNOInput.setAttribute("type",		"hidden");
	articleNOInput.setAttribute("name",		"articleNO");
	articleNOInput.setAttribute("value",	articleNO);
	
	form.appendChild(articleNOInput);
	document.body.appendChild(form);
	form.submit();
}

function readURL(input) {
	alert('그림바꾸기');
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		
		reader.onload = function(e) {
			$('#preview').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

// 게시글 수정하기
function fn_modify_article(obj) {
	obj.action = "${page}/board/modArticle.do";
	obj.submit();
}

</script>

</body>
</html>




