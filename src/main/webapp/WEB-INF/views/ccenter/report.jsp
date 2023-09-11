<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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

<!-- 비로그인 상태에서 1:1 문의하기 클릭했을 때 로그인 창으로 보내는 펑션 -->
<%
	if(session.getAttribute("isLogOn") == null) {%>
	<!-- 
		<script>
			alert("먼저 로그인을 하셔야 글을 쓰실 수 있습니다!");
			location.href="/member/login";
		</script>
	 -->	
		<%
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('먼저 로그인을 하셔야 글을 쓰실 수 있습니다!');");
		pw.println("location.href='/member/login?action=/ccenter/askOnetoOne';");
		pw.println("</script>");
		pw.flush();
		pw.close();
		// out.println("<script>alert("먼저 로그인을 해주세요!");</script>");
		// response.sendRedirect("/member/login");
	}
%>

<div id="content-wrapper">

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

<c:set var="menu" value="ccenter" />
<%@ include file="../include/sidebar.jsp" %>
     <div class="page_dir container">

      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      홈 &gt; 고객센터 &gt; 신고하기
	</div>
    <h1 class="pageTitle"><div>신고하기</div></h1>
    
    <div class="container">
   	 	<form name="reportAnswer" method="post" action="${path }/ccenter/addNewReport.do" enctype="multipart/form-data">
            <table style="width: 100%;" class="table" id="table" >
                <tr>
                    <td><label for="reporter">신고자</label></td>
                    <td><input type="text" id="reporter" name="reporter" value="${member.userId}" readonly></td>
                </tr>
                <tr>
                    <td><label for="reportedUser">신고대상</label></td>
                    <td><input type="text" id="reportedUser" name="reportedUser" ></td>
                </tr>
                <tr>
                    <td><label for="reason">신고사유</label></td>
                    <td><select id="reason">
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
                        <button type="submit" class="btn btn-success" id="report-button">신고하기</button>
                        <button type="reset" class="btn btn-danger" id="reset-button">취소</button>
                    </td>
                </tr>
            </table>
        </form>
        
        <form id="formList">
        	<input type="hidden" name="reason"/>
        </form>
    </div> 
  </div>
<%@ include file="../include/footer.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("#formList");
	var reasonSelect = $("#reason");
	
	// 셀렉박스 값 변경 이벤트 핸들러
    reasonSelect.on("change", function() {
        var reasonValue = reasonSelect.val();
        if(reasonValue == "모두") {
            formObj.find("[name='reason']").val(reasonValue);
            formObj.submit();          
        }
        formObj.find("[name='reason']").val(reasonValue);
        formObj.submit();
    });
});
</script>


</body>
</html>

