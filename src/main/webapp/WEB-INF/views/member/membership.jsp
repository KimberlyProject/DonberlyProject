<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp"%>
	
	<style>
        #membership{
          padding:0 200px;
          margin-bottom:50px;
        }
        #membership form>div{
          font-size:18px;
          margin-bottom:10px;
        }
        #membership form>div>label{
          text-align:center;
          display:inline-block;
          width:180px;
          color:rgb(73, 124, 64);
        }
        #membership form>div>input:nth-of-type(1){
          width:400px;
        }
        #membership form>div>.btn{
          color:#fff;
          background-color:rgb(230, 142, 60);
        }
        #membership form>.submit{
          text-align:center;
        }
        #membership form>.submit>input{
          color:#fff;
          font-weight:bold;
          background-color:rgb(73, 124, 64);
        }
        @media all and (max-width:1200px){
          #membership{
            padding:0 10%;          
          }
          #membership form>div>input:nth-of-type(1){
            width:40%;
          }
        }
	</style>
	
</head>
<body>
<%@ include file="../include/topMenu.jsp"%>

<div class="container" id="membership">

	<form class="form-horizontal" method="post" action="/member/membership">
		<div class="form-group">
			<div class="col-sm-2"></div>
			<div class="col-sm-6">
				<h2 align="center">회원가입</h2>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">아 이 디</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="userID" name="userId" maxlength="10" placeholder="아이디를 입력하세요."/>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-warning idCheck" type="button" id="idCheck" onClick="fn_idCheck();" value="N">중복검사</button>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">안내글</label>
			<div class="col-sm-8">
				<input type="text" class="form-control msg" id="msg" name="msg" readonly placeholder="메시지"/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8" id="msg2"></div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">비밀번호</label>
			<div class="col-sm-2">
				<input type="password" class="form-control" id="pw" name="pw" maxlength="10" placeholder="비밀번호"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">비밀번호확인</label>
			<div class="col-sm-2">
				<input type="password" class="form-control" id="repw" name="repw" maxlength="10" placeholder="비밀번호확인"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">이  름</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="name" name="name" maxlength="50" placeholder="이  름"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">닉 네 임</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="nickname" name="nickname" maxlength="50" placeholder="이  름"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">전화번호</label>
			<div class="col-sm-1">
				<select class="form-control" id="tel1" name="tel1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
			</div>
			<div class="input-group col-sm-3">
				<div class="input-group-addon">-</div>
				<div>
					<input type="text" class="form-control col-sm-1" id="tel2" name="tel2" maxlength="4" placeholder="Tel"/>
				</div>
				<div class="input-group-addon">-</div>
				<div>
					<input type="text" class="form-control col-sm-1" id="tel3" name="tel3" maxlength="4" placeholder="Tel"/>
				</div>
			</div>
		</div>
		<input type="hidden" class="form-control" id="tel" name="tel" />
		
		<div class="form-group">
			<label class="control-label col-sm-2">우편번호</label>
			<div class="col-sm-2">
				<input type="text"   class="form-control" name="zipCode" id="zipcode" readonly/>
			</div>
			<div class="col-sm-2">
				<input type="button" class="form-control" onclick="daumZipCode()" value="우편번호검색"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">주    소</label>
			<div class="col-sm-6">
				<input type="text"   class="form-control" name="address_1" id="address_1"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2">상세주소</label>
			<div class="col-sm-6">
				<input type="text"   class="form-control" name="address_2" id="address_2"/>
			</div>
		</div>
		<input type="hidden"   class="form-control" name="address" id="address"/>
		
		<div class="form-group">
			<label class="control-label col-sm-2">이메일</label>
			<div class="col-sm-6">
				<input type="text"   class="form-control" name="email" id="email"/>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-6">
				<button class="btn btn-warning" type="reset">다시입력</button>
				<button class="btn btn-primary signUpBtn" type="submit" id="submit" disabled="disabled">회원가입</button>
				<button class="btn btn-danger cancel" type="button">회원가입취소</button>
			</div>
		</div>
	</form>
</div>

<script>
//-------------------------------------------------------------------------------------------------
// jQuery를 이용하여 페이지가 로딩되면 할 수 있는 것들을 만든다.
//-------------------------------------------------------------------------------------------------
$(document).ready(function() {

	//-------------------------------------------------------------------------------------------------
	// 회원가입취소 버튼을 누르면 
	//-------------------------------------------------------------------------------------------------
	$(".cancel").on("click", function() {
		location.href="/member/login";
	});
	
	//-------------------------------------------------------------------------------------------------
	// 아이디 입력란에 글자를 쓰면 실시간으로 사용이 가능한지 아닌지 검사한다.
	//-------------------------------------------------------------------------------------------------
	$("#userID").on("input", function() {
		var inputID = $('#userID').val();
		// alert(inputID);
		
		$.ajax({
			url:			"/member/idCheck",
			type:			"post",
			dataType:		"json",
			data:			{"userId" : $('#userID').val()},
			success:		function(data) {
				// alert("중복검사결과 : " + data);
				// if(inputID == "" && data == '0') {
				if(inputID != "" && inputID.length < 4 && data == '0') {
					$(".signUpBtn").prop("disabled", true);
					$(".signUpBtn").css("background-color", "#AAAAAA");
					$("#idCheck").css({	"backgroundColor": "#FFCECE",
						 				"backgroundImage": "none"});
					document.getElementById("msg").value = "아이디는 4자리 이상이어야 합니다.";
					document.getElementById("msg2").innerHTML = "아이디는 4자리 이상이어야 합니다.";
					$("#msg").css("background-color", "#FFCECE");
				} else if(inputID != "" && inputID.length >= 4 && data == '0') {
					$(".signUpBtn").prop("disabled", false);
					$(".signUpBtn").css({"backgroundColor": "#4CAF50",
										 "backgroundImage": "none"});
					/*
					$(".signUpBtn").prop("class", "btn btn-primary");
					*/
					$("#idCheck").css("background-color", "#B0F6AC");
					document.getElementById("msg").value = "사용이 가능한 아이디입니다.";
					document.getElementById("msg2").innerHTML = "사용이 가능한 아이디입니다.";
					$("#msg").css("background-color", "#B0F6AC");
				} else if(data == '1') {
					$(".signUpBtn").prop("disabled", true);
					$(".signUpBtn").css("background-color", "#AAAAAA");
					$("#idCheck").css({"backgroundColor": "#B0F6AC",
						 "backgroundImage": "none"});
					document.getElementById("msg").value = "이미 사용 중인 아이디입니다.";
					document.getElementById("msg2").innerHTML = "이미 사용 중인 아이디입니다.";
					$("#msg").css("background-color", "#FFCECE");
				}
				
			},
			error: function(info) {
				// alert("에러가 발생하였습니다!");
			},
			complete: function(info) {
				// alert("작업을 완료하였습니다.");
			}
		});
		
	});

	//-------------------------------------------------------------------------------------------------
	// 회원가입 버튼을 눌렀을 경우
	//-------------------------------------------------------------------------------------------------
	$("#submit").on("click", function() {
		// 아이디, 비밀번호, 비밀번호확인, 이름, 전화번호, 주소에 값이 있는지 검사한다.
		// 입력된 값이 없으면 입력해야 한다고 경고창을 띄운다.
		
		if($("#userID").val() == "") {
			alert("아이디를 입력하셔야 합니다.");
			$("#userID").focus();
			return false;
		}
		if($("#pw").val() == "") {
			alert("비밀번호를 입력하셔야 합니다.");
			$("#pw").focus();
			return false;
		}
		if($("#repw").val() == "") {
			alert("비밀번호확인을 입력하셔야 합니다.");
			$("repw").focus();
			return false;
		}
		if($("#name").val() == "") {
			alert("이름을 입력하셔야 합니다.");
			$("#name").focus();
			return false;
		}
		if($("#nickname").val() == "") {
			alert("닉네임을 입력하셔야 합니다.");
			$("#nickname").focus();
			return false;
		}
		if($("#tel2").val() == "") {
			alert("전화번호를 입력하셔야 합니다.");
			$("#tel2").focus();
			return false;
		}
		if($("#tel3").val() == "") {
			alert("전화번호를 입력하셔야 합니다.");
			$("#tel3").focus();
			return false;
		}
		if($("#address_1").val() == "") {
			
			alert("주소를 입력하셔야 합니다.");
			$("#address_1").focus();
			return false;
		}
		if($("#pw").val() != $("#repw").val()) {
			alert("비밀번호 확인이 다릅니다.");
			$("#repw").focus();
			return false;
		}

		var mobile = $("#tel1").val() + $("#tel2").val() + $("#tel3").val();
		// document.getElementById("tel").value = $("#tel1").val() + $("#tel2").val() + $("#tel3").val();
		document.getElementById("tel").value = mobile;
		// alert(mobile);
		var add = $("#address_1").val() + $("#address_2").val();
		
		document.getElementById("address").value = add;
		
	});
	
});
</script>

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
			document.getElementById('zipcode').value	= data.zonecode;
			document.getElementById('address_1').value	= fullAddress;
			
			// 커서를 상세주소 입력란으로 이동시킨다.
			document.getElementById('address_2').focus();
        }
    }).open({
    	// 우편번호 팝업 창이 여러개 뜨는 것을 방지하기 위해서 popupName을 사용한다.
    	popupName:	'postcodePopup'
    });
}
</script>


</body>
</html>






