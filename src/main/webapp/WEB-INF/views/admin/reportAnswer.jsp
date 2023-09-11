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
			text-align:			left;
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
      	.head > th:first-child {
			width:				5%;
		}
		.head > th:nth-child(2) {
			width:				5%;
		}
		.head > th:nth-child(3) {
			width:				60%;
		}
		.head > th:nth-child(4) {
			width:				15%;
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
        <li><a href="./oneOnOneInquiry">1:1 문의하기 내역</a></li>
        <li><a href="./reportAnswer">신고하기 내역</a></li>
        <li><a href="./memberList">회원 목록</a></li>
      </ul>
      <button class="btn " id="sideMenu_close"><span class="glyphicon glyphicon-menu-left"></span></button>
    </aside>
    <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
      <span><a href="./reportAnswer">관리자</a></span>
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span><a href="./reportAnswer">신고하기 내역</a></span>
    </div>
    <h1 class="pageTitle"><div>신고하기 내역</div></h1>
	
	<div class="container">
		<!-- 삭제버튼 -->
		<div>
			<button class="btn btn-danger col-sm-1" style="float:left; ">삭제하기</button>
		</div>
		
		<!-- 검색창 -->
		<div class="row" style="vertical-align: middle; float:right;">
			<select class="col-sm-2 searchgroup" id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
				<option value="a" <c:if test="{searchType} == 'a'">selected</c:if>>전체</option>
				<option value="t" <c:if test="{searchType} == 't'">selected</c:if>>제목</option>
				<option value="c" <c:if test="{searchType} == 'c'">selected</c:if>>내용</option>
				<option value="w" <c:if test="{searchType} == 'w'">selected</c:if>>작성자</option>
				<option value="p" <c:if test="{searchType} == 'p'">selected</c:if>>상품번호</option>
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
					<th>NO</th>
					<th>작성자</th>
					<th>신고대상</th>
					<th>사유</th>
					<th>DATE</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="report" items="${report}" varStatus="articleNum">
				<tr>
					<td><input type="checkbox" style="width: 100%;"/></td>
					<td>
						${report.articleNo}
					</td>
					<td>
						${report.reporter}
					</td>
					<td>
						${report.reportedUser}
					</td>
					<td>
						${report.reason}
					</td>
					<td>
						<fmt:formatDate value="${report.writeDate}" pattern="yy년 MM월 dd일"/><br/>
					</td>
				</tr>
				<tr>
					<td class="content" colspan="6">
						${report.content}
						<br/>
						<br/>
						<div>
							<button id ="replybtn" class="btn btn-success col-sm-1" type="button">답변하기</button>
						</div>
					</td>
					
				</tr>
			</c:forEach>
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