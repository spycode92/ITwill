package class_;

public class Ex {

	// main() 메서드는 자바 프로그램의 시작점이다!
	// => main() 메서드에서부터 객체를 생성하고 사용할 수 있음.
	// 단, main() 메서드에서만 가능한 것은 아니고
	// main() 메서드가 호출하는 다른 메서드에서도 사용 가능
	public static void main(String[] args) {
		/*
		 * 정의한 클래스는 설계도에 해당하므로 실제 사용을 하기 위해서는
		 * 반드시 실체(=객체)를 생성해야 한다!
		 * // => 클래스를 사용하여 메모리에 생성된 객체(실체)를 만들게 되고,
		 *       이를 인스턴스(Instance) 라고 함.
		 *       
		 * < 클래스에 대한 인스턴스 생성 기본 문법 >
		 * 클래스명 변수명 = new 클래스명();      
		 */
		
		// Animal 클래스의 인스턴스 생성
		// 1. Animal 클래스 타입 변수 선언
//		Animal ani;
		
		// 2. Animal 클래스 인스턴스 생성 및 주소값 저장
//		ani = new Animal();
		
		Animal ani = new Animal();
		
		// Animal 인스턴스에 접근하여 멤버변수 사용 또는 메서드 호출
		// => 인스턴스에 접근을 하기 위해서는 반드시 인스턴스 주소가 필요하며,
		//    인스턴스 주소를 담고 있는 참조변수(ani)를 통해 접근이 가능함.
		// 1. Animal 인스턴스의 멤버변수 name과 age에 값 저장
//		name = "멍멍이"; // 컴파일 에러 발생!
		// => 반드시 참조변수명.멤버변수명 형태로 접근해야 함
		ani.name = "멍멍이"; // ani 인스턴스의 멤버변수 name에 "멍멍이" 저장
		System.out.println("이름 : " + ani.name);
		
		ani.age = 3;
		System.out.println("나이 : " + ani.age + "살");
		
		// 2. Animal 인스턴스의 메서드 cry() 호출
		// => 리턴값이 없는 메서드이므로 메서드만 호출
		// => 매개변수가 없는 메서드이므로 소괄호() 안에 아무것도 명시하지 않음
		ani.cry();
		
		System.out.println("----------------------------------");
		
		// Animal 클래스의 두 번째 인스턴스(ani2) 생성
		// => 멤버변수 초기화 - 이름 : 냐옹이, 나이 : 2
		Animal ani2 = new Animal();
		ani2.name = "냐옹이";
		ani2.age = 2;
		
		System.out.println("이름 : " + ani2.name);
		System.out.println("나이 : " + ani2.age + "살");
		ani2.cry();
		
		// -------------------------------------------------------------
		// 위의 두 인스턴스(ani, ani2) 구조
		// -------------------------------------------------------------
		// new
		// Animal 클래스 =>		인스턴스1(ani)		인스턴스2(ani2)
		// 이름(name)			"멍멍이"			"냐옹이"
		// 나이(age)				3					2
		// --------------------------------------------------------------
		
		System.out.println("=====================================");
		
		// Car 클래스의 인스턴스(car) 생성 및 멤버변수 초기화 후 출력
		// 제조사 : 현대
		// 모델명 : 그랜져
		// 배기량 : 3000
		
		Car car = new Car();
		// => Heap 메모리 공간에 생성된 인스턴스 주소가 참조변수 car 에 저장
		
		car.company = "현대";
		car.modelName = "그랜져";
		car.cc = 3000;
		
		System.out.println("제조사 : " + car.company);
		System.out.println("모델명 : " + car.modelName);
		System.out.println("배기량 : " + car.cc + "cc");
		
		car.speedUp();
		car.speedDown();
		

	}

} // Ex 클래스 끝

// 하나의 java 파일 내에 여러 개의 클래스를 정의할 수 있다!
// => 단, 파일명과 동일한 이름의 클래스 외에는 public 키워드를 붙일 수 없다!
// 학생(Student) 클래스 정의
// 속성 : 이름(name, 문자열), 번호(id, 정수), 과정명(className, 문자열)
// 기능 : 공부(study()) - 리턴값 없음, 매개변수 - 과목명(subjectName, 문자열)
//                        => "xxx 과목 공부!" 출력
//        휴식(rest()) - 리턴값 없음, 매개변수 없음
//                        => "휴식!" 출력
class Student {
	
}










