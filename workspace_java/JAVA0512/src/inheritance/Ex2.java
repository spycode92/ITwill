package inheritance;

public class Ex2 {

	public static void main(String[] args) {
		/*
		 * 상속의 장점
		 * 1. 코드 재사용성이 증가
		 * 2. 코드의 유지보수성이 용이해짐
		 */
		Print3D p = new Print3D();
		p.print3D();

	}

}

// 2차원 좌표(x, y)를 관리하는 Print2D 클래스
class Print2D { // = class Print2D extends Object 와 같음
	int x = 10; // x 좌표
	int y = 20; // y 좌표
	
	// 2차원 좌표값을 출력하는 print2D() 메서드 정의
	public void print2D() {
//		System.out.print("x 좌표 = " + x + ", y 좌표 = " + y);
		
		// 슈퍼클래스의 메서드를 수정하면
		// 서브클래스인 Print3D 클래스에서 수정 내용에 대한 적용을 받을 수 있음.
		System.out.print(x + ", " + y);
	}
}

// 3차원 좌표(x, y, z)를 관리하는 Print3D 클래스
// => x, y, z 좌표 관리 기능은 기본적으로 Print2D 클래스와 중복되므로 상속
class Print3D extends Print2D {
	int z = 30; // z 좌표
	
	// 3차원 좌표값을 출력하는 print3D() 메서드 정의
	public void print3D() {
//		System.out.println("x 좌표 = " + x + ", y 좌표 = " + y + ", z 좌표 = " + z);
		
		print2D();
		System.out.println(", z 좌표 = " + z);
	}
}















