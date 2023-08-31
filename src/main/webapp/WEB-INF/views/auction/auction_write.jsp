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
			width: 50%;
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
		#title {
			text-align: center;
			font-size: 30px;
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
        <li><a href="#">경매</a>          
          <ul>
            <li><a href="#">판매</a></li>
            <li><a href="#">구매</a></li>
          </ul>
        </li>
        <li><a href="#">캘린더</a></li>
        <li><a href="#">채팅목록</a></li>
      </ul>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <a href="/">홈</a> &gt;
      <a href="#">마이페이지</a> &gt;
      <a href="./">캘린더</a>
    </div>
    <h1 class="paitle"><div>캘린더</div></h1>
    
	<div class="container">
	
	
		<br><br><br>
		
		<!-- ------------------------------------------------------------------------------------------------------------------- -->	
		
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
		
		<form id="formgroup" name="aucArticle" method="post" action="${path}/auction/addNewArticle" enctype="multipart/form-data">
			<!-- 글쓰기 -->
			<table id="tb1" class="row table table-bordered table-striped">
				<tr><!-- 사진, 제목 -->  
					<th class="cate">제목</th>
					<th colspan="2"><input type="text" maxlength="500" name="title" placeholder="예) 상품명"></th>
				<tr> <!-- 최소금액 -->
					<th class="cate">최소 금액</th>					
					<th colspan="2"><input type="text" maxlength="10" name="minPrice" placeholder="숫자만 입력하세요">원</th>
				</tr>
				<tr> <!-- 상한금액 -->
					<th class="cate">상한 금액</th>					
					<th colspan="2"><input type="text" maxlength="10" name="maxPrice" placeholder="숫자만 입력하세요">원</th>
				</tr>
				<tr><!-- 입찰단위 -->
					<th class="cate">입찰 단위</th>				
					<th colspan="2">
						<select id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
							<option maxlength="10" name="bidRate" value="100" <c:if test="{searchType} == '100'">selected</c:if>>100원</option>
							<option maxlength="10" name="bidRate" value="500" <c:if test="{searchType} == '500'">selected</c:if>>500원</option>
							<option maxlength="10" name="bidRate" value="1000" <c:if test="{searchType} == '1000'">selected</c:if>>1,000원</option>
							<option maxlength="10" name="bidRate" value="3000" <c:if test="{searchType} == '3000'">selected</c:if>>3,000원</option>
							<option maxlength="10" name="bidRate" value="5000" <c:if test="{searchType} == '5000'">selected</c:if>>5,000원</option>
							<option maxlength="10" name="bidRate" value="10000" <c:if test="{searchType} == '10000'">selected</c:if>>10,000원</option>
							<option maxlength="10" name="bidRate" value="50000" <c:if test="{searchType} == '50000'">selected</c:if>>50,000원</option>
							<option maxlength="10" name="bidRate" value="100000" <c:if test="{searchType} == '100000'">selected</c:if>>100,000원</option>
						</select>
					</th>
				</tr>
				<tr><!-- 마감기한 -->
					<th class="cate">마감 기한</th>					
					<th colspan="2">
						<select id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
							<option name="deadline" value="0">오늘 마감</option>
							<option name="deadline" value="1">1일 후 마감</option>
							<option name="deadline" value="2">2일 후 마감</option>
							<option name="deadline" value="3">3일 후 마감</option>
							<option name="deadline" value="7">7일 후 마감</option>
						</select>
					</th>
				</tr>
				<tr>
					<td class="cate">
						사진첨부<br/><br/><br/>
						(1번 사진이<br/>
						경매장 썸네일로<br/> 
						설정됩니다.)<br/>
						<br/><br/><br/><br/>
						이미지 파일 첨부<br/><input type="button" value="파일추가" onclick="fn_addFiles()"/>	
					</th>	
					<th align="right">
						<input type="file" name="imgName" onchange="readURL(this);"/><br/>
						<img id="preview" src="" width=200 height=200/>
						<div id="d_file"></div>
					</th>
				<tr>
					<th class="cate">제품 설명</th><!-- 내용 -->
					<th colspan="2">
						<textarea placeholder="제품에 대한 상세 내용을 입력해주세요."></textarea>
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
		
		
		
	<%@ include file="../include/footer.jsp" %>
	
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
		
		function readURL(input) {
			if(input.files && input.files[0]) {
				var reader = new FileReader();
			}
		}
		
		var cnt=1;
		function fn_addFiles() {
			$("#d_file").append("<br>" + "<input type='file' name='file" + cnt + "' />");
			$("#d_file").append("<br>" + "<img id='preview' src='#' width=200 height=200/>");
			cnt++;
		}
	</script>
	
	
	
</body>
</html>