function startArray() {
	// 배열 생성 기본 문법 : new Array()
	// 배열의 크기(길이 = length)가 0인 기본 배열 생성(배열명 arr1)
	let arr1 = new Array();
	// => new Array() 코드에 의해 크기가 0인 배열(Array 인스턴스 = 객체) 1개가 생성되고
	//    생성된 배열이 arr1 이라는 변수에 저장됨
	
	// ---------------------------------------------
	// 배열 접근 기본 문법 : 배열명[인덱스]
	// 생성된 배열 arr1 의 첫번째 인덱스(= 0번)에 "Apple" 이라는 문자열 저장
	arr1[0] = "Apple";
	document.write(`Apple 저장 후 arr1 배열의 전체 데이터 : ${arr1}<br>`);
	document.write(`Apple 저장 후 arr1 배열의 크기(길이) : ${arr1.length}<br>`);
	
	// 생성된 배열 arr1 의 이름을 잘못 지정할 경우 오류 발생(변수명 틀린 것과 동일)
//	arr100[1] = "Orange"; // arr100 is not defined

	// 배열 arr2 의 두번째 인덱스(= 1번)에 "Orange" 저장 후 출력
	arr1[1] = "Orange";
	document.write(`Orange 저장 후 arr1 배열의 전체 데이터 : ${arr1}<br>`);
	document.write(`Orange 저장 후 arr1 배열의 크기(길이) : ${arr1.length}<br>`);
	
	// arr1 배열의 0번, 1번 인덱스에 저장된 각각의 데이터에 접근하여 출력
	document.write(`첫번째 배열(0번 인덱스)에 저장된 데이터 : ${arr1[0]}<br>`); // Apple
	document.write(`두번째 배열(1번 인덱스)에 저장된 데이터 : ${arr1[1]}<br>`); // Orange
	
	// 존재하지 않는 인덱스 지정하여 배열에 접근할 경우 오류가 아닌 undefined 값 사용됨
	document.write(`세번째 배열(2번 인덱스)에 저장된 데이터 : ${arr1[2]}<br>`); // undefined
	
	// arr1 배열의 기존 데이터가 저장된 1번 인덱스(Orange)에 "Banana" 저장 후 출력
	arr1[1] = "Banana";	// 기존 "Orange" 문자열 제거되고, 새로운 문자열 "Banana" 저장됨(덮어씀)
	document.write(`두번째 배열(1번 인덱스)에 저장된 데이터 : ${arr1[1]}<br>`); // Orange
	// ----------------------------------------------------------------------------------------
	// 기본 for문을 활용하여 arr1 배열을 차례대로 접근하면서 배열 내의 요소 출력
	// => arr1 배열의 첫번째 인덱스가 0이고, 배열의 크기를 arr1.length 로 접근 가능하므로
	//    배열 크기 - 1 까지가 최대 인덱스 번호일 때 i < arr1.length 형태로 조건식 작성
//	for(let i = 0; i <= arr1.length - 1; i++) { // 0 ~ 배열크기-1 까지
	for(let i = 0; i < arr1.length; i++) { // 0 ~ 배열크기보다 작을 동안
		// 제어변수 i를 배열의 인덱스 번호로 활용하면 배열을 처음부터 끝까지 접근 가능함
		document.write(`${i}번 배열 데이터 : ${arr1[i]}<br>`); // Orange
	}
	// -----------------------------------------------------
	// 함수를 이용하여 배열 데이터 출력하기
	// 1) printData() 함수 활용하여 배열 데이터 1개를 전달하면 document.write() 로 출력하기
	//    => printData() 함수 전달인자로 arr1 배열의 0번 인덱스 데이터 전달
	printData(arr1[0]);
	
	// 2) printDataForArray() 함수 활용하여 배열 1개를 전달하면
	//    반복문(for)을 통해 배열 내의 모든 데이터를 document.write() 로 출력하기
	//    => printDataForArray() 함수 전달인자로 arr1 배열 자체를 전달
	printDataForArray(arr1);
	// ==========================================================================
	// 배열에 저장될 데이터가 미리 준비되어 있을 경우
	// 배열 생성 시 인스턴스 생성 코드(new Array()) 대신 배열 데이터를 [] 사이에 직접 기술
	// => 기본 문법 : let 배열명 = [데이터1, 데이터2, ..., 데이터n];
	// arr2 배열 생성하면서 "홍길동", "이순신", "강감찬" 문자열 저장
	let arr2 = ["홍길동", "이순신", "강감찬"];
	document.write(`arr2 배열의 전체 데이터 : ${arr2}<br>`);
	document.write(`arr2 배열의 크기(길이) : ${arr2.length}<br>`);
	
	// 배열 요소를 차례대로 출력해주는 printDataForArray() 함수를 재사용하기 위해
	// 함수 호출 시 전달인자로 arr2 배열 전달
	printDataForArray(arr2);
	
	// 복수개의 데이터를 배열에 저장할 때 한 라인에 모든 데이터를 나열하지 않고,
	// 줄바꿈을 통해 데이터 식별을 더 용이하게 작성할 수 있으며
	// 또한, 마지막 요소의 앞 데이터까지 콤마로 구분하는데 
	// 자바스크립트에서는 마지막 요소에도 콤마를 붙일 수 있다! = Trailing Comma
	let arr3 = [
		"홍길동33", 
		"이순신33", 
		"강감찬33",
	];
	printDataForArray(arr3);
	// =====================================================================
	// 향상된 for문(foreach 문)
	// => 일반 for문과 달리 인덱스 없이 자동으로 배열 내의 모든 요소를 차례대로 반복 접근하는 for문
	//    단, 인덱스가 없으므로 반복 범위 직접 지정 불가(무조건 처음부터 끝까지 모든 요소 반복)
	// => 기본적으로 자바의 향상된 for문과 개념은 동일하나 문법 형태가 약간 다름
	//    자바 기본 문법 : for(배열요소 1개를 저장할 변수 : 배열명) {}
	//    자바스크립트 기본 문법 : for(배열요소 1개를 저장할 변수 of 배열명) {}
	// 1) 일반 for문
//	for(let i = 0; i < arr3.length; i++) {
//		// 배열 각 요소 데이터를 별도의 변수에 저장
//		let name = arr3[i];
//		document.write(`${i}번 배열(arr) 데이터 : ${name}<br>`);
//	}
	
	// 2) 향상된 for문
	for(let name of arr3) {
		document.write(`배열(arr) 데이터222 : ${name}<br>`);
	}
	
} // startArray() 함수 끝
// =================================================
// =================================================
// =================================================
function printData(data) {
	// 전달받은 1개의 데이터를 document.write() 로 출력하기
	document.write(`printData() 함수에 전달된 데이터 : ${data}<br>`);
}

function printDataForArray(arr) { // 전달받은 배열이 arr 변수에 저장됨
	// arr 변수를 활용하여 동일한 방법으로 배열에 접근
	for(let i = 0; i < arr.length; i++) {
		document.write(`${i}번 배열(arr) 데이터 : ${arr[i]}<br>`);
	}
}














