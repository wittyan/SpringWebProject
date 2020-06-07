$(function(){
		$("button#buttonMain").click(function(){
			$(location).attr('href','signup.do');
		});	
		
		$("#loginsubmit").click(function(){
			if($("input#id").val().length==0||$("input#password").val()==""){
				alert("ID or PASSWORD Check!!");
			}else{
				$("form#login").submit();
			}
		});
		
	});
	