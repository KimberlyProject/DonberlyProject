<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<%@ include file="../include/header.jsp"%>
	
    <style>
        #membership{
          width:480px;
          margin:0 auto 50px;
        }
        #membership form>div{
          font-size:0px;
          margin-bottom:20px;
        }
        #membership #msgNickname,
        #membership #msg{
        	font-size:14px;  
        }
        #membership form>div>label{    
          font-size:18px;      
          display:block;    
          margin:0;      
          color:rgb(73, 124, 64);
        }
        #membership form>div>input{
          font-size:18px;
          width:100%;
          vertical-align:bottom;
          border:0;
          border-bottom:1px solid rgb(73, 124, 64);
          outline:none;
        }
        #membership form>div>select{
          font-size:18px;
        }
        #membership form>div>#user_id,
        #membership form>div>#address{
          width:calc(100% - 100px);
          margin-right:10px;
        }
        #membership form>div>#zipCode{
          width:100px;
          margin-right:10px;
          border:1px solid #ccc;
          border-radius:5px;
          background-color:#ddd;
        }
        #membership form>div>#address2{
          width:calc(100% - 110px);
        }
        #membership form>div>#tel1,
        #membership form>div>#tel2,
        #membership form>div>#tel3{
          width:calc(33.33% - 10px);
          vertical-align:middle;
        }
        #membership form>div>#tel1 + span,
        #membership form>div>#tel2 + span{
          display:inline-block;
          width:15px;
          vertical-align:middle;
          text-align:center;
          font-size:18px;
        }
        #membership form>div>.btn{
          width:90px;
          color:#fff;
          background-color:rgb(230, 142, 60);
        }
        #membership form>.submit>input{
          width:100%;
          color:#fff;
          font-weight:bold;
          background-color:rgb(73, 124, 64);
        }
        @media all and (max-width:420px) {
	      	#membership{
		      	width:100%;
		      	max-width:480px;
		      	padding:0 10px;
	      	}
      }
    </style>
	
</head>
<body>
<%@ include file="../include/topMenu.jsp"%>
<c:set var="menu" value="member" />
<%@ include file="../include/sidebar.jsp" %>

    <div class="page_dir container">
      <button id="sideMenu_open"><span class="glyphicon glyphicon-th-large"></span></button>
      홈 &gt; 회원 가입
    </div>
    <h1 class="pageTitle"><div>회원 가입</div></h1>

<div id="membership">
      <form action="${path}/member/membership" method="post" id="memberForm">
        <div>
          <label for="user_id">아 이 디</label>
          <input type="text" id="userID" name="userId"/>
        </div>
        <div>
			<div id="msg"></div>
		</div>
        <div>
          <label for="pw">비밀번호</label>
          <input type="password" id="pw" name="pw"/>          
        </div>
        <div>
          <label for="repw">비밀번호 확인</label>
          <input type="password" id="repw" name="repw"/>
        </div>
        <div>
          <label for="name">이    름</label>
          <input type="text" id="name" name="name"/>
        </div>
        <div>
          <label for="nickname">닉네임</label>
          <input type="text" id="nickname" name="nickname"/>
        </div>
        <div>
			<div id="msgNickname"></div>
		</div>
        <div>
          <label for="tel">연 락 처</label>        
          <select id="tel1" name="tel1">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="017">017</option>
            <option value="018">018</option>
            <option value="019">019</option>
          </select>
          <span>-</span>
          <input type="tel" id="tel2" name="tel2" maxlength="4"/>
          <span>-</span>
          <input type="tel" id="tel3" name="tel3" maxlength="4"/>
        </div>
        <input type="hidden" id="tel" name="tel"/>
        <div>
          <label for="email">이 메 일</label>
          <input type="text" id="email" name="email"/>
        </div>
        <div>
          <label for="address1">주    소</label>
          <input type="text" id="address" name="address"/>
          <button type="button" class="btn" onclick="daumZipCode()">주소 검색</button>
        </div>
        <div>
          <label for="address2">상세주소</label>
          <input type="text" id="zipCode" name="zipCode" readonly/>
          <input type="text" id="address2" name="address2"/>
        </div>
        <div class="submit">
          <input type="button" class="btn" value="회원가입"/>
        </div>
      </form>
    </div>
    
    

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//-------------------------------------------------------------------------------------------------
// jQuery를 이용하여 페이지가 로딩되면 할 수 있는 것들을 만든다.
//-------------------------------------------------------------------------------------------------
$(document).ready(function() {

	//-------------------------------------------------------------------------------------------------
	// 회원가입취소 버튼을 누르면 
	//-------------------------------------------------------------------------------------------------
	$(".cancel").on("click", function() {
		location.href="${path}/member/login";
	});
	
	//-------------------------------------------------------------------------------------------------
	// 아이디 입력란에 글자를 쓰면 실시간으로 사용이 가능한지 아닌지 검사한다.
	//-------------------------------------------------------------------------------------------------
	$("#userID").on("input", function() {
		var inputID = $('#userID').val();
		// alert(inputID);
		
		$.ajax({
			url:			"${path}/member/idCheck",
			type:			"post",
			dataType:		"json",
			data:			{"userId" : $('#userID').val()},
			success:		function(data) {
				// alert("중복검사결과 : " + data);
				// if(inputID == "" && data == '0') {
				if(inputID != "" && inputID.length < 4 && data == '0') {
					document.getElementById("msg").innerHTML = "아이디는 4자리 이상이어야 합니다.";
					$("#msg").css("color", "red");
				} else if(inputID != "" && inputID.length >= 4 && data == '0') {
					document.getElementById("msg").innerHTML = "사용이 가능한 아이디입니다.";
					$("#msg").css("color", "rgb(83 147 243)");
				} else if(data == '1') {
					document.getElementById("msg").innerHTML = "이미 사용 중인 아이디입니다.";
					$("#msg").css("color", "red");
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
	
    // 닉네임 입력란에 글자를 쓰면 실시간으로 닉네임 사용 가능 여부를 검사한다.
    $("#nickname").on("input", function() {
        var inputNickname = $("#nickname").val();

        $.ajax({
            url: "${path}/member/nickCheck",
            type: "post",
            dataType: "json",
            data: {"nickname": inputNickname},
            success: function(data) {
                if (inputNickname != "" && inputNickname.length < 2 && data == '0') {
                    $("#msgNickname").html("닉네임은 2자리 이상이어야 합니다.");
                    $("#msgNickname").css("color", "red");
                } else if (inputNickname != "" && inputNickname.length >= 2 && data == '0') {
                    $("#msgNickname").html("사용 가능합니다.");
                    $("#msgNickname").css("color", "rgb(83 147 243)");
                } else if (data == '1') {
                    $("#msgNickname").html("이미 사용 중인 닉네임입니다.");
                    $("#msgNickname").css("color", "red");
                }
            },
            error: function(info) {
                // 에러 처리
            },
            complete: function(info) {
                // 완료 처리
            }
        });
    });

	//-------------------------------------------------------------------------------------------------
	// 회원가입 버튼을 눌렀을 경우
	//-------------------------------------------------------------------------------------------------
	$(".submit").on("click", function() {
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
			$("#repw").focus();
			return false;
		}    
		if($("#pw").val() != $("#repw").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#pw").focus();
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
		if($("#email").val() == "") {			
			alert("이메일를 입력하셔야 합니다.");
			$("#email").focus();
			return false;
		}
		if($("#address1").val() == "") {			
			alert("주소를 입력하셔야 합니다.");
			$("#address1").focus();
			return false;
		}
		var mobile = $("#tel1").val() + $("#tel2").val() + $("#tel3").val();
		$("#tel").val(mobile);
		
		var registrationSuccess = true; // 회원가입 성공
		
	 	if (registrationSuccess) {
	        // 회원가입 성공 알림을 띄웁니다.
	        alert("회원가입이 성공적으로 완료되었습니다. 환영합니다!");

	        // 페이지를 이동하거나 필요한 작업을 수행할 수 있습니다.
	        // 예를 들어, 회원가입 성공 후 메인 페이지로 리다이렉트할 수 있습니다.
	        window.location.href = "${path}member/login"; // 로그인 페이지 이동
	    }

    $('#memberForm').submit();
	});
});
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
</script>

<%@ include file="../include/footer.jsp"%>

</body>
</html>






