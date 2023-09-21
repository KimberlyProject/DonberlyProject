<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%! SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일"); %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../include/header.jsp" %>
	<%@ include file="../member/profileModal.jsp" %>
	<style>
		th {
			text-align:			center;
		}
		td {
			text-align:			center;
			overflow:hidden;
			white-space : nowrap;
			text-overflow: ellipsis;
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
      	#searchBtn {
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
		table {
			table-layout:		fixed;
			margin-bottom:		100px;
		}
		td > a {
			font-color:			#000;
		}
		ul.pagination > li > a {
			height:				34px;
		}
		.form-group {
			width:				100%;
			height:				50px;
		}
		#Asbtn {
			margin:				10px 25px 10px 25px;
		}
		#Psbtn {
			margin:				10px 25px 10px 25px;
		}
		.pagearea {
			text-align: center;
		}
		#sbtn {
			vertical-align:		middle;
			text-align: 		center;
		}
		.sbtn {
			width:				20%;
			height:				50px;
		}
		
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<c:set var="menu" value="admin" />
	<%@ include file="../include/sidebar.jsp" %>	
   <div class="page_dir container">
      <button class="btn" id="sideMenu_open"><span class="glyphicon glyphicon-th-large"></span></button>
      홈 &gt; 관리자 &gt; 회원 목록
    </div>
    
    <h1 class="pageTitle"><div>회원 목록</div></h1>
    
	<div class="container">
		<!-- 검색창 -->
		<div class="row" style="vertical-align: middle; float:right; margin-bottom: 10px;">
			<select class="col-sm-2 searchgroup" id="searchType" style="font-size: 15px; width: 75px; margin-right:10px; display: table-cell;">
				<option value="memberListAll" <c:if test="{searchType} == 'memberListAll'">selected</c:if>>전체</option>
				<option value="i" <c:if test="{searchType} == 'i'">selected</c:if>>아이디</option>
				<option value="tel" <c:if test="{searchType} == 'tel'">selected</c:if>>연락처</option>
				<option value="addr" <c:if test="{searchType} == 'addr'">selected</c:if>>주소</option>
				<option value="d" <c:if test="{searchType} == 'd'">selected</c:if>>가입일자</option>
			</select>
			<input id="searchKeyword" class="col-sm-2 searchgroup form-control" type="text" class="form-control" style="width:200px;" value="${pageVO.keyword }" placeholder="검색하기">
			<button id ="searchBtn" class="btn btn-success" type="button">
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
				<c:forEach var="list" items="${memberList}" varStatus="memberNum">
					<tr id="tr">
						<td><input type="checkBox" name="checkBox" style="width: 100%;"/></td>
						<td onclick="location.href='${path}/admin/memberDetail?userId=${list.userId}'">${memberNum.count}</td>
						<td onclick="location.href='${path}/admin/memberDetail?userId=${list.userId}'">${list.userId}</td>
						<td onclick="location.href='${path}/admin/memberDetail?userId=${list.userId}'">${list.tel}</td>
						<td id="td" class="addr" onclick="location.href='${path}/admin/memberDetail?userId=${list.userId}'">${list.address}</td>
						<td onclick="location.href='${path}/admin/memberDetail?userId=${list.userId}'"><fmt:formatDate value="${list.regDate}" pattern="yyyy년 MM월 dd일"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br/>
		<!-- 기능 버튼 -->
		<div id="sbtn" class="form-group">
			<!-- 7일 정지 버튼 -->
			<input class="btn btn-success sbtn" type="button" value="7일 정지" id="Asbtn"/>
			<!-- 영구 정지 버튼 -->
			<input class="btn btn-danger sbtn" type="button" value="영구 정지" id="psbtn"/>
		</div>
		<!-- 화면 하단의 페이지 영역 -->
		<div class="pagearea">
			<ul class="btn-group pagination" >
				<c:if test="${pageMaker.prev}">
					<li>
						<a href="<c:url value='/admin/memberList?page=${pageMaker.startPage-1}&searchType=${cri.searchType}&keyword=${cri.keyword}'/>"><span class="glyphicon glyphicon-chevron-left"></span><span class="glyphicon glyphicon-chevron-left"></span></a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
					<li>
						<a href="<c:url value='/admin/memberList?page=${pageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}'/>">${pageNum}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li>
						<a href="<c:url value='/admin/memberList?page=${pageMaker.endPage+1}&searchType=${cri.searchType}&keyword=${cri.keyword}'/>"><span class="glyphicon glyphicon-chevron-right"></span><span class="glyphicon glyphicon-chevron-right"></span></a>
					</li>
				</c:if>
			</ul>
		</div>
		
		<!-- 검색부분 -->
		<form id="formList" action="${path}/admin/memberList" method="GET">
			<input type="hidden" name="page"		value="${result.currentPageNum}"/>
			<input type="hidden" name="size"		value="${result.currentPage.pageSize}"/>
			<input type="hidden" name="searchType"	value="${pageVO.type}"/>
			<input type="hidden" name="keyword"		value="${pageVO.keyword}"/>
		</form>
	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<%@ include file="../include/footer.jsp" %>

<script>
    $(document).ready(function() {
      	
      	// 7일 정지: 7일정지 버튼을 누를 경우
    $("#Asbtn").on("click", function() {
		var inputID = [];
		$('input:checkbox[name="checkBox"]').each(function(index, item){
            /* 그 중에서도 체크박스에 check 되었을 경우 */
            if($(this).is(':checked', true)) {
                //console.log("체크");
                var idSelect = $(this).parent().next().next().text();
                alert(idSelect);

                $.ajax({
    				url:		"${path}/admin/Asuspension",
    				type:		"post",
    				dataType:	"text",
    				data:		{"userId" : idSelect},
    				success:	function(data) {
    					alert(idSelect + "회원님께서 7일 정지 되었습니다.");
    				},
    				error:		function(data) {
    					alert("에러가 발생하였습니다!");
    				},
    				complete:	function(data) {
    					alert("작업을 완료하였습니다!");
    				}
    			});
    		};
       	})
		
	});
    
      	// 영구정지: 영구정지 버튼을 누를 경우
    $("#psbtn").on("click", function() {
		var inputID = [];
		$('input:checkbox[name="checkBox"]').each(function(index, item){
            /* 그 중에서도 체크박스에 check 되었을 경우 */
            if($(this).is(':checked', true)) {
                //console.log("체크");
                var idSelect = $(this).parent().next().next().text();
                alert(idSelect);

                $.ajax({
    				url:		"${path}/admin/Psuspension",
    				type:		"post",
    				dataType:	"text",
    				data:		{"userId" : idSelect},
    				success:	function(data) {
    					alert(idSelect + "회원님께서 영구 정지 되었습니다.");
    				},
    				error:		function(data) {
    					alert("에러가 발생하였습니다!");
    				},
    				complete:	function(data) {
    					alert("작업을 완료하였습니다!");
    				}
    			});
    		};
       	})
		
	});
   	var formObj = $("#formList");
   	
   	// 검색: 검색버튼을 누를 경우
   	$("#searchBtn").click(function(e) {
   		var typeStr = $("#searchType").find(":selected").val();
   		var keywordStr = $("#searchKeyword").val();
   		console.log(typeStr, "", keywordStr);
   		
   		formObj.find("[name='searchType']").val(typeStr);
   		formObj.find("[name='keyword']").val(keywordStr);
   		formObj.find("[name='page']").val("1");
   		formObj.submit();
   	});
});
</script>
	
	
</body>
</html>