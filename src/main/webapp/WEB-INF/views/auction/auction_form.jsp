<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file="../include/header.jsp" %>
	<style>
	.colon{
		width: 4px;
	}
	.cate{
		width: 100px;
	}
	
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	
	<div class="container">
		<h2 align="center">경매장</h2>
		<div align="right">
			<span class="label label-info" style="font-size: 17px;">검색조건</span>

			<select id="searchType" style="font-size: 18px;">
				<option value="a" <c:if test="{searchType} == 'a'">selected</c:if>>전체</option>
				<option value="w" <c:if test="{searchType} == 'w'">selected</c:if>>작성자</option>
				<option value="c" <c:if test="{searchType} == 'c'">selected</c:if>>내용</option>
				<option value="p" <c:if test="{searchType} == 'p'">selected</c:if>>상품번호</option>
			</select>
			
			<input type="text" id="searchKeyword" value="${keyword }" placeholder="검색값"/>
			<button id="searchBtn" class="btn btn-warning btn-sm">검&nbsp;색</button>
		</div>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th rowspan="4"><img src="#" alt="상품사진""/></th><th class="cate">제목</th><th class="colon">:</th><th colspan="4">제목~</th>
			</tr>
			<tr>
				<th class="cate">판매자</th><th class="colon">:</th><th colspan="4">판매자 ID</th>
			</tr>
			<tr>
				<th class="cate">현재 가격</th><th class="colon">:</th><th>999,999</th><th class="cate">상한가</th><th class="colon">:</th><th>999,999</th>
			</tr>
			<tr>
				<th class="cate">마감 기한</th><th class="colon">:</th><th colspan="4">2023.8.10(금) 24:00</th>
			</tr>
		</table>
	
	
	</div>
<%@ include file="../include/footer.jsp" %>
</body>
</html>