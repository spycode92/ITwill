package polymorphism;

public class Ex2 {
	public static void main(String[] args) {
		/*
		 * 다형성(polymorphism)
		 * - 하나의 데이터타입(참조변수)으로 여러 인스턴스 참조하는 특성
		 * - 어떤 인스턴스를 업캐스팅하여 슈퍼클래스 타입 변수로 다루면
		 *   하나의 슈퍼클래스 타입으로 여러 서브클래스 타입 인스턴스를 다룰 수 있음
		 */
		
		//Circle 인스턴스(c)생성
		Circle c = new Circle();
		c.circlePaint();
		
		//Rectangle 인스턴스(r)생성
		Rectangle r = new Rectangle();
		r.draw();
		
		// Triangle 인스턴스(t)생성
		Triangle t = new Triangle();
		t.design();
		
		System.out.println("==============================================");
		
		// 슈퍼클래스의 메서드를 상속받아 오버라이딩 하는 경우
		// 코드의 통일성이 향상될 수 있다!
		
		c.draw();
		r.draw();
		t.draw();
		System.out.println("-----------------------------------");
		
		//코드의 통일성을 더 향상시키는 방법 : 업캐스팅 활용
		// => Circle, Rectangle, Triangle의 공통 슈퍼클래스인
		//    Shape 타입 참조변수(s)로 세 인스턴스 컨트롤 가능
		// Circle -> Shape 업캐스팅
		Shape s = new Circle();
		s.draw(); //동적 바인딩에 의해 Circle 인스턴스의 draw() 메서드 호출

		// Rectangle -> Shape 업캐스팅
		s = new Rectangle();
		s.draw(); //동적 바인딩에 의해 Rectangle 인스턴스의 draw() 메서드 호출
		
		// Triangle -> Shape 업캐스팅
		s = new Triangle();
		s.draw(); //동적 바인딩에 의해 Triangle 인스턴스의 draw() 메서드 호출
		
	}
} // Ex2 클래스 끝

// 여러 도형의 특징을 공통적으로 포함하는 슈퍼클래스 Shape 정의
class Shape {
	// 여러 도형의 공통점인 '그리다' 기능을 수행하는 draw 메서드 정의
	public void draw () {
		System.out.println("도형 그리기!");
	}
}

// Shape 클래스를 상속받는 Circle 클래스 정의
class Circle extends Shape {
	
	
	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("원 그리기!");
	}

	public void circlePaint() {
		System.out.println("원 그리기!");
	}
}

// Shape 클래스를 상속받는 Rectangle 클래스 정의
class Rectangle extends Shape{

	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("사각형 그리기!");
	}

	public void rdraw() {
		System.out.println("사각형 그리기!");
	}
}

// Shape 클래스를 상속받는 Triangle 클래스 정의
class Triangle extends Shape{
	
	@Override
	public void draw() {
		System.out.println("삼각형 그리기!");
	}

	public void design() {
		System.out.println("삼각형 그리기!");
	}
}