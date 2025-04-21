/*
[ 웹브라우저 내장객체 ]
- 웹브라우저에서 제공하는 다양한 속성 및 기능을 활용할 수 있는 객체
- window 라는 이름의 최상위 객체에서부터 계층구조로 다양한 객체가 제공됨
-------------------------------------------------------------------------
[ window 객체 ]
- 최상위 객체이며, 기본 객체이므로 객체명을 생략 가능한 객체(window. 생략 가능)
- 속성(프로퍼티, 변수) : window.속성명으로 접근(window.status, window.opener, window.document 등)
- 메서드(= 기능 = 동작 = 함수) : window.메서드명() 으로 호출
  => window.open(), window.close() 등
  
[ window.open() 함수 기본 문법 ]
window.open("새 창에서 표시할 주소(URL)", "창 이름", "옵션")
*/

function openWindow() {
	console.log("openWindow() 함수 호출됨!");
	
//	window.open("test3_popup.html", "", ""); // 새 창에 test3_popup.html 파일이 표시됨
	// => open() 메서드 세번째 파라미터로 옵션값 지정하지 않고 널스트링을 전달 시
	//    새 창의 크기 지정이 생략되므로 별도의 창 대신 기존 브라우저에 새 탭으로 열림
	
//	window.open("test3_popup.html", "", "width=500, height=400");
	// => 세번째 파라미터에 width, height 옵션 지정 시 가로, 세로 크기에 맞는 새 창 열림
	
//	window.open("test3_popup.html", "", "top=500, left=400");
	// => 세번째 파라미터에 top, left 옵션 지정 시 상단에서 해당 값만큼, 좌측에서 해당 값만큼
	//    떨어진 위치에 새 창 열림(사이즈는 기본값으로 지정됨)
	//    단, 크기를 지정하지 않으면 원하는 위치에 표시되지 않음
	
//	window.open("test3_popup.html", "", "width=500, height=400, top=500, left=400");
	// => 크기와 위치를 모두 지정하는 방법
	// --------------------------------------------------------------------------
	// open() 메서드 두번째 파라미터(창 이름)를 지정하지 않으면
	// 동일한 내용이 창이더라도 open() 메서드가 호출될 때마다 새 창으로 열린다!!
	// 따라서, 동일한 내용의 창일 경우 하나의 창을 표시한 뒤에는 새로고침 형태로 동작되도록 하려면
	// 두번째 파라미터에 창 이름을 지정하면 된다!
//	window.open("test3_popup.html", "myPopup", "width=500, height=400");
	// --------------------------------------------------------------------------
	// window.open() 메서드 호출되어 새 창이 열리면 해당 창에 대한 값이 리턴됨	
	// => 리턴되는 값은 열린 새 창에 대한 window 객체 자체가 리턴됨
	let popup = window.open("test3_popup.html", "myPopup", "width=500, height=400");
	console.log(popup); // 새 창의 window 객체 정보가 출력
	console.log(popup.name); // 새 창의 이름(window 객체가 관리하는 name 속성값) 출력(myPopup)
	console.log(popup.document); // HTML 태그가 보임(자세한 내용은 나중에 배움)
}

function openWindow2() {
	// 두번째 창의 이름을 첫번째 창과 다르게 지정 시 서로 다른 창으로 열림
//	window.open("test3_popup2.html", "myPopup2", "width=300, height=300"); // 새 창에서 열림
	// 단, 두번째 창의 이름이 첫번째 창의 이름과 동일할 경우
	// 서로 다른 파일이 하나의 창에서 번갈아가며 열림(하나의 창을 공유함)
//	window.open("test3_popup2.html", "myPopup", "width=300, height=300"); // 첫번째 창에서 열림
//	window.open("http://www.itwillbs.co.kr", "myPopup2", "width=300, height=300"); // 새 창에서 열림

	// window 객체는 기본 객체이므로 객체명 생략 가능
	open("test3_popup2.html", "myPopup2", "width=300, height=300"); // 새 창에서 열림
	
	// => alert 함수도 실제로는 window 객체에서 제공하는 메서드이므로
	//    window.alert() 대신 alert() 형태로 사용해왔다! (confirm(), prompt() 모두 동일함)
}

// =====================================================================
// [ 사용자가 의도하지 않은 팝업 열릴 때 브라우저에서 차단된 팝업 처리 ]
let newPopup = window.open("test3_popup.html", "newPopup", "width=500, height=400");
// => 함수 외부에서 실행되는 open() 메서드는 사용자의 의도와 관계없이
//    프로그램 실행 시 자동으로 새 창 열리게 된다!
//    따라서, 브라우저 팝업 차단 기능이 동작할 경우 새 창이 열리지 않는다! (null 값 리턴됨)
console.log("팝업 차단 확인");
console.log(newPopup);
// => 새 창이 열릴 경우 window 객체 정보가 출력되지만
//    팝업 차단에 의해 새 창이 열리지 않으면 window 객체가 생성되지 않아 null 값이 리턴되어 출력됨

// 새 창에 대한 window 객체가 저장된 newPopup 변수값이 null 일 경우
// alert 창을 통해 사용자에게 "팝업 차단 해제" 요청 메세지를 출력할 수 있다!
if(newPopup == null) {
	alert("현재 브라우저에서 팝업 차단 기능이 동작중입니다.\n팝업 차단 해제 후 다시 실행해 주세요!");
}
// =====================================================================
let itwillPopup; // 서로 다른 함수에서도 팝업 객체에 접근하기 위해 함수 바깥에서 변수 선언
function openWindow3() {
	// 새 창에 파일 대신 URL 지정하여 해당 웹사이드를 표시할 수도 있다!
//	let itwillPopup = window.open("http://www.itwillbs.co.kr", "itwillPopup", "width=500, height=400");
	itwillPopup = window.open("http://www.itwillbs.co.kr", "itwillPopup", "width=500, height=400");
	
//	alert("아이티윌 홈페이지 창을 닫습니다.");
	// window 객체의 close() 메서드를 호출하면 현재 창을 닫을 수 있다.
	// 이 때, window 내장 객체 대신 새 창의 window 객체가 저장된 변수명 지정 시
	// 해당 창에 대한 닫기 명령을 수행할 수 있다!
//	window.close(); // 부모창(test3.html 페이지가 열린 창) 이 닫힘

	// 아이티윌 홈페이지가 열린 팝업창(자식창)을 부모창(test3.html) 에서 닫기
	// => 자식창의 window 객체를 가리키는 itwillPopup 변수를 통해 close() 메서드 호출
//	itwillPopup.close();
}

function closeWindow3() {
	// 현재 창에서 새로 열린 자식창(아이티윌 홈페이지 창)을 닫고 싶을 경우
	// 동일한 함수 내에서가 아닌 다른 함수에서 닫기 위해서는
	// 해당 창의 window 객체를 관리하는 변수에 접근할 수 있어야한다!
	// => itwillPopup 변수를 함수 바깥에서 선언해야함
	itwillPopup.close();
}
















