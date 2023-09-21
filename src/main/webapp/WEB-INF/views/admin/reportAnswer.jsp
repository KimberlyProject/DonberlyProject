<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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
			width:				10%;
		}
		.head > th:nth-child(4) {
			width:				10%;
		}
		.head > th:nth-child(5) {
			width:				55%;
		}
		.head > th:last-child {
			width:				15%;
		}
		ul.pagination > li > a {
			height:				34px;
		}
		.pagearea {
			text-align: center;
		}
		div > select {
			width:				100px;
			height:				40px;
			margin-bottom:		10px;
		}
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<c:set var="menu" value="admin" />
	<%@ include file="../include/sidebar.jsp" %>	
   <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-th-large"></span></button>
      홈 &gt; 관리자 &gt; 신고하기 내역
    </div>
    <h1 class="pageTitle"><div>신고하기 내역</div></h1>
	
	<div class="container">

		<!-- 내역 나열 방식(최신순,오래된순) -->
		<select id="sortOrder" name="sortOrder">
		    <option value="latest">&nbsp;최신순</option>
		    <option value="oldest">&nbsp;오래된순</option>
		</select>
		
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
					<td>
						<input type="checkbox" style="width: 100%;"/>
					</td>
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
		<!-- 화면 하단의 페이지 영역 start -->
		<div class="pagearea">
			<ul class="btn-group pagination">
				<c:if test="${reportPageMaker.prev}">
					<li>
						<a href="<c:url value='/admin/reportAnswer?page=${reportPageMaker.startPage-1}'/>"><span class="glyphicon glyphicon-chevron-left"></span></a>
					</li>
				</c:if>
				<c:forEach begin="${reportPageMaker.startPage}" end="${reportPageMaker.endPage}" var="pageNum">
					<li>
						<a href="<c:url value='/admin/reportAnswer?page=${pageNum}'/>">${pageNum}</a>
					</li>
				</c:forEach>
				<c:if test="${reportPageMaker.next}">
					<li>
						<a href="<c:url value='/admin/reportAnswer?page=${reportPageMaker.endPage+1}'/>"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</li>
				</c:if>
			</ul>
		</div>
		<!-- 화면 하단의 페이지 영역 end -->
	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<%@ include file="../include/footer.jsp" %>
	
<script>
$(document).ready(function() {


    // 테이블 행 클릭 이벤트 처리
    $("tr").on("click", function() {
        $(this).next("tr").find(".content").toggleClass("on");
    });
});

</script>

</body>
</html>