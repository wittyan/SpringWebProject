$(function(){
	$("input#send").click(function(){
		
		if($("#rvcontents").val().length==0){
			alert("내용을 입력하세요");
			$("#rvcontents").val(" ");
			return false;
		}else{
			$("#rvcontents").val($("#rvcontents").val());
		}
		
		$("#rvfilename").val($("#rvfilename").val());
			
		$("form#reviewFrm").submit();
		
	});
	
	
	
	/*var grade=$("li.rvGrade").text();
	
	switch (grade) {
	case 1:
		$("a.a1:not([href]):not([tabindex])").css("color","inherit");
		$("a.a2:not([href]):not([tabindex])").css("color","inherit");
		$("a.a3:not([href]):not([tabindex])").css("color","inherit");
		$("a.a4:not([href]):not([tabindex])").css("color","inherit");
		break;
	case 2:
		$("a.a1:not([href]):not([tabindex])").css("color","inherit");
		$("a.a2:not([href]):not([tabindex])").css("color","inherit");
		$("a.a3:not([href]):not([tabindex])").css("color","inherit");
		break;
	case 3:
		$("a.a1:not([href]):not([tabindex])").css("color","inherit");
		$("a.a2:not([href]):not([tabindex])").css("color","inherit");
		break;
	case 4:
		$("a.a1:not([href]):not([tabindex])").css("color","inherit");
		break;
	}*/
	
	
	/*$("a.a1F").click(function(){
		if($("i#5_s").prop("class")=="far fa-star")){
			
		}
		$("i#f_s").attr("class","far fa-star");
	});
	
	$.each(function(index,dom){
		
	});*/
	
});