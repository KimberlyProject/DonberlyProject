<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%!	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 전체 목록</title>
	<%@ include file="../include/header.jsp" %>
</head>
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
			<c:forEach var="list" items="${memberList}">
				<tr>
					<td><a href="/member/memberDetail?id=${list.id }">${list.id }</a></td>
					<td>${list.name }</td>
					<td><fmt:formatDate value="${list.reg_date }" pattern="yyyy년 MM월 dd일 HH시 mm분"/></td>
					<td>${list.tel }</td>
					<td>${list.zipcode }</td>
					<td>${list.address1 }</td>
					<td>${list.address2 }</td>
					<td>${list.email }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div align="center">
		<button type="button" class="btn btn-success" onClick="location.href='${path}/member/memberInsert'">회원가입</button>
	</div>
</body>
</html>

