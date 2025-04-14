/*
[ if문 ]
- 특정 조건에 따라 문장을 실행하는 조건문
- 자바에서의 if문과 거의 동일
- 조건식은 반드시 결과가 true 또는 false 인 식만 사용 가능(자바만 해당됨)하며, 변수 사용도 가능

1. 단일 if문
- if문에 주어진 조건을 판별하여 true 일 때 지정된 블럭 내의 문장들을 수행하는 if문

< 기본 문법 >
문장1;

if(조건식) {
	// 조건식 판별 결과가 true 일 때 실행할 문장들...
	문장2;
}

문장3;

=> 조건식 판별 결과가 true 일 때 : 문장1 -> 문장2 -> 문장3 순으로 실행됨
=> 조건식 판별 결과가 false 일 때 : 문장1 -> 문장3 순으로 실행됨(문장2 실행은 생략됨)
*/

// 변수 num 선언 및 정수 10 으로 초기화 후 값 출력
//let num = 10;
let num = -10;
console.log(`num = ${num}`); // 문장1

// 단일 if 문 사용하여 변수 num 값이 0 보다 큰지 판별(질문 : 변수 num 이 0 보다 큰가?)
if(num > 0) {
	// num 값이 0 보다 클 경우 조건식 판별 결과가 true 이므로
	// 중괄호 블럭{} 내의 문장들이 차례대로 실행됨
	// 단, 0 보다 크지 않을 경우 판별 결과가 false 가 되므로 블럭 내의 문장들은 실행되지 못함
	console.log(`0보다 크다!`); // 문장2
} // if 문 끝

console.log(`이 문장은 if 문 조건식 판별 결과와 상관없이 무조건 실행됨!`); // 문장3
// ==============================================================================
// confirm() 함수를 통해 "종료하시겠습니까?" 메세지를 출력하고
// 사용자로부터 확인(true)/취소(false) 버튼을 입력받은 후
// 확인 버튼을 눌렀을 경우 "프로그램을 종료합니다!" 출력
let selectedBtn = confirm("종료하시겠습니까?");

// if 문을 사용하여 selectedBtn 값이 true 인지 판별(= selectedBtn 값이 true 와 같은지 판별)
//if(selectedBtn == true) {} // selectedBtn == true 인 조건이 true 일 경우(조건을 두 번 판별)
// 따라서, if문 조건식 부분에 boolean 타입 값을 판별할 경우에는
// boolean 타입 값만 사용하여 true/false 를 판별하자!
// 1) boolean 타입 값이 true 인지를 판별하는 방법
//    => if 문에 boolean 타입 변수만 표기하면 true 일 때 중괄호 블럭이 실행됨 
if(selectedBtn) { // selectedBtn == true 와 동일한 표현 방법
	console.log(`프로그램을 종료합니다!`); // selectedBtn 값이 true 일 때 실행되는 문장
}

//if(selectedBtn == false) { // selectedBtn == false 인 조건이 true 일 경우
// 2) boolean 타입 값이 false 인지를 판별하는 방법
//    => if문에 boolean 타입 변수만 표기하면 true 를 판별하므로
//       이 과정을 반전(반대로 뒤집기)하기 위해서는 NOT 연산자(!)를 결합하여 사용해야함
//    => ex) selectedBtn 이 false 일 때 !selectedBtn 수행 시 true 로 변경되므로
//           if(true) 문장이 되어 블럭문 내의 코드들을 실행하게 된다!
if(!selectedBtn) {
	console.log(`취소 버튼 클릭됨!`); // selectedBtn 값이 false 일 때 실행되는 문장
}





















