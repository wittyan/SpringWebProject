function idCheckFun(){
	window.open('idcheck2.do','id','left=300, top=100, width=440, height=330');
}
function sendPost(){
	window.open('address.do','addr','left=300, top=100, width=445, height=430');
}

$(function(){	
	$("a#idcheck").click(function(){
		idCheckFun();
	});
	$("input#idImg").click(function(){
		if($("input#id").val().length==0){
			alert('ID WRITEL!');
			return false;
		}
		document.idFrm.submit();
		
	});
	$("a#pppphere").click(function(){
		//alert();
		window.opener.document.rfrm.id.value=this.name;
		self.close();
	});
	
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
   
    $("input[name='password1']").on("keyup",function(){
    	$("font#chkNotice").html('');
	});
    $("input[name='password2']").on("keyup",function(){
    	if( $("input[name='password1']").val() != $("input[name='password2']").val()){
            $("font#chkNotice").html('비밀번호 일치하지 않음<br><br>');
            $("font#chkNotice").attr("color", "red");
          } else{
            $("font#chkNotice").html('비밀번호 일치함<br><br>');
            $("font#chkNotice").attr("color", "blue");
          }
	});
	
	$("button#join-submit").click(function(){
		if($("input[name='id']").val().length==0){
			alert("아이디를 확인 하시오!");
			$("input[name='id']").val('');
		}
		if($("input[name='name']").val().length==0){
			alert("이름을 확인 하시오!");
			$("input[name='name']").val('');
		}
		if($("input[name='nickname']").val().length==0){
			alert("닉네임을 확인 하시오!");
			$("input[name='nickname']").val('');
		}
		if($("input[name='birthdate']").val().length==0){
			alert("생일을 입력 하시오!");
			$("input[name='birthdate']").val('');
		}
		
		
		if($("input[name='password1']").val().length==0||$("input[name='password2']").val().length==0){
			alert("비밀번호를 입력하세요!");
			$("input[name='password1']").val('');
			$("input[name='password2']").val('');
			$("input[name='password1']").focus();
		}else{
			$("input[name='password']").val($("input[name='password1']").val());
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
		//05.20 수정
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
		//원래코드
/*		if($("input[name='address1']").val().length==0||$("input[name='address2']").val().length==0){
			alert("주소를 입력 하세요!");
			$("input[name='post1']").val("");
			$("input[name='post2']").val("");
			$("input[name='address1']").val("");
			$("input[name='address2']").val("");
			return false;
		}else{
			$("input[name='address']").val($("input[name='post1']").val()+"-"+$("input[name='post2']").val()+$("input[name='address1']").val()+" "+$("input[name='address2']").val());
		}
*/		
		$("form").submit();
	});
	
	
	 $.datepicker.setDefaults({
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
	
});
function checkfield(){
	/*var obj = document.rfrm;
	
	if(!obj.id.value){
		alert("아이디를 입력하세요!");
	}else if(!obj.name.value){
		alert("이름을 입력하세요!");
		obj.name.focus();
		return false;
	}else if(!obj.nickname.value){
		alert("닉네임을 입력하세요!");
		obj.nickname.focus();
		return false;
	}else if(!obj.password.value){
		alert("비밀번호를 입력하세요!");
		obj.password.focus();
		return false;
	}else if(!obj.tel1.value||!obj.tel2.value||obj.tel3.value){
		alert("연락처를 입렵하세요!");
		obj.tel1.value="";
		obj.tel1.focus();
		return false;
	}else if(!obj.email1.value||!obj.email2.value){
		alert("이메일을 입력하세요!");
		obj.email1.value="";
		obj.email1.focus();
		return false;
	}else if(!obj.post1.value||!obj.address1.value){
		alert("주소를 입력하세요!");
		return false;
	}else if(!obj.address2.value){
		alert("상세주소를 입력하세요!");
		obj.address2.value="";
		obj.address2.focus();
		return false;
	}else if(!obj.birthdate.value){
		alert("생일을 선택하세요!");
		return false;
	}*/
	
	
	/*if(obj.password.value==""){
		alert("Check Password!");
	}else if(obj.password.value!=obj.passwordcheck.value){
		alert("비밀번호가 일치하지 않습니다.");
		obj.password.value="";
	    obj.passwordcheck.value="";
		obj.password.focus();
		return false;
	}*/
	
	var exptext = /^[A-Za-z0-9_\.\-]/;
	if(exptext.test(obj.email1.value)==false){
		alert("이메일 형식이 올바르지 않습니다.")
		obj.email1.value="";
		obj.email1.focus();
		return false;
	}
	/*var nembertest = /^[0-9_\.\-]/;
	if(nembertest.test(obj.tel1.value)==false){
		alert("숫자만 입력하세요!");
		obj.tel1.value="";
		obj.tel1.focus();
		return false;
	}else if(nembertest.test(obj.tel2.value)==false){
		alert("숫자만 입력하세요!");
		obj.tel2.value="";
		obj.tel2.focus();
		return false;
	}else if(nembertest.test(obj.tel3.value)==false){
		alert("숫자만 입력하세요!");
		obj.tel3.value="";
		obj.tel3.focus();
		return false;
	}*/
	
	
	//document.rfrm.submit();
}

















