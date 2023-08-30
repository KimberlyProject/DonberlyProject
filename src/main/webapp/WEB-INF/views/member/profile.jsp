<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>profile</title>
    <%@ include file="../include/header.jsp" %>
    <style>
        h1 {
            text-align: center;
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
        .introduction {
        	resize: none;
        }
        
        
    </style>
    <script>
	    function chat() {
	        var confirmChat = confirm("1대1 채팅을 시작하시겠습니까?");
	        if (confirmChat) {
	            // 채팅 시작 로직을 여기에 추가
	            alert("1대1 채팅이 시작되었습니다.");
	        } else {
	            alert("채팅이 취소되었습니다.");
	        }
	    }
        function report() {
            var confirmReport = confirm("신고하시겠습니까?");
            if (confirmReport) {
                // 신고 처리 로직을 여기에 추가
                alert("신고되었습니다.");
            } else {
                alert("신고가 취소되었습니다.");
            }
        }
        
        function logout() {
            var confirmLogout = confirm("로그아웃하시겠습니까?");
            if (confirmLogout) {
                // 로그아웃 처리 로직을 여기에 추가
                alert("로그아웃되었습니다.");
            } else {
                alert("로그아웃이 취소되었습니다.");
            }
        }
    </script>
</head>
<body>
    <h1>프로필</h1>
    
    <div class="profile-info">
        <img src="../../resources/images/jjangu.png" width="100" height="100" alt="프로필 사진"/>
        <p class="nickname"><strong>닉네임:</strong> 사용자_닉네임</p>
        <p class="email"><strong>이메일:</strong> 사용자_이메일</p>
        <p class="introduce"><strong>자기소개</strong></p>
        <textarea class="introduction" rows="4" cols="50" readonly>안녕하세요 짱구입니다.</textarea>
    </div>
    
     <div class="submit-container">
        <input id="submit" type="button" value="1대1 채팅하기" class="btn btn-success" onclick="chat()"/>
        <input id="submit" type="button" value="신고하기" class="btn btn-danger" onclick="report()"/>
        <input id="submit" type="button" value="로그아웃" class="btn btn-warning" onclick="logout()"/>
    </div>


</body>
</html>