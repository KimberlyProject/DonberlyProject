<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돈벌리</title>
	<%@ include file="../include/header.jsp" %>
	<style>
	  .Loginbox{
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%, -60%);
		width:400px;
		/* height:100vh; */
		text-align:center;
	  }
	  .Loginbox h1{
	      margin-bottom:20px;
	  }
	  .Loginbox form {
	      background-color:#fff;
	      border:1px solid rgb(73, 124, 64);
	      border-radius:5px;
	      padding:30px 20px;
	  }
	  .Loginbox form input{
	      margin-bottom:10px;
	  }
	  .Loginbox form input:last-child{
	      margin-bottom:0px;
	  }
	  .Loginbox form input.btn{
	      width:100%;
	      background-color:rgb(44, 120, 55);
	      color:#fff;
	      transition:0.3s;
	  }
	  .Loginbox form input.btn:hover, .Loginbox form input.btn:focus{
	      background-color:rgb(31, 89, 39);
	      color:#fff;
	  }
	  .Loginbox .searchBox>a,
	  .Loginbox .searchBox>span{
		  color:#337ab7;
		  cursor:pointer;
	  }
	  .Loginbox .searchBox>span:hover{
		  text-decoration:underline;
	  }
	  footer{
	  	position:absolute;
	  	left:0px;
	  	bottom:0px;
	  	width:100%;
	  }
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
    <article class="Loginbox container">
      <h1><a href="#"><img src="${ path }/resources/images/logo_g.png" alt="logo"/></a></h1>
      <c:if test="${ member == null }">
      <form action="/member/login.do" method="post">
        <input type="text" class="form-control" placeholder="아 이 디" id="userId" name="userId">
        <div class="input-group" style="margin-bottom:10px;">
          <input type="password" class="form-control" placeholder="패 스 워 드" id="pw" name="pw">
          <span class="input-group-addon" id="basic-addon1"><span id="eye" class="glyphicon glyphicon-eye-open"></span></span>
        </div>
        <input type="submit" id="submit" class="btn" value="로 그 인">
		<c:if test="${msg == false}">
		 <div style="color:red;"> 아이디 또는 비밀번호가 일치하지 않습니다.</div>
		</c:if>
      </form>    
      <div class="searchBox">
        <a href="membership">회원가입</a> |
        <a href="./findId">아이디 찾기</a> |
        <a href="./findPasswd">비밀번호 찾기</a>
      </div>
    </c:if>
    
    </article>
    
  <%--  	<c:if test="${ member != null }">
   	<script>location.href = '/member/login?action=/ccenter/askOnetoOne'
   	
   	</script>
    </c:if> --%>
    
    <script>
		$('#eye').on('mousedown',function(){
			$('#pw').attr('type','text');
			return false;
		})
		$('#eye').on('mouseup',function(){
			$('#pw').attr('type','password');
			return false;
		})
		
    </script>
    
	<%@ include file="../include/footer.jsp" %>
</body>
</html>