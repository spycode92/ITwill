package final_;

public class Ex {

	public static void main(String[] args) {
		/*
		 * final 키워드
		 * - 대상의 변경이 불가능하도록(변경의 최종) 지정
		 * 
		 * 1. 변수에 final이 붙을 경우
		 *    => 변수의 값 변경 불가 = 저장되어 있는 값만 사용 가능
		 *        = 상수로 취급됨
		 *    => 일반 변수와 구별하기 위해 이름을 보통 대문자로 사용하며,
		 *       단어와 단어 사이의 구분은 언더스코어(_)를 사용함
		 *       ex) MAX_NUM
		 *    => 반드시 초기화 필수!
		 *       단, 초기화를 수행하지 않은 상수를 blank final 상수라고 하며
		 *       생성자를 통해 초기화하면 사용이 가능함
		 *       => 목적 : 객체마다 다른 상수 값을 갖기 위함   
		 * 
		 * 2. 메서드에 final이 붙을 경우
		 *    => 메서드 변경 불가 = 오버라이딩 금지!
		 * 
		 * 3. 클래스에 final이 붙을 경우
		 *    => 클래스 변경 불가 = 상속 금지!
		 */
		
		// final 변수의 대표적인 예 : Math 클래스의 PI 상수
		System.out.println("PI값 = " + Math.PI);
		// => Math 클래스의 PI 상수값은 변경이 불가능함
		
//		Math.PI = 3.14; // 컴파일 에러 발생! 값 변경 불가!
		// => The final field Math.PI cannot be assigned
		
		System.out.println("-------------------------------------");
		
		SubFinalMethod sfm = new SubFinalMethod();
		sfm.normalMethod();
		
		System.out.println("-------------------------------------");
		
		SubFinalClass sfc = new SubFinalClass();
		sfc.fc.num = 20;
		sfc.fc.method();
		
		// final 클래스는 상속이 불가능하지만 사용은 가능함
		String str = new String();

	}

}

// 1. 변수에 final 키워드를 사용할 경우
class FinalMember {
	
	// final 상수는 반드시 초기화 필수!
	final int finalMember = 10;
	// => 초기화를 하지 않으면 아래의 오류가 발생!
	// => The blank final field finalMember may not have been initialized
	
	// 만약, final 상수를 초기화하지 않을 경우
	final int blankFinalMember; // 컴파일 에러 발생!
	// 단, 생성자를 통해 초기화할 경우 사용이 가능하다!
	
	public FinalMember(int blankFinalMember) {
		super();
		this.blankFinalMember = blankFinalMember;
	}
	
	public void change() {
//		finalMember = 99; // final 키워드가 붙은 변수(=상수)는 값 변경 불가
		// => 오류 발생
		// => The blank final field finalMember may not have been initialized
		System.out.println("finalMember = " + finalMember);
		
		final int finalLocalVar = 20; // 로컬변수에도 final 키워드 사용 가능
//		finalLocalVar = 99; // 값 변경 불가!
	}
}

// ============================================================
// 2. 메서드에 final 키워드를 사용할 경우
class FinalMethod {
	
	public final void finalMethod() { // final 메서드 = 오버라이딩 불가!
		System.out.println("슈퍼클래스의 finalMethod()");
	}
	
	public void normalMethod() {
		System.out.println("슈퍼클래스의 normalMethod()");
	}
}

// FinalMethod 클래스를 상속받는 SubFinalMethod 클래스 정의
// => 메서드 오버라이딩
class SubFinalMethod extends FinalMethod {

	// final 메서드를 오버라이딩 할 수 없으므로 컴파일 에러 발생!
	// => Cannot override the final method from FinalMethod
//	@Override
//	public void finalMethod() {
//		System.out.println("서브클래스에서 오버라이딩 된 finalMethod()");
//	}

	@Override
	public void normalMethod() {
		System.out.println("서브클래스에서 오버라이딩 된 normalMethod()");
		finalMethod(); // 오버라이딩은 안되지만 호출은 가능함!
	}
	
}

// =====================================================================
// 3. 클래스에 final 키워드를 사용할 경우
final class FinalClass {
	int num = 10;
	
	public void method() {
		System.out.println("슈퍼클래스의 method()");
	}
}

// FinalClass 클래스를 상속받는 SubFinalClass 정의
//class SubFinalClass extends FinalClass { }
// => The type SubFinalClass cannot subclass the final class FinalClass
// => final 클래스를 상속받을 수 없다!

class SubFinalClass {
	// final 클래스는 상속관계(is-a) 형태로 사용이 불가능하지만
	// 포함관계(has-a) 형태로 인스턴스를 생성하여 사용은 가능함.
	FinalClass fc = new FinalClass();
}












































