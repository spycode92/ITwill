package method_overriding;

public class Test2 {

	public static void main(String[] args) {
		

	}

}

/*
 * Car 클래스 정의
 * - 멤버변수 : speed(현재속력, int), maxSpeed(최대속력, int)
 * - 메서드
 *   speedUp() : "자동차 속력 증가!" 출력(리턴타입, 파라미터 없음)
 *   speedDown() : "자동차 속력 감소!" 출력(리턴타입, 파라미터 없음)
 *   addFuel() : "자동차 연료 주입!" 출력(리턴타입, 파라미터 없음)
 *   
 */

/*
 * 자동차(Car) 클래스를 상속받는 전기자동차(ElectricCar) 정의
 * - 멤버변수 : batteryCapacity(배터리 용량, int)
 * - Car 클래스의 메서드 오버라이딩
 *   speedUp() : "ElectricCar 전기모터의 힘으로 속력 증가!" 출력(리턴타입 없음, 파라미터값 없음)
 *   speedDown() : "ElectricCar 속력 감소하면서 전기배터리 충전!" 출력(리턴타입 없음, 파라미터값 없음)
 *   addFuel() : "전기차 충전소에서 배터리 충전!" 출력(리턴타입 없음, 파라미터값 없음)
 *   
 */

/*
 * 자동차(Car) 클래스를 상속받는 디젤자동차(DieselCar) 정의
 * - 멤버변수 : cc(엔진 배기량, int)
 * - Car 클래스의 메서드 오버라이딩
 *   speedUp() : "디젤 엔진의 힘으로 속력 증가!" 출력(리턴타입 없음, 파라미터값 없음)
 *   speedDown() : "디젤 자동차 속력 감소!" 출력(리턴타입 없음, 파라미터값 없음)
 *   addFuel() : "주유소에서 디젤 연료 주입!" 출력(리턴타입 없음, 파라미터값 없음)
 */