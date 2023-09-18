<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .modal-footer {
        text-align: center;
    }

    /* 프로필 정보 섹션 */
    .profile-info {
        text-align: center;
        padding: 20px;
        background-color: #f9f9f9;
        border-radius: 5px;
        margin: 20px auto;
        max-width: 400px;
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
    }
    
    .modal-body {
    	background-image: url("../../resources/images/profliebackground.jpeg");
    }
</style>
<!-- 모달 시작 -->
<form name="modalform" method="post"   action="${Path}/ccenter/report" >
<div class="modal fade" id="memberModal" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="memberModalLabel">프로필 정보</h4>
            </div>
            <div class="modal-body">
                <!-- 프로필 정보 영역 -->
                <div class="profile-info">
                    <img src="../../resources/images/profileimage.png" alt="프로필 사진">
                    <div class="row">
                        <div class="row-md-offset-2">
                            <p class="info"><strong>닉네임:</strong> <span id="modalNickname"></span></p>
		                    <p class="info"><strong>이메일:</strong> <span id="modalEmail"></span></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="chat()">1대1 채팅하기</button>
                <button type="button" class="btn btn-danger" onclick="report()">신고하기</button>
            </div>
        </div>
    </div>
</div>
</form>
<script>
    function chat() {
        var confirmChat = confirm("1대1 채팅을 시작하시겠습니까?");
        if (confirmChat) {
            // 채팅 시작 로직을 여기에 추가
            window.location.href = "../chat/chattingview";
        } else {
            alert("채팅이 취소되었습니다.");
        }
    }
    function report() {
        var confirmReport = confirm("신고하시겠습니까?");
        if (confirmReport) {
            // 신고 처리 로직을 여기에 추가
            window.location.href = "../ccenter/report?report=" + document.getElementById('modalNickname').innerText;
        } else {
            alert("신고가 취소되었습니다.");
        }
    }
</script>
<!-- 모달 끝 -->


<script>
function openModal(member) {
    document.getElementById('modalNickname').innerText = member.nickname;
    document.getElementById('modalEmail').innerText = member.email;

    // 현재 로그인된 세션의 정보 가져오기 (예: 세션에 저장된 닉네임)
    var loggedInNickname = "${sessionScope.member.nickname}";

    // 클릭한 닉네임과 세션의 닉네임이 같은 경우에만 버튼을 숨깁니다.
    if (member.nickname === loggedInNickname) {
        document.querySelector('.btn-success').style.display = 'none'; // 1대1 채팅하기 버튼 숨기기
        document.querySelector('.btn-danger').style.display = 'none';  // 신고하기 버튼 숨기기
    } else {
        document.querySelector('.btn-success').style.display = 'inline'; // 1대1 채팅하기 버튼 표시하기
        document.querySelector('.btn-danger').style.display = 'inline';  // 신고하기 버튼 표시하기
    }

    // 모달을 열기
    $('#memberModal').modal('show');
}

</script>