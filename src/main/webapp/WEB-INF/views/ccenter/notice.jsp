<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			width:				65%;
		}
		.head > th:nth-child(3) {
			width:				15%;
		}
		.head > th:last-child {
			width:				15%;
		}
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<c:set var="menu" value="ccenter" />
	<%@ include file="../include/sidebar.jsp" %>	
   <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-th-large"></span></button>
      홈 &gt; 고객센터 &gt; 공지사항
    </div>
    
    <h1 class="pageTitle"><div>공지사항</div></h1>
	<div class="container">
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr class="head" style="background: rgb(73, 124, 64); color: #FFF;">
					<th>No</th>
					<th>Title</th>
					<th>Id</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td class="title">Donberly w1.0 GRAND OPEN!</td>
					<td>admin1234</td>
					<td>2023.08.23</td>
				</tr>
				<tr>
					<td class="content" colspan="4">
						Donberly w1.0이 오픈되었습니다!!!<br/>
						많은 이용 부탁드립니다!!!
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