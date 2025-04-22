/*
[ window 객체의 하위 객체 - location ]
- 페이지 이동 관련 주소(URL) 정보를 관리하는 객체(= 페이지 이동 관련 작업 담당)
- window 객체의 하위 객체이므로 window.location.xxx 형식으로 접근해야하지만
  보통 window 객체명은 생략하고 location.xxx 형식으로 사용
- 페이지 관련 속성(변수) 및 메서드가 제공됨
- 주로 사용하는 속성 : location.href (=> URL(주소) 정보 관리)
  => 이 값을 변경하면 현재 접속한 웹사이트(또는 파일)가 변경됨
- 주로 사용하는 메서드 : location.reload(), location.replace()
*/
function func1() {
	// 현재 웹브라우저 주소표시줄에 표시된 주소(URL) 확인
	// => location 객체의 href 속성값 확인
	console.log(location);
	console.log("현재 접속 주소 : " + location.href);
}

function func2() {
	// URL(주소) 정보 변경을 위해 location 객체의 href 속성값 변경 = 페이지 이동
//	location.href = "http://www.itwillbs.co.kr";
	// => 현재 웹브라우저 주소표시줄의 주소 정보가 우변의 주소로 변경됨
	//    즉, 웹브라우저에서 페이지 이동이 일어남 = 하이퍼링크와 동일한 동작 수행
	
	// 웹사이트 주소 대신 특정 파일명을 지정하여 해당 파일 요청도 가능
	// ex) html 파일 지정 시 해당 파일 내용이 보여지며, 이미지 파일 지정 시 해당 이미지 열림
//	location.href = "1.jpg";
	// -------------------------------------------------
	// 주소 또는 파일명을 지정할 때 위치 지정 방법 2가지
	// 1. 절대 주소 지정 방식
	// => 어느 위치에서 실행하더라도 동일한 위치에 접근 가능한 방식
//	location.href = "http://www.itwillbs.co.kr"; // 항상 아이티윌 사이트에 접속 가능한 주소
//	location.href = "http://localhost:8080/StudyJavascript/javascript7_0422_object/1.jpg";
	
	// 2. 상대 주소 지정 방식
	// => 현재 위치에 따라 대상 주소가 변하는 방식(상대적인 위치를 지정하는 방식)
	// => 상대 주소 지정에 사용하는 기호
	//    1) 현재 위치 : ./ (단, 현재 위치 기호는 생략 가능함)
	//    2) 현재 위치 기준 1단계 상위 폴더(경로) : ../
	//    3) 최상위(= Root = 현재 위치 기준 가장 바깥쪽(윗쪽)) 폴더(경로) : /
	//    4) 현재 위치 기준 1단계 하위 폴더 : 폴더명/ 또는 ./폴더명/
	// 현재 위치(StudyJavascript/javascript7_0422_object 폴더) 기준으로 같은 폴더에 있는 1.jpg 파일
//	location.href = "./1.jpg";

	// 현재 위치(StudyJavascript/javascript7_0422_object 폴더) 기준으로 
	// 1단계 상위 폴더(webapp)에 있는 images 폴더 내의 2.jpg 파일
	// => ../ 지정 시 현재 위치의 상위 폴더인 webapp 을 가리킴
	// => webapp 내의 images 폴더는 webapp/images 이므로 ../images/ 형태로 지정
//	location.href = "../images/2.jpg";
	
	// 현재 위치 기준 하위 폴더인 images 내의 3.jpg 파일
	location.href = "./images/3.jpg";
	
	// 루트(/)를 기준으로 3.jpg 를 지정할 경우
	// localhost:8080/3.jpg 경로를 지정하게 되는데
	// 이 경로에 이미지파일이 존재하지 않으므로 404 오류 발생
	// => 루트 활용법은 나중에 자세히 배움
//	location.href = "/3.jpg";
	// -------------------------------------------------
}

function func3() {
	// URL 정보 새로고침(Refresh)을 위해 location 객체의 reload() 메서드 호출(= 페이지 새로고침)
	// => 주소표시줄의 URL 정보에 해당하는 페이지 다시 로딩 = 웹브라우저 새로고침(F5) 과 동일
//	location.reload();
	
	// replace() 메서드 호출하여 특정 페이지 주소 지정 시
	// 현재 페이지의 내용을 지정한 페이지 내용으로 교체(replace)
	// => 주의! 현재 페이지를 "교체"하므로 교체되기 전의 페이지의 접속 기록을 덮어씀
	//    즉, 웹브라우저 히스토리에 교체 전 페이지 정보가 제거되고 교체된 페이지 정보가 기록됨
	location.replace("http://www.itwillbs.co.kr");
	
	// location.href 의 경우 해당 페이지로 새로 이동을 수행하므로
	// 웹브라우저 히스토리에 이동 전 페이지와 이동 후 페이지 기록이 모두 기록됨
//	location.href = "http://www.itwillbs.co.kr";
	// => 일반적인 페이지 이동 시에는 location.href 사용!!
}

// ===================================================
let newWindow;
function openWindow() {
	newWindow = window.open("../javascript7_0421_object/test4.html", "newWindow", "width=500, height=400");
}

function popupInfo() {
	// newWindow 변수에 객체가 저장되어 있을 경우에만 window 객체의 정보에 접근하기
	if(newWindow != null) {
		// 새 창(newWindow)의 location 객체에 접근하려면 newWindow.location.xxx 사용
		console.log("새 창의 URL 정보 : " + newWindow.location.href);
	} else {
		alert("새 창이 열려있지 않습니다!");
	}
}
// ===================================================
function addCart() {
	// "상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?" 질문을 통해
	// 사용자가 [확인] 버튼 클릭 시 test5_cart.html 페이지로 이동
	if(confirm("상품이 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?")) {
		location.href = "test5_cart.html";
	}
}

















