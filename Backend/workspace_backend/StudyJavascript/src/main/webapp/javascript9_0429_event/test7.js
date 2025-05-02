window.onload = () => {
	// 선택값 확인 버튼 클릭 이벤트 핸들링
//	document.querySelector("#btnCheck").onclick = () => {
//		// 셀렉트박스의 선택된 항목에 접근하려면 셀렉트박스 요소 객체의 value 속성값 활용
//		// => 이 때, 선택된 항목(option 태그)의 value 값이 셀렉트박스의 value 값으로 설정됨
//		document.querySelector("#infoArea").innerHTML = `<h3>${document.fr.fruits.value}</h3>`;
//	}
	
	// 이벤트 핸들링 시 해당 요소 객체의 onXXX 속성 대신 addEventListener() 메서드로 처리 가능
	// 객체명.on이벤트명 = 함수 => 객체명.addEventListener("이벤트명", 함수) 형태로 바뀜
	// => 하나의 이벤트에 복수개의 핸들러 등록이 가능하고
	//    기존 등록된 이벤트 제거도 null 값 전달 대신 removeEventListener() 메서드로 직관적임
//	document.getElementById("btnCheck").addEventListener("click", () => {
	document.querySelector("#btnCheck").addEventListener("click", () => {
		document.querySelector("#infoArea").innerHTML = `<h3>${document.fr.fruits.value}333</h3>`;
	});
	// =========================================================================
	// 전송버튼(submit) 이벤트 핸들링
	// => 해당 폼의 submit 이벤트 활용하여 핸들링(버튼 클릭 이벤트가 아님!)
	document.fr.onsubmit = function() {
		// 현재 셀렉트박스 선택 항목이 "과일을 선택하세요" 일 경우
		// "과일 선택 필수!" 경고창(alert) 출력하고 셀렉트박스에 포커스 요청
		// => 이 때, 경고창 출력 후 submit 동작이 취소되도록 하려면 return false; 사용
		// 1) 셀렉트박스 value 속성값이 널스트링("")인지 판별
//		if(document.fr.fruits.value == "") { // document.fr.fruits.value.length == 0 동일
//			alert("과일 선택 필수!");
//			document.fr.fruits.focus();
//			return false; // 현재 함수 실행 즉시 종료 => submit 동작도 취소됨
//			// 만약, submit 동작을 수행하려면 return true; 또는 return 문 자체 생략
//		}

		// 2) 셀렉트박스 내의 각 option 태그 항목들이 셀렉트박스 객체 내의 options 이름의 배열로 관리됨
		//    따라서, 배열의 첫번째 항목(과일을 선택하세요)의 selected 속성값이 true 인지 판별
		console.log(document.fr.fruits); // <select> 태그 요소 출력
		console.log(document.fr.fruits.options); // <select> 태그 내의 <option> 태그 요소 출력
		// => 이 때, 각 옵션들은 HTMLOptionsCollection 타입의 객체(배열)로 관리됨
		//    배열 내의 selected 속성값에 해당 셀렉트박스 항목 선택 여부가 저장되어 있음(true/false)
		if(document.fr.fruits.options[0].selected) {
			alert("과일 선택 필수2222!");
			document.fr.fruits.focus();
			return false; // 현재 함수 실행 즉시 종료 => submit 동작도 취소됨
			// 만약, submit 동작을 수행하려면 return true; 또는 return 문 자체 생략
		}
	} // onsubmit 이벤트 끝
	
	// =============================================================================
	// 셀렉트박스에 클릭 이벤트 핸들링 할 경우
	// 항목을 실제로 선택하지 않고 셀렉트박스 자체를 클릭하기만 해도 이벤트가 발생함
//	document.fr.fruits2.onclick = function() {
//		console.log("셀렉트박스 클릭!");
//	}

	// 셀렉트박스 항목 선택하면 이전 값과 다른 값이 선택되었을 때만 이벤트가 동작되도록 하려면
	// click 이벤트 대신 change 이벤트 핸들링
	document.fr.fruits2.onchange = function() {
		console.log("셀렉트박스 클릭(change)!");
		
		// 선택된 항목의 value 값을 텍스트박스(name 속성 selectedFruit)에 출력
		document.fr.selectedFruit.value = document.fr.fruits2.value;
		
		// "과일을 선택하세요" 이외의 다른 항목 선택 시 텍스트박스 읽기전용 설정 및 배경색 변경하고
		// 아니면, 텍스트박스 읽기전용 해제 및 배경색을 원래대로 되돌리기
		// => 읽기전용 속성명 : readonly
		// => 주의! 자바스크립트에서 HTML 속성명 접근 시 두 단어 이상일 경우
		//    Camel-case 표기법으로 지정해야한다!
		//    ex) readonly = readOnly    
		//        style.background-color = style.backgroundColor
		if(document.fr.fruits2.selectedIndex > 0) { // "과일을 선택하세요" 이외의 항목 선택 시
			document.fr.selectedFruit.readOnly = true; // 읽기전용으로 설정
			document.fr.selectedFruit.style.backgroundColor = "#CCCCCC55"; // 배경색 회색 설정
			// => 색상 지정 시 #RRGGBBAA 형식으로도 지정 가능함
			//    A 는 Alpha 값으로 투명도를 조정할 수 있음(숫자가 클 수록 불투명해짐)
		} else { // "과일을 선택하세요" 항목 선택 시
			document.fr.selectedFruit.readOnly = false; // 읽기전용 해제
			document.fr.selectedFruit.style.backgroundColor = ""; // 배경색 기본값으로 복원
		}
		
	}
	
	// 선택항목 품절 처리 버튼 클릭 시 해당 option 태그 항목 선택 불가(disabled) 처리
	document.querySelector("#btnSoldout").onclick = function() {
		// 임시) 사과 항목에 대한 disabled 설정(disabled = true)
//		document.fr.fruits2.options[1].disabled = true;
		
		// 선택한 항목을 알아내기 위해 셀렉트박스의 selectedIndex 속성값 활용
		console.log(`선택한 항목 인덱스 : ${document.fr.fruits2.selectedIndex}`);
		
		const selectedIndex = document.fr.fruits2.selectedIndex;
		
		// 선택한 항목에 대한 disabled 설정
		// 단, 선택한 항목이 첫번째 항목일 경우는 제외함
		if(selectedIndex > 0) {
			const selectedItem = document.fr.fruits2.options[selectedIndex];
			
			// 해당 항목 비활성화 처리
			selectedItem.disabled = true;
			
			// 비활성화 처리된 항목 텍스트 옆에 (품절) 추가
//			selectedItem.innerText = selectedItem.innerText + " (품절)";
			// 셀렉트박스 option 태그의 텍스트는 innerText 대신 text 속성값으로 제어 가능
			selectedItem.text += " (품절)";
			
			// 선택항목 초기화(선택 항목을 첫번째 항목으로 변경)
			document.fr.fruits2.selectedIndex = 0;
		}
	}
	
	// 선택항목 품절 처리 버튼 클릭 시 모든 항목 선택 가능하도록 선택 불가 해제 처리
	document.querySelector("#btnSell").onclick = function() {
		for(let option of document.fr.fruits2.options) {
			option.disabled = false;
			
			// 품절 텍스트 제거
			// => 해당 텍스트에 replace() 메서드 호출하여 " (품절)" 텍스트를 널스트링("")으로 대체(치환)
			// => 기본 문법 : xxx.replace(원본문자열, 대체할문자열)
			option.text = option.text.replace(" (품절)", "");
		}
		
		document.fr.fruits2.selectedIndex = 0;
	}
	
	
	
} // window.onload 이벤트 끝



















