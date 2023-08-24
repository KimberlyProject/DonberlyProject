<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		.carousel-inner {
        	width: 400px;
        	height: 200px;
        }
        .table {
        	width: 900px;
        	align: center;
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
		
		
		<form id="formgroup" name="aucWrite" method="post" action="${path}/auction/auction_wirte_send}" enctype="auction_wirte_send">
			<!-- 글쓰기 -->
			<table id="tb1" class="table table-bordered table-striped table-hover">
				<tr><!-- 사진, 제목 -->  
					<th rowspan="7" class="carousel-inner" role="listbox"><!-- 롤링사진 -->
						<div class="aucimg active">
							<img src="../../../resources/images/aucImsi/auc1.jpg" arl="auc1" width="200" height="200"/>
						</div>
						<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
							<span class="sr-only">Next</span>
						</a>
					</th>
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
		</form>
		
		<table id="tb3" class="row">
				<tr>
					<td class="col-sm-2"></td>
					<td id="price1" class="col-sm-2">
					<input  class="col-sm-1 form-control" type="text" style="width:200px; text-align:right" placeholder="12,500원">
					<button class="btn btn-success" style="background-color:rgb(73, 124, 64); color:#FFFFFF;">
					<span>입찰하기</span>
					</button>
					</td>
					<td id="price2" class="col-sm-3">
					<input  class="col-sm-1 form-control" type="text" class="form-control" style="width:200px; text-align:right" placeholder="110,000">
					<button class="btn btn-warning" style="background-color:rgb(73, 124, 64); color:#FFFFFF;">
					<span>상한가 구매</span>
					</button>
					</td>	
					<td class="col-sm-1"></td>
				</tr>
			</table>
		
			<br/><br/>
		

	<%@ include file="../include/footer.jsp" %>
</body>
</html>