package access_modifier;

public class Test {

	public static void main(String[] args) {
		Account acc = new Account();
		
//		acc.accountNo = "111-1111-111";
//		acc.ownerName = "홍길동";
//		acc.balance = 10000;
		// => Setter() 메서드 대체
		
		// Setter() 메서드로 111-1111-111, 홍길동, 10000 입력
		acc.setAccountNo("111-1111-111");
		acc.setOwnerName("홍길동");
		acc.setBalance(10000);
		
//		System.out.println("계좌번호 : " + acc.accountNo);
//		System.out.println("예금주명 : " + acc.ownerName);
//		System.out.println("현재잔고 : " + acc.balance + "원");
		// => Getter() 메서드로 대체
		
		// Getter() 메서드를 활용하여 계좌번호, 예금주명, 현재잔고를 출력
		System.out.println("계좌번호 : " + acc.getAccountNo());
		System.out.println("예금주명 : " + acc.getOwnerName());
		System.out.println("현재잔고 : " + acc.getBalance() + "원");
		
	

	}

}

/*
 * Account 클래스 정의
 * - 멤버변수(private 접근제한자 선언)
 *   accountNo, ownerName, balance
 * - Getter/Setter 메서드 정의 (단축키 사용 가능!)
 */
class Account {
	// 멤버변수
	private String accountNo;
	private String ownerName;
	private int balance;
		
	// 생성자
	
	// 메서드
	// Getter/Setter 메서드를 정의하여 멤버변수에 간접적으로 접근하도록 수행
	// 단축키 : Alt + Shiht + S -> R
	// 1. String accountNo 변수에 대한 Getter/Setter
	public String getAccountNo() {
		return accountNo;
	}
	
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	
	// 2. String ownerName 변수에 대한 Getter/Setter
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	
	// 3. int balance 변수에 대한 Getter/Setter
	public int getBalance() {
		return balance;
	}
	
	public void setBalance(int balance) {
		this.balance = balance;
	}
	
}




