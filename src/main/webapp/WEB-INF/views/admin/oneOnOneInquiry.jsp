<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../include/header.jsp" %>
	<%@ include file="./mailSend.jsp" %>
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
		.btnbox{
			display:flex;
			justify-content:space-between;
			flex-direction: row-reverse;
			margin-bottom:10px;
		}		
		.btnbox>div>input{
			width:200px;
		}
      	#searchbtn {
        	height: 			2.4em;
        	color:				#FFFFFF;
        	margin-right:		15px;
      	}
      	#searchType{
      		height:34px;
      		width:150px;
      	}
      	.searchgroup {
        	padding:			3px 3px 6px 3px;
      	}
      	.table{
      		margin-bottom:50px;
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
		.ooo {
			width: 				100%;
			height:				2.4em;
			margin-bottom:		10px;
		}
		
		@media all and (max-width:780px){		
			.btnbox{
				display:block;
			}
			.btnbox>div{			
				display:flex;
				margin-bottom:10px;
			}
			.btnbox>div>input{
				width:calc(100% - 40px);
			}
	      	#searchType{
	      		width:100px;
	      	}
	      	.table{
	      		font-size:15px;
	      	}
	      	thead{
	      		display:none;
	      	}
	      	.table, tbody, td, tr{
	      		display:block;
	      	}
	      	.table>tbody>tr:nth-of-type(odd){
	      		display:grid;
	      		grid-template-columns: 30px 30px 1fr;
	      		border-top::1px solid rgb(73, 124, 64);
	      		border-left::1px solid rgb(73, 124, 64);
	      		border-right::1px solid rgb(73, 124, 64);	
      		}
      		.table>tbody>tr:last-child{
				border-bottom::1px solid rgb(73, 124, 64);      			
      		}
      		.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, .table-bordered>thead>tr>td, .table-bordered>thead>tr>th{
      			border:0;
      		}
      		.table>tbody>tr:nth-of-type(odd)>td{      		
      			padding:0;
    		}
      		.table>tbody>tr:nth-of-type(odd)>td:nth-of-type(1)>input{
      			margin-top:12px;
      		}
	      	.table>tbody>tr:nth-of-type(odd)>td:nth-of-type(4){	      		
      			grid-column: 1 / span 2;	
      			padding-left:10px;
      		}
	      	.table>tbody>tr:nth-of-type(odd)>td:nth-of-type(1), .table>tbody>tr>td:nth-of-type(2), .table>tbody>tr>td:nth-of-type(3){	      		
      			background-color: rgb(73, 124, 64);
      			color:#fff;
      			height:40px;
      			line-height:40px;
      		}
	      	.table>tbody>tr:nth-of-type(odd)>td:nth-of-type(4), .table>tbody>tr>td:nth-of-type(5){	      		
      			font-size:14px;
      			color:#999;
      		}
      		.content.on{
      			display:block;
      		}
		}
	    
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<c:set var="menu" value="admin" />
	<%@ include file="../include/sidebar.jsp" %>	
   <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-th-large"></span></button>
      홈 &gt; 관리자 &gt; 1:1 문의
    </div>
    
    <h1 class="pageTitle"><div>1:1 문의</div></h1>
	
	<div class="container">

		<!-- 삭제버튼 -->
		<div>
			<button id="delArticle" class="btn btn-danger col-sm-1" style="float:left; ">삭제하기</button>
		</div>
		<!-- 삭제버튼 끝 -->
		
		<!-- 검색창 -->
		<div class="row" style="vertical-align: middle; float:right;">
			<select class="col-sm-2 searchgroup" id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
				<option value="inquiryAll" <c:if test="{searchType} == 'inquiryAll'">selected</c:if>>전체</option>
				<option value="t" <c:if test="{searchType} == 't'">selected</c:if>>제목</option>
				<option value="c" <c:if test="{searchType} == 'c'">selected</c:if>>내용</option>
				<option value="w" <c:if test="{searchType} == 'w'">selected</c:if>>작성자</option>
			</select>
			<input id="searchKeyword" class="col-sm-2 searchgroup form-control" type="text" class="form-control" style="width:200px;" value="${pageVO.keyword}" placeholder="검색하기">
			<button id ="searchBtn" class="btn btn-success" type="button">
				<span class="glyphicon glyphicon-search"/>
			</button>   
		</div>
      	
      	<!-- 검색창 -->
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr id="head" style="background: rgb(73, 124, 64); color: #FFF;">
					<th style="vertical-align:middle;"><span class="glyphicon glyphicon-ok"></span></th>
					<th>NO</th>
					<th>TITLE</th>
					<th>USER ID</th>
					<th>EMAIL</th>
					<th>DATE</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="asks" items="${ask}" varStatus="articleNum">
				<tr class="article">
					<td><input class="check" type="checkbox" style="width: 100%;"/></td>
					<td class="articleNo">${fn:length(ask) - articleNum.index}<input class="num" name="num" type="hidden" value="${asks.articleNo}"></td>
					<td>
						${asks.title} 
					</td>
					<td>
						${asks.userId}
					</td>
					<td>
						${asks.email}
					</td>
					<td>
						<fmt:formatDate value="${asks.writeDate}" pattern="yy년 MM월 dd일"/><br/>
					</td>
				</tr>
				<tr>
					<td class="content" colspan="6">
						${asks.content}
						<br/>
						<br/>
						<div  align="right">
							<a class="btn btn-success" href="javascript:void(0);" onclick="openModal({email: '${asks.email}'})">답변하기</a>
						</div>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<form id="formList" action="${path}/admin/oneOnOneInquiry" method="GET">
			<input type="hidden" name="searchType"	value="${pageVO.type}"/>
			<input type="hidden" name="keyword"		value="${pageVO.keyword}"/>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
	<script>
		$(document).ready(function(){
			// tr을 누를 경우
			$("tr").on("click", function() {
				$(this).next("tr").find(".content").toggleClass("on");
			});
			;
			
			var formObj = $("#formList")
			// 검색: 검색버튼을 누를 경우
			$("#searchBtn").click(function(e) {
				var typeStr = $("#searchType").find(":selected").val();
				var keywordStr = $("#searchKeyword").val();
				console.log(typeStr, "", keywordStr);
				
				formObj.find("[name='searchType']").val(typeStr);
				formObj.find("[name='keyword']").val(keywordStr);
				formObj.submit();
			});
			
			// 삭제하기	
			$("#delArticle").on("click", function() {
				const frm = $("#head").closest("form");
				let articleNo = [];
				//$(".article", ".check", ".articleNo").each(function() {
					
				//});
				for(let i = 0; i < $(".article").length; i++) {
					console.log($(".article:eq(" + i + ")").find(".check").is(":checked"));
					
					if(!$(".article:eq(" + i + ")").find(".check").is(":checked")){
						articleNo[i] = $(".article:eq(" + i + ")").find(".articleNo").val();
					}
					$(".num:eq(" + i + ")").prop("value", articleNo[i]);
					console.log($(".num:eq(" + i + ")").val());
				}
				
				frm.prop("action", "${path}/admin/delArticle");
				frm.prop("method", "post");
				frm.submit();
			});
		});
		
</script>

</body>
</html>