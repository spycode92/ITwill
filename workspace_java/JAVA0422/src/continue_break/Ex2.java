package continue_break;

public class Ex2 {

	public static void main(String[] args) {
		// 중첩 for문을 사용하여 2단 ~ 9단까지 구구단 출력
		// => 단, 구구단의 단이 5단일 때 반복문 종료
//		for(int dan = 2; dan <= 9; dan++) { // 2 ~ 9 반복
//			System.out.println("< " + dan + "단 >");
//			
//			// 현재 단이 5단일 때 반복문 종료
////			if(dan == 5) {
////				break;
////			}
//			
//			for(int i = 1; i <= 9; i++) { // 1 ~ 9 반복
//				if(dan == 5) {
//					break;
//				}
//				System.out.println(dan + " * " + i + " = " + (dan * i));
//				
//			} // 안쪽 for문
//			
//			System.out.println(); // 줄바꿈
//			
//		} // 바깥쪽 for문
		
		/*
		 * Label 기능
		 * - 반복문의 앞에 위치하여 break 또는 continue의 동작 지점을 지정
		 * - break 문 또는 continue 문 뒤에 해당 레이블의 이름을 지정할 경우
		 *   label 위치의 다음 반복문에 break 또는 continue 문이 적용됨
		 * - 주로 중첩 반복문에서 반복문을 한꺼번에 빠져나가기 위해 사용
		 * - 반복문 앞 또는 위에 대문자로 된 문자를 작성하고 콜론을 붙임
		 * 
		 * < 기본 문법 >
		 * 레이블명:
		 * 바깥쪽반복문() {
		 * 		안쪽반복문() {
		 * 			if(조건) {
		 * 				break 레이블명; // 또는 continue 레이블명;
		 * 			}
		 * 		}
		 * }
		 */
		
		EXIT_FOR:
		for(int dan = 2; dan <= 9; dan++) { // 2 ~ 9 반복
			System.out.println("< " + dan + "단 >");
			
			// 현재 단이 5단일 때 반복문 종료
//			if(dan == 5) {
//				break;
//			}
			
			for(int i = 1; i <= 9; i++) { // 1 ~ 9 반복
				if(dan == 5) {
					break EXIT_FOR;
				}
				System.out.println(dan + " * " + i + " = " + (dan * i));
				
			} // 안쪽 for문
			
			System.out.println(); // 줄바꿈
			
		} // 바깥쪽 for문
		
		
		

	}

}
