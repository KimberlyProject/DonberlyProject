<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
         // obj.action="${path}/sale4/listArticles.do";
         obj.action="${path}/buy/listArticles.do";
         obj.submit();
      }
          
   </script>
   
   <style>
      .conta {
         display: grid;
         grid-template-columns: 1fr 1fr;
      }
      
      .con {
         display: grid;
         
      }
      .image {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 5px;
      }
      
      #price{
      	text-align: right;
      }
      
      #d{
      border : 3px solid rgb(73, 124, 64);
      border-radius: 20px;
      margin-top : 50px;
      margin-bottom: 50px;
      }
      
      .line {
		 background-color: #FFFfff;
	 	border-width: 0;
	  }
	  
	  .a{
	  	  font-size:18px;
       	  width:30%;
          vertical-align:bottom;
          border:0;
          border-bottom:1px solid rgb(73, 124, 64);
          outline:none;
	  }
	  
	  
   </style>
   
   <title>글쓰기창</title>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>

	<c:set var="menu" value="board" />
	<%@ include file="../include/sidebar.jsp" %>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      홈 &gt;
      장터 &gt;
      상품등록
    </div> 
    <h1 class="pageTitle">
    	<div>판매장터</div>
    </h1>




<div class="container" id="d">
		<br/><br/>
   <form  class="conta" name="articleForm" method="post"   action="${path}/sale/addNewArticle.do"   enctype="multipart/form-data">
       <!-- <div border="0" align="center"> -->   
      <div class="item image" id="d_file">
         <ul class= "item">
            <li>이미지파일 첨부:  </li>
            <li>
            <img  id="preview" src="#"   width=350 height=350/>
              <%--  이미지를 2개 이상 올릴 때 사용한다.  --%>
              <input type="file" name="imageFileName"  onchange="readURL(this);" /><br/>
            </li>
         </ul>
    
      </div>
      <div class="item con">
         <ul class="item">
            <li><h3>작성자 : <input type="text" class="line" maxlength="50" id="nickname" name="nickname" value="${member.nickname }" readonly/></h3> </li>
         </ul>
         <ul class="item">
            <li>상품 : &nbsp;<input type="text" class="a" id="title" maxlength="20" name="title" /></li>
         </ul>
         <ul class="item">
			<li>가격 : &nbsp;<input type="text" class="a" id="price" maxlength="10" name="price"/>원</li>
		</ul>
         <ul class="item">
            <li>팔고자 하는 것에 대해</li>
            <li><textarea name="content" rows="6" cols="35" maxlength="4000"></textarea></li>
         </ul>
         <ul class="item">
            <li> </li>
            <li>
               <button type="submit" class="btn btn-info" >글쓰기</button>
               <button type="button" class="btn btn-warning" onClick="backToList(this.form)" >목록보기</button>
            </li>
         </ul>
      </div>
   </form>
  
</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>