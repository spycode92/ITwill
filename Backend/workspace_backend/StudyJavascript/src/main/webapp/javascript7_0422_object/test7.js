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
}



















