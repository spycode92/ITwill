package constructor;

public class Test2 {

	public static void main(String[] args) {
		
//		Account2 acc = new Account2();
		// => 파라미터 생성자를 정의하면
		//    기본 생성자가 자동으로 만들어지지 않음!
		
		// 계좌번호, 예금주명, 현재잔고를 파라미터 값으로 전달
		Account2 acc = new Account2("111-1111-111", "홍길동", 10000); 
		acc.showAccountInfo();

	}

}

/*
 * Account2 클래스
 * - accountNo, ownerName, balance
 * - showAccountInfo() 메서드
 * - 파라미터 생성자(accountNo, ownerName, balance) 생성
 *   => 단축키 활용 가능
 */

class Account2 {
	// 멤버변수
	String accountNo;
	String ownerName;
	int balance;
		
	// 생성자
	// 기본 생성자
//	public Account2() {}
	
	// 파라미터 생성자(accountNo, ownerName, balance) 생성
	// - 단축키 : Alt + Shift + S -> O
	public Account2(String accountNo, String ownerName, int balance) {
		super();
		this.accountNo = accountNo;
		this.ownerName = ownerName;
		this.balance = balance;
	}
		
	// 메서드
	public void showAccountInfo() {
		System.out.println("계좌번호 : " + accountNo);
		System.out.println("예금주명 : " + ownerName);
		System.out.println("현재잔고 : " + balance + "원");
	}
	
}








