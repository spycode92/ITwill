/*
[ window 객체의 하위 객체 - document ]
- HTML 문서 정보(= 내용)를 관리하는 객체
  (document 객체를 통해 DOM 에 접근하고 각 요소에 대한 처리가 가능함)
- 문서 정보 확인, 내용 변경 등의 다양한 작업 수행 가능
- 속성 : title, bgColor, fgColor
- 메서드 : write(), querySelector(), getElementById() 등
*/
function func1() {
	// 현재 HTML 문서의 제목(= 웹브라우저 제목표시줄의 내용 = title 태그 내용) 확인
	console.log(`document.title : ${document.title}`);
}

function func2() {
	// HTML 문서의 제목(title 속성값) 변경
	document.title = "변경된 title";
}

function func3() {
	// HTML 문서의 색상 정보 확인(fgColor, bgColor 속성값 확인)
//	console.log(`document.fgColor : ${document.fgColor}`); // fore ground 약자. 문서 전경색(주로 텍스트)
//	console.log(`document.bgColor : ${document.bgColor}`); // back ground 약자. 문서 배경색
	// => bgColor, fgColor 속성값을 별도로 설정하지 않았을 경우 널스트링("")
	
	// 단, document.bgColor 또는 fgColor 대신 CSS 에서 값을 제어하는 방식으로 변경됨
	// => 자바스크립트에서 다룰 경우 document.body.style.color 와 backgroundColor 로 변경됨
	console.log(`document.body.style.color : ${document.body.style.color}`); // fore ground 약자. 문서 전경색(주로 텍스트)
	console.log(`document.body.style.backgroundColor : ${document.body.style.backgroundColor}`); // back ground 약자. 문서 배경색
}

function func4() {
	// HTML 문서의 색상 정보 변경(fgColor, bgColor 속성값 변경)
	// => 변경할 속성값으로 "색상명" 또는 "색상코드값"("#RRGGBB") 형태로 지정
	// 1) 색상명을 영문자로 지정하는 방식(대소문자 무관)
//	document.fgColor = "BLUE"; // 전경색(글자색)을 파란색으로 변경
//	document.bgColor = "lightpink"; // 배경색을 연한 분홍색으로 변경
	
	// 단, document.bgColor 또는 fgColor 대신 CSS 에서 값을 제어하는 방식으로 변경됨
	// => 자바스크립트에서 다룰 경우 document.body.style.color 와 backgroundColor 로 변경됨
//	document.body.style.color = "GREEN"; // 전경색(글자색)을 초록색으로 변경
//	document.body.style.backgroundColor = "yellow"; // 배경색을 연한 분홍색으로 변경
	// => 주의! document.bgColor 또는 fgColor 속성값으로 색상 확인 불가(별개의 속성)
	// -------------------------------------
	// 2) 색상 코드값을 6자리의 16진수로 지정하는 방식(= 디테일한 색상 지정 가능)
	// => "#RRGGBB" 형식으로 색상 지정(R : RED, G : GREEN, B : BLUE 세 가지 색상을 조합)
	//    각 색상에 해당하는 값을 16진수 2자리(00 ~ FF) 값의 범위 내에서 지정
	// => 이 때, 색의 3원색이 아닌 빛의 3원색 원리로 색상 조합
	//    즉, 모든 값이 최대치(FFFFFF)이면 흰색, 최소치(000000)이면 검정색이 됨
//	document.body.style.color = "#FF0000"; // 빨간색(RED)
//	document.body.style.backgroundColor = "#00FF00"; // 초록색(GREEN)
//	document.body.style.color = "#FFFF00"; // 노란색(YELLOW) = RED + GREEN
//	document.body.style.backgroundColor = "#FFFFFF"; // 흰색(WHITE)

	// 색상값을 널스트링 지정 시 브라우저 기본 색상으로 지정됨
	document.body.style.color = ""; // 브라우저 기본 전경색 : 검정색
	document.body.style.backgroundColor = ""; // 브라우저 기본 배경색 : 흰색
}

function func5() {
	// document 객체는 HTML 문서 자체의 정보를 가지고 있으며, 문서의 시작을 가리키는 역할을 수행
	// => DOM(Document Object Model, 문서 객체 모델)의 진입점 역할을 수행하므로
	//    document 객체를 통해 문서의 모든 구성 요소(Element)에 단계(계층)별로 접근 가능
	console.log(document); // 모든 요소에 대한 HTML 태그 형태로 표시됨
	console.log(typeof(document)); // object
	console.log(`document 객체 : ${document}`);
	// => [object HTMLDocument] : HTML 문서 자체를 관리하는 document 객체라는 의미
	
	console.log(document.documentElement);
	console.log(`document.documentElement 객체 : ${document.documentElement}`); 
	// [object HTMLHtmlElement] : HTML 문서의 전체 태그(= 루트 노트 = <html> 태그) 정보 관리하는 객체
	
	console.log(document.head);
	console.log(`document.head 객체 : ${document.head}`); 
	// [[object HTMLHeadElement] : HTML 문서의 헤더 정보(<head> 태그) 관리하는 객체
	
	console.log(document.body);
	console.log(`document.body 객체 : ${document.body}`); 
	// [object HTMLBodyElement] : HTML 문서의 바디 정보(<body> 태그) 관리하는 객체
	
	// 위의 각 요소 객체들을 통해 문서 내의 요소 제어가 가능하다!!!
	// => 다양한 속성 및 메서드가 제공됨
	
}





















