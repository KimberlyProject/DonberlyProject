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
					<th rowspan="5" id="productimg"><img src="#" alt="상품사진"/></th>
					<th class="cate">제목</th>
					<th class="colon">:</th>
					<th colspan="4"><input type="text" placeholder="예) 상품명"></th>
				<tr> <!-- 최소금액 -->
					<th class="cate">최소금액</th>
					<th class="colon">:</th>
					<th colspan="4"><input type="text" placeholder="예) 1,000원"></th>
				</tr>
				<tr> <!-- 상한금액 -->
					<th class="cate">상한금액</th>
					<th class="colon">:</th>
					<th colspan="4"><input type="text" placeholder="예) 100,000원"></th>
				</tr>
				<tr><!-- 입찰단위 -->
					<th class="cate">입찰단위</th>
					<th class="colon">:</th>
					<th>
						<select id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
							<option value="100" <c:if test="{searchType} == '100'">selected</c:if>>100원</option>
							<option value="500" <c:if test="{searchType} == '500'">selected</c:if>>500원</option>
							<option value="1000" <c:if test="{searchType} == '1000'">selected</c:if>>1,000원</option>
							<option value="3000" <c:if test="{searchType} == '3000'">selected</c:if>>3,000원</option>
							<option value="5000" <c:if test="{searchType} == '5000'">selected</c:if>>5,000원</option>
							<option value="10000" <c:if test="{searchType} == '10000'">selected</c:if>>10,000원</option>
							<option value="50000" <c:if test="{searchType} == '50000'">selected</c:if>>50,000원</option>
							<option value="100000" <c:if test="{searchType} == '100000'">selected</c:if>>100,000원</option>
						</select>
					</th>
				</tr>
				<tr><!-- 마감기한 -->
					<th class="cate">마감기한</th>
					<th class="colon">:</th>
					<th>
						<select id="searchType" style="font-size: 18px; width: 150px; diplay: table-cell;">
							<option value="100" <c:if test="{searchType} == '100'">selected</c:if>>서버타임+24h</option>
						</select>
					</th>
				</tr>
				<tr>
				<td align="right">이미지파일 첨부</td>
				<td>
					<input type="file" name="imageFileName" onchange="readURL(this);"/><br/>
					<img id="preview" src="#" width="200" height="200"/>
				</td>
			</tr>
			</table> <!-- 글쓰기 -->
	
			<table id="tb2" class="table table-bordered table-striped table-hover">
				<tr>
					<th id="title" colspan="4" align="center">제품 상세 내용</th><!-- 내용 -->
				</tr>
				<tr>	
					<th colspan="4">
						<textarea placeholder="판매하실 제품에 대한 상세내용을 입력하세요."></textarea>
					</th>
				</tr>
			</table>
		
		</form>
		<button class="btn btn-success col-sm-offset-6" style="color:#FFFFFF;"><a href="#">상품 올리기</span></a></button>

	<%@ include file="../include/footer.jsp" %>
</body>
</html>