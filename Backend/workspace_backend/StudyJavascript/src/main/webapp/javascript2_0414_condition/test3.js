/*
3. if ~ else if 문(= 다중 else if 문)
- if문에 주어진 조건을 판별하여 true 일 경우 if 문의 블럭 내의 문장들을 수행하고,
  false 일 경우 다음 if 문(else if)의 조건을 판별 후 true 이면 else if 내의 문장들을 수행,
  아니면 다음 if 문 조건을 계속 판별함
  => 만약, 모든 조건식의 판별 결과가 false 이면 else 문이 있을 경우 해당 블럭 문장 수행
     (단, else 문은 생략 가능함)
- 주의! if문은 위에서부터 순서대로 조건을 판별하므로
  else 문은 항상 가장 마지막 조건으로 기술해야한다!

< 기본 문법 >
if(조건식1) {
	// 조건식1 판별 결과가 true 일 때 실행할 문장들...		
} else if(조건식2) {
	// 조건식1 판별 결과가 false 이고, 조건식2 판별 결과가 true 일 때 실행할 문장들...
} else if(조건식n) {
	// 조건식1, 2 판별 결과가 false 이고, 조건식n 판별 결과가 true 일 때 실행할 문장들...
} else {
	// 위의 모든 조건식 판별 결과가 false 일 때 실행할 문장들... (else 문은 생략 가능)
}
*/

let num = 0;

// 변수 num 값에 대해 "0보다 크다!", "0보다 작다!", "0 이다!" 세 가지 경우의 수 판별
if(num > 0) {
	console.log(`${num} : 0보다 크다!`);
} else if(num < 0) {
	console.log(`${num} : 0보다 작다!`);
} else { // 0보다 크지도 않고, 작지도 않음(즉, 0) => 또는 else if(num == 0) 사용 가능
	console.log(`${num} : 0이다!`);
}

// else 문 대신 마지막 조건(0 과 같음)도 else if 문으로 판별 가능
if(num > 0) {
	console.log(`${num} : 0보다 크다!`);
} else if(num < 0) {
	console.log(`${num} : 0보다 작다!`);
} else if(num == 0) {
	console.log(`${num} : 0이다!`);
}
// ==============================================================
// 변수 num2 에 값을 저장한 후 "홀수" or "짝수" or "0" 판별하여 출력
let num2 = 0;

// 변수 num 값에 대해 "홀수" or "짝수" or "0" 세 가지 경우의 수 판별
if(num2 % 2 == 1) { // 홀수
	console.log(`${num2} : 홀수!`);
} else if(num2 % 2 == 0) { // 짝수
	console.log(`${num2} : 짝수!`);
} else { // 홀수도 아니고 짝수도 아닌 수 = 0
	console.log(`${num2} : 0이다!`);
}
// => 주의! 0 입력했을 경우 0 대신 짝수 조건식에 대한 결과가 true 가 된다! (0 을 2로 나눈 나머지 == 0)
//    따라서, 이런 경우 짝수 판별 조건식보다 0 판별 조건식이 먼저 수행되어야 한다! => 순서 중요!!
if(num2 % 2 == 1) { // 홀수(짝수 또는 0 과 아무런 순서상의 관계없음 = else 문으로 처리도 가능)
	console.log(`${num2} : 홀수!`);
} else if(num2 == 0) { // 0  => 최소한 짝수 판별 식보다 윗쪽에 위치해야한다!
	console.log(`${num2} : 0이다!`);
} else if(num2 % 2 == 0) { // 짝수
	console.log(`${num2} : 짝수!`);
}
// ==================================================================================
// 정수 1개(num3) 를 입력받아 
// 1) 10보다 큰 수, 2) 10보다 작고 5보다 크거나 같은 수, 3) 5보다 작고 0보다 크거나 같은 수 판별
// => ex) 입력받은 정수 15 : 10 보다 크다!
//        입력받은 정수 7 : 10 보다 작고 5 보다 크다!
let num3 = -3;

//if(num3 > 10) {
//	console.log(`입력받은 정수 ${num3} : 10 보다 크다!`);
//} else if(num3 <= 10 && num3 >= 5) {
//	console.log(`입력받은 정수 ${num3} : 10 보다 작고 5보다 크거나 같다!`);
//} else { 
//	// 주의! 첫번째와 두번째 조건이 아닌 나머지 조건을 else 문으로 처리할 경우
//	// 0 ~ 4 사이 숫자뿐만 아니라 0보다 작은 숫자도 else 문에서 처리하므로 올바르지 못한 결과가 됨
//	console.log(`입력받은 정수 ${num3} : 5 보다 작고 0 보다 크거나 같다!`);
//}

// 5 보다 작고 0 보다 크거나 같은 조건식도 else 가 아닌 else if 문으로 처리해야한다!
if(num3 > 10) {
	console.log(`입력받은 정수 ${num3} : 10 보다 크다!`);
} else if(num3 <= 10 && num3 >= 5) {
	console.log(`입력받은 정수 ${num3} : 10 보다 작고 5보다 크거나 같다!`);
} else if(num3 < 5 && num3 >= 0) { 
	console.log(`입력받은 정수 ${num3} : 5 보다 작고 0 보다 크거나 같다!`);
} else {
	console.log(`입력받은 정수 ${num3} : 입력 오류!`);
}
// ==================================================================
// prompt() 활용하여 학생 점수(score)를 입력받아 학점 판별하기 (ex. XX점 : A)
// A학점 : 90 ~ 100점 
// B학점 : 80 ~ 89점
// C학점 : 70 ~ 79점
// D학점 : 60 ~ 69점
// F학점 : 0 ~ 59점
// 단, 입력받은 점수가 0 ~ 100 사이가 아닐 경우 "점수 입력 오류!" 출력
//let score = prompt("점수를 입력하세요");
let score = 100;
console.log(`입력받은 점수 : ${score}`);

//if(score >= 90 && score <= 100) {
//	console.log(`학점 : A`);
//} else if(score >= 80 && score <= 89) {
//	console.log(`학점 : B`);
//} else if(score >= 70 && score <= 79) {
//	console.log(`학점 : C`);
//} else if(score >= 60 && score <= 69) {
//	console.log(`학점 : D`);
//} else if(score >= 0 && score <= 59) {
//	console.log(`학점 : F`);
//} else {
//	console.log(`점수 입력 오류!`);
//}

if(score >= 90 && score <= 100) { // 90 ~ 100 사이
	console.log(`학점 : A`);
} else if(score >= 80) { // 80 ~ 89 사이(이 때, 90 ~ 100 사이가 아니므로 90 미만이 포함됨. 따라서, score <= 89 생략 가능)
	console.log(`학점 : B`);
} else if(score >= 70) {
	console.log(`학점 : C`);
} else if(score >= 60) {
	console.log(`학점 : D`);
} else if(score >= 0) {
	console.log(`학점 : F`);
} else {
	console.log(`점수 입력 오류!`);
}
// => 주의! 첫번째 조건에서 90 ~ 100 사이를 판별하고
//    두번째 조건에서 80 이상을 판별하는데
//    이 때, 105 점을 입력하면 "점수 입력 오류!" 가 아닌 "B학점" 으로 판별된다!
//    score >= 80 조건 판별 시 90 ~ 100 사이가 아닌 수 중에서 80 이상인 값은 모두 해당되기 떄문
// => 따라서, 학점 판별 전 먼저 0 ~ 100 사이의 점수를 판별하거나
//    반대로 0 보다 작거나 100 보다 큰 점수를 판별하면 된다!
if(score < 0 || score > 100) {
	console.log(`점수 입력 오류!`);	
} else if(score >= 90 && score <= 100) { // 90 ~ 100 사이
	console.log("정상적인 점수 입력됨!");
	console.log(`학점 : A`);
} else if(score >= 80) { // 80 ~ 89 사이(이 때, 90 ~ 100 사이가 아니므로 90 미만이 포함됨. 따라서, score <= 89 생략 가능)
	console.log("정상적인 점수 입력됨!");
	console.log(`학점 : B`);
} else if(score >= 70) {
	console.log("정상적인 점수 입력됨!");
	console.log(`학점 : C`);
} else if(score >= 60) {
	console.log("정상적인 점수 입력됨!");
	console.log(`학점 : D`);
} else if(score >= 0) { // score <= 59 동일함
	console.log("정상적인 점수 입력됨!");
	console.log(`학점 : F`);
}


if(score < 0 || score > 100) { // 0 보다 작거나 100 보다 클 경우
	console.log(`점수 입력 오류!`);
} else { // 정상적인 점수일 경우(0 ~ 100 사이)
	console.log("정상적인 점수 입력됨!");
	
	if(score >= 90) { // 90 ~ 100 사이(else 문 판별 시 무조건 100 이하가 포함되므로 100 이하 판별 생략)
		console.log(`학점 : A`);
	} else if(score >= 80) { // 80 ~ 89 사이(이 때, 90 ~ 100 사이가 아니므로 90 미만이 포함됨. 따라서, score <= 89 생략 가능)
		console.log(`학점 : B`);
	} else if(score >= 70) {
		console.log(`학점 : C`);
	} else if(score >= 60) {
		console.log(`학점 : D`);
	} else { // else 문 판별 시 무조건 0 이상이 포함되므로 0 이상 59 이하는 판별 불필요 (생략)
		console.log(`학점 : F`);
	}
}


// ==============================================
// Dangling Else 문제(Issue)
// => else 문은 가장 가까운 if 문과 짝을 이룬다!
let n1 = 128;
let n2 = 256;

//if(n1 > n2)
//	if(n1 > 100)
//		console.log(`n1 = ${n1}`);
//else // 이 else 문은 if(n1 > 100) 문장과 짝을 이룬다!
//	if(n2 > 100)
//		console.log(`n2 = ${n2}`);
//console.log(`Done!`);
// => 따라서, if(n1 > n2) 값이 false 이므로 else 문이 실행될 것 같지만
//    else 문은 if(n1 > n2) 의 짝이 아니므로 console.log(`Done!`) 만 실행된다!
// => 결론! 중괄호 생략하지 말자!!!!

if(n1 > n2) {
	if(n1 > 100) {
		console.log(`n1 = ${n1}`);
	}
} else { // 이 else 문은 if(n1 > 100) 문장과 짝을 이룬다!
	if(n2 > 100) {
		console.log(`n2 = ${n2}`);
	}
}
console.log(`Done!`);

























