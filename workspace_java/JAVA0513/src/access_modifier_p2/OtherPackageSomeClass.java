package access_modifier_p2;

import access_modifier_p1.ParentClass;

public class OtherPackageSomeClass {
	
	public void useMember() {
		// 다른 패키지의 상속관계가 아닌 다른 클래스에서의 접근
		// => 인스턴스 생성 후 참조변수를 통해 접근해야 함 = has-a 관계
		// => 다른 패키지이므로 import문이 필요.
		ParentClass p = new ParentClass();
		p.publicVar = 10;		// public(O)
//		p.protectedVar = 20;	// protected(X)
								// - 패키지가 다르고, 상속 관계도 아니므로 접근 불가!
//		p.defaultVar = 30;		// default(X) - 다른 패키지에서 접근 불가!
//		p.privateVar = 40;		// private(X) - 다른 클래스에서 접근 불가!
	}
}
