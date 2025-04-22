package continue_break;

public class Test {

	public static void main(String[] args) {
		/*
		 * 1 ~ 100까지 정수의 합을 계산(total 변수에 저장)
		 * => 단, 합계가 1000보다 클 경우 반복문을 종료하고 빠져나간 뒤
		 *    1000보다 커지는 시점의 정수(x)를 출력
		 */
		
		// 변수 선언 및 초기화
		int total = 0;
		int x;
		
		// 반복문
		for(x = 1; x <= 100; x++) {
			total += x;
			
			if(total > 1000) {
				break; // 합계(total)가 1000보다 클 때 for문 종료
			}
		}
		
		// total과 x 값 출력
		System.out.println("1 ~ " + x + "까지 정수의 합 = " + total);
		System.out.println("합계가 1000보다 클 때 x = " + x);
		
		System.out.println("===================================");
		
		/*
		 * 1 + (-2) + 3 + (-4) + 5 + (-6) + 7 + (-8) + ... 생략 ...
		 * 형식으로 계속 더 할 때 합계 100 이상이 되는 x 값을 출력(break문 사용)
		 * <힌트> 정수가 짝수일 때 음수 형태로 변환해서 합계 누적
		 */

		// while문 사용
		x = 1;
		total = 0;
		
		while(total < 100) { // 합계가 100보다 작을 동안 반복(= 100 이상 종료)
			
			if(x % 2 == 0) { // 짝수일 때
				System.out.println(-x);
				total = total + -x; // 음수값으로 변환하여 누적
			} else { // 홀수일 때
				System.out.println(x);
				total = total + x; // 양수값 그대로 누적
			}
			
			x++;
		}
		
		System.out.println("----------------------------------------");
		
		x = 0;
		total = 0;
		
		while(total < 100) { // 합계가 100보다 작을 동안 반복(= 100 이상 종료)
			x++;
			
			if(x % 2 == 0) { // 짝수일 때
				System.out.println(-x);
				total = total + -x; // 음수값으로 변환하여 누적
			} else { // 홀수일 때
				System.out.println(x);
				total = total + x; // 양수값 그대로 누적
			}
			
		}
		
		System.out.println("----------------------------------------");
		
		// break문을 사용한 while문
		x = 1;
		total = 0;
		
		while(true) {
			if(x % 2 == 0) { // 짝수일 때
				System.out.println(-x);
				total = total + -x; // 음수값으로 변환하여 누적
			} else { // 홀수일 때
				System.out.println(x);
				total = total + x; // 양수값 그대로 누적
			}
			
			if(total >= 100) {
				break;
			}
			
			x++;
		}
		
		System.out.println("==================================");
			
		total = 0;
		// 위의 내용을 for문으로 작성
		for(x = 1; total < 100; x++) {
			if(x % 2 == 0) { // 짝수일 때
				System.out.println(-x);
				total = total + -x; // 음수값으로 변환하여 누적
			} else { // 홀수일 때
				System.out.println(x);
				total = total + x; // 양수값 그대로 누적
			}
		}
		
		// for문의 종류
		// 1. 초기식, 조건식, 증감식이 모두 존재하는 for문
		// 2. 초기식을 생략한 형태의 for문
		x = 1;
		total = 0;
		for(; total < 100; x++) {
			if(x % 2 == 0) { // 짝수일 때
				System.out.println(-x);
				total = total + -x; // 음수값으로 변환하여 누적
			} else { // 홀수일 때
				System.out.println(x);
				total = total + x; // 양수값 그대로 누적
			}
		}
				
		// 3. 조건식을 생략한 형태의 for문
		total = 0;
		// 위의 내용을 for문으로 작성
		for(x = 1; ; x++) { // 조건식을 생략할 경우 조건식의 값은 true
			if(x % 2 == 0) { // 짝수일 때
				System.out.println(-x);
				total = total + -x; // 음수값으로 변환하여 누적
			} else { // 홀수일 때
				System.out.println(x);
				total = total + x; // 양수값 그대로 누적
			}
			
			if(total >= 100) {
				break;
			}
		}
		
		// 4. 증감식을 생략한 형태의 for문
		total = 0;
		// 위의 내용을 for문으로 작성
		for(x = 1; total < 100; ) {
			if(x % 2 == 0) { // 짝수일 때
				System.out.println(-x);
				total = total + -x; // 음수값으로 변환하여 누적
			} else { // 홀수일 때
				System.out.println(x);
				total = total + x; // 양수값 그대로 누적
			}
			x++; // for문 내에서 제어변서의 값을 증가할 경우 증감식 생략 가능
		}
				
		// 5. 모든 조건을 생략한 형태의 for문 
//		for(;;) {
//			// 무한 반복
//		}
		
		
		
		
		
	}

}






