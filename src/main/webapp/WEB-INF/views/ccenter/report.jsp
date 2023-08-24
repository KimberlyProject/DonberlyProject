<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/topMenu.jsp" %>
 <h1>신고하기</h1>
    
    <form action="submitReport" method="post">
        <label for="reporter">신고자:</label>
        <input type="text" id="reporter" name="reporter" value="몽룡이" readonly><br>
        
        <label for="reportedUser">신고대상:</label>
        <input type="text" id="reportedUser" name="reportedUser"><br>
        
        <label for="reason">사유:</label>
        <select id="reason" name="reason">
            <option value="비매너">비매너(욕설/비방, 기만, 노쇼, 음란/선정성 개인정보유출 등)</option>
            <option value="허위매물">허위매물</option>
            <option value="상품상태불량">상품 상태 불량</option>
            <option value="광고홍보">광고/홍보</option>
            <option value="관련없는이미지내용">관련없는 이미지/관련없는 내용</option>
            <option value="게시글도배">게시글 도배</option>
            <option value="기타">기타</option>
        </select><br>
        
        <label for="details">상세내용:</label><br>
        <textarea id="details" name="details" rows="5" cols="40"></textarea><br>
        
        <input type="submit" value="신고하기">
        <input type="button" value="취소" onclick="history.back()">
    </form>
<%@ include file="../include/footer.jsp" %>
</body>
</html>