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
		.colon{
			width: 4px;
		}
		.cate{
			width: 100px;
		}
		input {
			width: 200px;
			font-size: 15px;
		}
		#productimg {
			width: 500px;
		}
		textarea {
			width: 100%;
			height: 100%;
		}
		#tb1 {
			margin: 0px;
		}
		th {
			font-size: 15px;
		}
		.btn {
			font-color: white;
			color: white;
		}
		#formgroup {
			padding: 0px 40px;
		}
		.cate {
			text-align: center;
			padding: 30px 30px 30px 30px;
			width: 300px;
		}
		td {
			text-align:center;
		}
		.imgNoinput {
			width: 10px;
		}
		#submit {
			verticla-align: center;
			text-align: center;
		}
		#minPrice {
		text-align: right;
		}
		#maxPrice {
		text-align: right;
		}
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
        <li><a href="/auction/auction_main">경매</a>          
        </li>
        <li><a href="#">캘린더</a></li>
        <li><a href="#">채팅목록</a></li>
      </ul>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <a href="/">홈</a> &gt;
      <a href="/auction/auction_main">경매장</a> &gt;
      <a href="#">경매올리기</a>
    </div>
    
   <%
	//로그인 세션 없으면 로그인을 먼저 하도록 한다.
	if(session.getAttribute("isLogOn") == null) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('로그인이 필요합니다.');");
		pw.println("location.href='/member/login?action=/auction/auction_wirte';");
		pw.println("</script>");
		pw.flush();
		pw.close();
	}
	%>
		
	<div class="container">
		<form id="formgroup" name="aucArticle" method="post" action="${path}/auction/addNewArticle" enctype="multipart/form-data">
			<input type="hidden" name="aucId" ${member.userId}/>
			<!-- 글쓰기 -->
			<table id="tb1" class="row table table-bordered table-striped">
				<tr><!-- 사진, 제목 -->  
					<th class="cate">제목</th> 
					<th colspan="2"><input id="title" type="text" maxlength="500" name="title" placeholder="예) 상품명"> &nbsp;&nbsp;&nbsp; 판매자 [${member.userId}] 님</th>
				<tr> <!-- 최소금액 -->
					<th id="minprice" class="cate">최소 금액</th>					
					<th colspan="2"><input id="minPrice" class="commas" onkeyup="addCommas(this)" type="text" maxlength="10" name="minPrice" placeholder="숫자만 입력하세요">원</th>
				</tr>
				<tr> <!-- 상한금액 -->
					<th class="cate">상한 금액</th>					
					<th colspan="2"><input id="maxPrice" class="commas" onkeyup="addCommas(this)" type="text" maxlength="10" name="maxPrice" placeholder="숫자만 입력하세요">원</th>
				</tr>
				<tr><!-- 입찰단위 -->
					<th class="cate">입찰 단위</th>				
					<th colspan="2">
						<select id="searchType" name ="bidRate" style="font-size: 18px; width: 150px; diplay: table-cell;">
							<option value="100" <c:if test="{searchType} == '100'">selected</c:if>>100원</option>
							<option value="500" <c:if test="{searchType} == '500'">selected</c:if>>500원</option>
							<option value="1000" <c:if test="{searchType} == '1000'">selected</c:if>>1,000원</option>
							<option value="3000" <c:if test="{searchType} == '3000'">selected</c:if>>3,000원</option>
							<option value="5000" <c:if test="{searchType} == '5000'">selected</c:if>>5,000원</option>
							<option value="10000" <c:if test="{searchType} == '10000'">selected</c:if>>10,000원</option>
							<option value="50000" <c:if test="{searchType} == '50000'">selected</c:if>>50,000원</option>
							<option value="100000" <c:if test="{searchType} == '100000'">selected</c:if>>100,000원</option>
						</select>
					</th>
				</tr>
				<tr><!-- 마감기한 -->
					<th class="cate">마감 기한</th>					
					<th colspan="2">
						<select id="searchType" name="deadlineRate" style="font-size: 18px; width: 150px; diplay: table-cell;">
							<option value="0">오늘 마감</option>
							<option value="1">1일 후 마감</option>
							<option value="2">2일 후 마감</option>
							<option value="3">3일 후 마감</option>
							<option value="7">7일 후 마감</option>
						</select>
					</th>
				</tr>
				<tr>
					<td class="cate">
						사진첨부<br/><br/><br/>
						(1번 사진이<br/>
						썸네일로<br/> 
						설정됩니다.)<br/>
						<br/><br/><br/><br/>
						이미지 파일 첨부<br/><input type="button" value="파일 추가" onClick="fn_addFiles()"/>	
					</td>	
					<th align="right">
						<input type="file" name="imageFileName"  onchange="readURL(this);"/><br/>
						<img  id="preview" src="#" width=200 height=200/><br/>
						<div id="d_file"></div>
					</th>
				<tr>
					<th class="cate">제품 설명</th><!-- 내용 -->
					<th colspan="2">
						<textarea name="content" id="content" placeholder="제품에 대한 상세 내용을 입력해주세요."></textarea>
					</th>
				</tr>	
			</table> <!-- 글쓰기 -->
			<br/>
			<br/>
			<div id="submit">
			<input class="btn btn-success" type="submit" id="submit" value="상품 올리기"/>
			</div>
		</form>
		<br/>
		<br/>
	</div>		
<script>

	$("#submit").on("click", function() {
		if($("#title").val() == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		if($("#minPrice").val() == "") {
			alert("최소금액을 입력해주세요.");
			$("#minPrice").focus();
			return false;
		}
		
		if($("#maxPrice").val() == "") {
			alert("상한금액을 입력해주세요");
			$("#maxPrice").focus();
			return false;
		}
		
		var minPrice = parseFloat($("#minPrice").val().replace(/,/g, ''));
		var maxPrice = parseFloat($("#maxPrice").val().replace(/,/g, ''));

		if (isNaN(minPrice) || isNaN(maxPrice)) {
		    alert("숫자만 입력해주세요.");
		    return false;
		}

		if (minPrice >= maxPrice) {
		    alert("최소 금액보다 더 큰 상한 금액을 입력해주세요.");
		    $("#maxPrice").focus();
		    return false;
		}
		
		if($("#content").val() == "") {
			alert("제품에 대한 상세설명을 입력해주세요.");
			$("#content").focus();
			return false;
		}
		
	});
	
	//숫자 입력창 콤마(,)추가하기
	function addCommas(input) {
      	var num = input.value.replace(/,/g, '');
       input.value = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
    //이미지 미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}  
    
	//이미지 추가하기
   	var cnt=1;
	function fn_addFiles() {
		//$("#d_file").append("<br>"+"<input type='file' name='file" +cnt + "' onchange='readURL(this);' />");
		$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
		$("#d_file").append("<br>"+"<img  id='preview"+cnt+"' src='#'   width='200' height='200' />");
		cnt++;
	}  

    

</script>
	
	
	
	<%@ include file="../include/footer.jsp" %>
</body>
</html>