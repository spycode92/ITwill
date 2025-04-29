console.log("check2");
//document.getElementById("img1").src = "../images/2.jpg";  // 오류 발생

// ==========================================================================
// body 영역이 로딩된 후 load 이벤트에 의해 호출되는 myFunc1() 함수 정의
function myFunc1() {
	console.log("myFunc1");
	// body 영역 내의 모든 요소가 로딩 완료되었으므로 #img 요소 접근도 가능
	document.getElementById("img1").src = "../images/2.jpg"; // 오류 발생 가능성이 있는 위치
}
// --------------------------------------------------------------------------
// 해결책2-2) window 객체의 load 속성을 통해 모든 요소 로딩 완료 시 작업 실행(window.onload=xxx())
// window.onload = 이벤트 발생 시 실행할 함수;
// 주의! 함수 뒤에 소괄호()를 명시하지 않는다!
//window.onload = myFunc1(); // 오류 발생! myFunc1() 코드에 의해 코드 실행 시점에 함수가 바로 호출됨
// 단, 이 때, HTML 요소는 로딩되기 전이므로 객체가 존재하지 않아(null) 오류가 발생하게 됨
// => 즉, onload 이벤트와 관계없이 myFunc1 함수가 실행된다!

window.onload = myFunc1;
// => window.onload 속성에 myFunc1 함수를 전달하면
//    window 객체가 모두 로딩된 후 load 이벤트에 의해 myFunc1 함수가 호출됨
// => 현재 시점에서 호출이 아닌 이벤트 동작 시점에서 호출하도록 하기 위해 소괄호() 제거
// ---------------------------------------------------------------------------------------
// 해결책2-3) window.onload 이벤트 뒤에 별도로 정의한 함수를 전달하지 않고 익명함수 형태로 구현
// => 익명(anonymous)함수란? 함수 정의 시 함수의 이름이 없는 함수
// => 별도로 정의해 놓고 호출하는 함수와 달리 이름이 없기 때문에
//    특정 이벤트 발생 시 즉시 함수를 구현하여 전달하고 외부에서는 호출이 불가능한 형태로 사용
// 기본 문법 : function([파라미터...]) { 실행할 코드들... }
//window.onload = function() {
//	console.log("익명함수 실행됨!");
//	document.getElementById("img1").src = "../images/3.jpg";
//}
// => window.onload = myFunc1; 아래쪽에 익명함수 전달 코드가 기술되어 있으므로
//    기존에 전달된 myFunc1 함수는 제거되고 익명함수가 덮어씀

// 익명함수 정의 시 화살표 함수 형태로 변경 가능
// function() {} 대신 () => {} 형태로 정의
window.onload = () => {
	console.log("익명함수 실행됨222!");
	document.getElementById("img1").src = "../images/3.jpg";
}















