package for_;

public class Test3 {

	public static void main(String[] args) {
		// 바깥쪽 for문 i 값이 1 ~ 10까지 반복할 동안
		// 안쪽 for문 j 값을 1 ~ 5까지 반복하면서 i와 j의 값을 출력
		for(int i = 1; i <= 10; i++) { // 바깥쪽 for문
			System.out.println("i = " + i);
			
			for(int j = 1; j <= 5; j++) { // 안쪽 for문
				System.out.println("-----> j = " + j);
			}
		}
		
		System.out.println("===================================");
		
		/*
		 * 타이머(XX분 XX초)
		 * - 시(hour) : 0 ~ 23시 
		 * - 분(min) : 0 ~ 59분
		 * - 초(sec) : 0 ~ 59초
		 * 
		 * < 출력 예시 >
		 * 0분 0초
		 * 0분 1초
		 * 0분 2초
		 * ... 생략 ...
		 * 0분 59초
		 * 1분 0초
		 * 1분 1초
		 * ... 생략 ...
		 * 59분 58초
		 * 59분 59초
		 */
		
		// 바깥쪽 for문으로 분(min, 0 ~ 59 반복)
		for(int min = 0; min <= 59; min++) {
//			System.out.println(min + "분");
			
			// 안쪽 for문으로 초(sec, 0 ~ 59 반복)
			for(int sec = 0; sec <= 59; sec++) {
//				System.out.println(min + "분 " + sec + "초");
				System.out.printf("%2d분 %2d초\n", min, sec);
			}
		}
		
		System.out.println("===================================");
		
		/*
		 * 중첩 for문 활용한 구구단 전체 출력(2단 ~ 9단)
		 * 
		 * < 2단 >
		 * 2 * 1 = 2
		 * 2 * 2 = 4
		 * 2 * 3 = 6
		 * ... 생략 ...
		 * 
		 * < 3단 >
		 * 3 * 1 = 3
		 * ... 생략 ...
		 * 
		 * < 9단 >
		 * 9 * 1 = 9
		 * 9 * 2 = 18
		 * ... 생략 ...
		 * 9 * 9 = 81
		 * 
		 * => 단(dan) 이 2 ~ 9 까지 1씩 증가(바깥쪽 for문)
		 *    이 때, 각 단마다 i값이 1 ~ 9까지 1씩 증가(안쪽 for문)
		 */

	}

}









