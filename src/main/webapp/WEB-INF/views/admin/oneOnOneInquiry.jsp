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
      	.pagination {
        	color: 				rgb(73, 124, 64);
      	}
      	#searchbtn {
        	height: 			2.4em;
        	background-color:	rgb(73, 124, 64);
        	color:				#FFFFFF;
        	margin-right:		15px;
      	}
      	.searchgroup {
        	padding:			3px 3px 6px 3px;
      	}
      	.title {
      		text-align:			left;
      	}
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<div class="container">
		<span class="glyphicon glyphicon-menu-hamburger"> 경로1 > 경로2 > 경로3</span>
		<h2 align="left">1:1 문의</h2>
		<!-- 삭제버튼 -->

		<!-- 검색창 -->
		<div>
			<button class="btn btn-danger" style="float:left; ">삭제하기</button>
		</div>
		<div class="row" style="vertical-align: middle; float:right;">
			<select class="col-sm-2 searchgroup" id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
				<option value="a" <c:if test="{searchType} == 'a'">selected</c:if>>전체</option>
				<option value="w" <c:if test="{searchType} == 't'">selected</c:if>>제목</option>
				<option value="c" <c:if test="{searchType} == 'c'">selected</c:if>>내용</option>
				<option value="w" <c:if test="{searchType} == 'w'">selected</c:if>>작성자</option>
				<option value="w" <c:if test="{searchType} == 'p'">selected</c:if>>상품번호</option>
			</select>
			<input  class="col-sm-2 searchgroup form-control" type="text" class="form-control" style="width:200px;" placeholder="검색하기">
			<button id ="searchbtn" class="btn btn-secondary" type="button">
				<span class="glyphicon glyphicon-search"/>
			</button>   
		</div>
      	<!-- 검색창 -->
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr style="background: rgb(73, 124, 64); color: #FFF;">
					<th style="width: 5%;"><span class="glyphicon glyphicon-ok"/></th>
					<th style="width: 5%;">No</th>
					<th style="width: 60%;">Title</th>
					<th style="width: 15%;">Id</th>
					<th style="width: 15%;">Date</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 5%;"><input type="checkbox" style="width: 100%;"/></td>
					<td style="width: 5%;">1</td>
					<td style="width: 60%;" class="title">제목자리입니다.</td>
					<td style="width: 15%;">gildong</td>
					<td style="width: 15%;">2023.08.23</td>
				</tr>
				<tr>
					<td class="content" style="text-align: left;" colspan="5">
						1대1 문의사항 입니다. <br/>
						답변주세요
						<div>
							<button id ="searchbtn" class="btn btn-secondary" type="button">답변하기</button>
						</div>
					</td>
					
				</tr>
				<tr>
					<td style="width: 5%;"><input type="checkbox" style="width: 100%;"/></td>
					<td style="width: 5%;">2</td>
					<td style="width: 60%;" class="title">제목자리입니다.</td>
					<td style="width: 15%;">gildong</td>
					<td style="width: 15%;">2023.08.23</td>
				</tr>
				<tr>
					<td class="content" style="text-align: left;" colspan="5">
						1대1 문의사항 입니다. <br/>
						답변주세요
						<div>
							<button id ="searchbtn" class="btn btn-secondary" type="button">답변하기</button>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width: 5%;"><input type="checkbox" style="width: 100%;"/></td>
					<td style="width: 5%;">3</td>
					<td style="width: 60%;" class="title">제목자리입니다.</td>
					<td style="width: 15%;">gildong</td>
					<td style="width: 15%;">2023.08.23</td>
				</tr>
				<tr>
					<td class="content" style="text-align: left;" colspan="5">
						1대1 문의사항 입니다. <br/>
						답변주세요
						<div>
							<button id ="searchbtn" class="btn btn-secondary" type="button">답변하기</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
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