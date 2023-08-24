<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
</head>
<style>
             

</style>
<body>
	<div class="container">
		<h2 align="center">회원 목록</h2>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th align="center">아이디</th>
					<th align="center">이  름</th>
					<th align="center">가입일자</th>
					<th align="center">전화번호</th>
					<th align="center">우편번호</th>
					<th align="center">주    소</th>
					<th align="center">상세주소</th>
					<th align="center"> 이메일 </th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${chatList}">
				<tr>
					<td><a href="/member/memberDetail?id=${list.user_id }">${list.user_id }</a></td>
					<td>${list.name }</td>
					<td><fmt:formatDate value="${list.reg_date }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></td>
					<td>${list.tel }</td>
					<td>${list.nickname }</td>
					<td>${list.address }</td>
					<td>${list.my_img }</td>
					<td>${list.email }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>