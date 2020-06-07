$(function(){
	$("input#idCheck").click(function(){
		 if($("input#id").val().length==0){
	    	 alert('idCheck');
	    	 return false;
	     } 
	     $.ajax({
	    	url:'idAjax.do',
	    	type:'POST',
	    	dataType:'text',
	    	data:{id:$("input#id").val()},
	    	success:function(v){
	    		if(v.trim()=='true'){
	    			$("span#rsp").html("<font size=3 color='red'>이미사용중</font>");
	    			$("input#id").val('');
	    			$("input#id").focus();
	    		}else{
	    			$("span#rsp").html("<font size=3 color='blue'>사용가능</font>");
	    		}
	    	},error:function(){
	    		alert('error');
	    	}
	     });
	});
	$("input#regiBtn").click(function(){
		
		if($("input[name=name]").val().length==0 || $("input[name=tel1]").val().length==0 || 
				$("input[name=tel2]").val().length==0 || $("input[name=tel3]").val().length==0
				|| $("input[name=post1]").val().length==0 || $("input[name=post2]").val().length==0 ||
				$("input[name=post3]").val().length==0){
			alert('빈칸을 입력하세요');
			return false;
		}
			$("form").submit();
		});
	
	$("a#sendPost").click(function(){
		window.open('caddress.do','addr','left=300, top=100, width=445, height=430');
	});
	
	$("input#searchDong").click(function(){
		if($("input#dong").val().length==0){
			alert('텍스트를 입력하십시오.');
			return false;
		}
	});
	
	$("a[name='addr']").click(function(){
		window.opener.document.rcfrm.post1.value=$(this).text().trim().split("-")[0];
		window.opener.document.rcfrm.post2.value=$(this).text().trim().split("-")[1];
		window.opener.document.rcfrm.post3.value=$(this).text().trim().split("-")[2];
		self.close();
	});
});