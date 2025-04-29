function changeColor1() {
	// id 선택자 "text1" 인 요소의 배경색(style.backgroundColor 속성)을 "SKYBLUE" 로 변경
	document.querySelector("#text1").style.backgroundColor = "SKYBLUE";
}

function changeColor2() {
	// id 선택자 "text1" 인 요소의 배경색(style.backgroundColor 속성)을 "YELLOW" 로 변경
//	document.querySelector("#text1").style.backgroundColor = "YELLOW";
	// 단, 최초 색상으로 되돌리려면 속성값을 널스트링으로 설정
	document.querySelector("#text1").style.backgroundColor = "";
}

// changeColor3(this) 형태로 호출하므로 파라미터 전달받기(함수 호출한 요소 객체가 전달됨)
function changeColor3(element) {
	// id 선택자 "text2" 요소의 배경색 "LIME" 으로 변경
	document.querySelector("#text2").style.backgroundColor = "LIME";
}

// changeColor4(this) 형태로 호출하므로 파라미터 전달받기(함수 호출한 요소 객체가 전달됨)
function changeColor4(element) {
	// id 선택자 "text2" 요소의 배경색 원래대로 되돌리기
	document.querySelector("#text2").style.backgroundColor = "";
}

function showText2() {
	// id 선택자 "text2" 요소의 입력값 확인 후 출력
	// => 아무것도 입력되지 않았을 경우 "텍스트를 입력하세요" 경고창(alert) 출력
	//    아니면, 콘솔 또는 alert 을 통해 입력된 텍스트 출력(단, 아무것도 입력되지 않으면 출력X)
	let element = document.querySelector("#text2");
	
	if(element.value == "") {
		alert("텍스트를 입력하세요!");
		
		// 입력되지 않은 텍스트박스에 커서(= 포커스) 요청
		// => 대상 요소 객체의 focus() 메서드 호출하면 해당 요소에 포커스 요청
		element.focus();
		
		return; // 함수 실행 즉시 종료 => 즉, 아래쪽 출력문 실행 안 됨
	}
	
	console.log("입력값 : " + element.value);
}
// ===========================================================================
function checkId1(event) { // checkId1(event) 형태로 호출 => 이벤트 객체가 전달됨
	// keyup 이벤트 동작 시 호출되는 함수(텍스트박스에 커서 위치한 상태에서 키를 눌렀다 뗄 때 동작)
	// 텍스트박스 입력값(value 속성값)을 span 태그(id 선택자 result1) 사이에 출력
	// => <span></span> 태그 사이에 내용을 표시해야하므로 innerText 또는 innerHTML 속성 활용
	// 1) 텍스트박스 입력값 가져와서 변수에 저장
	let value = document.getElementById("id1").value;
	
	// 2) span 태그 사이에 입력값 출력(단순 텍스트 출력 시 innerText 사용)
	document.getElementById("result1").innerText = value;
	
//	console.log("입력값 : " + value);
//	console.log("입력값(event) : " + event.target.value);
	// --------------------------------------------------
	console.log(event); // KeyboardEvent 객체 출력됨(누른 키의 정보가 담겨있음)
	console.log(`event.key : ${event.key}`);
	console.log(`event.keyCode : ${event.keyCode}`);
	console.log(`event.altKey : ${event.altKey}`);
	console.log(`event.ctrlKey : ${event.ctrlKey}`);
	console.log(`event.shiftKey : ${event.shiftKey}`);
	
	// 만약, 엔터키(keyCode = 13)가 입력됐을 경우에만 "입력값 : xxx" 출력하는 경우
	if(event.keyCode == 13) { // 엔터키 판별
		console.log("입력값(event) : " + event.target.value);
	}
}

function checkId2(element) { // checkId2(this) 형태로 호출 => 대상 요소 객체가 전달됨
	// blur 이벤트 동작 시 텍스트박스 입력값을 span 태그 영역에 출력하기
	// => 텍스트박스에 포커스 위치한 상태에서 다른 곳으로 포커스가 옮겨가면(빠져나가면) 동작
	//    (즉, 텍스트박스에 내용 입력과는 무관하게 포커스 해제 여부만 판별)
	let value = document.getElementById("id2").value;
	document.getElementById("result2").innerText = value;
	console.log("입력값 : " + value);
	
	console.log("입력값(this) : " + element.value);
	
}

function checkId3(inputValue) { // checkId3(this.value) 형태로 호출 => 대상 요소의 value 속성값 전달됨
	// change 이벤트 동작 시 텍스트박스 입력값을 span 태그 영역에 출력하기
	// => 텍스트박스에 포커스 위치한 상태에서 다른 곳으로 포커스가 빠져나갈 때(= blur 이벤트와 동일)
	//    입력 내용이 이전 시점과 달라졌을 경우 동작(= blur 이벤트와 차이점)
	let value = document.getElementById("id3").value;
	document.getElementById("result3").innerText = value;
	console.log("입력값 : " + value);
	
	console.log("입력값(this.value) : " + inputValue);
	
	
}
















