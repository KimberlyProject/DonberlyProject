<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
			width: 200px;
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
		.cate {
			text-align: center;
			padding: 30px 30px 30px 30px;
			width: 300px;
		}
		td {
			text-align:center;
		}
		.imgNoinput {
			width: 10px;
		}
		#minPrice {
		text-align: right;
		}
		#maxPrice {
		text-align: right;
		}
		#imgAdd {
			width: 90px;
		}
		#imgInfo {
			color: gray;
		}
		#gigi{
            display: flex;
            justify-content: center;
        }
        .addimg button {
            display: inline-block; /* 버튼을 가로로 정렬 */
        }
	
	</style>
</head>
<body>
	<%@ include file="../include/topMenu.jsp" %>
	<c:set var="menu" value="auction" />
	<%@ include file="../include/sidebar.jsp" %>
    
    <!-- 배너 -->
	<div class="page_dir container">
		<button id="sideMenu_open"><span class="glyphicon glyphicon-th-large"></span></button>
		홈 &gt; 경매장 &gt; 경매상품 올리기
	</div>
	<h1 class="pageTitle"><div>경매 상품 올리기</div></h1>
    
   <%
	//로그인 세션 없으면 로그인을 먼저 하도록 한다.
	if(session.getAttribute("isLogOn") == null) {
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('로그인이 필요합니다.');");
		pw.println("location.href='/member/login?action=/auction/auction_wirte';");
		pw.println("</script>");
		pw.flush();
		pw.close();
	}
	%>
		
	<div class="container">
		<form id="formgroup" name="aucArticle" method="post" action="${path}/auction/addNewArticle" enctype="multipart/form-data">
			<!-- 글쓰기 -->
			<table id="tb1" class="row table table-bordered table-striped">
				<tr><!-- 사진, 제목 -->  
					<th class="cate">제목</th> 
					<th colspan="2"><c:out value="${boardInfo.brdmemo}" escapeXml="false"/>
						<input id="title" type="text" maxlength="500" name="title" placeholder="예) 상품명"> &nbsp;&nbsp;&nbsp; 판매자 [${member.nickname}] 님</th>
				<tr> <!-- 최소금액 -->
					<th id="minprice" class="cate">최소 금액</th>					
					<th colspan="2"><c:out value="${boardInfo.brdmemo}" escapeXml="false"/>
						<input id="minPrice" class="commas" onkeyup="addCommas(this)" type="text" maxlength="10" name="minPrice" placeholder="숫자만 입력하세요">원</th>
				</tr>
				<tr> <!-- 상한금액 -->
					<th class="cate">상한 금액</th>					
					<th colspan="2"><c:out value="${boardInfo.brdmemo}" escapeXml="false"/>
						<input id="maxPrice" class="commas" onkeyup="addCommas(this)" type="text" maxlength="10" name="maxPrice" placeholder="숫자만 입력하세요">원</th>
				</tr>
				<tr><!-- 입찰단위 -->
					<th class="cate">입찰 단위</th>				
					<th colspan="2">
						<select id="searchType" name ="bidRate" style="font-size: 18px; width: 150px; diplay: table-cell;">
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
					<th class="cate">마감 기한</th>					
					<th colspan="2">
						<select id="searchType" name="deadlineRate" style="font-size: 18px; width: 150px; diplay: table-cell;">
							<option value="0">오늘 마감</option>
							<option value="1">1일 후 마감</option>
							<option value="2">2일 후 마감</option>
							<option value="3">3일 후 마감</option>
							<option value="7">7일 후 마감</option>
						</select>
					</th>
				</tr>
				<tr>
					<th class="cate">사진첨부<br/><br/><br/><br/><br/><br/><br/>
						<input class="btn btn-primary" id="imgAdd" type="button" value="사진 추가" onClick="fn_addFiles()"/>
					</th>	
					<th>
						<div id="d_file" style="overflow-y: scroll; height: 240px; ">
						 	<span id="imgInfo"> 
						 	첫번째 사진이 썸네일로 설정됩니다.<br/> 원활한 경매 진행을 <span id="imageUploadError">최소 2장 이상의 사진을 올려주세요.</span><br/>
						 	사진이 없을 시 입찰자 없이 경매가 종료될 수 있습니다.</span>
						 	
						 	<br/><br/>
							<input type="file" id="imageFileName1" name="imageFileName1" onchange="readAndResize(this)"/><br/>
							<input type="file" id="imageFileName2" name="imageFileName2" onchange="readAndResize(this)"/>
							
						</div>
					</th>
				<tr>
					<th class="cate">제품 설명</th><!-- 내용 -->
					<th colspan="2">
					 <div><c:out value="${boardInfo.brdmemo}" escapeXml="false"/>
						<textarea name="content" id="content" placeholder="판매하실 상품에 대한 상세한 설명을 입력해주세요." 
						style="overflow-y: hidden; height: 300px;"></textarea>
					</div>
					</th>
				</tr>	
			</table> <!-- 글쓰기 -->
			<br/>
			<br/>
			<div id="gigi">
			<button class="btn btn-success" type="button" id="gogo">상품 올리기</button>
			</div>
		</form>
		<br/>
		<br/>
	</div>		

	<%@ include file="../include/footer.jsp" %>

<script>
	
	$(document).ready(function() {
		
		$("#gogo").on("click", function() {
			if($("#title").val() == "") {
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return false;
			}
			
			//금액 숫자열로 변환
			var minPrice = parseFloat($("#minPrice").val().replace(/,/g, ''));
			var maxPrice = parseFloat($("#maxPrice").val().replace(/,/g, ''));	
			if($("#minPrice").val() == "") {
				alert("최소금액을 입력해주세요.");
				$("#minPrice").focus();
				return false;
			}	
			if (isNaN(minPrice)) {
			    alert("숫자만 입력해주세요.");
			    $("#minPrice").focus();
			    return false;
			}
			if($("#maxPrice").val() == "") {
				alert("상한금액을 입력해주세요");
				$("#maxPrice").focus();
				return false;
			}	
			if (isNaN(maxPrice)) {
			    alert("숫자만 입력해주세요.");
			    $("#maxPrice").focus();
			    return false;
			}
			
			//입찰단위,상한금액 제한
			var bidRate = $("#searchType").val();
			var calPrice = maxPrice - minPrice; 		
			if (minPrice >= maxPrice) {
			    alert("최소금액보다 큰 상한금액을 입력해주세요.");
			    $("#maxPrice").focus();
			    return false;
			}		
			if(maxPrice < bidRate) {
				alert("입찰단위가 상한금액을 초과합니다. 적절한 입찰단위를 선택해주세요.");
				$("#searchType").focus();
				return false;
			}	
			if(calPrice < bidRate) {
				alert("입찰단위가 상한금액을 초과합니다. 적절한 입찰단위를 선택해주세요.");
				$("#searchType").focus();
				return false;
			}	
	
			//이미지 첨부 여부 확인하기
			var image1 = $("#imageFileName1").val();
		    var image2 = $("#imageFileName2").val();
		    if (!image1 || !image2) {
		    	alert("최소 두장 이상의 사진을 올려주세요.")
		        $("#imageUploadError").css("color", "red");
		        return false;
		    } else {
		        // 이미지파일 확장자 검사하기
		        if (!isImageFileName(image1) || !isImageFileName(image2)) {
		            alert("이미지파일(jpg, jpeg, png, gif, pdf)만 올려주세요.");
		            $("#imageUploadError").css("color", "red");
		            return false;
		        } else {
		            $("#imageUploadError").css("color", "gray");
		        }
		    }
		    	    
			if($("#content").val() == "") {
				alert("제품에 대한 상세설명을 입력해주세요.");
				$("#content").focus();
				return false;
			}	
			
			//제출 후 중복클릭 방지
	        $("#gogo").prop("disabled", true);
	        $("#formgroup").submit();
		});
		
	});
		
	//이미지파일 확장자 검사하기
	function isImageFileName(fileName) {
	    var allowedExtensions = ["jpg", "jpeg", "png", "gif", "pdf"];
	    var fileExtension = fileName.split('.').pop().toLowerCase();	  
	    return allowedExtensions.includes(fileExtension);
	}
	
	//숫자 입력창 100단위 콤마(,)추가하기
	function addCommas(input) {
      	var num = input.value.replace(/,/g, '');
       input.value = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//이미지 추가하기
   	var cnt=1;
	function fn_addFiles() {
		$("#d_file").append("<div class='addimg'><br><input type='file' name='file"+cnt+"' />"+"<button class='btn btn-danger'>삭제하기</button></div>");
		cnt++;
	}  
	
	//추가한 이미지 삭제하기
	document.addEventListener("click", function(event) {
    if (event.target.classList.contains("btn") && event.target.classList.contains("btn-danger")) {
        var parent = event.target.closest(".addimg");
        if (parent) {
            parent.remove();
        }
    }
	});

</script>
</body>
</html>