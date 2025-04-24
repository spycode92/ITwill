/*
[ 선택자(Selector) ]
- HTML 문서에서 특정 대상(요소)을 구분(선택)하는 용도로 사용되는 속성(이름)
- id, class, 태그 등을 사용
1) id 선택자(#) : 태그 요소를 유일하게 구분할 수 있도록 지정하는 중복되지 않는 이름
                  => 해당 태그에 id 속성을 통해 이름을 지정(중복되지 않은 이름 필수!)
2) class 선택자(.) : 태그 요소를 복수개 선택할 수 있도록 중복으로 지정하는 이름
                     => 해당 태그에 class 속성을 통해 이름을 지정(중복 가능)
3) 태그 선택자(태그명) : 해당 태그를 직접 선택할 수 있도록 지정하는 이름(태그명 그대로 사용)

[ document 객체를 사용하여 특정 선택자를 갖는 요소(태그) 선택 방법 ]
< 1. document.getElementXXX() 또는 getElementsXXX() 메서드 활용 >
1. id 선택자 : document.getElementById("id선택자명");
2. class 선택자 : document.getElementsByClassName("class선택자명");
3. 태그 선택자 : document.getElementsByTagName("태그명");
=> 메서드 호출 시 리턴되는 객체를 통해 해당 요소(태그)에 접근하여 다양한 작업(제어) 수행 가능
=> 이 때, id 선택자를 지정하면 대상 태그에 대한 단일 객체가 리턴되며(= 유일하므로)
   class 선택자 또는 태그 선택자 지정 시 대상 태그들에 대한 복수개의 객체가 리턴됨(= 중복되므로)
   따라서, 복수개의 객체가 리턴될 경우 HTMLCollection 타입 객체로 관리되며(배열처럼 관리됨)
   반복문을 통해 복수개의 요소 중 각각의 요소에 차례대로 접근 가능함
*/
function func1() {
	// <body> 태그 내의 HTML 태그 요소들 중 
	// id 선택자가 "name" 인 태그에 접근하여 해당 태그에 대한 객체 가져오기
	// => 대상 태그 : <input type="text" id="name" placeholder="id=name">
	// => document.getElementById() 메서드 호출하여 지정된 id 에 선택자에 대한 태그 요소를 객체로 리턴받기
	let nameElement = document.getElementById("name");
	console.log(nameElement); // <input type="text" id="name" placeholder="id=name">
	console.log(`nameElement 객체 : ${nameElement}`); // [object HTMLInputElement]
	// => id 선택자가 "name" 인 HTML 요소(<input> 태그로 생성된 텍스트박스)가 객체로 리턴됨
	
	// nameElement 변수를 통해 해당 요소에 대한 객체에 접근하여 해당 요소(태그) 제어 가능
	// => 객체명.속성명 형태로 해당 요소의 속성값에 접근하거나 객체명.메서드명()으로 메서드 호출
	console.log(`nameElement 의 id 속성값 : ${nameElement.id}`); // name
	console.log(`nameElement 의 type 속성값 : ${nameElement.type}`); // text
	console.log(`nameElement 의 placeholder 속성값 : ${nameElement.placeholder}`); // id=name
	// 텍스트박스(텍스트필드)의 입력값은 value 속성으로 설정하므로 값 확인도 value 속성으로 접근
	// => 태그에 value 속성 설정 여부와 관계없이 자바스크립트에서 관리되는 속성
	console.log(`nameElement 의 value 속성값 : ${nameElement.value}`); // 입력된 값이 출력
	// => 이 때, 입력값이 비어있을 경우 null 값이 아닌 널스트링("") 출력됨
	//    (객체 자체는 존재하므로 null 이 아니고, 해당 객체 내의 value 속성값만 비어있음)
	
	// nameElement 변수를 별도로 선언하지 않고 즉시 요소에 접근도 가능함
	console.log(`nameElement 의 value 속성값2 : ${document.getElementById("name").value}`);
	
	// nameElement 변수를 통해 첫번째 텍스트박스에 입력된 값 변경(value 속성값 변경)
	nameElement.value = "이연태";
	// => 해당 텍스트박스에 입력되어 있던 기존 값 대신, value 속성에 지정된 새로운 값이 덮어씀(변경됨)
	// -------------------------------------------------------------------------------
	// "name2" 라는 id 속성값(선택자)을 통해 두번째 텍스트박스에 접근한 뒤 입력값 출력하기
	// 만약, 입력된 값을 가져와서 변수에 저장할 경우
	let name2 = document.getElementById("name2").value;
	console.log(`name2 의 입력값 : ${name2}`);
	// -------------------------------------------------------------------------------
	// id 선택자가 "header1" 인 요소의 배경색(style.backgroundColor 속성)을 "SKYBLUE" 로 변경
	document.getElementById("header1").style.backgroundColor = "SKYBLUE";
	
	// id 선택자가 "header2" 인 요소의 배경색(style.backgroundColor 속성) 또는
	// 글자색(style.color 속성)을 변경
	let header2 = document.getElementById("header2");
	header2.style.backgroundColor = "#AAFF00";
	header2.style.color = "BLUE";
	// ===========================================================================
	// class 선택자를 통해 단일 또는 복수개의 요소 선택 가능
	// => document.getElementsByClassName() 메서드 사용(전달인자 : 클래스 선택자 이름)
	// 클래스 선택자가 "header_class5" 인 요소 가져오기
	let header5 = document.getElementsByClassName("header_class5");
	console.log(header5); // HTMLCollection(2) 객체 표시됨(동일한 클래스를 갖는 2개의 요소)
	// => 리턴받은 객체는 복수개의 요소가 관리되는 HTMLCollection 타입이며
	//    배열 형태와 동일하므로 일반적인 객체 접근 방법으로는 접근이 불가능하다!
//	header5.style.backgroundColor = "PINK"; // 오류 발생
	// => Cannot set properties of undefined (setting 'backgroundColor')
	
	// HTMLCollection 타입은 배열 형태와 동일하게 취급되므로 배열 접근 방법 사용
	// => 배열의 인덱스(0 ~ 배열크기-1) 를 직접 지정하거나 for문을 통해 반복 접근도 가능
	// 1) 각각의 요소에 대한 인덱스를 직접 지정하여 접근(모든 배경색을 PINK 로 변경)
//	header5[0].style.backgroundColor = "PINK";
//	header5[1].style.backgroundColor = "PINK";
	
	// 2) 일반 for문 활용하여 차례대로 접근(모든 배경색을 ORANGE 로 변경)
	// => 배열의 시작 인덱스는 반드시 0 이고, 반복문을 통해 접근 가능한 최대 인덱스는
	//    배열 크기(length) - 1 까지
//	for(let i = 0; i < header5.length; i++) {
//		let element = header5[i]; // 반복문 반복에 따라 각 인덱스의 요소를 변수에 저장
//		
//		// 현재 반복문 내에서 반복 과정을 일반적인 출력문으로 확인하는 대신
//		// debugger; 코드를 지정하여 디버거를 실행하면 해당 시점에서 코드 실행이 멈추고
//		// 멈춘 시점에 블록 변수, 로컬 변수, 전역 변수 등에 대한 값 등을 확인할 수 있다!
////		debugger;
//		element.style.backgroundColor = "ORANGE";
//	}
	
	// 3) 향상된 for문(= forEach 또는 for...of 문) 활용하여 차례대로 접근
	//    (모든 배경색을 GREEN 으로 변경, 글자색을 RED 로 변경)
	for(let element of header5) {
		element.style.backgroundColor = "GREEN";
		element.style.color = "RED";
	}
	// ================================================================================
	// 태그 선택자를 통해 클래스 선택자와 마찬가지로 복수개의 태그 요소에 접근 가능
	// => 클래스 선택자는 서로 다른 태그 복수개도 하나로 묶어서 관리가 가능하지만
	//    태그 선택자는 동일한 태그만 묶어서 관리함
	// => document.getElementsByTagName() 메서드 사용
	// => class 선택자와 동일한 접근 방식으로 접근하여 HTMLCollection 객체(배열)로 관리됨
	// 변수명 tagsH4 에 h4 태그 요소들을 모두 선택하여 객체로 리턴받아 저장
	let tagsH4 = document.getElementsByTagName("h4");
	
	// h4 태그 요소들의 배경색을 YELLOW 로 변경
	for(let h4Element of tagsH4) {
		h4Element.style.backgroundColor = "YELLOW";
		// => 기존 Header - 4 요소의 배경색이 "GREEN" 이었지만 "YELLOW" 색상으로 덮어씀
		
		// 해당 태그 사이(시작태그와 끝태그)의 텍스트 노드 접근 방법
		// => 텍스트 요소가 포함된 태그 객체를 통해 innerText 또는 innerHTML 속성값 활용
		// 1) innerText : 텍스트 노드의 텍스트 데이터만 처리
//		console.log(h4Element.innerText);
//		h4Element.innerText = "색상 변경된 h4 태그";
//		h4Element.innerText = "<i>색상 변경된 h4 태그</i>";
		// => 주의! innerText 속성은 태그 지정 시 단순 텍스트로 취급하여 태그가 적용되지 않음!
		
		// 2) innerHTML : 텍스트 데이터뿐만 아니라 태그까지 처리
		// 지정한 태그를 실제 요소에 적용시키려면 innerText 대신 innerHTML 사용
//		console.log(h4Element.innerHTML);
//		h4Element.innerHTML = "<i>색상 변경된 h4 태그</i>";
		
	}
	
	console.log("-------------------------");
	
	let header_class5_2 = document.getElementById("header_class5_2");
	
//	console.log(header_class5_2);
	console.log(header_class5_2.innerText); // 단순 텍스트만 처리
	console.log(header_class5_2.innerHTML); // 화면 표시 여부와 관계없이 모든 내용(태그 포함) 처리
	console.log(header_class5_2.textContent); // 화면 표시 여부와 관계없이 태그 요소 제외하고 처리
	
	
	
}



















