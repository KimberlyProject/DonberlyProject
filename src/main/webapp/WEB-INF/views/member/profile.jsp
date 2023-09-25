<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile</title>
<%@ include file="../include/header.jsp"%>
<style>
h1 {
	text-align: center;
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

/* 09-01 */
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

.container {
	max-width: 400px;
	margin: 20px auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* Profile info section */
.profile-info {
	text-align: center;
	padding: 20px;
	background-color: #f9f9f9;
	border-radius: 5px;
	margin: 20px auto; /* 전체 간격을 조절합니다. */
	max-width: 400px; /* 가로 크기 제한 (선택 사항) */
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
	color: white;
}
</style>
<script>
	function chat() {
		var confirmChat = confirm("1대1 채팅을 시작하시겠습니까?");
		if (confirmChat) {
			// 채팅 시작 로직을 여기에 추가
			alert("1대1 채팅이 시작되었습니다.");
			window.location.href = "../chat/chattingview";
		} else {
			alert("채팅이 취소되었습니다.");
		}
	}
	function report() {
		var confirmReport = confirm("신고하시겠습니까?");
		if (confirmReport) {
			// 신고 처리 로직을 여기에 추가
			window.location.href = "../ccenter/report";
		} else {
			alert("신고가 취소되었습니다.");
		}
	}
</script>
</head>
<body>
	<h1>${profile.nickname}의프로필</h1>

	<div class="container">
		<div class="profile-info">
			<img src="${path}/resources/images/jjangu.png" alt="프로필 사진">

			<div class="row">
				<div class="row-md-offset-2">
					<p class="info">
						<strong>닉네임:</strong> ${profile.nickname}
					</p>
				</div>
			</div>
			<p class="info">
				<strong>이메일:</strong> ${profile.email}
			</p>
		</div>
		<div class="submit-container">
			<input id="submit" type="button" value="1대1 채팅하기"
				class="btn btn-success" onclick="chat()" /> <input id="submit"
				type="button" value="신고하기" class="btn btn-danger" onclick="report()" />
		</div>
	</div>




</body>
</html>