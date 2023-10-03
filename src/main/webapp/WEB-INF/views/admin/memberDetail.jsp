<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../include/header.jsp" %>
	<style>
	 .table {
	 	border-bottom:					1px solid lightgray;
	 }
	 .title {
	 	text-align:right;
	 }
	 #fbtn {
			vertical-align:		middle;
			text-align: 		center;
	}
	 .fbtn {
	 	width:		20%;
	 	height:		50px;
	 	margin:		10px 20px 0 20px;
	 }
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<c:set var="menu" value="admin" />
	<%@ include file="../include/sidebar.jsp" %>	
   <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-th-large"></span></button>
      홈 &gt; 관리자 &gt; 회원목록 &gt; 회원상세정보
    </div>
    
    <h1 class="pageTitle"><div>회원 상세 정보</div></h1>
	<div class="container">
		<form name="frm" action="${path}/admin/memberUpdate" method="post">
			<table class="table">
				<tr>
					<td class="title"><label>아이디</label></td>
					<td><input class="col-sm-7" type="text" id="userId" name="userId" value="${detail.userId}" readonly="readonly"></td>
				</tr>
				<tr>
					<td class="title"><label>비밀번호</label></td>
					<td><input class="col-sm-7" type="password" id="pw" name="pw" value="${detail.pw}"></td>
				</tr>
				<tr>
					<td class="title"><label>비밀번호 확인</label></td>
					<td><input class="col-sm-7" type="password" id="repw" name="repw" value="${detail.repw}"></td>
				</tr>
				<tr>
					<td class="title"><label>이름</label></td>
					<td><input class="col-sm-7" type="text" id="name" name="name" value="${detail.name}"></td>
				</tr>
				<tr>
					<td class="title"><label>닉네임</label></td>
					<td><input class="col-sm-7" type="text" id="nickname" name="nickname" value="${detail.nickname}"></td>
				</tr>
				<tr>
					<td class="title"><label>연락처</label></td>
					<td><input class="col-sm-7" type="text" id="tel" name="tel" value="${detail.tel}"></td>
				</tr>
				<tr>
					<td class="title"><label>이메일</label></td>
					<td><input class="col-sm-7" type="text" id="email" name="email" value="${detail.email}"></td>
				</tr>
				<tr>
					<td class="title"><label>우편번호</label></td>
					<td><input class="col-sm-7" type="text" id="zipCode" name="zipCode" value="${detail.zipCode}"></td>
				</tr>
				<tr>
					<td class="title"><label>주소</label></td>
					<td><input class="col-sm-7" type="text" id="address" name="address" value="${detail.address}"></td>
				</tr>
			</table>
			<div class="form-group">
				<div id="fbtn">
					<!-- 스크립트를 통한 수정 -->
					<input class="btn btn-primary fbtn" type="button" value="수정" onClick='btn_click("update");'/>
					<!-- 스크립트를 통한 삭제 -->
					<input class="btn btn-danger fbtn" type="button" value="삭제(POST)" onClick='btn_click("delete");'/>
				</div>
			</div>
		</form>
	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<%@ include file="../include/footer.jsp" %>
		<script>
		function btn_click(str) {	
			switch(str){
			case 'update' :
				if(pw.value != repw.value){
					alert("비밀번호가 일치하지 않습니다.");
					return false;
				}
				alert("수정 완료되었습니다.")
				frm.submit();
				break;
			case 'delete' :				
				frm.action = "${path}/admin/memberDelete";
				alert("삭제 완료되었습니다.")
				frm.submit();
				break;
			}					
		}
	</script>
</body>
</html>