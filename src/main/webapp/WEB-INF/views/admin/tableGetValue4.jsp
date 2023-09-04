<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="../../include/header.jsp" %>

    <style>
        table {
            width: 100%;
            border: 1px solid #444444;
        }

        th, td {
            border: 1px solid #444444;
            text-align: center;
        }
    </style>
</head>
 
<body>   
<%@ include file="../../include/topMenu.jsp" %>
<div class="container">
    <br><br>
    <div class="row">
        <table id="example-table-2" width="100%" class="table table-bordered table-hover text-center">
            <thead>
                <tr>
                    <th>No. </th>
                    <th>선택</th>
                    <th>제품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>계산</th>
                    <th>합계</th>
                </tr>
            </thead>
            <tbody>                
                <tr>
                    <td>1</td>
					<td><input id="sbtn" type="checkbox" name="checkBox" style="width: 100%;" />1</td>
                    <td>연필</td>
                    <td>1000</td>
                    <td><input type="text" name="cnt" value="0"/></td>
                    <td><input type="button" class="checkBtn" value="계산" /></td>
                    <td><input type="text" name="result"/></td>
                </tr>
                <tr>
                    <td>2</td>
					<td><input id="sbtn" type="checkbox" name="checkBox" style="width: 100%;" value="2" />1</td>
                    <td>볼펜</td>
                    <td>1500</td>
                    <td><input type="text" name="cnt" value="0"/></td>
                    <td><input type="button" class="checkBtn" value="계산" /></td>
                    <td><input type="text" name="result"/></td>
                </tr>
                <tr>
                    <td>3</td>
					<td><input id="sbtn" type="checkbox" name="checkBox" style="width: 100%;" value="3" />1</td>
                    <td>지우개</td>
                    <td>500</td>
                    <td><input type="text" name="cnt" value="0"/></td>
                    <td><input type="button" class="checkBtn" value="계산" /></td>
                    <td><input type="text" name="result"/></td>
                </tr>
            </tbody>
        </table>
        <div class="col-lg-12" id="ex2_Result1" ></div> 
        <div class="col-lg-12" id="ex2_Result2" ></div> 
    </div> 
    <br><br> 
</div>
</body>

<script>
    $(function() {

        /* input 타입 중 checkbox에서 name값을 기준으로 찾음. (name 대신 id도 가능)
         * e.g. $('input:checkbox[id="chk"]').click(function () {....} 대충 이런식입니다.
         * */
        $('input:checkbox[name="checkBox"]').click(function () {

            /* 그 중에서도 체크박스에 check 되었을 경우 */
            if($('input:checkbox[name="checkBox"]').is(':checked')) {
                console.log("체크");
                clickEvent(event);

              /* 또는 */
            } else {
                alert("체크 해제");
                clickEventDelete(event);
            }
        })

    });

    function clickEvent(event) {

        // 이벤트를 체크박스에 달았기 때문에 여기에서 타겟은 체크박스를 가리킨다.
        console.log('target :: ', $(event.target));

        // $(event.target)에서 가장 가까운 tr 태그 찾기
        var row = $(event.target).closest('tr');

        // 그 중에서도 td 태그를 찾는다.
        var columns = row.find('td');


        // 콘솔에 어떻게 row와 columns의 위치를 출력한다.
        console.log('row :: ' , row);
        console.log('columns :: ' , columns);

        //columns.addClass('row-highlight');
        var values = "";

        // 제이쿼리를 이용한 반복문. idx값과 item을 이용해서 필요한 용도에 맞게 사용하기.
        $.each(columns, function (idx, item) {
            values = values + 'td' + (idx + 1) + ':' + item.innerHTML + '<br/>';
            //-------------------------------------------------------------------------------------
            // 선택한 체크박스의 row에서 값을 가져오고자는 컬럼에 대한 작업
            //-------------------------------------------------------------------------------------
            if(idx == 3)	// 가져오고자 하는 컬럼의 위치
            	alert(idx + " : " + item.innerHTML);	// 해당 컬럼의 값을 가져온다.
            //alert(values);
        });

        console.log('전체 row와 column의 내용 ==> ' , values);
    }

    function clickEventDelete(event) {

        // 이벤트를 체크박스에 달았기 때문에 여기에서 타겟은 체크박스를 가리킨다.
        console.log('target :: ', $(event.target));

        // $(event.target)에서 가장 가까운 tr 태그 찾기
        var row = $(event.target).closest('tr');

        $(row).remove();

   }

</script>

<script>
    // 버튼 클릭시 Row 값 가져오기
    $(".checkBtn").click(function(){ 
    	
    	  //현재 row의 정보 가져오기 
    	  var thisRow = $(this).closest('tr'); 
   	  
    	  //주소 input 값 가져오기
    	  //var addr = thisRow.find('td:eq(1)').find('input').val();
    	  //섦졍 input 값 가져오기
    	  //var txt = thisRow.find('td:eq(3)').find('input').val();
    	  //alert(addr + ":" + txt);
            
        var str = ""
        var tdArr = new Array();    // 배열 선언
        var checkBtn = $(this);
            
        // checkBtn.parent() : checkBtn의 부모는 <td>이다.
        // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
        var tr = checkBtn.parent().parent();
        var td = tr.children();
            
        ////console.log("클릭한 Row의 모든 데이터 : "+tr.text());
            
        var no 		= td.eq(0).text();
        var name	= td.eq(2).text();
        var price	= td.eq(3).text();
        var cnt		= thisRow.find('td:eq(4)').find('input').val();
        
        let sum		= parseInt(price) * parseInt(cnt);
        alert("합계:" + sum);
        
        // 합계 에 값을 출력시킨다.
        thisRow.find('td:eq(6)').find('input').val(sum);

            
        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        /*
        td.each(function(i){    
            tdArr.push(td.eq(i).text());
        });
            
        console.log("배열에 담긴 값 : "+tdArr);
            
 
        str += " * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
               ", 아이디 : <font color='red'>" + userid + "</font>" +
               ", 이름 : <font color='red'>" + name + "</font>" +
               ", 이메일 : <font color='red'>" + email + "</font>";        
            
        $("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + tr.text());        
        $("#ex2_Result2").html(str);    
        */
    }); 
</script>



</html>
