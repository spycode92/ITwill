package static_member;

public class Test4 {

	public static void main(String[] args) {
		
		// 생성된 유일한 인스턴스 주소를 리턴
		Account acc = Account.getInstance();
		
		acc.setAccountNo("111-1111-111");
		acc.setOwnerName("홍길동");
		acc.setBalance(10000);
		
		acc.showAccountInfo();

	}

}

/*
 * Account 클래스를 싱글톤 디자인 패턴을 적용하여 설계
 * - 멤버변수 : accountNo, ownerName, balance 모두 private 설정
 * - 메서드 : showAccountInfo()
 * - 멤버변수에 대한 Getter/Setter 정의
 */

class Account {
	// ============== Account 클래스에 대한 싱글톤 패턴 구현 ===============
	
	// 1. 자신의 인스턴스를 생성하여 자신의 클래스 타입 변수 instance에 저장
	//    => private static
	private static Account instance = new Account();
	
	// 2. 기본 생성자 정의 => private
	private Account() {}
	
	// 3. Getter 메서드 정의 => public static
	public static Account getInstance() {
		return instance;
	}
	
	// =======================================================================
	
	// 멤버변수
	private String accountNo;
	private String ownerName;
	private int balance;

	// 메서드
	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}
	
	public void showAccountInfo() {
		System.out.println("계좌번호 : " + accountNo);
		System.out.println("예금주명 : " + ownerName);
		System.out.println("현재잔고 : " + balance + "원");
	}
	
}













