function startArray2() {
	// 아무런 데이터도 저장하지 않은 arr 배열 생성
	let arr = new Array();
	
	// 정수 데이터 1, 2, 3 을 갖는 arrNum 배열 생성
	let arrNum = [1, 2, 3];
	
	// 문자 데이터 "a", "b", "c", "d", "e" 를 갖는 arrStr 배열 생성
	let arrStr = ["a", "b", "c", "d", "e"];
	
	// 각 배열에 저장된 데이터 출력 및 배열의 크기 출력
	document.write(`arr 배열의 전체 데이터 : ${arr}<br>`);
	document.write(`arr 배열의 크기(길이) : ${arr.length}<br>`);
	
	document.write(`arrNum 배열의 전체 데이터 : ${arrNum}<br>`);
	document.write(`arrNum 배열의 크기(길이) : ${arrNum.length}<br>`);
	
	document.write(`arrStr 배열의 전체 데이터 : ${arrStr}<br>`);
	document.write(`arrStr 배열의 크기(길이) : ${arrStr.length}<br>`);
	
	document.write(`<hr>`);
	printDataForArray(arrNum);
	printDataForArray2(arrNum);
	document.write(`<hr>`);
	// =====================================================================
	// [ 자바스크립트에서 배열을 통해 제공하는 메서드 - 배열명.메서드명() ]
	// 1. push()
	//    - 배열 내의 '맨 마지막 인덱스' 에 새로운 요소(데이터) 추가(기본적인 데이터 추가 방법)
	//    - push() 메서드 호출 후 데이터 추가로 인해 증가된 배열의 크기를 리턴
	//      => push() 메서드 전달인자 : 추가할 데이터(요소)   리턴값 : 증가된 배열의 크기
	arr.push("홍길동"); // arr 배열의 마지막 인덱스로 "홍길동" 추가
	// => 기존 배열에 데이터가 없으므로 0번 인덱스 생성되며 "홍길동"이 추가됨
	document.write(`arr 배열 0번 데이터 : ${arr[0]}<br>`);
	
	// "이순신" 문자열을 배열에 push()
	arr.push("이순신");
	document.write(`arr 배열 1번 데이터 : ${arr[1]}<br>`);
	document.write(`arr 배열 전체 데이터 : ${arr}<br>`);
	
	// 1, 2, 3 이 저장되어 있는 arrNum 배열 맨 뒤에 정수 4 추가
	arrNum.push(4);
	document.write(`arrNum 배열 전체 데이터 : ${arrNum}<br>`);
	
	// arr 배열에 정수 10 추가
	arr.push(10); // 기존 "홍길동", "이순신" 과 상관없이 다른 데이터타입도 추가됨
	document.write(`arr 배열 전체 데이터 : ${arr}<br>`);
	
	// "a" ~ "e" 까지 저장되어 있는 arrStr 배열 맨 뒤에 문자 "f" 추가 후
	// 리턴되는 값을 변수 pushResult 에 저장 후 출력
	let pushResult = arrStr.push("f");
	document.write(`arrStr 배열 전체 데이터 : ${arrStr}<br>`);
	document.write(`push() 후 리턴값 : ${pushResult}<br>`);
	document.write(`<hr>`);
	// ------------------------------------------------------------------------------
	// 2. pop()
	//    - 배열 내의 '맨 마지막 인덱스 요소' 꺼내서 리턴
	//    - 파라미터 : 없음   리턴값 : 꺼내진 마지막 요소(데이터)
	//    - 이 때, 꺼낸 데이터는 배열 내에서 제거됨
	let popResult = arrNum.pop(); // 남은 요소 : 3개(1, 2, 3)
	document.write(`pop() 호출 후 리턴값 : ${popResult}<br>`);
	document.write(`pop() 호출 후 전체 데이터 : ${arrNum}<br>`);
	
	arrNum.pop(); // 남은 요소 : 2개(1, 2)
	arrNum.pop(); // 남은 요소 : 1개(1)
	
	popResult = arrNum.pop(); // 마지막으로 저장되어 있던 요소 리턴됨(1)
	document.write(`pop() 호출 후 리턴값 : ${popResult}<br>`);
	popResult = arrNum.pop(); // 더 이상 요소가 저장되어 있지 않으므로 undefined 리턴됨
	document.write(`pop() 호출 후 리턴값 : ${popResult}<br>`);
	// --------------------------------------------------------------------------------
	// 3. unshift()
	//    - 배열 내의 '맨 처음 인덱스'에 새 데이터 추가(push() 메서드와 반대)
	//    - 기존의 데이터들은 모두 한 칸씩 인덱스가 뒤로 밀림
	//    - 증가된 배열의 크기가 리턴됨
	let unshiftResult = arrStr.unshift("x");
	document.write(`unshift() 호출 후 리턴값 : ${unshiftResult}<br>`);
	document.write(`unshift() 호출 후 전체 데이터 : ${arrStr}<br>`);
	
	// 4. shift()
	//    - 배열 내의 '맨 처음 인덱스 요소' 꺼내서 리턴(pop() 메서드와 반대)
	//    - 리턴하는 데이터는 배열에서 제거
	let shiftResult = arrStr.shift();
	document.write(`shift() 호출 후 리턴값 : ${shiftResult}<br>`);
	document.write(`shift() 호출 후 전체 데이터 : ${arrStr}<br>`);
	// ===========================================================================
	/*
	push() + pop() 메서드 조합하여 Stack(스택) 자료구조 구현 가능
	=> 후입선출(Last In First Out, LIFO 또는 First In Last Out, FILO) 구조
	   (즉, 마지막에 추가된 데이터가 가장 먼저 출력됨)
	=> 웹브라우저의 뒤로/앞으로, 응용프로그램의 Undo/Redo 기능 등에 활용됨
	
	push() + shift() 메서드 조합하여 Queue(큐) 자료구조 구현 가능
	=> 선입선출(First In First Out, FIFO 또는 Last In Last Out, LILO) 구조
	=> 은행의 대기표, 웹사이트 티켓팅 대기열 등에서 활용됨
	*/
	// ===========================================================================
	// 5. indexOf()
	//    - 배열 내에서 특정 요소를 탐색하여 해당 요소의 위치(인덱스)값 리턴
	//    - 단, 해당 요소가 존재하지 않을 경우 -1 리턴
	//    - lastIndexOf() 메서드는 indexOf() 와 반대로 뒤(마지막 인덱스)에서부터 요소를 탐색
	//      따라서, 복수개의 요소가 존재할 경우 indexOf() 는 앞에서부터 만나는 첫번째 요소 탐색,
	//      lastIndexOf() 는 뒤에서부터 만나는 첫번째 요소 탐색
	document.write(`arrStr() 배열에서 문자 "c" 의 위치 : ${arrStr.indexOf("c")}<br>`);
	document.write(`arrStr() 배열에서 문자 "x" 의 위치 : ${arrStr.indexOf("x")}<br>`);
	
	// arrStr() 배열에 문자 "c" 를 맨 뒤에 추가
	arrStr.push("c");
	document.write(`arrStr 전체 데이터 : ${arrStr}<br>`);
	document.write(`arrStr() 배열에서 문자 "c" 의 위치(indexOf) : ${arrStr.indexOf("c")}<br>`);
	// => 앞에서부터 제일 먼저 만나는 "c" 의 인덱스 2 리턴됨(세 번째 문자 "c")
	document.write(`arrStr() 배열에서 문자 "c" 의 위치(lastIndexOf) : ${arrStr.lastIndexOf("c")}<br>`);
	// => 뒤에서부터 제일 먼저 만나는 "c" 의 인덱스 6 리턴됨(맨 뒤의 문자 "c")
	
}

function printDataForArray(arr) {
	for(let i = 0; i < arr.length; i++) {
		document.write(`배열 데이터(for) : ${arr[i]}<br>`);
	}
}

function printDataForArray2(arr) {
	for(let data of arr) {
		document.write(`배열 데이터(foreach) : ${data}<br>`);
	}
}
















