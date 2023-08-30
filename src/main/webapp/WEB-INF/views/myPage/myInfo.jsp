<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내정보</title>
    <%@ include file="../include/header.jsp" %>
    <style>
        
        .top-menu {
            background-color: #333;
            color: #fff;
        }
        .profile-info {
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #f9f9f9;
            margin: 20px auto; /* 전체 간격을 조절합니다. */
            max-width: 600px; /* 가로 크기 제한 (선택 사항) */
            text-align: center;
        }
        .profile-info img {
            border-radius: 50%;
            display: block;
            margin: 0 auto 10px;
        }
        .profile-info p {
            margin: 5px 0;
        }
        .submit-container {
            text-align: center; /* 버튼 가운데 정렬 */
            margin-top: 20px; /* 위쪽 여백 추가 */
        }
        #submit {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
            margin-bottom: 5px;
        }
        .footer {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
        }
        h1 {
            text-align: center;
        }
        
        .introduction {
        	resize: none;
        }
        
        .submit-container a.btn {
		    margin-bottom: 10px;
		}

        /* 추가적인 스타일링을 여기에 추가할 수 있습니다. */
    </style>
</head>
<body>
    <div class="top-menu">
        <%@ include file="../include/topMenu.jsp" %>
    </div>
	<c:set var="menu" value="mypage" />
	<%@ include file="../include/sidebar.jsp" %>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      홈 &gt; 마이페이지 &gt; 내 정보
    </div>
	<!-- 배너 타이틀 -->
  <h1 class="pageTitle"><div>내 정보</div></h1>
    
    
   	<c:if test="${member == null}">
		<script>location.href="/member/login"</script>
	</c:if>   
    <div class="profile-info">
        <img src="../../resources/images/jjangu.png" width="100" height="100" alt="프로필 사진"/>
        <p class="nickname"><strong>닉네임:</strong> 사용자_닉네임</p>
        <p class="email"><strong>이메일:</strong> 사용자_이메일</p>
        <p class="introduce"><strong>자기소개</strong></p>
        <textarea class="introduction" rows="4" cols="50" readonly>안녕하세요 짱구입니다. </textarea>
    </div>
    
     <!-- <div class="submit-container">
        <input id="submit" type="button" value="수정하기" class="btn btn-success"/>
     </div> -->
     
    <div class="submit-container">
    	<a href="${path}/myPage/myProfileUpdate" class="btn btn-success">수정하기</a>
	</div>
    
    <div class="footer">
        <%@ include file="../include/footer.jsp" %>
    </div>
</body>
</html>
