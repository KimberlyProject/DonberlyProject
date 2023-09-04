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
    	 var cnt = 1;
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
         obj.action="${contextPath}/board/listArticlesPaging.do";
         obj.submit();
      }
        
      var cnt=1;
      function fn_addFiles() {
    	  
    	  
          $("#d_file").append("<ul class = item> <br>"+"<input type='file' name='file"+cnt+"' onchange='readURL(this);' /><br>"
          						+"<img  id='preview"+cnt+"' src='#'   width='200' height='200' /> </ul>");
         
         cnt++;
      }  
   </script>
   
   <style>
      .conta {
         display: grid;
         grid-template-columns: 1fr 1fr;
      }
      
      .con {
         display: grid;
         grid-template-rows: 1fr 1fr 1fr 1fr 1fr;
         gap: 20px;
      }
      .image {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 5px;
      }
      
   </style>
   
   <title>글쓰기창</title>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
<div class="container">
		<br/><br/><br/><br/>
   <form  class="conta" name="articleForm" method="post"   action="${contextPath}/board/addNewArticleMulti.do"   enctype="multipart/form-data">
       <!-- <div border="0" align="center"> -->   
      <div class="item image" id="d_file">
         <ul class= "item">
            <li>이미지파일 첨부:  </li>
            <li><input type="file" name="imageFileName"  onchange="readURL(this);" /><br/>
            <img  id="preview" src="#"   width=200 height=200/></li>
              <%--  이미지를 2개 이상 올릴 때 사용한다.  --%>
            <li>이미지파일 첨부<br/><input type="button" value="파일 추가" onClick="fn_addFiles()"/></li>
         </ul>
    
      </div>
      <div class="item con">
         <ul class="item">
            <li> 작성자</li>
            <li><input type="text"  maxlength="50"  value="${member.nickname }" readonly/> </li>
         </ul>
         <ul class="item">
            <li>글제목: </li>
            <li><input type="text"  maxlength="50" name="title" /></li>
         </ul>
         <ul class="item">
			<li>가격</li>
			<li><input type="text" maxlength="50" name="price"/></li>
		</ul>
         <ul class="item">
            <li><br>글내용: </li>
            <li><textarea name="content" rows="2" cols="35" maxlength="4000"></textarea> </li>
         </ul>
         <ul class="item">
            <li> </li>
            <li>
               <input type="submit" value="글쓰기" />
               <input type="button" value="목록보기" onClick="backToList(this.form)" />
            </li>
         </ul>
      </div>
   </form>
  
</div>
</body>
</html>