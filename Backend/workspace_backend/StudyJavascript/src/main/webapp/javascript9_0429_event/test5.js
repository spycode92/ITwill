window.onload = function() {
	/*
	[ form 태그 내의 각 요소에 접근하는 방법 ]
	1) 기존의 document.querySelector() 메서드 등을 활용하여 해당 요소를 직접 지정하는 방법
	2) form 태그를 통해 폼 내의 요소에 접근하는 방법
	   - document.form태그의name속성값.접근할태그의name속성값.속성명 또는
	     document.form태그의name속성값.접근할태그의name속성값.메서드명()
		 => 속성명 : name, type, value 등
		 => 메서드 : focus() - 대상 요소에 커서(포커스) 요청
	     	         blur() - 대상 요소에서 커서(포커스) 해제
	                 select() - 대상 요소에 포커스 요청 및 입력 항목 블럭 지정
	*/
	// btnFocus, btnSelect 클릭 이벤트 핸들링 => onload 필수
	document.querySelector("#btnFocus").onclick = function() {
		console.log("btnFocus 클릭됨!");
		
		// 문서(document)내의 form태그(name 속성 : fr) 내의 텍스트박스(name 속성 : text1)에 접근하여
		// 해당 텍스트박스에 입력된 값 출력
//		console.log(document.fr.text1.value);

		// text1 텍스트박스에 포커스 요청 => 대상 요소 객체의 focus() 메서드 호출
		document.fr.text1.focus();
	}
	
	document.querySelector("#btnSelect").onclick = function() {
		console.log("btnSelect 클릭됨!");
		
		// text1 텍스트박스에 포커스 요청과 함께 입력된 텍스트 블럭 지정
		// => 대상 요소 객체의 select() 메서드 호출
		document.fr.text1.select();
	}
	
	// id 속성이 부여되지 않은 텍스트박스(name 속성값 text1)의 keyup 이벤트 핸들링
	document.fr.text1.onkeyup = function(e) {
//		console.log(e);
		// 텍스트박스에 입력된 값을 변수에 저장하기
//		let value = document.fr.text1.value;
		// 이벤트 발생 객체(e)나 this 를 통해서도 대상 요소에 접근 가능
		// 단, 이벤트 발생 요소에 따라 e 또는 this 에 저장된 객체가 달라짐
//		let value = e.target.value;
		let value = this.value;
		console.log(`입력값 : ${value}`);
		// ------------------------------
		// 입력값의 문자열 길이(length 속성)가 5보다 크면
		// 현재 요소(텍스트박스) 객체의 blur() 메서드 호출하여 포커스 해제
		if(value.length >= 5) {
//			this.blur(); // e.target.blur() 또는 document.fr.text1.blue() 모두 동일함
			console.log("blur() 메서드 호출됨!");
		}
		
	}
	// =============================================================================
	// #btnShowInfo, #btnCheckInfo 버튼 클릭 이벤트 핸들링
	document.querySelector("#btnShowInfo").onclick = function() {
		// 폼 태그 내의 입력 요소 데이터(name 속성값 text1, text2, ta) 가져와서 변수에 저장 후
		// div 태그(id 선택자 infoArea)에 출력하기
		let text1 = document.fr.text1.value;
		let text2 = document.fr.text2.value;
		let ta = document.fr.ta.value;
		console.log(`text1 : ${text1}`);
		console.log(`text2 : ${text2}`);
		console.log(`ta : ${ta}`);

		// 1) innerText 속성으로 복수개의 텍스트 출력
//		document.querySelector("#infoArea").innerText = text1 + ", " + text2 + ", " + ta;	
		// 각 텍스트 사이에 줄바꿈 수행할 경우 "\n" 활용 
//		document.querySelector("#infoArea").innerText = text1 + "\n" + text2 + "\n" + ta;
		
		// 2) innerHTML 속성으로 복수개의 텍스트 출력
//		document.querySelector("#infoArea").innerHTML = text1 + ", " + text2 + ", " + ta;	
		// 각 텍스트 사이에 줄바꿈 수행할 경우 "\n" 이 아닌 <br> 태그 활용 
		document.querySelector("#infoArea").innerHTML = 
			text1 + "<br>" 
			+ text2 + "<br>" 
			+ ta;	
	}
	
	document.querySelector("#btnCheckInfo").onclick = () => {
		// 각 입력 요소(text1, text2, ta) 중 입력되지 않은 항목을 판별
		// => 기본적으로 submit 버튼과 입력 항목의 required 속성 조합하여 간단하게 구현 가능하지만
		//    추가적인 작업(입력값 규칙 검증 등)을 수행해야할 경우
		//    자바스크립트를 통해 별도의 코드로 추가작업 구현해야함
		// -----------------------------------------------------------
		// 입력되지 않은 항목 판별하는 방법 2가지
		// 1) 입력값(value 속성값)이 널스트링("") 인지 판별
		// 2) 입력값(value 속성값)의 문자열 길이(length 속성값)가 0인지 판별
		// => 각 입력되지 않은 항목을 판별하여 "x번째 텍스트 입력 필수!" 메세지 출력(alert)하고
		//    해당 요소에 포커스(커서) 요청
		// => 단, 모든 항목 입력이 완료되었을 경우 alert 활용하여 "모든 텍스트 입력 완료!" 출력
		let fr = document.fr; // 문서 내의 폼 요소를 별도의 변수에 저장
		// 위에서 선언한 fr 변수 내에 폼 요소 객체가 저장되어 있음
		let text1 = fr.text1.value;
		let text2 = fr.text2.value;
		let ta = fr.ta.value;
		
		if(text1 == "") {
			alert("첫번째 텍스트 입력 필수!");
			fr.text1.focus();
			return;
		} else if(text2.length == 0) {
			alert("두번째 텍스트 입력 필수!");
			fr.text2.focus();			
			return;
		} else if(ta == "") {
			alert("세번째 텍스트 입력 필수!");
			fr.ta.focus();
			return;
//		} else {
//			alert("모든 텍스트 입력 완료!");
		}
		
		// else 없이 메세지 출력하려면 if 문 블럭 내에서 return 을 통해 함수 실행 종료 필수!
		alert("모든 텍스트 입력 완료!");
		
		// 현재 모든 입력값이 입력됐을 때 submit 버튼이 아닌 버튼을 통해
		// submit 버튼과 동일한 동작을 수행하려면
		// 해당 form 태그 요소 객체의 submit() 메서드 호출
		fr.submit();
	}
	
} // window.onload 이벤트 끝












