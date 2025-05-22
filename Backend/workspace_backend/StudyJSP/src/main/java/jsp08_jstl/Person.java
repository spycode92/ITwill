package jsp08_jstl;

public class Person {
	// 멤버변수(필드) 선언(외부에서 변수값 변경이 불가능하도록 접근제한자 private 사용)
	private int idx;
	private String name;
	
	// 파라미터 생성자 정의(단축키 : Alt + Shift + S -> O)
	public Person(int idx, String name) {
		super();
		this.idx = idx;
		this.name = name;
	}

	// 멤버변수에 직접 접근하는 대신 값을 주고받을 수 있도록 Getter/Setter 메서드 정의
	// => 단축키 : Alt + Shift + S -> R
	public int getIdx() {
		return idx;
	}
	
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Person [idx=" + idx + ", name=" + name + "]";
	}
	
	
	
}











