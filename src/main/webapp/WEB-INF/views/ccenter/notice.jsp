<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file ="../include/header.jsp" %>

<body>

<%@ include file="../include/topMenu.jsp" %>
<h1>공지사항 목록</h1>
    
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
        </tr>
        
        <c:forEach items="${noticeList}" var="notice">
            <tr>
                <td>${notice.id}</td>
                <td>${notice.title}</td>
                <td>${notice.author}</td>
                <td>${notice.date}</td>
            </tr>
        </c:forEach>
    </table>
    
    
    <%@ include file="../include/footer.jsp" %>

</body>
</html>