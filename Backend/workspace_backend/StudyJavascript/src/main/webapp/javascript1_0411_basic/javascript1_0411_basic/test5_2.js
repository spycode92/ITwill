// 변수 선언 방법의 차이점(var vs let)
// 1. var 키워드로 변수 선언 시 동일한 이름의 변수를 선언하더라도 중복 선언이 가능하며
//    선언된 변수 값을 다른 데이터로 변경 시에도 문제가 발생하지 않는다!
var varNum = 10;
console.log(varNum + "(var) : " + typeof(varNum));

// 기존에 선언된 varNum 변수와 동일한 이름의 변수를 다시 선언하더라도 오류가 발생하지 않고
// 해당 변수에 다른 데이터를 저장해서 사용도 가능함(기존의 varNum 변수값을 새로 덮어씀)
var varNum = "홍길동"; // 이 시점에 10 -> "홍길동" 으로 바뀌면서 변수 타입도 number -> string 으로 바뀜
console.log(varNum + "(var) : " + typeof(varNum));
// -------------------------------------------------------
// 2. let 키워드로 변수 선언 시 동일한 이름의 변수를 중복 선언할 수 없다!(불가능 = 자바와 동일)
//    선언된 변수 값을 다른 데이터로 변경 시에도 문제가 발생하지 않는다!
let letNum = 10;
console.log(letNum + "(let) : " + typeof(letNum));

// 기존에 선언된 letNum 변수와 동일한 이름으로 let 키워드를 사용하여 다시 중복선언 할 경우
// 변수명 중복으로 인한 오류 발생함!
// => 이클립스 오류 메세지 : Cannot redeclare block-scoped variable 'letNum')
// => 개발자 도구 - 콘솔 메세지 : Identifier 'letNum' has already been declared
//let letNum = 10; // 오류 발생
//console.log(letNum + "(let) : " + typeof(letNum));

// var 와 동일하게 기존에 저장된 값을 다른 값으로 변경 가능함
letNum = "홍길동"; // 이 시점에 10 -> "홍길동" 으로 바뀌면서 변수 타입도 number -> string 으로 바뀜
console.log(letNum + "(let) : " + typeof(letNum));

// 결론!!!! 일반적인 상황에서 변수 선언 시 var 보다 let 을 사용하자!!!!
// --------------------------------------------------------------------------
// 3. const 가 var 또는 let 과의 다른 점
// => const 키워드를 사용하여 선언한 변수는 [상수(constant)] 로 취급되어
//    처음 저장된 값을 다른 값으로 변경이 불가능해진다!
// => const 로 선언하는 변수는 반드시 초기화도 함께 수행되어야 한다!
//const constNum; // 오류 발생! (콘솔 메세지 : Missing initializer in const declaration)
const constNum = 10;
console.log(constNum + "(const) : " + typeof(constNum));

// const 는 let 과 마찬가지로 중복 선언 불가!
//const constNum = 10; // 오류 발생(콘솔 메세지 : Identifier 'constNum' has already been declared)

// constNum 변수값 변경
//constNum = "홍길동"; // 이클립스 코드 상에서는 오류가 발견되지 않음
// => 실행 시 콘솔 오류 메세지 : Assignment to constant variable.
// => 결론! const 로 선언된 변수의 값은 절대 변경 불가!

// ========================================================================
let name = "Kim";
let classRoom = 5;
console.log(name + "님, " + classRoom + " 강의장으로 입장하세요.");
// 위의 출력 방법(연결 연산자 활용) 대신 백틱(``)을 사용하여 직관적인 문자열과 데이터 표현 가능함

console.log(`name님, classRoom 강의장으로 입장하세요.`); // => name님, classRoom 강의장으로 입장하세요.
// => 백틱도 일반 문자열처럼 그대로 출력 가능함


// 백틱(``) 사이에 출력할 데이터의 형태를 문자열 그대로 작성하고
// 변수가 위치할 곳은 ${} 사이에 변수명을 지정하면 실행 시점에 변수가 해당 위치에 바인딩(Binding)됨
console.log(`${name}님, ${classRoom} 강의장으로 입장하세요.`); // => Kim님, 5 강의장으로 입장하세요.
// => name 변수는 ${name} 부분, classRoom 변수는 ${classRoom} 부분에 사용되어 실제 변수값이 출력됨



















