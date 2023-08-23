<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <h1>Q&A 목록</h1>
    
    <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
        </tr>
        
        <c:forEach items="${qnaList}" var="qna">
            <tr>
                <td>${qna.id}</td>
                <td>${qna.title}</td>
                <td>${qna.author}</td>
                <td>${qna.date}</td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>