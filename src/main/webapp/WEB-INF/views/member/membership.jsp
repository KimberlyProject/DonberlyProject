<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돈벌리</title>
	<%@ include file="../include/header.jsp" %>
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
	<%@ include file="../include/topMenu.jsp" %>
    <aside id="sideMenu">
      <ul>
        <li><a href="#">회원가입</a></li>
        <li><a href="#">로그인</a></li>
      </ul>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      회원 가입
    </div>
    <h1 class="pageTitle"><div>회원 가입</div></h1>
    <div class="container" id="membership">
      <form action="" method="get">
        <div>
          <label for="user_id">아 이 디</label>
          <input type="text" id="user_id" name="user_id"/>
          <button class="btn">중복 확인</button>
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
          <button class="btn">중복 확인</button>
        </div>
        <div>
          <label for="address1">주    소</label>
          <input type="text" id="address1" name="address1"/>
          <input type="button" class="btn" onclick="daumZipCode()" value="주소 검색"/>       
        </div>
        <div>
          <label for="address2">상세주소</label>
          <input type="text" id="address2" name="address2"/>
        </div>
        <div>
          <label for="tel">연 락 처</label>
          <input type="text" id="tel" name="tel"/>
        </div>
        <div>
          <label for="email">이 메 일</label>
          <input type="text" id="email" name="email"/>
        </div>
        <div class="submit">
          <input type="submit" class="btn" value="회원가입"/>
        </div>
      </form>
    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function daumZipCode() {
        new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            console.log(data);
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
          document.getElementById('address1').value	= fullAddress;
          
          // 커서를 상세주소 입력란으로 이동시킨다.
          document.getElementById('address2').focus();
            }
        }).open({
          // 우편번호 팝업 창이 여러개 뜨는 것을 방지하기 위해서 popupName을 사용한다.
          popupName:	'postcodePopup'
        });
    }
    </script>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>