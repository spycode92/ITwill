/*
Date 객체
- 날짜 및 시각 정보를 관리하는 내장 객체
- 제공되는 다양한 메서드를 통해 날짜 및 시각 정보 확인 및 처리 가능
- new Date() 형식으로 Date 객체 생성 후 메서드 호출을 통해 날짜 및 시각 처리
  => 생성자 호출 형태(Date(xxxx))는 다양한 생성자를 제공함
*/

// 1. new Date() : 현재 시스템(클라이언트 = PC)의 현재 날짜 및 시각 정보를 기준으로 Date 객체 생성
let date1 = new Date();
document.write(`${date1}<br>`); // Mon Apr 28 2025 14:16:16 GMT+0900 (한국 표준시)
// => Date 객체의 기본 출력 형태는 국제 표준시 형태이며
//    toLocaleString() 메서드를 호출하여 출력할 경우 브라우저 국가 설정에 맞는 형태로 출력됨
document.write(`${date1.toLocaleString()}<br>`); // 2025. 4. 28. 오후 2:18:13

// 2. new Date("yyyy-MM-dd") : 날짜를 지정하여 Date 객체 생성(y : 연도, M : 월, d : 일)
// => 연도 4자리, 월 2자리, 일 2자리 형식으로 날짜를 전달해야한다는 의미(문법)
// => 시각 미 지정 시 국제표준시 기준 00시 00분 00초로 설정됨(대한민국 표준시는 GMT +9)
//let date2 = new Date("2000"); // 연도만 지정 시 1월 1일이 기본값으로 설정됨
//let date2 = new Date("2000-02"); // 연도와 월만 지정 시 1일이 기본값으로 설정됨
let date2 = new Date("2000-02-03"); // 2000년 2월 3일로 설정
document.write(`${date2}<br>`); // Thu Feb 03 2000 09:00:00 GMT+0900 (한국 표준시)
document.write(`${date2.toLocaleString()}<br>`); // 2000. 2. 3. 오전 9:00:00

// 3. new Date("yyyy-MM-ddThh:mm:ss") : 날짜 및 시각을 지정하여 Date 객체 생성
// => y : 연도, M : 월, d : 일, h : 시, m : 분, s : 초
// => 도 4자리, 월 2자리, 일 2자리, 시 2자리, 분 2자리, 초 2자리 형식으로 전달한다는 의미
//let date3 = new Date("2003-02-14T13:28:59");
//let date3 = new Date("2003-02-14T13:28"); // 초 생략 시 기본값 00초
// 주의! 분과 초를 생략하고 시만 지정 시 오류 발생(출력데이터 : Invalid Date)
let date3 = new Date("2003-02-14T13");
document.write(`${date3}<br>`); // Fri Feb 14 2003 13:28:59 GMT+0900 (한국 표준시)
// ==============================================================================================
// Date 객체에서 정보(연도, 월, 일, 시, 분, 초 등)를 추출하는 메서드
// => Date 객체의 getXXX() 메서드 활용(객체의 특정 값을 리턴하는 메서드들은 주로 get 으로 시작함)
let now = new Date();
document.write(`현재 연도 : ${now.getFullYear()}<br>`); // 2024
document.write(`현재 월 : ${now.getMonth()}<br>`); // 3(현재 4월)
// => 주의! getMonth() 리턴값은 실제 월보다 1만큼 작은 값이 리턴됨
//    (1월이 January 이며, 첫번째 월이라는 의미로 0 을 기준값으로 사용하여 차례대로 표기)
// => 따라서, 실제 월을 표기하려면 getMonth() 리턴값 + 1 처리 필수!
document.write(`현재 월 : ${now.getMonth() + 1}<br>`); // 4
document.write("현재 월 : " + (now.getMonth() + 1) + "<br>"); // 문자열 결합 순서 주의!
document.write(`현재 일 : ${now.getDate()}<br>`); // 28

// getDay() 메서드는 날짜가 아닌 요일을 정수로 관리(0 : 일요일, 6 : 토요일 => 달력 순서와 동일)
document.write(`현재 요일 : ${now.getDay()}<br>`); // 1(월요일)
// => 만약, 정수값이 아닌 실제 요일을 표기하려면 변환 작업이 필요
// 0 일 때 "일요일", 1일 때 "월요일", ..., 6 일 때 "토요일" 로 변환하여 출력하기
 
// 1) 다중 else if 문
now = new Date("2025-04-29");
//if(now.getDay() == 0) {
//	document.write('현재 요일 : 일요일<br>');
//} else if(now.getDay() == 1) {
//	document.write('현재 요일 : 월요일<br>');
//} else if(now.getDay() == 2) {
//	document.write('현재 요일 : 화요일<br>');
//} else if(now.getDay() == 3) {
//	document.write('현재 요일 : 수요일<br>');
//} else if(now.getDay() == 4) {
//	document.write('현재 요일 : 목요일<br>');
//} else if(now.getDay() == 5) {
//	document.write('현재 요일 : 금요일<br>');
//} else if(now.getDay() == 6) {
//	document.write('현재 요일 : 토요일<br>');
//}

let strDay = "";
if(now.getDay() == 0) {
	strDay = "일";
} else if(now.getDay() == 1) {
	strDay = "월";
} else if(now.getDay() == 2) {
	strDay = "화";
} else if(now.getDay() == 3) {
	strDay = "수";
} else if(now.getDay() == 4) {
	strDay = "목";
} else if(now.getDay() == 5) {
	strDay = "금";
} else if(now.getDay() == 6) {
	strDay = "토";
}

// 2) if 대신 switch-case 문 활용
switch(now.getDay()) {
	case 0 : strDay = "일"; break;
	case 1 : strDay = "월"; break;
	case 2 : strDay = "화"; break;
	case 3 : strDay = "수"; break;
	case 4 : strDay = "목"; break;
	case 5 : strDay = "금"; break;
	case 6 : strDay = "토"; // 마지막 case 문의 break 불필요
}

document.write(`현재 요일(strDay) : ${strDay}요일<br>`);
// -----------------------
// 3) 배열 활용
// => 요일을 미리 배열에 저장 후 getDay() 리턴값을 배열 인덱스로 활용
const arrDay = ["일", "월", "화", "수", "목", "금", "토"];
//               0     1     2     3     4     5     6
document.write(`현재 요일(arrDay) : ${arrDay[now.getDay()]}요일<br>`);

convertDayToString(now.getDay());
// ---------------------------
// 함수 활용
// => getDay() 리턴값을 함수에 전달하면 요일을 출력하도록 함수 정의
// => convertDayToString 함수 정의(함수 파라미터 : 요일값(getDay() 리턴값)을 1개 전달)
function convertDayToString(day) {
	const arrDay = ["일", "월", "화", "수", "목", "금", "토"];
	document.write(`현재 요일(function) : ${arrDay[day]}요일<br>`);
}
// ------------------------------------------------------------------------------------
// getTime() 메서드
// => 기준일자(1970년 1월 1일 0시 0분 0초 = 국제표준시 기준) 기준으로
//    대상 날짜와의 차이값을 밀리초(ms) 단위로 계산하여 리턴
// => 밀리초? 1/1000초이며, 1초 = 1000ms, 1분 = 1000 * 60ms
let targetDate = new Date("2025-04-03"); // 계산 대상일자
document.write(`targetDate : ${targetDate}<br>`);

let nowDate = new Date(); // 현재 시스템 날짜 지정
document.write(`nowDate : ${nowDate}<br>`);

// 대상날짜(targetDate)와 기준일자와의 차이, 현재 시스템 날짜와 기준일자의 차이 계산하여 리턴받기
let targetTime = targetDate.getTime();
document.write(`대상날짜 getTime() 결과 : ${targetTime} ms<br>`); // 1743638400000 ms
let nowTime = nowDate.getTime();
document.write(`현재날짜 getTime() 결과 : ${nowTime} ms<br>`); // 1745823997850 ms

// getTime() 메서드 활용하여 두 날짜간의 차이를 계산하면 D-Day 계산이 가능하다!
// 두 날짜 간의 차이 계산식 = 기준일시(nowTime) - 대상일시(targetTime) (반대로도 계산 가능)
// 1) 뺄셈 결과 양수 : 기준일시가 대상일시보다 큼 = 대상일시는 기준일시 기준 과거 = XX일 경과
// 2) 뺄셈 결과 음수 : 기준일시가 대상일시보다 작음 = 대상일시는 기준일시 기준 미래 = XX일 남음
// 3) 뺄셈 결과 0 : 기준일시가 대상일시와 동일 = 지금 = D-Day
//                      (단, 정확히 0 이 아니더라도 같은 날짜일 때를 위한 별도의 계산 필요)
//let differenceTime = nowTime - targetTime;
//document.write(`두 날짜의 차 : ${differenceTime} ms<br>`); // 2185597850 ms
//document.write(`${targetDate.toLocaleString()} 로부터 ${differenceTime} ms 지났습니다.<br>`);

// 두 날짜의 차가 밀리초 단위로 계산되는데 D-Day 계산을 위해서는 결과값을 일 단위로 변환 필요
// => 계산을 통해 더 큰 단위의 값으로 변환해야함(밀리초 -> 초 -> 분 -> 시 -> 일 순으로 변환)
// => 따라서, 결과값(밀리초)을 초로 변환하려면 두 단위의 차(1000)만큼 나누기 필요(1000ms / 1000 = 1s)
//    또한, 초로 변환한 결과를 다시 60으로 나누면 분, 다시 60으로 나누면 시
//    다시 24로 나누면 일 단위까지 변환됨
// => 결론 : 1000 * 60 * 60 * 24 = 86400000 밀리초 = 1일
//let differenceTime = (nowTime - targetTime) / 86400000; // 직접 밀리초 단위를 변환 대상으로 지정
// => 위의 방법을 통해 직접 계산하는 대신
//    기본 계산 단위를 모두 연산 과정에 표기하면 차후에 유지보수가 편리함
let differenceTime = (nowTime - targetTime) / 1000 / 60 / 60 / 24; 
// => 만약, 연 단위 계산을 위해서는 365일로 나누어야 하므로 / 365 추가하면 됨
document.write(`두 날짜의 차 : ${differenceTime} 일<br>`); // 25.304571724537038 일
// => 소수점(실수) 절삭(버림)을 위해 Math.floor() 메서드 활용하거나 parseInt() 함수 활용
document.write(`두 날짜의 차 : ${parseInt(differenceTime)} 일<br>`); // 25 일
document.write(`두 날짜의 차 : ${Math.floor(differenceTime)} 일<br>`); // 25 일

// D-Day 판별하기
differenceTime = parseInt(differenceTime);
if(differenceTime > 0) {
	document.write(`${differenceTime} 일 지났습니다!<br>`);
} else if(differenceTime < 0) {
	document.write(`${differenceTime} 일 남았습니다!<br>`);
} else if(differenceTime == 0) {
	document.write(`D-Day 입니다!<br>`);
}

document.write("<hr>");

// D-Day 판별하기(날짜가 동일하고 시각이 다를 경우)
targetDate = new Date("2025-04-28");
targetTime = targetDate.getTime();
differenceTime = (nowTime - targetTime) / 1000 / 60 / 60 / 24;
// => 주의! parseInt() 함수를 통해 소수점 버림을 수행하지 않을 경우
//    동일한 일자에 시각이 다르면 D-Day 가 아닌 것으로 판별한다 => 정확히 0 이 아니기 때문
// => 따라서, parseInt() 등으로 정수화를 수행하거나 또는
//    Date 객체의 메서드들을 조합하여 "오늘" 인지 판별 필요(오늘 = 연, 월, 일이 모두 같은 날)
if(nowDate.getFullYear() == targetDate.getFullYear()
		&& nowDate.getMonth() == targetDate.getMonth()
		&& nowDate.getDate() == targetDate.getDate()) {
	// 주의! 0.x 값이 나오더라도 날짜가 같으면 무조건 D-Day 이므로
	// 음수 또는 양수보다 먼저 연산을 수행하도록 순서를 조정해야함
	document.write(`D-Day 입니다!<br>`);
} else if(differenceTime > 0) {
	document.write(`${differenceTime} 일 지났습니다!<br>`);
} else if(differenceTime < 0) {
	document.write(`${differenceTime} 일 남았습니다!<br>`);
}














