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
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span><a href="./memberDetail">회원 상세 정보</a></span>
    </div>
    <h1 class="pageTitle"><div>회원 상세 정보</div></h1>
	<div class="container" style="background-color: lightgray;">

		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr style="background: rgb(73, 124, 64); color: #FFF;">
					<th style="width: 5%;"><span class="glyphicon glyphicon-ok"></span></th>
					<th style="width: 5%;">No</th>
					<th style="width: 15%;">아이디</th>
					<th style="width: 15%;">연락처</th>
					<th style="width: 45%;">주소</th>
					<th style="width: 15%;">가입일자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 5%;"><input type="checkbox" style="width: 100%;"/></td>
					<td style="width: 5%;">1</td>
					<td style="width: 15%;">heedong</td>
					<td style="width: 15%;">010-1111-1111</td>
					<td class="addr" style="width: 45%;">서울특별시 종로구 종로 78 (종로2가, 미려빌딩 3,5,6층)</td>
					<td style="width: 15%;">2023.08.23</td>
				</tr>
				<tr>
					<td style="width: 5%;"><input type="checkbox" style="width: 100%;"/></td>
					<td style="width: 5%;">2</td>
					<td style="width: 15%;">bangja</td>
					<td style="width: 15%;">010-2222-2222</td>
					<td class="addr" style="width: 45%;">서울특별시 종로구 종로 78 (종로2가, 미려빌딩 3,5,6층)</td>
					<td style="width: 15%;">2023.08.23</td>
				</tr>
				<tr>
					<td style="width: 5%;"><input type="checkbox" style="width: 100%;"/></td>
					<td style="width: 5%;">3</td>
					<td style="width: 15%;">chunhyang</td>
					<td style="width: 15%;">010-2222-2222</td>
					<td class="addr" style="width: 45%;">서울특별시 종로구 종로 78 (종로2가, 미려빌딩 3,5,6층)</td>
					<td style="width: 15%;">2023.08.23</td>
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