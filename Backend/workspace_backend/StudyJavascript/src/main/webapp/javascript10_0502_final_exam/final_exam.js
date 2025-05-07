// window.onload 이벤트 외의 다른 곳에서도 접근하기 위해 전역변수로 선언
// => 주의! 자식창에서 현재창(= 부모창)의 변수에 접근하기 위해 var 로 변수 선언 필요함
var resultCheckId = false;
var resultCheckPasswd = false;
var resultCheckPasswd2 = false;

window.onload = () => {
	let joinForm = document.joinForm;
	
	// 아이디, 비밀번호 입력값 체크 결과(true/false) 를 저장할 변수 선언
	// => 여러 이벤트 핸들러에서 사용해야하므로 각 이벤트 핸들러 외부에서 선언 필요
	//    만약, window.onload 외에 다른 이벤트에서도 사용해야할 경우 전역변수로 선언 필요
//	let resultCheckId = false;
//	let resultCheckPasswd = false;
//	let resultCheckPasswd2 = false;
	
	// 1. ID 중복확인 버튼 클릭 시 새 창(check_id.html) 띄우기
	document.getElementById("btnChecKId").onclick = openCheckIdWindow;
	// 단, ID 입력 텍스트박스 readonly 처리 시 클릭 이벤트 발생해도 새 창 띄우기
	joinForm.id.onclick = openCheckIdWindow;
	
	function openCheckIdWindow() {
		window.open("check_id.html", "check_id", "width=400,height=400");
	}
	
	// --------------------------------------------------------------------
	// 2. 아이디 입력란에서 커서가 빠져나갈 때 아이디 길이 체크하기
	// => blur 이벤트
//	let idElement = joinForm.id; // 아이디 입력 요소 객체 저장
//	idElement.onblur = function() {
//		if(idElement.value.length >= 4 && idElement.value.length <= 8) {
//			document.getElementById("checkIdResult").innerText = "사용 가능";
//			document.getElementById("checkIdResult").style.color = "GREEN";
//			
//			// 아이디 입력 체크 완료 시 resultCheckId 변수값을 true 로 변경
//			resultCheckId = true;
//		} else {
//			document.getElementById("checkIdResult").innerText = "4~8글자만 사용 가능합니다";
//			document.getElementById("checkIdResult").style.color = "RED";
//			
//			// 아이디 입력 체크 완료 시 resultCheckId 변수값을 false 로 변경
//			resultCheckId = false;
//		}
//	}
	// => check_id.html 파일 내의 자바스크립트에서 작업 수행하므로 주석 처리

	// --------------------------------------------------------------------
	// 3. 비밀번호 입력란에 키를 누를때마다 비밀번호 길이 체크하기
	joinForm.passwd.onkeyup = function() {
		// 키를 누를때마다 패스워드 요소 입력값 저장
		let passwd = joinForm.passwd.value;
		
		// 변수 선언 시 false 일 때의 값을 미리 저장
		let message = "사용 불가능한 패스워드";
		let color = "RED";
		resultCheckPasswd = false; // 키를 누를때마다 미리 체크 결과를 false 로 저장해두고 차후 확인하여 변경
		
		if(passwd.length >= 8 && passwd.length <= 16) {
			message = "사용 가능한 패스워드";
			color = "BLUE";
			resultCheckPasswd = true; 
		}
		
		document.getElementById("checkPasswdResult").innerText = message;
		document.getElementById("checkPasswdResult").style.color = color;
	}
	
	// --------------------------------------------------------------------
	// 4. 비밀번호확인 입력란에 키를 누를때마다 비밀번호와 같은지 체크하기
	joinForm.passwd2.onkeyup = checkSamePasswd;
	
	// 비밀번호 입력란 blur 이벤트 발생 시 비밀번호 확인란과 같은지 체크
	// => 비밀번호 일치여부 확인 후 비밀번호 입력란에서 변경 시 다시 체크하기 위함
	joinForm.passwd.onblur = checkSamePasswd;
	
	// 비밀번호 일치 여부를 확인할 함수 정의(임시로 onload 이벤트 함수 내에 정의)
	function checkSamePasswd() {
		// 키를 누를때마다 패스워드와 패스워드확인 요소 입력값 저장
		let passwd = joinForm.passwd.value;
		let passwd2 = joinForm.passwd2.value;
		
		// 변수 선언 시 false 일 때의 값을 미리 저장
		let message = "비밀번호 불일치";
		let color = "RED";
		resultCheckPasswd2 = false;
		
		if(passwd == passwd2) {
			message = "비밀번호 일치";
			color = "BLUE";
			resultCheckPasswd2 = true;
		}
		
		console.log("resultCheckPasswd2 : " + resultCheckPasswd2);
		
		document.getElementById("checkPasswd2Result").innerText = message;
		document.getElementById("checkPasswd2Result").style.color = color;
	}
	
	// --------------------------------------------------------------------
	// 5. 주민번호 숫자 입력할때마다 길이 체크하기
	joinForm.jumin1.onkeyup = function() {
		if(joinForm.jumin1.value.length >= 6) { // 주민번호 앞자리 6자리 이상일 경우
			// 6자리보다 많이 입력되었을 경우(주로 키를 누른채 계속 입력되면 keyup 이벤트가 발생하지 않음)
			// => 입력된 주민번호 앞자리를 6자리 제외하고 나머지 제거
			// => 부분문자열 처리하는 메서드를 활용하여 6번째 문자열까지만 추출
			// 1) 문자열.substr(시작인덱스, 길이) 메서드 : 시작인덱스부터 길이만큼의 문자열 추출하여 리턴
//			joinForm.jumin1.value = joinForm.jumin1.value.substr(0, 6); // 0번 인덱스부터 6자리 추출
			
			// 2) 문자열.substring(시작인덱스, 끝인덱스) 메서드
			//    => 시작인덱스부터 끝인덱스-1 까지 문자열 추출하여 리턴
//			joinForm.jumin1.value = joinForm.jumin1.value.substring(0, 6); // 0 ~ 6-1 번 인덱스까지 추출
			
			// 3) 입력값을 후처리하는 대신 해당 입력폼에 maxlength 속성으로 실제 입력 길이 제한
			  
			// 주민번호 뒷자리 입력란(jumin2)으로 커서 이동(= 포커스 요청)
			joinForm.jumin2.focus();
		}
	}
	
	joinForm.jumin2.onkeyup = function() {
		if(joinForm.jumin2.value.length >= 7) { // 주민번호 뒷자리 7자리 이상일 경우
			// 주민번호 뒷자리 입력란에서 커서 해제(= blur)
			joinForm.jumin2.blur();
		}
	}
	
	// --------------------------------------------------------------------
	// 6. 주소검색 버튼 클릭 시 search_address.html 페이지를 새 창에 표시하기
	document.getElementById("searchAddress").addEventListener("click", function() {
//		window.open("search_address.html", "search_address", "width=500,height=500");

		// 다음 우편번호 API 를 활용한 주소검색 창 띄우기
		new daum.Postcode({
	        oncomplete: function(data) { // 파라미터 data 에 클릭된 주소 정보 전달됨
	            // 팝업에서 검색결과 항목(원하는 주소)을 클릭했을때 실행할 코드
//				console.log(data); // 주소 정보가 저장된 객체 출력됨

				// 우편번호, 기본주소, 상세주소 항목에 각 주소 정보 출력하기
				// => data.xxx 속성을 통해 각 주소정보에 접근 가능
				// 1) 우편번호 : zonecode 속성 활용
				//    (= 원래 postcode 이나 최근 국가기초구역번호로 변경됨 = zonecode 사용)
				joinForm.postcode.value = data.zonecode;
				
				// 2) 기본 주소 : address 속성 활용
//				joinForm.address1.value = data.address;
				
				// 만약, 해당 주소에 건물명(buildingName 속성값)이 존재할 경우
				// 기본 주소 뒤에 건물명을 결합하여 출력
				// ex) 기본 주소(address)   : 부산광역시 부산진구 동천로 109
				//     건물명(buildingName) : 삼한골든게이트
				//     => 부산광역시 부산진구 동천로 109 (삼한골든게이트)
//				console.log("건물명 : " + data.buildingName);
				
				let address = data.address; // 기본주소 변수에 저장
				
				// 건물명 존재 여부 판별하여 존재할 경우 address 변수에 추가
				if(data.buildingName != "") { // 건물명 존재할 경우
					address += ` (${data.buildingName})`;
				}
				
				// 기본주소(+건물명) 출력
				joinForm.address1.value = address;
				
				// 상세주소 입력 항목(address2)에 커서 요청
				joinForm.address2.focus();
	        }
	    }).open();
	});
	
	// --------------------------------------------------------------------
	//	7. 이메일 도메인 선택 셀렉트 박스 항목 변경 시 
	//     선택된 셀렉트 박스 값을 이메일 두번째 항목(@ 기호 뒤)에 표시하기
	document.getElementById("emailDomain").addEventListener("change", function() {
		// 셀렉트박스의 change 이벤트 핸들러 내에서 this 지정 시 셀렉트박스에 접근 가능
//		console.log(this);

		// 셀렉트박스의 value 속성값을 email2 의 value 속성값으로 설정
		joinForm.email2.value = this.value;
		
		// "직접 입력" 항목인지 판별
		// => this.selectedIndex 가 0 또는 this.value 가 "" 인지 판별
//		console.log(this.selectedIndex);
		if(this.selectedIndex == 0) { // "직접입력" 선택 시(this.value == "" 동일함)
			// 읽기 전용 설정, 배경색 원래대로, 포커스 요청
			joinForm.email2.style.backgroundColor = ""; // 기본색으로 변경
			joinForm.email2.readOnly = false; // 읽기전용 해제(readonly 아님! Camel-case 필수!)
			joinForm.email2.focus(); // 커서 요청
		} else {
			joinForm.email2.style.backgroundColor = "#CCCCCC99"; // 회색으로 변경
			joinForm.email2.readOnly = true; // 읽기전용 설정(readonly 아님! Camel-case 필수!)
		}
	});
	
	// --------------------------------------------------------------------
	//	8. 취미의 "전체선택" 체크박스 체크 시 취미 항목 모두 체크, 
	//     "전체선택" 해제 시 취미 항목 모두 체크 해제하기
	document.getElementById("check_all").addEventListener("click", function() {
//		console.log(this.checked); // 현재 체크박스 체크상태 확인

		// 3개의 취미 체크박스(name="hobby")가 hobby 라는 이름의 배열로 관리됨 => 반복문으로 접근
		for(let hobby of joinForm.hobby) {
			hobby.checked = this.checked; // 취미 체크상태를 전체선택 체크상태와 동일하게 변경 
		} 
	});

	// --------------------------------------------------------------------
	// 9. 이미지변경 버튼 클릭 시 사진 교체하기
	document.getElementById("btnChangeImg").onclick = function() {
		document.getElementById("profileImg").src = "../images/heart(full).png";
	}
	
	// --------------------------------------------------------------------
	// 10. 가입(submit) 클릭 시 이벤트 처리 
	// => 주의! 버튼 click 이벤트가 아닌 폼의 submit 이벤트로 핸들링
	joinForm.onsubmit = function() {
//		alert("확인");
		
		if(joinForm.name.value.length == 0) { // 이름 미입력
			alert("이름 입력 필수!");
			joinForm.name.focus();
			// 이름 미입력 시 submit 동작 취소를 위해 false 값 리턴
			return false; // submit 동작 취소
//		} else if(joinForm.id.value.length == 0 && joinForm.id.value.length >= 4 && joinForm.id.value.length <= 8) { // 아이디 조건 확인
		} else if(!resultCheckId) {
			alert("아이디 입력값 확인 필수!");
			joinForm.id.focus();
			return false; // submit 동작 취소
		} else if(!resultCheckPasswd) {
			alert("비밀번호 입력값 확인 필수!");
			joinForm.passwd.focus();
			return false; // submit 동작 취소
		} else if(!resultCheckPasswd2) {
			alert("비밀번호 일치여부 확인 필수!");
			joinForm.getElementById("passwd2").focus();
			return false; // submit 동작 취소
		} else if(joinForm.jumin1.value == "") { // value.length == 0 과 동일
			alert("주민번호 앞자리 입력 필수!");
			joinForm.jumin1.focus();
			return false; // submit 동작 취소
		} else if(joinForm.jumin2.value == "") { // value.length == 0 과 동일
			alert("주민번호 뒷자리 입력 필수!");
			joinForm.jumin2.focus();
			return false; // submit 동작 취소
		// 주소 확인 생략
		} else if(joinForm.email1.value == "") { // value.length == 0 과 동일
			alert("이메일 계정 입력 필수!");
			joinForm.email1.focus();
			return false; // submit 동작 취소
		} else if(joinForm.email2.value == "") { // value.length == 0 과 동일
			alert("이메일 도메인 입력 필수!");
			joinForm.email2.focus();
			return false; // submit 동작 취소
		} else if(joinForm.job.selectedIndex == 0) {
			alert("직업 선택 필수!");
			joinForm.job.focus();
			return false; // submit 동작 취소
		} else if(joinForm.gender.value == "") { // 라디오버튼은 value 속성값 널스트링 체크로 처리
			alert("성별 선택 필수!");
			joinForm.gender[0].focus();
			return false; // submit 동작 취소
		} else if(!joinForm.hobby[0].checked && !joinForm.hobby[1].checked && !joinForm.hobby[2].checked) {
			alert("취미 최소 하나 선택 필수!");
			joinForm.hobby[0].focus();
			return false; // submit 동작 취소
		} else if(joinForm.joinReason.value == "") { // textarea 도 value 값으로 체크 가능
			alert("가입동기 입력 필수!");
			joinForm.joinReason.focus();
			return false; // submit 동작 취소
		} 
		
		// submit 동작 처리 시 return true; 또는 생략 가능
	} 
	
	
	
} // window.onload 이벤트 끝
















