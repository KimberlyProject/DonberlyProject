<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 문의하기</title>
    <%@ include file="../include/header.jsp" %>
    <style>
    	#inquiry-form table tr>td:nth-child(1){
    		text-align: center; 
    		width: 20%;
    	}
    	#inquiry-form table tr>td:nth-child(2) input {
    		width: 100%;
    	}
    	#inquiry-form table tr>td:nth-child(2) textarea{
    		width: 100%;
    		height: 200px;
    	}
    	
    	#title::placeholder, #content::placeholder {
        color: lightgray; /* 연한 회색으로 변경 */
    	}
    	
    
   
    </style>
</head>
<body>

<%@ include file="../include/topMenu.jsp" %>
   <aside id="sideMenu">
      <ul>
        <li><a href="./notice">공지사항</a></li>
        <li><a href="./qna">Q & A</a></li>
        <li><a href="./askOnetoOne">1:1 문의하기</a></li>
        <li><a href="./report">신고하기</a></li>
      </ul>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <span><a href="./notice">고객센터</a></span>
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span><a href="./qna">1:1 문의하기</a></span>
    </div>
    <h1 class="pageTitle"><div>1:1 문의하기</div></h1>
    
    <div id="inquiry-form" class="container">
        <form id="inquiry-form">
            <table style="width: 100%;" class="table" id="table" >
                <tr>
                    <td><label for="title">제목</label></td>
                    <td><input type="text" id="title" name="title" placeholder="제목을 입력하세요"></td>
                </tr>
                <tr>
                    <td><label for="nickname">작성자</label></td>
                    <td><input type="text" id="nickname" name="nickname"></td>
                </tr>
                <tr>
                    <td><label for="content">문의내용</label></td>
                    <td><textarea id="content" name="content" placeholder="자세한 내용을 함께 보내주시면 더욱 신속히 답변드릴수 있습니다.&#13;&#10;&#13;&#10;10월 18일부터 산업안전보건법에 고객응대 근로자 보호조치가 시행됩니다. 고객응대근로자에게 폭언, 욕설 등을 하지 말아주세요." rows="4" style="resize: none;"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <button type="submit" class="btn btn-success" id="submit-button">문의하기</button>
                        <button type="reset" class="btn btn-danger" id="reset-button">취소</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
<script>
    const submitButton = document.getElementById('submit-button');
    const tableBody = document.getElementById('table-body');

    submitButton.addEventListener('click', submitInquiry);

    function submitInquiry() {
        const title = document.getElementById('title').value;
        const nickname = document.getElementById('nickname').value;
        const content = document.getElementById('content').value;

        if (title.trim() === '' || nickname.trim() === '' || content.trim() === '') {
            alert('모든 필드를 입력해주세요.');
            return;
        }

        // 서버로 데이터를 전송하고, 테이블에 추가하는 로직을 구현해야 합니다.

        const newRow = createTableRow(title, nickname, content);
        tableBody.appendChild(newRow);

        // 입력 필드 초기화
        document.getElementById('title').value = '';
        document.getElementById('nickname').value = '';
        document.getElementById('content').value = '';
    }

    function createTableRow(title, nickname, content) {
        const newRow = document.createElement('tr');

        const titleCell = document.createElement('td');
        titleCell.textContent = title;
        newRow.appendChild(titleCell);

        const nicknameCell = document.createElement('td');
        nicknameCell.textContent = nickname;
        newRow.appendChild(nicknameCell);

        const contentCell = document.createElement('td');
        contentCell.textContent = content;
        newRow.appendChild(contentCell);

        return newRow;
    }
</script>



<%@ include file="../include/footer.jsp" %>
</body>
</html>

