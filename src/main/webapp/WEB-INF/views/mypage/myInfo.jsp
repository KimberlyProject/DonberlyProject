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
        
        .submit-container a.btn {
		    margin-bottom: 10px;
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
        
		.my {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: black;
            background-image: url("../../resources/images/profliebackground.jpeg");
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        /* Profile info section */
        .profile-info {
            text-align: center;
            padding: 20px;
            border-radius: 5px;
            margin: 20px auto; /* 전체 간격을 조절합니다. */
            max-width: 600px; /* 가로 크기 제한 (선택 사항) */
        }

        .profile-info img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .profile-info p {
            margin: 5px 0;
            font-size: 18px;
            color: black;
        }

        /* Edit button */
        .edit-button {
            text-align: center;
            margin-top: 20px;
        }

        .edit-button a.btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
        
        /* 모달 스타일 */
		.modal {
		    display: none;
		    position: fixed;
		    z-index: 1;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto;
		    background-color: rgba(0,0,0,0.4);
		}
		
		.modal-content {
		    background-color: #fefefe;
		    margin: 25% auto;
		    padding: 20px;
		    border: 1px solid #888;
		    border-radius: 5px;
		    max-width: 240px;
		}
		
		.close {
		    color: black;
		    float: right;
		    font-size: 28px;
		    font-weight: bold;
		    opacity: 1;
    		cursor: pointer;
		}
		
		.close:hover,
		.close:focus {
		    color: black;
		    text-decoration: none;
		    cursor: pointer;
		}
		
		.inline-btn {
	        display: inline-block;
	        margin-top: 10px;
    		margin-left: 70px;
	    }
	     
	    .modal-content label {
	        margin-left: 25px;
	    }

		/* 수정하기 버튼 스타일 */
		.edit-button a.btn {
		    background-color: rgb(73, 124, 64); /* 원하는 배경 색상 설정 */
		    color: white; /* 글자 색상 설정 */
		}
		
		/* 수정하기 버튼에 호버 */
		.edit-button a.btn:hover {
		    background-color: rgb(73, 124, 65);
		    color: white;
		}
    </style>
</head>
<body>
    <div class="top-menu">
        <%@ include file="../include/topMenu.jsp" %>
    </div>
    
	<c:set var="menu" value="mypage" />
	<%@ include file="../include/sidebar.jsp" %>
    <div class="page_dir container">
      <button id="sideMenu_open"><span class="glyphicon glyphicon-th-large"></span></button>
      홈 &gt; 마이페이지 &gt; 내 정보 보기    
    </div>

	<h1 class="pageTitle"><div>내정보</div></h1>
    
    
    <div class="container my">
	    <div class="profile-info">
            <img src="${path}../../resources/images/profileimage.png" alt="프로필 사진">
            
            <div class="row">
            <div class="row-md-offset-2">
            <p class="info"><strong>닉네임:</strong> ${member.nickname}</p>
            </div>
            </div>
            <p class="info"><strong>이메일:</strong> ${member.email}</p>
        </div>
	    
	     <div class="edit-button">
	        <a href="javascript:void(0);" class="btn" onclick="confirmPassword()">수정하기</a>
	    </div>
	</div>
	
	<!-- 비밀번호 확인 모달 -->
	<div id="passwordModal" class="modal">
	    <div class="modal-content">
	        <span class="close" onclick="closeModal()">&times;</span>
	        <label for="password">비밀번호를 입력하세요</label>
	        <input type="password" id="password" name="password" required onkeydown="handleEnterKey(event)">
	        <button class="btn btn-primary inline-btn" onclick="checkPassword()">확인</button>
	    </div>
	</div>
	
	
    
    <div class="footer">
        <%@ include file="../include/footer.jsp" %>
    </div>
    
    <script>
	    // Enter 키 처리
	    function handleEnterKey(event) {
	        if (event.keyCode === 13) {
	            event.preventDefault();
	            checkPassword();
	        }
	    }
    	
        function confirmPassword() {
            var modal = document.getElementById("passwordModal");
            modal.style.display = "block";
        }

        function closeModal() {
            var modal = document.getElementById("passwordModal");
            modal.style.display = "none";
        }

        function checkPassword() {
            var enteredPassword = document.getElementById("password").value;
            var storedPasswordFromDB = "${member.pw}"; // 데이터베이스에서 가져온 비밀번호

            if (enteredPassword === storedPasswordFromDB) {
                window.location.href = "${path}/member/userProfileEditor";
            } else {
                alert("비밀번호가 일치하지 않습니다.");
            }

            closeModal();
        }
    </script>
</body>
</html>
