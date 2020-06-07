$(function(){
	$("select#sel11").change(function(){
	        var fno = $(this).val();
	        var sum = 0;
	        //alert(fno);
	        if(fno=="선택하세요"){
	        	alert("선택하세요 진짜!!");
	        }else if(fno=="1"){
	        	$("thead#mbltb1").empty();
				$("tbody#mbltb1").empty();
				$("thead#mbltb1").append("<tr><th>NO</th><th>ID</th><th>총구매횟수</th><th>총구매금액</th></tr>");
				$.ajax({
					url:"/team/selemblt2.do",
					dataType:"json",
					type:"POST",
					data:{cmd:"selemblt2", no:fno},
					success:function(v){
						//console.log(v);
						$.each(v,function(i,d){
							$("tbody#mbltb1").append("<tr><td>"+d.no+"</td><td><a href='#' id='chekid1'>"+d.id+"</a></td><td>"+d.cnt+"</td><td>"+addComma(d.sum)+"원</td></tr>");
							
						});
						$("a#chekid1").click(function(){
							var pid = $(this).html();
							
							//alert(pid);
							$.ajax({
								url:"/team/seleme.do",
								dataType:"json",
								type:"POST",
								data:{cmd:"seleme", id:pid},
								success:function(k){
									//console.log(k);
									$("thead#mbltb1").empty();
									$("tbody#mbltb1").empty();
									$("td#priceall1").empty();
									$("thead#mbltb1").append("<tr><th>NO</th><th>ID</th><th>업체명</th><th>상품명</th><th>예약인원수</th><th>가격</th><th>예약날짜</th></tr>");
									$.each(k,function(n,m){
										$("tbody#mbltb1").append("<tr><td>"+m.no+"</td><td>"+m.id+"</td><td>"+m.cname+"</td><td>"+m.pname+"</td><td>"+m.rcount+"</td><td>"+addComma(m.pprice)+"원</td><td>"+m.rdate+"</td></tr>");
										sum+=parseInt(m.pprice);
										//alert(sum);
									});
									$("td#priceall1").append(addComma(sum)+"원");
								}
							});//ajax
						});//click
					}
				});
	        }else if(fno=='2'){
				$("thead#mbltb1").empty();
				$("tbody#mbltb1").empty();
				$("thead#mbltb1").append("<tr><th>NO</th><th>ID</th><th>총구매금액</th><th>총구매횟수</th></tr>");
				$.ajax({
					url:"/team/selemblt2.do",
					dataType:"json",
					type:"POST",
					data:{cmd:"selemblt2", no:fno},
					success:function(v){
						//console.log(v);
						$.each(v,function(i,d){
							$("tbody#mbltb1").append("<tr><td>"+d.no+"</td><td><a href='#' id='chekid2'>"+d.id+"</a></td><td>"+addComma(d.sum)+"원</td><td>"+d.cnt+"</td></tr>");
						});
						$("a#chekid2").click(function(){
							var pid = $(this).html();
							//alert(pid);
							$.ajax({
								url:"/team/seleme.do",
								dataType:"json",
								type:"POST",
								data:{cmd:"seleme", id:pid},
								success:function(k){
									//console.log(k);
									$("thead#mbltb1").empty();
									$("tbody#mbltb1").empty();
									$("td#priceall1").empty();
									$("thead#mbltb1").append("<tr><th>NO</th><th>ID</th><th>업체명</th><th>상품명</th><th>예약인원수</th><th>가격</th><th>예약날짜</th></tr>");
									$.each(k,function(n,m){
										$("tbody#mbltb1").append("<tr><td>"+m.no+"</td><td>"+m.id+"</td><td>"+m.cname+"</td><td>"+m.pname+"</td><td>"+m.rcount+"</td><td>"+addComma(m.pprice)+"원</td><td>"+m.rdate+"</td></tr>");
										sum+=parseInt(m.pprice);
									});
									$("td#priceall1").append(addComma(sum)+"원");
								}
							});//ajax
						});//click
					}
				});
			}else if(fno=='3'){
				$("thead#mbltb1").empty();
				$("tbody#mbltb1").empty();
				$("td#priceall1").empty();
				$("thead#mbltb1").append("<tr><th>NO</th><th>ID</th><th>업체명</th><th>상품명</th><th>예약인원수</th><th>가격</th><th>예약날짜</th></tr>");
				$.ajax({
					url:"/team/selemblt.do",
					dataType:"json",
					type:"POST",
					data:{cmd:"selemblt", no:fno},
					success:function(v){
						//console.log(v);
						$.each(v,function(i,d){
							$("tbody#mbltb1").append("<tr><td>"+d.no+"</td><td>"+d.id+"</td><td>"+d.cname+"</td><td>"+d.pname+"</td><td>"+d.rcount+"</td><td>"+addComma(d.pprice)+"원</td><td>"+d.rdate+"</td></tr>");
							sum+=parseInt(d.pprice);
						});
						$("td#priceall1").append(addComma(sum)+"원");
					}
				});
			}
	});//click
	
	
});
function addComma(num){
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
}