<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="./WEB-INF/views/include/header.jsp" %>
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
      	.title {
      		text-align:			left;
      	}
	</style>
</head>
<body>
	<%@ include file="./WEB-INF/views/include/topMenu.jsp" %>
	<aside id="sideMenu">
      <ul>
        <li><a href="#">공지사항</a></li>
        <li><a href="#">Q & A</a></li>
        <li><a href="#">1:1문의하기</a></li>
        <li><a href="#">신고하기</a></li>
      </ul>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <span><a href="#">고객센터</a></span>
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span><a href="#">Q & A</a></span>
    </div>
    <h1 class="pageTitle"><div>Q & A</div></h1>
	<div class="container">
		<!-- 글쓰기버튼 -->
		<div>
			<button class="btn btn-success col-sm-1" style="float:left; ">글쓰기</button>
		</div>
		<!-- 검색창 -->
		<div class="row" style="vertical-align: middle; float:right;">
			<select class="col-sm-2 searchgroup" id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
				<option value="a" <c:if test="{searchType} == 'a'">selected</c:if>>전체</option>
				<option value="t" <c:if test="{searchType} == 't'">selected</c:if>>제목</option>
				<option value="c" <c:if test="{searchType} == 'c'">selected</c:if>>내용</option>
			</select>
			<input  class="col-sm-2 searchgroup form-control" type="text" class="form-control" style="width:200px;" placeholder="검색하기">
			<button id ="searchbtn" class="btn btn-success" type="button">
				<span class="glyphicon glyphicon-search"/>
			</button>   
		</div>
      	<!-- 검색창 -->
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr style="background: rgb(73, 124, 64); color: #FFF;">
					<th style="width: 5%;">No</th>
					<th style="width: 65%;">Title</th>
					<th style="width: 15%;">Id</th>
					<th style="width: 15%;">Date</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 5%;">1</td>
					<td style="width: 65%;" class="title">사기당하면 어쩌죠?</td>
					<td style="width: 15%;">admin1234</td>
					<td style="width: 15%;">2023.08.23</td>
				</tr>
				<tr>
					<td class="content" style="text-align: left;" colspan="5">
						당했어요 어쩔 수 없어요
					</td>
				</tr>
				<tr>
					<td style="width: 5%;">2</td>
					<td style="width: 65%;" class="title">판매자가 돈만 받고 연락이 안되요.</td>
					<td style="width: 15%;">admin1234</td>
					<td style="width: 15%;">2023.08.23</td>
				</tr>
				<tr>
					<td class="content" style="text-align: left;" colspan="5">
						저런... 안됬네요...
					</td>
				</tr>
				<tr>
					<td style="width: 5%;">3</td>
					<td style="width: 65%;" class="title">택배로 벽돌이 왔습니다.</td>
					<td style="width: 15%;">admin1234</td>
					<td style="width: 15%;">2023.08.23</td>
				</tr>
				<tr>
					<td class="content" style="text-align: left;" colspan="5">
						짝짝짝 벽돌 당첨!
					</td>
				</tr>
				<tr>
					<td style="width: 5%;">4</td>
					<td style="width: 65%;" class="title">이런식으로 운영해도 되나요?</td>
					<td style="width: 15%;">admin1234</td>
					<td style="width: 15%;">2023.08.23</td>
				</tr>
				<tr>
					<td class="content" style="text-align: left;" colspan="5">
						안되나요?
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<%@ include file="./WEB-INF/views/include/footer.jsp" %>
	<script>
		$(document).ready(function(){
			$("tr").on("click", function() {
				$(this).next("tr").find(".content").toggleClass("on");
			});
		});
	</script>
</body>
</html>