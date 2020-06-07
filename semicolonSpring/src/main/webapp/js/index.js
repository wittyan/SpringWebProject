$(function(){
	
	$("select#select2").append("<option selected>상품 </option>");
	$("select#select2").addClass("nc_select");
	$("select#select1").change(function(){
		//alert($(this).val());
		var cno = $(this).val();
		$.ajax({
			url: "/team/sProAction.do",
			dataType:"json",
			type: "POST",
			data: { cmd: "sProAction", no: cno },
		    success:function(v){
		    	$("select#select2").removeClass("nc_select");
		    	$("select#select2").empty();
		    	$("select#select2").append("<option selected value='empty' >상품 </option>");
		    	$.each(v,function(i,d){
		    		
		    		$("select#select2").append("<option>"+d.name+"</option>");		    		
		    		
		    	});
		    	$("select#select2").addClass("nc_select");
		    },error:function(e,textStatus){
		    	//alert(e);
		    	//alert(textStatus);
		    }
		    	  
			});//ajax			  
	});//change	
	/*$("select#select2").change(function(){
		
	});//change
*/	
	$("a#searchFun").click(function(){
		
		if($("select#countFun").val()=='empty'
			||$("input[name=timeFun]").val()=='이용시간'
			||$("input[name=dataFun]").val()=='이용날짜'
				|| $("select#select1").val()=='empty'
				|| $("select#select2 option:selected").val()=='empty'){
		alert('선택하세요');
		}else{
			
		$("form#choiceFun").submit();
	}
	});
	
});



