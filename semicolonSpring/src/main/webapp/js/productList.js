$(function(){
	$("input[name='del']").click(function(){
		console.log('name=del');
		if($(this).val()=='DEL'){
			$("input[name='mod']").val("수정");
			
		}
		$(this).val("DEL");
		
		 var delId=this.id;
		 $("input[type='checkbox']").each(function(){
			  if(delId==this.id){
				  $(this).prop("checked",true);
				  $("input[name='del']").each(function(){
					  if(this.id!=delId){
						  $(this).val("삭제");
					  }
				  });
			 }else{
				 $(this).prop("checked",false);
			 }
		  });//each
	});//click
	$("input[name='mod']").click(function(){
		var modId=this.id;
		var rst="";
		//var numTypeList={"pno","cno","pPrice","ptype"}
		if($(this).val()=='MOD'){
			console.log('val=MOD');
			$("input[name='del']").val("삭제");
			$.each($("tr[lang='"+this.id+"'] input[type='text']"),function(i,d){
				if($("tr[lang='"+this.id+"'] input[type='text']").length-1==i){
					rst+=d.name+"="+d.value;
				}else{
					rst+=d.name+"="+d.value+"&";
				}				
				//console.log(rst);
			});//each
//			rst+="&pno="+modId;
			console.log(rst);R
			$.ajax({
				url:"/team/modProduct.do?cmd=modProduct",
				type:'post', 
				dataType:'text',
				data:rst,
				success:function(v){
					location.reload();
				},error:function(){
					console.log(rst);
				}
			});//ajax
		}//if
		$(this).val("MOD");
		$("tr[lang='"+this.id+"'] input[name='mod']").each(function(){
			$(this).val($(this).val()=='수정'?"MOD":"수정");
			if($(this).val()=="수정"){
				$("tr[lang='"+modId+"']").eq(0).show();
				$("tr[lang='"+modId+"']").eq(1).hide();
			}else{
				$("tr[lang='"+modId+"']").eq(1).show();
				$("tr[lang='"+modId+"']").eq(0).hide();
			}
		});

		 
	});//click
	
});