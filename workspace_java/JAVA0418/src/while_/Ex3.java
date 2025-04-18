package while_;

public class Ex3 {

	public static void main(String[] args) {
		/*
		 * 중첩 while문
		 * - 중첩 for문과 마찬가지로 while문 내부에 또 다른 while문을 기술
		 * 
		 * < 기본 문법 >
		 * 초기식1;
		 * 
		 * while(조건식1) {
		 * 		
		 * 		초기식2;
		 * 
		 * 		while(조건식2) {
		 *      	// 반복할 문장
		 * 			// 증감식2;
		 * 		}
		 * 
		 *		증감식1;
		 * }
		 * 
		 */
		
		// for문을 사용하여 i값이 1 ~ 5까지 반복할 동안
		// j값이 1 ~ 3까지 반복하는 중첩 for문
//		for(int i = 1; i <= 5; i++) { // 바깥쪽 for문
//			
//			for(int j = 1; j <= 3; j++) { // 안쪽 for문
//				System.out.println("i = " + i + ", j = " + j);				
//			}
//		}
		
		int i = 1; // 초기식1
		
		while(i <= 5) { // 조건식1				
			int j = 1; // 초기식2
		
			while(j <= 3) { // 조건식2
		    	// 반복할 문장
				System.out.println("i = " + i + ", j = " + j);
				j++; // 증감식2
			}
		
			i++;
		}
		
		

	}

}




