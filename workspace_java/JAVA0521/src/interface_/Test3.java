package interface_;

public class Test3 {

	public static void main(String[] args) {
		PhotoShop p = new PhotoShop();
		
		p.draw(new Circle());
		p.draw(new Rectangle());

	}

}

//모든 도형의 그리기 기능을 제공하는 Shape 인터페이스 정의
//=> draw() 추상메서드 정의(리턴값 없음, 파라미터 없음)
interface Shape {
	public abstract void draw();
}

//Shape 인터페이스를 구현하는 Circle, Rectangle 클래스 정의
//=> 추상메서드 draw() 를 오버라이딩하여 각자 도형 그리기 기능을 구현
//ex) Circle 은 "원 그리기", Rectangle 은 "사각형 그리기" 출력
//=> Circle : 멤버변수(반지름, radius, 실수형, 접근제한자 : private)
//     		  Setter() 메서드, 
//     		  draw() 메서드 호출 시 "원그리기! 반지름 : 반지름 길이" 출력
//=> Rectangle : 멤버변수(가로, width, 실수형, 접근제한자 : private
//						  세로, height, 실수형, 접근제한자 : private)
//        	  Setter() 메서드,
//            draw() 메서드 호출 시 "가로 : 가로길이, 세로 : 세로길이 의 사각형 그리기!"
class Circle implements Shape {
	private double radius = 3.0;

	public void setRadius(double radius) {
		this.radius = radius;
	}

	@Override
	public void draw() {
		System.out.println("원 그리기 - 반지름 : " + radius);
	}
	
	
}

class Rectangle implements Shape {
	private double width = 2.0;
	private double height = 1.5;
	
	public void setWidth(double width) {
		this.width = width;
	}
	
	public void setHeight(double height) {
		this.height = height;
	}

	@Override
	public void draw() {
		System.out.println("가로 : " + width + ", 세로 : " + height + "의 사각형 그리기!");
	}
	
}

//Photoshop 클래스 정의
//draw() 메서드 정의
//=> Circle, Rectangle 인스턴스를 전달받아 해당 인스턴스의 draw() 호출
//두 인스턴스의 공통 타입으로 Shape 인터페이스를 파라미터 타입으로 지정
class PhotoShop {
	// draw 메서드 정의
	// => Circle, Rectangle 인스턴스를 전달받아 인스턴스의 draw() 호출
	//    두 인스턴스의 공통 타입으로 Shape 인터페이스를 파라미터 타입으로 지정
	public void draw(Shape s) { // Circle & Rectangle -> Shape 업캐스팅
		// Shape 타입 변수의 draw() 메서드 호출 시 실제 인스언스의 draw() 호출됨
		s.draw();
	}
}







