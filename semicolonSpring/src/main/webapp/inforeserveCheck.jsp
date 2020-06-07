<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
    table th, td{ 
        text-align: center;
    }
</style>
<script>
$(document).ready(function(){
		$("tr[lang='product'] td").css("vertical-align","middle");
	$("button#btn-submit").click(function(){
		if(confirm('정말 예약하시겠습니까?')){
		$("form").submit();
		}
	}); 
});
</script>

<body>
<form action="inforeserveProcess.do" method="post" > 

<input type="hidden" value="${id }" name="id"/>
<input type="hidden" value="${date }" name="date"/>
<input type="hidden" value="${count }" name="count"/>
<input type="hidden" value="${pno }" name="pno"/>


    <div class="container">
    <hr>
        <h3>주문결제</h3>    
        <br>
        <ul>
        <li><h5>주문하시고자 하는 상품의 정보를 다시한번 확인하여 주십시오.</h5></li>
        <li><h5> 주문정보와 결제정보를 다시한번 확인해 주세요.</h5></li>
        </ul>
        <table class="table table-bordered" id="tbl-product">
            <colgroup>
                <col style="width: 20%;" />
                <col style="width: 20%" />
                <col style="width: 20%" />
                <col style="width: 20%" />
                <col style="width: 20%" />
            </colgroup>
            <tr style="background-color:#d3d3d3 ">             
                      
                <th  colspan="2">상품명</th>
                <th>이용날짜</th>
                <th>가격</th>
                <th>예약인원</th>
            </tr>
            <tr lang="product">                
                <td><img width="200px" src="/team/semiupload/${spb.pfilename }"></td>
                <td>${spb.pname }</td>
                <td>${date }</td>
                <td>${spb.pPrice }</td>
                <td>${count }</td>
            </tr>
           
            <tr style="background-color:#FF7F00 ">                
                <td colspan="2">적립될 포인트 : 30 원</td>
                
                <td colspan="3">총 주문금액 : ${spb.pPrice }-30 = ${spb.pPrice - 30} 원</td>
                
            </tr>
           
        </table>
                
        <table class="table table-bordered" id="tbl-order" style="display: none;">            
            <thead>                
                <th>품목</th>
                <th>가격</th>
                <th>수량</th>
                <th>금액</th>
            </thead>
            <tbody>
            
            </tbody>
        </table>        
        <hr>
        <h1>01</h1><h3>예약자 정보</h3>
        <div style="padding:50px;margin:10px;border:2px solid black ">
        <table class="table table-bordered" id="tbl-total">
           
            <tbody>
	            <tr>
	                <td>예약자</td>
	                <td>${member.name }</td>
	            </tr>
	            <tr>
	                <td>주소</td>
	                <td>${member.address }</td>
	            </tr>
	            <tr>
	                <td>이메일</td>
	                <td>${member.email }</td>
	            </tr>
	            <tr>
	                <td>연락처</td>
	                <td>${member.tel }</td>
	            </tr>
	            
            </tbody>            
        </table>
        </div>
        <hr>
        <h1>02</h1><h3>판매자 정보</h3>
        <div style="padding:50px;margin:10px;border:2px solid black ">
        <table class="table table-bordered" id="tbl-total">
            <tbody>
	            <tr>
	                <td>업체명</td>
	                <td>${company.cname }</td>
	            </tr>
	            <tr>
	                <td>연락처</td>
	                <td>${company.ctel }</td>
	            </tr>
	            <tr>
	                <td>주소</td>
	                <td>${company.cadd }</td>
	            </tr>
            </tbody>            
        </table>
        </div>
        <hr>
        <h1>03</h1><h3>결제 금액</h3>
        <div style="padding:50px;margin:10px;border:2px solid black ">
        <table class="table table-bordered" id="tbl-total">
          
            
            <tbody>
            <tr>
                <td>상품금액</td>
                <td>${spb.pPrice }</td>
             </tr>
            <tr>
                <td>적립 포인트 결제</td>
                <td><font color="red">30</font></td>
             </tr>
            <tr style="font-weight:bold;background-color:#FF7F00 ">
                <td>총 결제 금액</td>
                <td><font size="3">${spb.pPrice }-30 = ${spb.pPrice - 30}</font></td>
             </tr>

            </tbody>            
        </table>
        </div>
        <hr>
        <h1>04</h1><h3>결제방법 선택</h3>
        <div style="padding:50px;margin:10px;border:2px solid black ">
        <table class="table table-bordered" id="tbl-total">
           
            <tbody style="text-align:left">
            <tr>
                <td>입금계좌 선택</td>
                <td><select name="account">
                	<option value="기업은행">기업은행 152-124512-12-512</option>
                	<option value="신한은행">신한은행 120-354-561782</option>
                	<option value="국민은행">국민은행 121-21-5123-123</option>
                </select></td>
            </tr>
            <tr>
                <td>입금자명</td>
                <td><input type="text" value=""></td>
            </tr>
            <tr>
                <td>입금금액</td>
                <td style="font-weight:bold">133,350원 (결제 금액)</td>
            </tr>
            <tr style="border-style:none">
        	<td colspan="2" style="font-weight:bold;text-align:right;border-style:none">무통장 입금의 경우 입금확인이 된 후 부터 배송이 진행됩니다.     </td>
            </tr>   
            </tbody>         
        </table>
        </div>
    </div>  
    <br>
      
       <div style="text-align: right;margin-bottom: 20px; margin-right:250px">
            <button type="button" class="btn btn-primary" id="btn-submit">예약하기</button>
        </div>     
</form>
</body>
</html>
