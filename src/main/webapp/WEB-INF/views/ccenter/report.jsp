<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>신고하기</title>
	<%@ include file="../include/header.jsp" %>
	
	<style>
	#report-form table tr>td:nth-child(1) {
		text-align: center; 
		width: 20%;
	}
	
	#report-form table tr>td:nth-child(2) {
		width: 100%;
	}
	
	#report-form table tr>td:nth-child(2) textarea {
   		width: 100%;
   		height: 200px;
    }
	
	#content::placeholder {
        color: lightgray; /* 연한 회색으로 변경 */
    }
	
	
	</style>
</head>

<body>
<%@ include file="../include/topMenu.jsp" %>
<div id="content-wrapper">
<aside id="sideMenu">
      <ul>
        <li><a href="./notice">공지사항</a></li>
        <li><a href="./qna">Q & A</a></li>
        <li><a href="#">1:1 문의하기</a></li>
        <li><a href="#">신고하기</a></li>
      </ul>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <span><a href="./notice">고객센터</a></span>
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span><a href="./qna">신고하기</a></span>
    </div>
    <h1 class="pageTitle"><div>신고하기</div></h1>
    
    <div id="report-form" class="container">
    <form id="report-form">
            <table style="width: 100%;" class="table" id="table" >
                <tr>
                    <td><label for="reporter">신고자</label></td>
                    <td><input type="text" id="reporter" name="reporter" value="피해자"></td>
                </tr>
                <tr>
                    <td><label for="reportedUser">신고대상</label></td>
                    <td><input type="text" id="reportedUser" name="reportedUser" value="김종민"></td>
                </tr>
                <tr>
                    <td><label for="reason">사유</label></td>
                    <td><select id="reason" name="reason">
				            <option value="비매너">비매너(욕설/비방, 기만, 노쇼, 음란/선정성 개인정보유출 등)</option>
				            <option value="허위매물">허위매물</option>
				            <option value="상품상태불량">상품 상태 불량</option>
				            <option value="광고홍보">광고/홍보</option>
				            <option value="관련없는이미지내용">관련없는 이미지/관련없는 내용</option>
				            <option value="게시글도배">게시글 도배</option>
				            <option value="기타">기타</option>
        				</select></td>
                </tr>
                <tr>
                    <td><label for="content">상세내용</label></td>
                    <td><textarea id="content" name="content" placeholder="자세한 내용을 함께 보내주시면 더욱 신속히 답변드릴수 있습니다." rows="4" style="resize: none;"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <button type="submit" class="btn btn-success" id="submit-button">신고하기</button>
                        <button type="reset" class="btn btn-danger" id="reset-button">취소</button>
                    </td>
                </tr>
            </table>
        </form>
    </div> 
  </div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>