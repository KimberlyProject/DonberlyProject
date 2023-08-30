<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내정보</title>
    <%@ include file="../include/header.jsp" %>
    <style>
    	.form-group {
	    	width: 350px;
	    	margin: auto;
    	}
    	input {
    		margin-bottom: 10px;
    	}
    	#submit {
    		margin-top: 20px;
    	}
    	
    	.form-control {
    		resize:	none;
    	}
    </style>
</head>
<body>

<div class="container mt-5">
    <form action="wtf.jsp" method="POST">
        <div class="text-center"> <!-- 가로 방향 중앙 정렬 -->
            <div class="form-group">
                <input type="text" class="form-control" id="아이디" name="아이디" placeholder="받는분 아이디">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="제목" name="제목" placeholder="제목">
            </div>
            <div class="form-group">
                <textarea class="form-control" id="내용" name="내용" rows="5" placeholder="내용을 입력하세요"></textarea>
            </div>
            <div>
                <button type="submit" class="btn btn-success" id="submit">전송</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
