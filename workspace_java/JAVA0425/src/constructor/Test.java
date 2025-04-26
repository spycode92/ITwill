package constructor;

public class Test {

	public static void main(String[] args) {
		// Account 인스턴스 생성
		Account acc = new Account();
		
//		acc.accountNo = "111-1111-111";
//		acc.ownerName = "홍길동";
//		acc.balance = 10000;
//		
//		System.out.println("계좌번호 : " + acc.accountNo);
//		System.out.println("예금주명 : " + acc.ownerName);
//		System.out.println("현재잔고 : " + acc.balance + "원");
				
		acc.showAccountInfo();

	}

}

/*
 * Account 클래스
 * - accountNo, ownerName, balance
 * - showAccountInfo() 메서드
 * - 인스턴스 생성 시
 *   "Account() 생성자 호출됨!" 출력
 *   accountNo에 "111-1111-111", ownerName 에 "홍길동", balance 에 10000
 *   초기값으로 설정
 */

class Account {
	// 멤버변수 선언
	String accountNo;
	String ownerName;
	int balance;
	
	// public Account() {} // 기본 생성자

	// 생성자 정의
	public Account() {
		System.out.println("Account() 생성자 호출됨!");
		
		// 인스턴스 생성 시 기본값으로 가져야할 데이터를 멤버변수 저장
		accountNo = "111-1111-111";
		ownerName = "홍길동";
		balance = 10000;
	}
		
	// 메서드
	public void showAccountInfo() {
		System.out.println("계좌번호 : " + accountNo);
		System.out.println("예금주명 : " + ownerName);
		System.out.println("현재잔고 : " + balance + "원");
	}
}





