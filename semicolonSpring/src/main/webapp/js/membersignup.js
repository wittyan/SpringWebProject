$(function(){
	
	
	$("#sameCheck").click(function(){
		window.open('idcheck2.do','id','left=300, top=100, width=420, height=250');
	});
	
	 $.datepicker.setDefaults({
		 changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.

		  changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
		  yearRange: 'c-100:c',
	        dateFormat: 'yy/mm/dd',
	        prevText: '���� ��',
	        nextText: '���� ��',
	        monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
	        monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
	        dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
	        dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
	        dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
	        showMonthAfterYear: true,
	        yearSuffix: '��'
	    });

	 
	        $("#datepicker1").datepicker();

	        var rfrm = document.rfrm;
			
			var id = rfrm.id.value;
			var name = rfrm.name.value;
			var nickname = rfrm.nickname.value;
			var password= rfrm.password.value;
			var passwordcheck = rfrm.passwordcheck.value;
			var gender = rfrm.gender.value;
			var tel1 = rfrm.tel1.value;
			var tel2 = rfrm.tel2.value;
			var tel3 = rfrm.tel3.value;
			var email1 = rfrm.email1.value;
			var email2 = rfrm.email2.value;
			var address = rfrm.address.value;
			var date = rfrm.birthdate.value;
	    
   
	$("#join-submit").click(function(){
//		�������� �˻�
		
		if(!id || !name || !nickname || !password || !passwordcheck
				|| !gender || !tel1 || !tel2 || !tel3 || !email1 || !email2 || !address
				|| !date){
			alert('��ĭ�� �Է��ϼ���');
			
		}
		else if(password!=passwordcheck){
				alert('�н����尡 Ʋ���ϴ�');
		}else{
		rfrm.submit();
	    }    
	});
	
//	$("#sameCheck").click(function(){
//		window.open
//	});
	

});