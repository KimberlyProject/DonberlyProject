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
</style>
<!-- 모달 시작 -->
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
                    <img src="../../resources/images/jjangu.png" alt="프로필 사진">
                    <div class="row">
                        <div class="row-md-offset-2">
                            <p class="info"><strong>닉네임:</strong> <span id="modalNickname"></span></p>
                        </div>
                    </div>
                    <p class="info"><strong>이메일:</strong> <span id="modalEmail"></span></p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" onclick="chat()">1대1 채팅하기</button>
                <button type="button" class="btn btn-danger" onclick="report()">신고하기</button>
            </div>
        </div>
    </div>
</div>

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
            window.location.href = "../ccenter/report";
        } else {
            alert("신고가 취소되었습니다.");
        }
    }
</script>
<!-- 모달 끝 -->

<script>
    function openModal(member) {
        // 여기서 member는 해당 회원의 정보 객체입니다.
        // 모달 내용을 동적으로 채워 넣는 코드를 추가합니다.
        document.getElementById('modalNickname').innerText = member.nickname;
        document.getElementById('modalEmail').innerText = member.email;

        // 모달을 활성화합니다.
        $('#memberModal').modal('show');
    }
</script>