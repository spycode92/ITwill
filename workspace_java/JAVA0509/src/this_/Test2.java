package this_;

public class Test2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}

/*
 * Account2 클래스 생성
 * - 멤버변수 : accountNo, ownerName, balance 선언
 * - 생성자 오버로딩 (레퍼런스 this와 생성자 this() 활용)
 *   1) 기본 생성자("111-1111-111", "홍길동", 0)
 *   2) 계좌번호를 전달받아 초기화하는 생성자
 *   3) 계좌번호, 예금주명을 전달받아 초기화하는 생성자
 *   4) 계좌번호, 예금주명, 현재잔고를 전달받아 초기화하는 생성자
 *      => 초기화 작업을 수행하는 생성자
 * - showAccountInfo() 메서드 정의 -> 계좌번호, 예금주명, 현재잔고 출력
 */