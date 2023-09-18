<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    /* 모달 스타일 */
    .modal-dialog {
        max-width: 8000px;
    }

    /* 모달 내부 스타일 */
    .modal-body {
        padding: 20px;
    }

    .modal-title {
        font-size: 22px;
        text-align: center;
    }

    /* 폼 스타일 */
    .form-group {
        margin-bottom: 20px;
    }

    label {
    	font-size: 18px;
        font-weight: bold;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    
    /* 버튼 스타일 */
    .btn-group {
    	width: 100%;
        text-align: center;
        margin-top: 20px;
    }

    #reset,
    #send {
        width: 150px;
        margin: 0 10px;
    }

</style>

<!-- e-mail 전송 페이지 모달 시작 -->
<form name="modalform" id="emailForm" method="post" action="${Path}/admin/mailSend">
    <div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="memberModalLabel">메일 보내기</h4>
                </div>
                <div class="modal-body">
                    <!-- 이메일 보내기 폼 영역 -->
                    <div class="container-fluid">
                        <div class="form-group">
                            <label class="control-label">제목</label>
                            <div>
                                <input type="text" id="subject" class="form-control" name="subject" placeholder="제목 입력">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">받는 분</label>
                            <div>
                                <input type="hidden" class="form-control" name="email" id="email">
                                <p class="info"><span id="modalEmail"></span></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label">메일 내용</label>
                            <div>
                                <textarea name="message" id="message" rows="10" cols="100" maxlength="4000" placeholder="메일 내용 입력" style="resize: none;"></textarea>
                            </div>
                        </div>
                        <div class="btn-group">
                           	<div>
                               	<input id="reset" class="btn btn-danger" type="reset" value="다시 작성하기" />
                               	<input id="send" class="btn btn-primary" type="submit" value="메일 보내기" />
                            </div>
                        </div>
                   </div>
                </div>
            </div>
        </div>
    </div>
</form>


<!-- e-mail 전송 페이지 모달 끝 -->


<script>
function openModal(member) {
	document.getElementById("subject").value = '';
	document.getElementById("message").value = '';
	
	document.getElementById('modalEmail').innerText = member.email;
	document.getElementById("email").value = member.email;
    
    // 모달을 열기
    $('#emailModal').modal('show');
    
}

</script>
