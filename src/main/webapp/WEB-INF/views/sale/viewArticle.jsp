<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
	<%@ include file="../member/profileModal.jsp" %>
	<style>
		
		#trBtn_modify {
		display:	none;
		}
		
		.line {
		 background-color: #FFFfff;
			 border-width: 0;
		}
		
		#preview {
			width: 450px;
			height:500px;
			border-radius: 50%;
		}
		
		.grid-second {
			display: grid;
			
			row-gap: 20px;
		}
		
		.container-div {
			display: grid;
			grid-template-columns: 1fr 1fr;
		}
		
		#i_price{
			text-align: right;
		}
		
		#i_thumbnail{
			margin-top : 20px;
			margin: 20px 50px; 
			
		}
	</style>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>


	<c:set var="menu" value="board" />
	<%@ include file="../include/sidebar.jsp" %>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      홈 &gt;
      장터 &gt;
      상세페이지
    </div> 
    <h1 class="pageTitle">
    	<div>판매장터</div> <!-- 팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다팝니다 -->
    </h1>
	
<div class="container">


	<form name="formArticle" method="post" action="${path}" enctype="multipart/form-data" class="container-div">
		<div class="item">
	<c:choose>
		<c:when test="${not empty article.thumbnail && article.thumbnail != 'null'}">
		<!-- 이미지를 가져오는 메서드는 FileDownloadController 클래스에 있다. -->
			<ul class="item">
				
				<li>
					<input type="hidden" name="originalFileName" value="${article.thumbnail }"/>
					<img src="${path}/download.do?articleNO=${article.articleNO}&thumbnail=${article.thumbnail}" id="preview"/><br/>
				<li>
			</ul>
			<ul class="item">
				<li id="a"><input type="hidden" class="btn btn-primary" name="thumbnail" id="i_thumbnail" onchange="readURL(this);" /><li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul id="tr_fileUpload"> 
				
				<li><input type="hidden" name="originalFileName" value="${article.thumbnail }"/><li>
			</ul>
			<ul class="item">
				<li>
					<img id="preview"/><br/>
					<input type="hidden" name="thumbnail" id="i_thumbnail" onchange="readURL(this);"/>
				<li>
			</ul>
		</c:otherwise>
	</c:choose>	
		</div>
			<div class="item">
			
				<div class="grid-second">
					<input type="hidden" value="${article.articleNO }" name="articleNO"/>
					<input type="hidden" value="${article.p_code }" name="p_code"/>
					<input type="hidden"   value="${article.nickname }" name="nickname"/>
					<input type="hidden" value="${article.purpose }" name="purpose"/>
					
					<ul class="item">
						
						<li><h2><input type="text" class="line"  value="${article.title }" name="title" id="i_title" disabled/></h2><li>
					</ul> 
					<ul class="item">
						<li>가격 : <input id="i_price" type="text" class="line" width=10px; value="${article.price }" name="price" disabled/>원
						</li>
					</ul>
					<ul class="item">
						<li>작성자<li>
							<input id="i_price" type="hidden" class="line" width=10px; value="${article.nickname }" disabled/>
						<a href="javascript:void(0);" onclick="openModal({nickname: '${article.nickname}', email: '${article.email}'})">${article.nickname}</a>
						
					</ul>
					
					<ul class="item">
						<li>내  용<li>
						<li><textarea rows="5" style="background-color: #FFFfff;" cols="50" name="content" id="i_content" disabled>${article.content }</textarea><li>
					</ul>
					
					<ul class="item">
						<li>등록일자<li>
						<li>
							<input type="text" class="line" size="30" value="<fmt:formatDate value="${article.write_date }" pattern='yyyy년 MM월 dd일 HH시 mm분'/>" disabled/>
						<li>
						
					</ul> 
					
					<ul class="item" id="trBtn_modify">
						<li>
							<input type="button" class="btn btn-primary" value="수정반영하기" onClick="fn_modify_article(formArticle)"/>
							<input type="button" class="btn btn-warning" value="취소" onClick="backToList(formArticle)"/>
						<li>
					</ul>
					
					<ul class="item" id="trBtn">
						<li>
							<input type="button" class="btn btn-info" value="목록으로 돌아가기" onClick="backToList(this.form)"/>
							<input type="hidden" class="seller" name="seller" value="${article.userId}"/>
							<input type="hidden" class="buyer" name="buyer" value="${member.userId}"/>

							<input type="hidden" class="article" name="article" value="${article.articleNO}"/>
							<c:choose>
								<c:when test="${member.userId == article.userId}">
									<input type="button" class="btn btn-primary" id="chat" value="1:1채팅" 
										style="display:none" onClick="fn_chat(${article.articleNO})"/>
								</c:when>
								<c:otherwise>
									<input type="button" class="btn btn-primary" id="chat" value="1:1채팅" onClick="fn_chat(${article.articleNO})"/>
								</c:otherwise>
							</c:choose>
							<!-- 로그인한 아이디와 게시글을 쓴 사람의 아이디가 같다면, 글쓴 본인이므로 수정/삭제가 가능하다. -->
							<c:if test="${member.userId == article.userId}">
								<input type="button" class="btn btn-warning" value="수정하기" onClick="fn_enable(this.form)"/>
								<input type="button" class="btn btn-danger"  value="삭제하기" onClick="fn_remove('${path}/sale/removeArticle.do', ${article.articleNO})"/>
								<input type="button" class="btn btn-warning" value="구매완료" id="buyEnd"/>
							</c:if>
						<li>
					</ul>
				</div>
		</div>

	</form>
</div>
<br/><br/><br/><br/>

<%@ include file="../include/footer.jsp" %>

<script>
// 게시글 목록으로 돌아가기
function backToList(obj) {
	obj.action="${path}/sale/listArticles.do";
	obj.submit();
}

// 게시글을 쓴 사람이 본인이면 화면이 수정할 수 있도록 변경시킨다.
function fn_enable(obj) {
	document.getElementById("i_title").disabled				= false;
	document.getElementById("i_content").disabled			= false;
	document.getElementById("i_price").disabled				= false;
	document.getElementById("i_thumbnail").type				= "file";
	
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
	
	
	
	obj.action = "${path}/sale/modArticle.do";
	obj.submit();
}


$("#buyEnd").on("click", function() {
	var articleNO = ${article.articleNO};
	var userId = ${member.userId};
	if(confirm("해당 상품을 구매 완료하시겠습니까?")) {
	
	location.href = "${path}/sale/saleEnd?articleNO=" + articleNO + "&userId=" + userId;
	alert("구매가 완료되었습니다.");
	}
});//#buyNow

//1:1 채팅 방만들기
function fn_chat(artNo){
	$.ajax({
		 url:	"/chat/makeRoom",
		 type:	"post",
		 dataType: "text",
		 contentType: 'application/json',
		 data:	JSON.stringify({"seller":$('.seller').val(),
			 	"buyer" : $('.buyer').val(),
			 	"artNo" : artNo,
			 	"status" : "s"
				 
		 
		 }),	
		 success: function(data){
			 console.log(data);
			 window.open(data, "_blank", "width=940, height=750");
			//location.href=data;
		 },
		 error:function(request,status,error){
			 console.log("실패");
		 },
		 complete:function(){
			 $('#chatContent').val('');
		 }
	 });
	
}

</script>

</body>
</html>




