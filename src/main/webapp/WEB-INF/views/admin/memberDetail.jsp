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
					<td class="title col-sm-4"><label>아이디</label></td>
					<td class="col-sm-8"><input class="col-sm-7" type="text" id="userId" name="userId" value="${detail.userId}" readonly="readonly"></td>
				</tr>
				<tr>
					<td class="title col-sm-3"><label>비밀번호</label></td>
					<td class="col-sm-9"><input class="col-sm-7" type="password" id="pw" name="pw" value="${detail.pw}"></td>
				</tr>
				<tr>
					<td class="title col-sm-3"><label>비밀번호 확인</label></td>
					<td class="col-sm-9"><input class="col-sm-7" type="password" id="repw" name="repw" value="${detail.repw}"></td>
				</tr>
				<tr>
					<td class="title col-sm-3"><label>이름</label></td>
					<td class="col-sm-9"><input class="col-sm-7" type="text" id="name" name="name" value="${detail.name}"></td>
				</tr>
				<tr>
					<td class="title col-sm-3"><label>닉네임</label></td>
					<td class="col-sm-9"><input class="col-sm-7" type="text" id="nickname" name="nickname" value="${detail.nickname}"></td>
				</tr>
				<tr>
					<td class="title col-sm-3"><label>연락처</label></td>
					<td class="col-sm-9"><input class="col-sm-7" type="text" id="tel" name="tel" value="${detail.tel}"></td>
				</tr>
				<tr>
					<td class="title col-sm-3"><label>이메일</label></td>
					<td class="col-sm-9"><input class="col-sm-7" type="text" id="email" name="email" value="${detail.email}"></td>
				</tr>
				<tr>
					<td class="title col-sm-3"><label>주소</label></td>
					<td>
						<input class="col-sm-5" type="text" id="address" name="address" value="${detail.address}">
						<button class="col-sm-2" type="button"  onclick="daumZipCode()">주소 검색</button>
					</td>
				</tr>
				<tr>
					<td class="title"><label>상세 주소</label></td>
					<td>
						<input class="col-sm-2" type="text" id="zipCode" name="zipCode" readonly value="${detail.zipCode}"/>
						<input class="col-sm-5" type="text" id="address2" name="address2" value="${detail.address2}">
					</td>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
	    function daumZipCode() {
	        new daum.Postcode({
	          
	          oncomplete: function(data) {
	          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	          // 각 주소의 노출규칙에 따라서 주소를 조합한다.
	          // 내려오는 변수가 값이 없을 경우에는 공백('') 값을 가지므로, 이를 참고해서 분기한다.
	          var fullAddress	= '';	// 최종   주소 변수
	          var subAddress	= '';	// 조합형 주소 변수
	          
	          // 사용자가 선택한 주소의 타입에 따라서 해당 주소값을 가져온다.
	          if(data.userSelectedType == 'R') {	// 도로명 주소를 선택한 경우
	            fullAddress = data.roadAddress;
	          } else {	// 지번 주소를 선택한 경우
	            fullAddress	= data.jibunAddress;
	          }
	          
	          // 사용자가 선택한 주소가 도로명 타입일 떄는 주소를 조합한다.
	          if(data.userSelectedType == 'R') {
	            // 법정동명이 있을 경우 추가한다.
	            if(data.bname != '') {
	              subAddress += data.bname;
	            }
	            // 건물명이 있을 경우에 추가한다.
	            if(data.buildingName != '') {
	              subAddress += (subAddress != '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	            fullAddress += (subAddress != '' ? '(' + subAddress + ')' : '');
	          } // End - if(data.userSelectedType == 'R')
	            
	          // 추출한 우편번호와 주소정보를 입력항목에 나타낸다.
	          document.getElementById('zipCode').value = data.zonecode;
	          document.getElementById('address').value	= fullAddress;
	          
	          // 커서를 상세주소 입력란으로 이동시킨다.
	          document.getElementById('address2').focus();
	            }
	        }).open({
	          // 우편번호 팝업 창이 여러개 뜨는 것을 방지하기 위해서 popupName을 사용한다.
	          popupName:	'postcodePopup'
	        });
	    }
	    
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