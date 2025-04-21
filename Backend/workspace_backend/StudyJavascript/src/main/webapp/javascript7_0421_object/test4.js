/*
[ window 객체의 하위 객체 - history ]
- 웹브라우저의 방문 기록을 관리하는 객체
  => 웹브라우저를 통해 접속했던 페이지 주소(URL) 정보를 저장하고 관리
- 자료구조 중 Stack 구조를 사용하여 페이지 정보를 관리(Stack 2개 - back, forward)
- 속성 : length 등
- 메서드 : back(), forward(), go() 등
*/
function func1() {
	// 현재 웹브라우저에 저장된 방문한 페이지 기록 갯수 확인 => length 속성값 활용
	console.log(history);
	console.log("방문 기록 갯수 : " + history.length);
}

function func2() { // 이전페이지 버튼 클릭 시 호출
	// 웹브라우저에 저장된 페이지 방문 기록 중 현재 페이지 기준 이전페이지로 이동 = back() 메서드 호출
	// => 웹브라우저 '뒤로가기(이전페이지)' 버튼과 동일한 역할
	history.back();
}

function func3() { // 다음페이지 버튼 클릭 시 호출
	// 웹브라우저에 저장된 페이지 방문 기록 중 현재 페이지 기준 다음페이지로 이동 = forward() 메서드 호출
	// => 웹브라우저 '앞으로가기(다음페이지)' 버튼과 동일한 역할
	history.forward();
}

function func4() { // 2단계 이전페이지 버튼 클릭 시 호출
	// 현재 웹페이지 기준 x번째 페이지로 이동 => go() 메서드 호출
	// => x번째 이전페이지로 이동하려면 go(-x) 지정(음수값)
	history.go(-2);
}

function func5() { // 2단계 이전페이지 버튼 클릭 시 호출
	// 현재 웹페이지 기준 x번째 페이지로 이동 => go() 메서드 호출
	// => x번째 다음페이지로 이동하려면 go(x) 지정(양수값)
	history.go(2);
}







