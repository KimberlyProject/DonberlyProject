<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../include/header.jsp" %>
	<style>
		th {
			text-align:			center;
		}
		td {
			text-align:			center;
		}
		.content {
			display:			none;
		}
		.content.on {
			display:			table-cell;
		}
      	input {
        	width:				500px;
      	}
      	#searchbtn {
        	height: 			2.4em;
        	color:				#FFFFFF;
        	margin-right:		15px;
      	}
      	.searchgroup {
        	padding:			3px 3px 6px 3px;
        	margin-bottom:			10px;
      	}
      	.addr {
      		text-align:			left;
      	}
      	.stop {
      		margin-left:		50px;
      	}
      	.head > th:first-child {
			width:				5%;
		}
		.head > th:nth-child(2) {
			width:				5%;
		}
		.head > th:nth-child(3) {
			width:				15%;
		}
		.head > th:nth-child(4) {
			width:				15%;
		}
		.head > th:nth-child(5) {
			width:				45%;
		}
		.head > th:last-child {
			width:				15%;
		}
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<aside id="sideMenu">
      <ul>
        <li><a href="./oneOnOneInquiry">1:1 문의</a></li>
        <li><a href="./memberList">회원 목록</a></li>
      </ul>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <span><a href="./oneOnOneInquiry">관리자</a></span>
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span><a href="./memberList">회원 목록</a></span>
    </div>
    <h1 class="pageTitle"><div>회원 목록</div></h1>
	<div class="container">
		<!-- 검색창 -->
		<div class="row" style="vertical-align: middle; float:right;">
			<select class="col-sm-2 searchgroup" id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
				<option value="a" <c:if test="{searchType} == 'a'">selected</c:if>>전체</option>
				<option value="i" <c:if test="{searchType} == 'i'">selected</c:if>>아이디</option>
				<option value="t" <c:if test="{searchType} == 't'">selected</c:if>>연락처</option>
				<option value="addr" <c:if test="{searchType} == 'addr'">selected</c:if>>주소</option>
				<option value="d" <c:if test="{searchType} == 'd'">selected</c:if>>가입일자</option>
			</select>
			<input  class="col-sm-2 searchgroup form-control" type="text" class="form-control" style="width:200px;" placeholder="검색하기">
			<button id ="searchbtn" class="btn btn-success" type="button">
				<span class="glyphicon glyphicon-search"/>
			</button>   
		</div>
      	<!-- 검색창 -->
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr class="head" style="background: rgb(73, 124, 64); color: #FFF;">
					<th><span class="glyphicon glyphicon-ok"></span></th>
					<th>No</th>
					<th>아이디</th>
					<th>연락처</th>
					<th>주소</th>
					<th>가입일자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox" style="width: 100%;"/></td>
					<td>1</td>
					<td>heedong</td>
					<td>010-1111-1111</td>
					<td class="addr">서울특별시 종로구 종로 78 (종로2가, 미려빌딩 3,5,6층)</td>
					<td>2023.08.23</td>
				</tr>
				<tr>
					<td><input type="checkbox" style="width: 100%;"/></td>
					<td>2</td>
					<td>bangja</td>
					<td>010-2222-2222</td>
					<td class="addr">서울특별시 종로구 종로 78 (종로2가, 미려빌딩 3,5,6층)</td>
					<td>2023.08.23</td>
				</tr>
				<tr>
					<td><input type="checkbox" style="width: 100%;"/></td>
					<td>3</td>
					<td>chunhyang</td>
					<td>010-2222-2222</td>
					<td class="addr">서울특별시 종로구 종로 78 (종로2가, 미려빌딩 3,5,6층)</td>
					<td>2023.08.23</td>
				</tr>
				<br/>
				
			</tbody>
		</table>
		<div align="center">
			<button class="btn btn-warning col-sm-offset-4 col-sm-1" style="width:120px;">3일 정지</button>
			<button class="btn btn-danger col-sm-1 stop" style="width:120px;">영구 정지</button>
		</div>
	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<%@ include file="../include/footer.jsp" %>
	<script>
		$(document).ready(function(){
			$("tr").on("click", function() {
				$(this).next("tr").find(".content").toggleClass("on");
			});
		});
	</script>
</body>
</html>