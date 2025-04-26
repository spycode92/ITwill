package constructor;

public class Ex2 {

	public static void main(String[] args) {
		/*
		 * 파라미터 생성자
		 * - 생성자 호출 시점에서 전달해야할 데이터가 있을 경우
		 *   생성자 파라미터(매개변수)를 선언할 수 있음(= 메서드와 동일)
		 * - 전달받은 데이터는 인스턴스 변수를 초기화하는 용도로 사용
		 * - 즉, 객체마다 다른 데이터를 가진 채로 인스턴스를 생성하기 위해 사용
		 * 
		 * < 파라미터 생성자 기본 문법 >
		 * [접근제한자] 클래스명(매개변수 선언...) {
		 * 		// 생성자 호출 시점에 파라미터 데이터를 전달하여
		 *		// 인스턴스 내의 인스턴스 변수(=멤버변수)를 초기화함
		 *		인스턴스변수명(멤버변수명) = 매개변수명(데이터)
		 * }
		 * 
		 * => 파라미터 생성자 자동 단축키 : Alt + Shift + S -> O
		 */

		// Person2 인스턴스(p) 생성
//		Person2 p = new Person2();
		// => 오류 발생! The constructor Person2() is undefined
		// => 파라미터 생성자를 하나라도 정의할 경우
		//    컴파일러 의해서 기본 생성자가 자동으로 생성되지 않기 때문에
		//    기본 생성자를 호출할 수 없게 된다!
		// => 해결책 : 1) 기본 생성자를 직접 정의하던지
		//             2) Person2(String, int) 파라미터 생성자로 인스턴스 생성!
		Person2 p = new Person2("홍길동", 20);
		p.showPersonInfo();
		
		System.out.println("--------------------------");
		
		Person2 p2 = new Person2("이순신", 44);
		p2.showPersonInfo();
		
		System.out.println("-------------------------");
		
		Person2 p3 = new Person2("강감찬", "한국", 30);
		p3.showPersonInfo();
		
	}

}

class Person2 {
	// 멤버변수 선언(= 인스턴스 변수, 필드)
	String name;
	String nation;
	int age;
	
	// 생성자를 정의하지 않으면 기본 생성자가 자동으로 생성됨
//	public Person2() {} // 기본 생성자
	
	// 파라미터 생성자
	public Person2(String newName, int newAge) {
		System.out.println("Person(String, int) 생성자 호출됨!");
		
		// 전달받은 파라미터값을 인스턴스 변수에 저장
		name = newName;
		age = newAge;
		
		// 만약, 국가명(nation)은 무조건 "대한민국"으로 고정하고 싶을 경우
		// 별도로 파라미터값을 전달받지 않고 생성자 내에서 "대한민국"으로 초기화
		nation = "대한민국";
	}
		
	// 파라미터 생성자 자동 단축키 : Alt + Shift + S -> O
	public Person2(String name, String nation, int age) {
		System.out.println("Person2(String, String, int) 생성자 호출됨!");
//		super();
		this.name = name;
		this.nation = nation;
		this.age = age;
	}

	
	// 메서드
	public void showPersonInfo() {
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("국가 : " + nation);
	}
}










