/*
자바스크립트에서 라디오버튼과 체크박스는 name 속성이 같은 요소들을 하나의 배열로 관리함
=> 배열명은 해당 요소의 name 속성값과 동일하게 자동으로 지정됨
=> 배열에 저장되는 실제 데이터는 해당 요소의 value 속성값과 동일
=> 각 항목의 선택(체크) 여부는 해당 요소의 checked 속성값을 통해 확인
   (true : 체크(선택), false : 미체크(미선택))
   
라디오버튼의 선택값을 확인할 때는 별도로 배열 형태가 아닌 name 속성값.value 속성값 확인 시
선택된 라디오버튼의 value 속성값 확인이 가능하다! (= 라디오버튼 선택에 따라 값이 바뀜)
단, 체크박스는 배열의 각각의 인덱스에 저장되므로 대표값이 없음! 
*/
window.onload = function() {
	// 라디오버튼 선택완료 버튼 클릭 이벤트
	document.querySelector("#btnRadio").onclick = function() {
		// 라디오버튼(name 속성명 "radio") 요소에 접근하여 value 속성값 출력
		console.log(`라디오버튼 value 값 : ${document.fr.radio.value}`);
		// => 복수개의 라디오버튼 중 "선택된 항목" 의 value 속성값이 출력됨(선택에 따라 값이 바뀜)
		
		// 두 개의 라디오버튼 중 아무것도 선택하지 않았을 경우
		// alert 창을 통해 "라디오버튼 선택 필수!" 출력
//		if(document.fr.radio.value == "") {
//			alert("라디오버튼 선택 필수!");
//			return;
//		}		 
		// ---------------------------------------------
		// 각각의 라디오버튼 요소에 직접 접근하여 해당 요소의 value 속성값과 checked 속성값 출력하기
		// => 배열의 각 요소 접근 방법을 사용하므로 radio[인덱스] 형태로 접근
		console.log(`첫번째 라디오버튼 value 속성값 : ${document.fr.radio[0].value}`);
		// => 첫번째 라디오버튼 선택 여부와 관계없이 무조건 "라디오1" 출력됨
		console.log(`첫번째 라디오버튼 checked 속성값 : ${document.fr.radio[0].checked}`);
		// => 첫번째 라디오버튼 선택 시 true, 미 선택 시 false 가 출력됨
		
		console.log(`두번째 라디오버튼 value 속성값 : ${document.fr.radio[1].value}`);
		// => 두번째 라디오버튼 선택 여부와 관계없이 무조건 "라디오2" 출력됨
		console.log(`두번째 라디오버튼 checked 속성값 : ${document.fr.radio[1].checked}`);
		// => 두번째 라디오버튼 선택 시 true, 미 선택 시 false 가 출력됨
		
		// 두 개의 라디오버튼 중 아무것도 선택하지 않았을 경우
		// alert 창을 통해 "라디오버튼 선택 필수!" 출력
		// => 배열로만 접근하기! document.fr.radio.value 사용 금지!
//		if(document.fr.radio[0].checked == false && document.fr.radio[1].checked == false) {
		if(!document.fr.radio[0].checked && !document.fr.radio[1].checked) {
			alert("라디오버튼 선택 필수!");
			return;
		}	
		
	}
	
	// ========================================================================
	// 체크박스 선택완료 버튼 클릭 이벤트
	document.querySelector("#btnCheck").onclick = function() {
		// 체크박스 처리 방법은 기본적으로 라디오버튼과 동일함
		// ---------------------------------------------------
		// 각 체크박스의 value 속성값과 checked 속성값을 모두 div 영역(id = "infoArea")에 출력
		let infoArea = document.querySelector("#infoArea");
		let checkbox = document.fr.check; // 체크박스 배열을 별도의 변수에 저장
		
//		infoArea.innerText = checkbox[0].value + " : " + checkbox[0].checked;
//		infoArea.innerText = checkbox[1].value + " : " + checkbox[1].checked;
//		infoArea.innerText = checkbox[2].value + " : " + checkbox[2].checked;
		// => 마지막 코드가 최종적으로 실행되어 화면에 표시됨(덮어씀)
		
		// 문자열 결합을 통해 하나의 문자열로 div 영역에 출력해야함
//		infoArea.innerText = 
//			checkbox[0].value + " : " + checkbox[0].checked + "\n"
//			+ checkbox[1].value + " : " + checkbox[1].checked + "\n"
//			+ checkbox[2].value + " : " + checkbox[2].checked;
		
		// 백틱 사용 시 연결 연산자 불필요
//		infoArea.innerText = `
//			${checkbox[0].value} : ${checkbox[0].checked}
//			${checkbox[1].value} : ${checkbox[1].checked}
//			${checkbox[2].value} : ${checkbox[2].checked}
//		`;	
		
		// 반복문(for)을 활용하여 중복 코드 제거(체크박스 배열(document.fr.check) 을 반복)
		let checkInfo = "";
		
		// 1) 기본 for문
//		for(let i = 0; i < checkbox.length; i++) {
//			// 문자열을 누적 결합하기 위해 += 연산을 통해 문자열 결합 누적
//			checkInfo += checkbox[i].value + " : " + checkbox[i].checked + "\n";
//		}
		
		// 2) 향상된 for문(foreach, for...of 문)
		for(let item of checkbox) {
			// 문자열을 누적 결합하기 위해 += 연산을 통해 문자열 결합 누적
			checkInfo += item.value + " : " + item.checked + "\n";
		}
		
		infoArea.innerText = checkInfo;
		
		// --------------------------------------
		// 3개의 체크박스 중 하나도 체크되지 않았을 경우
		// "체크박스 한 개 이상 체크 필수!" 경고창 출력
		if(!checkbox[0].checked && !checkbox[1].checked && !checkbox[2].checked) {
			alert("체크박스 한 개 이상 체크 필수!");
			return;
		}
		
	}
	// ===========================================================================
	// 전체선택 체크박스 click 이벤트 핸들링
	// => 전체선택 체크박스 체크상태 출력
	document.querySelector("#all_check").onclick = function() {
		// document.querySelector("#all_check") 또는 document.fr.all_check 대신
		// this 또는 event 객체 활용하면 다시 체크박스 객체 접근 코드 기술할 필요 없음
		// (이벤트가 발생한 현재 객체 자신에게 접근 시에만 사용 가능)
//		console.log(`전체선택 체크 상태 : ${this.checked}`);
		
		// 전체선택 체크박스가 "체크" 상태일 경우 다른 체크박스 모두 "체크" 상태로 변경하고
		// 아니면 다른 체크박스 모두 "체크해제" 상태로 변경
		if(this.checked) { // 전체선택 체크
//			console.log("전체선택 체크됨!");
			// 체크박스 checked 속성값을 true 로 변경
			document.fr.check[0].checked = true;
			document.fr.check[1].checked = true;
			document.fr.check[2].checked = true;
		} else { // 전체선택 체크해제
//			console.log("전체선택 체크해제됨!");
			// 체크박스 checked 속성값을 false 로 변경
			document.fr.check[0].checked = false;
			document.fr.check[1].checked = false;
			document.fr.check[2].checked = false;
		}
	}
	
	
	
} // window.onload 이벤트 끝












