/*
[ 자바스크립트 변수 ]
- 데이터를 저장하는 공간
- 변수 선언 기본 문법 : 변수선언키워드 변수명 = 값; (선언문과 초기화 문장 분리도 가능)
- 다만, 자바와 달리 데이터타입을 별도로 지정하지 않고 var 또는 let 또는 const 로 선언
  (세 가지 선언 방식은 각각 다른 특징이 부여됨)
- 변수명은 자바 식별자 작성 규칙과 거의 동일한 규칙 적용
- 사용되는 데이터 타입은 문자(= 문자열, string), 숫자(number), 논리(boolean), 
  특수값 undefined, null 등 사용됨
  => 변수 선언 및 값 할당 시 자동으로 해당 변수의 데이터타입이 결정됨
- 변수 또는 데이터의 데이터타입 확인 방법 : typeof 키워드 사용
  => 기본문법1) typeof 변수명 또는 typeof 데이터
  => 기본문법2) typeof(변수명) 또는 typeof(데이터)
*/

// 변수 선언 기초
var num; // 오류 없음
let num2; // 오류 없음

//const num3; // 오류 발생(코드 상에서 컴파일 오류처럼 빨간줄이 표시되고, 실행 시 콘솔에도 오류 표시됨)
// => Missing initializer in const declaration (콘솔 메세지)
// => 'const' declarations must be initialized. (이클립스 메세지)
// => 이유 : 상수로 취급되므로 값을 할당(저장)하지 않으면 오류 발생! (나중에 자세히 배움)
// -----------------------------------------------------------
// 변수 선언 및 다양한 타입의 데이터 저장
var str; // 변수 str 선언(아직 값이 초기화(= 할당 = 저장)되지 않은 상태)
console.log("str = " + str); // str = undefined 
// => 값이 초기화되지 않아 데이터가 정해지지 않은 상태이므로 undefined 값 저장되어 있음(접근은 가능 = 오류 없음)
// 변수 str 의 데이터타입 확인을 위해 typeof 연산자 활용
console.log("str 의 데이터타입 = " + typeof(str)); // str 의 데이터타입 = undefined
// => 데이터가 정해지지 않았으므로 데이터타입도 정해지지 않은 상태(= undefined)
// => 결론! 초기화 되지 않은 변수의 값과 데이터타입은 모두 undefined(오류 아님!!!!)

// 변수 str2 선언
var str2;
// str2 변수에 "자바스크립트" 문자열 저장
str2 = "자바스크립트"; // 이 때, 변수 str2 의 데이터타입이 결정됨(문자(문자열) 이므로 string 타입)
console.log("str2 = " + str2); // str2 = 자바스크립트
console.log("str2 의 데이터타입 = " + typeof(str2)); // str2 의 데이터타입 = string

// 변수 str3 선언과 함께 '자바스크립트' 문자열 저장(한 문장)
var str3 = '자바스크립트'; // 자바스크립트에서는 "" 와 '' 의 차이가 없다! 모두 문자(문자열)로 취급
console.log("str3 = " + str3 + "\nstr3 의 데이터타입 = " + typeof(str3));
// => 콘솔 창에서 문자열 줄바꿈은 이스케이프 문자 \n 사용하여 수행

// alert() 함수로 웹브라우저 알림창을 통해 출력하기
//alert("str3 = " + str3 + "\nstr3 의 데이터타입 = " + typeof(str3));
// => alert() 함수에서 문자열 줄바꿈은 이스케이프 문자 \n 사용하여 수행

// document.write() 함수로 웹브라우저 화면(본문) 영역에 출력하기
document.write("str3 = " + str3 + "<br>str3 의 데이터타입 = " + typeof(str3));
// => document.write() 함수는 태그 사용이 가능하므로 줄바꿈은 <br> 태그 사용

document.write("<br>I'm studing javascript");
//document.write('<br>I'm studing javascript'); // 오류 발생!
// => '' 사이의 문자열에 ' 기호를 텍스트로 취급하려면 이스케이프 문자 \' 형태로 지정해야한다!
document.write('<br>I\'m studing javascript');

// "" 사이의 문자열에 " 기호를 텍스트로 취급하려면 이스케이프 문자 \" 형태로 지정해야한다!
// 또한, 문자열 사이에 \ 기호를 텍스트로 취급하려면 이스케이프 문자 \\ 형태로 지정해야한다!
document.write("<br>제 이름은 \"이연태\" 입니다\\");
// =================================================================================
// 변수 num 선언 및 정수 100 으로 초기화 후 변수 num 값 출력
var num = 100;
document.write("<br>num = " + num + ", num 의 데이터타입 = " + typeof(num));

// 변수 num 값을 3.14 로 변경
num = 3.14;
document.write("<br>num = " + num + ", num 의 데이터타입 = " + typeof(num));
// =================================================================================
// 변수 b 선언 및 논리값 true 저장 후 출력
var b = true;
document.write("<br>b = " + b + ", b 의 데이터타입 = " + typeof(b));
// =================================================================================
// 주의! 특수한 데이터타입
var v1; // 변수 선언 시 아무 데이터도 저장하지 않았을 경우 미확정(undefined)
var v2 = null; // 특수한 값인 null 값도 변수에 저장 가능
document.write("<br>v1 = " + v1 + ", v1 의 데이터타입 = " + typeof(v1));
document.write("<br>v2 = " + v2 + ", v2 의 데이터타입 = " + typeof(v2)); // v2 = null, v2 의 데이터타입 = object
// => object 타입은 나중에 배움






















