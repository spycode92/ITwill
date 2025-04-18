function btnClick() {
	alert("버튼4 클릭");
}

function btnClick2(msg) {
	alert(msg);
}

function btnClick3(num1, num2) {
	alert(num1 + num2);
}
// --------------------------------------------
// [ 숫자 맞추기 게임 ]
function startNumberGame() {
//	let correctNum = 5; // 정답
	
	/*
	주의! 숫자 입력 시 취소 버튼()을 클릭했거나 
	아무 숫자도 입력하지 않고 확인 버튼을 클릭했을 경우에는
	"게임을 종료합니다" 출력 후 현재 함수를 끝내기 위해 return; 코드 실행
	*/
//	let userNum = prompt("숫자를 입력하세요.");
//	console.log("입력한 숫자 : " + userNum);
//	
//	// 취소버튼(null) 또는 아무것도 입력하지 않고 확인 버튼("")일 때 작업 종료
//	if(userNum == null || userNum == "") {
//		alert("게임을 종료합니다.");
//		return; // 현재 함수(startNumberGame) 를 종료하고 빠져나감
//	}
//	
//	// 입력받은 값을 숫자 데이터로 변환하여 다시 저장
//	userNum = Number(userNum);
//	
//	console.log("입력한 숫자(Number 타입으로 변환 결과) : " + userNum);
//	console.log("입력한 숫자(Number 타입으로 변환 결과) 타입 : " + typeof(userNum));
//
//	// NaN 이라는 값은 특수한 값으로 직접 비교가 불가능하며
//	// isNaN() 함수에 데이터 전달 시 숫자가 아닌지를 판별해준다!
//	if(isNaN(userNum)) { // 해당 데이터가 숫자가 아닐 경우 true 리턴, 숫자일 경우 false 리턴
//		alert("숫자만 입력 가능합니다!");
//	}
//	// -----------------------------------------------------------
//	// 정답 일치 여부 판별
//	if(userNum < correctNum) { // 입력받은 숫자가 정답보다 작음(UP)
//		alert(`${userNum} : 입력받은 숫자가 정답보다 작습니다!`);
//	} else if(userNum > correctNum) { // 입력받은 숫자가 정답보다 큼(DOWN)
//		alert(`${userNum} : 입력받은 숫자가 정답보다 큽니다!`);
//	} else { // 입력받은 숫자와 정답이 일치
//		alert(`${userNum} : 정답입니다!`);
//	}
	// ==============================================================
	// 정답을 입력받을 때까지 반복
	let correctNum = 5; // 정답
	let count = 0; // 반복 횟수(정답 입력 횟수)를 카운팅 할 변수
	 
	// 무한루프 사용 및 정답일 때 무한루프 빠져나오기
	while(true) {
		count++; // while 문 내의 대부분의 위치에서 사용 가능(반복할 때마다 1회씩 증가하기만 하면 됨)
		
		let userNum = prompt("숫자를 입력하세요.");
		console.log("입력한 숫자 : " + userNum);
		
		// 취소버튼(null) 또는 아무것도 입력하지 않고 확인 버튼("")일 때 작업 종료
		if(userNum == null || userNum == "") {
			alert("게임을 종료합니다.");
			return; // 현재 함수(startNumberGame) 를 종료하고 빠져나감
		}
		
		// 입력받은 값을 숫자 데이터로 변환하여 다시 저장
		userNum = Number(userNum);
		
		console.log("입력한 숫자(Number 타입으로 변환 결과) : " + userNum);
		console.log("입력한 숫자(Number 타입으로 변환 결과) 타입 : " + typeof(userNum));

		// NaN 이라는 값은 특수한 값으로 직접 비교가 불가능하며
		// isNaN() 함수에 데이터 전달 시 숫자가 아닌지를 판별해준다!
		if(isNaN(userNum)) { // 해당 데이터가 숫자가 아닐 경우 true 리턴, 숫자일 경우 false 리턴
			alert("숫자만 입력 가능합니다!");
		}
		// -----------------------------------------------------------
		// 정답 일치 여부 판별
		if(userNum < correctNum) { // 입력받은 숫자가 정답보다 작음(UP)
			alert(`${userNum} : 입력받은 숫자가 정답보다 작습니다!`);
		} else if(userNum > correctNum) { // 입력받은 숫자가 정답보다 큼(DOWN)
			alert(`${userNum} : 입력받은 숫자가 정답보다 큽니다!`);
		} else { // 입력받은 숫자와 정답이 일치
			alert(`${userNum} : 정답입니다!`);
			alert("정답까지 입력한 횟수 : " + count + "회");
			
			break; // 현재 while 문을 종료하고 빠져나감(Exit while)
			// break 대신 return 문 사용하여 현재 함수를 종료해도 동일함
			// 단, 정답일 때 반복 종료 후 다른 작업을 수행해야할 경우에는 break 사용
		}
		
	} // while 문 끝
	
//	alert("정답까지 입력한 횟수 : " + count + "회");
	// => 주의! while 문 종료 후 입력 횟수 출력하기 위해서는 while 문 종료 시 return 사용 불가!
	//    (return 문을 만나면 아래쪽 모든 코드 실행을 중단하고 함수 호출한 위치로 되돌아가기 때문)
	
}

















