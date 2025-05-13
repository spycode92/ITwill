package method_overriding;

public class Ex {

	public static void main(String[] args) {
		
		// 상속의 기본 개념
		Student s1 = new Student();
		s1.name = "홍길동";
		
		System.out.println("-------------------------------");
		
		Student s2 = new Student("이순신", 44, false, true);
		s2.eat("저녁"); // Person 클래스로부터 상속받음 메서드
		s2.sleep(); // Person 클래스로부터 상속받은 메서드
		s2.study();

	}

}

/*
 * Person 클래스 정의
 * - name(이름, 문자열), age(나이, 정수형), isHungry(boolean) 멤버변수
 * - eat() 메서드 : 매개변수 있음, 리턴 없음
 *   => 파라미터 값을 받아 : "XXX 먹기!" 출력, isHungry 값을 false
 * - sleep() 메서드 : 매개변수 없음, 리턴 없음
 *   => "잠자기!" 출력, isHungry 값을 true  
 */

class Person {
	String name;
	int age;
	boolean isHungry;
	
	public Person() {
		System.out.println("Person() 생성자 호출됨!");
	}
	
	public void eat(String foodName) {
		System.out.println(foodName + "먹기!");
		isHungry = false;
	}
	
	public void sleep() {
		System.out.println("잠자기!");
		isHungry = true;
	}
}

/*
 * Student 클래스 정의
 * - Person 클래스 상속받음
 * - isStudyMode(boolean) 멤버변수
 * - name, age, isHungry, isStudyMode를 파라미터로 갖는 생성자 정의
 * - study() 메서드 : 매개변수 없음, 리턴 없음
 *   => "공부하기!" 출력
 */

class Student extends Person {
	boolean isStudyMode;
	
	public Student() {
//		super(); // Parent 클래스의 Parent() 기본 생성자 호출
		// Student() 생성자가 호출되면 가장 먼저
		// 슈퍼클래스인 Person 클래스의 기본 생성자가 자동으로 호출됨.
		System.out.println("Student() 생성자 호출됨!");
	}
	
	// 이름, 나이, 배고픔, 공부모드를 전달받아 초기화하는 파라미터 생성자 정의
	public Student(String name, int age, boolean isHungry, boolean isStudyMode) {
//		super();
		// Student(String, int, boolean, boolean) 생성자가 호출되면 가장 먼저
		// 슈퍼클래스인 Person 클래스의 기본 생성자가 자동으로 호출됨
		this.name = name;
		this.age = age;
		this.isHungry = isHungry;
		this.isStudyMode = isStudyMode;
		System.out.println("Student(String, int, boolean, boolean) 생성자 호출됨!");
	}
	
	public void study() {
		System.out.println("공부하기!");
	}
	
}









