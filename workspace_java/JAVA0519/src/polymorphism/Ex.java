package polymorphism;

public class Ex {

	public static void main(String[] args) {
		/*
		 * 동적 바인딩
		 * - 상속 관계에서 업캐스팅 후 메서드를 호출할 때
		 *   컴파일(번역) 단계에서의 실행 대상과 실제 실행 단계에서의
		 *   실행 대상이 달라지는 것
		 * - 참조 변수의 타입과 무관하게 실제 인스턴스의 메서드를 실행하게 됨
		 */
		
		// 슈퍼클래스 타입 인스턴스 생성
		Parent p = new Parent();
		p.parentPrn();
		
		// 서브클래스 타입 인스턴스 생성
		Child c = new Child();
		c.parentPrn(); // 슈퍼클래스로부터 상속받은 메서드
		c.childPrn(); // 서브클래스에서 정의한 메서드
		
		System.out.println("-------------------------------------");
		
		// 서브클래스 타입 인스턴스 -> 슈퍼클래스 타입으로 업캐스팅
		p = c; // Child -> Parent
		// Parent p = (Parent) c;
		p.parentPrn(); // Child 인스턴스의 오버라이딩 된 메서드가 호출됨!
		
		System.out.println("====================================");
		
		자동차 car = new 자동차();
		car.drive();
		
		디젤차 dcar = new 디젤차();
		dcar.drive();
		
		전기차 ecar = new 전기차();
		ecar.drive();
		
		System.out.println("----------------------------------------");
		
		car = dcar; // 업캐스팅, 자동차 car = new 디젤차();
		car.drive();
		
		car = ecar; // 업캐스팅, 자동차 car = new 전기차();
		car.drive();
		
		

	}

}

class 자동차 {
	public void drive() {
		System.out.println("자동차를 운전하다!");
	}
}

class 디젤차 extends 자동차 {

	@Override
	public void drive() {
		System.out.println("디젤차를 운전하다!");
	}
	
}

class 전기차 extends 자동차 {

	@Override
	public void drive() {
		System.out.println("전기차를 운전하다!");
	}
	
}



class Parent {
	public void parentPrn() {
		System.out.println("슈퍼클래스의 parentPrn()");
	}
}


class Child extends Parent {
	public void childPrn() {
		System.out.println("서브클래스의 childPrn()");
	}

	// 오버라이딩 단축키 : Alt + shift + S -> V
	@Override
	public void parentPrn() {
		System.out.println("서브클래스에서 오버라이딩 된 parentPrn()");
	}
	
	
}














