function sendPost(){
	window.open('address.do','addr','left=300, top=100, width=445, height=430');
}

$(function(){
	$("select[name='email3']").change(function(){
		if($(this).val()==$("option#dr").val()){
			$("input[name='email2']").val("");
			$("input[name='email2']").attr("disabled",false);
		}else{
			$("input[name='email2']").val($(this).val());
			$("input[name='email2']").attr("disabled",true);
	}
		checkfield();
	});
	$("a#sendPost").click(function(){
		sendPost();
	});
	$("input#searchDong").click(function(){
		if($("input#dong").val().length==0){
			alert('Dong Input');
			return false;
		}
		
		$("form[name='searchFrm']").submit();
	});
	$("a[name='addr']").click(function(){
		
		window.opener.document.rfrm.post1.value=$(this).text().trim().split("-")[0];
		window.opener.document.rfrm.post2.value=$(this).text().trim().split("-")[1];
		window.opener.document.rfrm.address1.value=$(this).text().trim().split("-")[2];
		self.close();
	});
    $("input#tels").on("keyup",function(){
    	$(this).val($(this).val().replace(/[^0-9]/g,""));
    	if($("input[name='tel1']").val().length>3||$("input[name='tel2']").val().length>4||$("input[name='tel3']").val().length>4){
    		alert("전화번호가 이상합니다!");
    		$("input[name='tel1']").val('');
    		$("input[name='tel2']").val('');
    		$("input[name='tel3']").val('');
    	}
	});
    $("input#password1").on("keyup",function(){
    	$("font#chkNotice").html('');
	});
	$("input#password2").on("keyup",function(){
    	if( $("input#password1").val() != $("input#password2").val()){
            $("font#chkNotice").html('비밀번호 일치하지 않음<br><br>');
            $("font#chkNotice").attr("color", "red");
          } else{
            $("font#chkNotice").html('비밀번호 일치함<br><br>');
            $("font#chkNotice").attr("color", "blue");
          }
	});
	//수정요망
/*	 $.datepicker.setDefaults({
		 changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.

		  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		  yearRange: 'c-100:c',
	        dateFormat: 'yy/mm/dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });	 
	$("#datepicker1").datepicker();
	*/
    //save버튼클릭시
	$("input#saveInfoBtn").click(function(){
		if($("input#name").val()==null){
			alert('이름을 입력하세요');
			$("input#name").focus();
		}
		if($("input#nickname").val()==null){
			alert('닉네임을 입력하세요');
			$("input#nickname").focus();
		}
		if($("input#password1").val()==null||$("input#password2").val()==null||$("input#password1").val().trim()!=$("input#password2").val().trim()){
			alert('비밀번호를 다시 확인하세요');
			console.log($("input#password1").val()+" "+$("input#password2").val())
			$("input#password1").val('');
			$("input#password2").val('');
			$("input#password1").focus();
			return false;
		}else if($("input#password1").val()==$("input#password2").val()){
			$("input#password").val($("input#password2").val());
			//console.log($("input#pw").val());
		}
		if($("input[name='tel1']").val().lengt==0||$("input[name='tel2']").val().length==0||$("input[name='tel3']").val().length==0){
			alert("전화번호를 체크 하세요");
			$("input[name='tel1']").val('');
			$("input[name='tel2']").val('');
			$("input[name='tel3']").val('');
			$("input[name='tel1']").focus();
		}else{
			$("input[name='tel']").val($("input[name='tel1']").val()+"-"+$("input[name='tel2']").val()+"-"+$("input[name='tel3']").val());
		}
		if($("input[name='email1']").val().length==0||$("input[name='email2']").val().length==0){
		    alert("Email Check!");
		    $("input[name='email1']").val('');
		    $("input[name='email2']").val('');
		    $("select#sel").prop("selectedIndex",0);
		    return false;
		}else{
		$("input[name='email']").val($("input[name='email1']").val()+"@"+$("input[name='email2']").val());
		}
		if($("input[name='address1']").val().length==0||$("input[name='address2']").val().length==0){
			alert("주소를 입력 하세요!");
			$("input[name='post1']").val("");
			$("input[name='post2']").val("");
			$("input[name='address1']").val("");
			$("input[name='address2']").val("");
			return false;
		}else{
			$("input[name='address']").val($("input[name='post1']").val()+"-"+$("input[name='post2']").val()+"@"+$("input[name='address1']").val()+"#"+$("input[name='address2']").val());
		}
		//디버그
		$("input#saveInfoBtn").click(function(){
			console.log($("input#password").val());
			console.log($("input[name='email']").val());
		});
		$("form#myInfo").submit();
	});

});
/*function checkfield(){

	var exptext = /^[A-Za-z0-9_\.\-]/;
	if(exptext.test(obj.email1.value)==false){
		alert("이메일 형식이 올바르지 않습니다.")
		obj.email1.value="";
		obj.email1.focus();
		return false;
	}

}*/