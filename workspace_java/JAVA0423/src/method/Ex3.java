package method;

public class Ex3 {

	public static void main(String[] args) {
		// 5. 파라미터가 2개 이상인 메서드 호출
		String snack = "새우깡";
		int myMoney = 1000;
		System.out.println("동생아! 생우깡이랑 1000원 줄테니 쿠쿠다스 바꿔줘!");
		
//		sister_5(1000, "새우깡");
		// => The method sister_5(String, int) in the type Ex3 
		//    is not applicable for the arguments (int, String)

		String mySnack = sister_5("새우깡", 1000); // String, int 형태의 데이터 전달
		System.out.println("동생이 바꿔다 준 것 : " + mySnack);
		
	} // main() 메서드 끝

	// 5. 파라미터가 2개 이상인 메서드 정의
	public static String sister_5(String snack, int money) {
		System.out.println("오빠가 준 과자는 : " + snack);
		System.out.println("오빠가 준 돈은 : " + money + "원");
		System.out.println(snack + "을(를) 쿠쿠다스로 교환했다!");
		snack = "쿠쿠다스";
		
		// snack 변수 값을 리턴
		return snack;
	}
	
} // Ex3 클래스 끝





