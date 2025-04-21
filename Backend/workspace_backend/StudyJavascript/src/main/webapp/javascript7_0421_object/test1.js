/*
[ 사용자 정의 객체 ]
- 사용자가 필요에 따라 직접 정의한 객체

[ 객체 정의 기본 문법 ]
1) 객체 리터럴(Object Literal) 방식
   객체변수선언 = {
		프로퍼티명1: 값1,
		프로퍼티명2: 값2,
		...생략...
		프로퍼티명n: 값n,
		메서드명: function([파라미터]) {
			메서드 호출 시 실행할 코드...
		}
   }
   
   => 객체변수명.프로퍼티명 형태로 값에 접근하고
      객체변수명.메서드명() 형태로 메서드 호출
*/

//var name = "이순신";

// 객체 리터럴 방식으로 person 객체 정의
const person = {
	// 1) 객체의 프로퍼티(속성) 선언
	name: "홍길동",
	age: 20,
	// 2) 객체의 메서드 정의
	eat: function() {
		console.log("밥 먹자!");
	},
	say: function() {
		console.log(`제 이름은 ${name} 입니다.`); // 전역변수 name 을 출력하는 코드(없으면 접근 불가)
		// 주의! 객체 내의 메서드에서 자신의 객체에 선언된 프로퍼티(속성)에 접근하려면
		// 반드시 자신의 객체를 가리키는 this.프로퍼티명 형태로 접근해야한다!
		console.log(`제 이름은 ${this.name} 입니다.`);
	}
}
// ---------------------------------------
/*
2) 생성자 함수(Constructor function) 방식
- 객체 생성 시점에 생성자 함수에 전달인자를 전달하여 객체 내의 값을 초기화하는 방식

[ 객체 정의 기본 문법 ]
   function 객체명(파라미터...) {
		this.프로퍼티명1 = 파라미터1,
		this.프로퍼티명2 = 파라미터2,
		...생략...
		this.프로퍼티명n = 파라미터n,
		메서드명: function([파라미터]) {
			메서드 호출 시 실행할 코드...
		}
   }
   
   => 접근 방법은 동일하나 객체 생성 시 함수 호출과 마찬가지로
      객체명() 부분의 소괄호 사이에 객체에 전달할 값을 지정하여 객체를 생성해야함
   => new 객체명(전달인자...)
   => 특이사항 : 객체를 함수 형태로 선언할 때 객체의 이름을 함수명 부분에 지정하는데
                 이 때는 이름의 첫글자를 대문자로 지정(Camel-case 가 아닌 Pascal-case 형태로 표기)
				 (객체 리터럴 방법으로 객체 선언 시에는 변수명을 지정하기 때문에 소문자로 표기했음)
*/
function Person2(name, age) {
	// 첫번째 파라미터로 전달받은 name 값을 name 프로퍼티에 저장(초기화)
	// => 파라미터로 선언한 name 과 Person2 객체 내의 프로퍼티명 name 이 같을 경우
	//    객체 내의 프로퍼티명을 지정할 때 this.프로퍼티명 형태로 접근하여 두 개를 구별해야함
	this.name = name;
//	age = age; // 잘못된 코드
	this.age = age; // 반드시 좌변의 이름 앞에 this. 을 붙여서 프로퍼티로 선언되도록 해야한다!
}

// ========================================================
function test1() {
	console.log("test1() 함수 호출됨!");
	// 객체 리터럴 방식으로 정의된 객체 접근 시 
	// 객체변수명.프로퍼티명 또는 객체변수명.메서드명() 으로 접근
	// 1) 객체 프로퍼티 접근 : 객체변수명.프로퍼티명
	console.log(`person 객체의 name 프로퍼티값 : ${person.name}`);
	console.log(`person 객체의 age 프로퍼티값 : ${person.age}`);
	console.log("person 객체의 age 프로퍼티값 : " + person.age); // 백틱 없이 사용(문자열 결합)
	
	// 2) 객체 메서드 호출 : 객체변수명.메서드명([전달인자...])
	// 2-1) person 객체의 eat() 메서드 호출
	person.eat();
	// 2-2) person 객체의 say() 메서드 호출
	person.say();
	// ----------------------------------------------
	// 객체 내의 프로퍼티값은 변경이 가능하다! (= 변수처럼 사용)
	person.name = "이순신"; // person 객체의 name 프로퍼티값이 "이순신" 으로 변경됨
	console.log(`person 객체의 name 프로퍼티값 : ${person.name}`);
	
	// 객체 내의 프로퍼티 추가도 가능함
	person.height = 180.5; // person 객체의 height 프로퍼티에 180.5 저장(새 프로퍼티 추가됨)
	console.log(`person 객체의 height 프로퍼티값 : ${person.height}`);
	// ===================================================
	// 생성자 함수(Constructor function) 방식으로 정의된 객체에 접근
	// 1) 객체 생성 코드(new 객체명()) 작성
	// => function Person2(name, age) 형태로 정의되어 있으므로, 
	//    객체 생성 코드 전달인자 부분에 name 값과 age 값을 차례대로 전달
	let person2 = new Person2("강감찬", 30);
	console.log(`Person2 객체의 name 프로퍼티값 : ${person2.name}`);
	console.log(`Person2 객체의 age 프로퍼티값 : ${person2.age}`);
}

function test1_2() {
	console.log("test1_2() 함수 호출됨!");
	// 함수 바깥(전역변수 레벨)에 선언(정의)된 객체일 경우
	// test1() 함수와 test1_2() 함수에서 모두 접근이 가능하다!
	person.say();
	// 단, const person = {} 함수 정의 코드가 test1() 함수 내부(지역변수 레벨)로 이동할 경우
	// test1() 함수에서만 person 객체 접근이 가능하고 다른 함수에서는 접근이 불가능하다!
	
	// test1() 함수 내에서 person 객체에 추가한 height 프로퍼티는
	// test1_2() 함수에서도 동일하게 적용됨(= 하나의 객체를 공유하기 때문)
	console.log(`person 객체의 height 프로퍼티값 : ${person.height}`);
}






















