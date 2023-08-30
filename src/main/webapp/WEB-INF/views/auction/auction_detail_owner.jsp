<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
		input {
			width: 100%;
			font-size: 15px;
		}
		#productimg {
			width: 500px;
		}
		textarea {
			width: 100%;
			height: 100%;
		}
		#tb1 {
			margin: 0px;
		}
		#title {
			text-align: center;
			font-size: 30px;
		}
		th {
			font-size: 15px;
		}
		.btn {
			font-color: white;
			color: white;
		}
		#formgroup {
			padding: 0px 40px;
		}
		.row {
			align: center;
		}
		#price1 {
			padding: 0px 0px 0xp 30px;
		}
		#price2 {
			padding: 0px 30px 0px 0px;
		}
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	
	<div class="container">
		<br/><br/>
		
		<div class="myroot">
			<a href="#">홈</a> >
			<a href="#">경매</a> >
			<a href="#">경매장</a>
			<a href="#">글쓰기</a>
		</div>
		<br/><br/>
		
		<img src="/resources/images/banner.jpeg" alt="배너" style="width: 1150px;">
		<br><br><br>
		
		
		<!-- 글쓰기 -->
			<table id="tb1" class="table table-bordered table-striped table-hover">
				<tr><!-- 사진, 제목 -->  
					<th rowspan="7" id="productimg"><img src="#" alt="상품사진"/></th>
					<th class="cate">제목</th>
					<th class="colon">:</th>
					<th colspan="4">상품명</th>
				<tr> <!-- 상품번호 -->
					<th class="cate">상품번호</th>
					<th class="colon">:</th>
					<th colspan="4">2023082201</th>
				</tr>
				<tr> <!-- 판매자 -->
					<th class="cate">판매자</th>
					<th class="colon">:</th>
					<th colspan="4">길동이</th>
				</tr>
				<tr><!-- 현재입찰가 -->
					<th class="cate">현재입찰가</th>
					<th class="colon">:</th>
					<th colspan="4">80,000원</th>
				</tr>
				<tr><!-- 입찰단위 -->
					<th class="cate">입찰단위</th>
					<th class="colon">:</th>
					<th colspan="4">100원</th>
				</tr>
				<tr><!-- 상한금액 -->
					<th class="cate">상한금액</th>
					<th class="colon">:</th>
					<th colspan="4">100,000원</th>
				</tr>
				<tr><!-- 경매기간 -->
					<th class="cate">상한금액</th>
					<th class="colon">:</th>
					<th colspan="4">sysdate + 24h</th>
				</tr>
			</table> 
			
			<!-- 글쓰기 -->
			<table id="tb2" class="table table-bordered table-striped table-hover">
				<tr>
					<th id="title" colspan="4" align="center">제품 상세 내용</th><!-- 내용 -->
				</tr>
				<tr>	
					<th id="textbox" colspan="4">
						<textarea rows=15 placeholder="판매하실 제품에 대한 상세내용을 입력하세요.">
							맥 m1 미쳤음. 
							에어인데 무거워. 
							사지마^^
							140만원에 샀는데 풀박이라 100만원부터 시작할게요!
						</textarea>
					</th>
				</tr>
			</table>
		
		<table id="tb3" class="row">
				<tr>
					<td class="col-sm-5"></td>
					<td id="price1" class="col-sm-2">
						<button class="btn btn-success" color:#FFFFFF;">
						<span>현재금액 판매</span>
						</button>
					</td>
					<td class="col-sm-1"></td>
					<td id="price2" class="col-sm-3">
						<button class="btn btn-danger" style="background-color:rgb(73, 124, 64); color:#FFFFFF;">
						<span>경매취소</span>
						</button>
					</td>	
					<td class="col-sm-6"></td>
				</tr>
			</table>
		
			<br/><br/>
		

	<%@ include file="../include/footer.jsp" %>
</body>
</html>