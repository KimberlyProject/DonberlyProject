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
	<c:if test="${findId != null}">
		<script>
			alert(${findId} + '입니다.');
		</script>
	</c:if>
    <article class="Loginbox container">
      <h1><a href="#"><img src="${ path }/resources/images/logo_g.png" alt="logo"/></a></h1>
      <form action="/member/findId" method="post">
        <input type="text" class="form-control" placeholder="이 름" id="name" name="name">
        <input type="text" class="form-control" placeholder="이 메 일" id="email" name="email">
        <input type="button" class="btn" value="아이디 찾기" onClick="find();">
      </form>    
      <div>
        <a href="">회원가입</a> |
        <a href="./findId">아이디 찾기</a> |
        <a href="./findPasswd">비밀번호 찾기</a>
      </div>
    </article>
    <script>
    	function find(){
    		let obj = {
    				name : $("#name").val(),
    				email : $("#email").val()
    		};
			$.ajax({
			    type : "POST",         
			    url : "/member/findId",    
			    data : obj,           
			    dataType : "text",
			    success : function(data){ 
			    	if(data){
				        alert(`당신의 ID는 \${data} 입니다`);
				        $("#name").val('');
				        $("#email").val('');
			    	}else{
			    		alert("일치하는 계정이 없습니다.")
			    	}
			    },
			    error : function(XMLHttpRequest, textStatus, errorThrown){ // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
			        alert('에러가 발생했습니다.')
			    }
			 });
    	}
    </script>
    <%@ include file="../include/footer.jsp" %>
</body>
</html>