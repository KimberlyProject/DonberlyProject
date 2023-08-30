<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
	<meta charset="UTF-8">
	<title>글쓰기창</title>
	<%@ include file="../include/header.jsp" %>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#preview').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}  
		function backToList(obj) {
			// obj.action="${contextPath}/board4/listArticles.do";
			obj.action="${contextPath}/board4/listArticlesPaging.do";
			obj.submit();
		}
		  
		var cnt=1;
		function fn_addFiles() {
			// $("#d_file").append("<br>"+"<img  id='preview"+cnt+"' src='#'   width='200' height='20' />");
			// $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' onchange='readURL(this);' />");
			$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
			cnt++;
		}  
	</script>
	<title>글쓰기창</title>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<div class="container">

	<h1 style="text-align:center">글쓰기</h1>
	<form name="articleForm" method="post"   action="${contextPath}/board4/addNewArticleMulti.do"   enctype="multipart/form-data">
	    <!-- <table border="0" align="center"> -->	
		<table   class="table">
			<tr>
				<td align="right"> 작성자</td>
				<td colspan=2  align="left"><input type="text" size="20" maxlength="100"  value="${member.name }" readonly/> </td>
			</tr>
			<tr>
				<td align="right">글제목: </td>
				<td colspan="2"><input type="text" size="67"  maxlength="500" name="title" /></td>
			</tr>
			<tr>
				<td align="right" valign="top"><br>글내용: </td>
				<td colspan=2><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea> </td>
			</tr>
			<tr>
				<td align="right">이미지파일 첨부:  </td>
				<td><input type="file" name="imageFileName"  onchange="readURL(this);" /><br/>
				<img  id="preview" src="#"   width=200 height=200/></td>
			  	<%--  이미지를 2개 이상 올릴 때 사용한다.  추가버튼 누루면 밑에 입력창이 추가로 생긴다.--%>
				<td align=left>이미지파일 첨부<br/><input type="button" value="파일 추가" onClick="fn_addFiles()"/></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="3"><div id="d_file"></div></td>
			</tr>
			<tr>
				<td align="right"> </td>
				<td colspan="2">
					<input type="submit" value="글쓰기" />
					<input type="button" value="목록보기" onClick="backToList(this.form)" />
				</td>
			</tr>
		</table>
	</form>
  
</div>
</body>
</html>
