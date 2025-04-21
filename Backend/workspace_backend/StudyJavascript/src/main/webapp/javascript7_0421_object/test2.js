/*
3) 클래스(Class) 선언 방식
   - 자바에서 정의하는 방식과 거의 동일한 문법 사용(ES6 이상부터 사용 가능)
   
   [ 기본 문법 ]
   class 클래스명 {
		constructor([파라미터...]) {
			this.프로퍼티명1 = 파라미터1; 
			this.프로퍼티명2 = 파라미터2,
			...생략...
			this.프로퍼티명n = 파라미터n
		}
	
		메서드명([파라미터...]) {
			메서드 호출 시 실행할 코드...
		}
   }
   
   => 객체 생성 및 접근 방법은 1, 2번 방법과 동일함
*/

class Car {
	constructor(modelName, color) { // new Car(modelName, color) 형태로 객체 생성 필요함
		this.modelName = modelName;
		this.color = color;
	}
	
	engineStart() {
		console.log("차 시동 걸기!");
	}
}

// ========================================================
function test2() {
	// Car 클래스의 인스턴스 생성
	const car = new Car("SONATA", "RED");
	
	// Car 인스턴스의 프로퍼티값 출력
	console.log("car 객체의 modelName 속성값 : " + car.modelName);
	console.log(`car 객체의 color 속성값 : ${car.color}`);
	
	// Car 인스턴스의 engineStart() 메서드 호출
	car.engineStart();
	// ------------------------------
	// 동일한 Car 클래스를 바탕으로 두번째 Car 인스턴스(객체) 생성하기
	const car2 = new Car(); // 위의 Car 객체와는 또 다른 객체가 되어 서로 다른 값을 갖게 된다!
	// => 주의! 생성자가 Car(modelName, color) 형태로 호출되어야 하지만
	//    생성자 파라미터로 아무것도 전달하지 않으면 속성값이 없게 되므로 undefined 가 된다! 
	console.log("car2 객체의 modelName 속성값 : " + car2.modelName); // undefined
	console.log(`car2 객체의 color 속성값 : ${car2.color}`); // undefined
	car2.engineStart();
}























