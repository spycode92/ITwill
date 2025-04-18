package while_;

public class Ex {

	public static void main(String[] args) {
		/*
		 * while문
		 * - for문과 마찬가지로 특정 조건식의 판별 결과가 true일 동안 반복
		 * - for문과 달리 조건식 위치만 정해져 있고
		 *   초기식과 증감식의 위치는 유동적으로 변함(생략도 가능)
		 *   (개발자가 정함!)
		 * - for문은 주로 반복 횟수가 정해져 있는 경우 사용하며,
		 *   while문은 주로 반복 횟수가 정해져 있지 않은 경우 사용
		 * - for문과 while문은 100% 상호 변환이 가능함!
		 * 
		 * < 기본 문법 >
		 * [초기식;] // while문 보다 위에 위치하도록(생략도 가능)
		 * 
		 * while(조건식) {
		 * 		[증감식;] // 증감식 위치는 반복할 문장보다 위에 올 수도 있다!
		 *		// 조건식 결과가 true 일 때 반복 실행할 문장
		 *		[증감식;]
		 * }
		 * 
		 */
		
		// for문을 사용하여 "Hello, World!" 문자열을 10번 반복 출력
		for(int i = 1; i <= 10; i++) {
			System.out.println(i + " : Hello, World!");
		}
		
		System.out.println("---------------------------------");
		
		// 위의 for문을 while문을 치환
		
		int i = 1; // 초기식
		  
		while(i <= 10) { // 조건식
			System.out.println(i + " : Hello, World!");
			i++;
		}
		
		// 제어변수 i가 while문 보다 위쪽에서 선언되었으므로
		// while문 반복 종료 후에도 변수 i값에 접근 가능함
		System.out.println("while문 종료 후 i값 = " + i);
		
		System.out.println("----------------------------------");
		
		// 제어변수 i가 1 ~ 10까지 증가하면서 i 값 출력
		// => 출력 예시 : 1 2 3 4 5 6 7 8 9 10
		
//		for(i = 1; i <= 10; i++) {
//			System.out.print(i + " ");
//		}
		
		// while문
		i = 1;
		while(i <= 10) {
			System.out.print(i + " ");
			i++;
		}
		
		System.out.println();
		System.out.println("--------------------------------");
		
		// 제어변수 i가 1 ~ 10까지 증가하면서 i 값 출력
		// => 출력 예시 : 1 3 5 7 9
//		for(i = 1; i <= 10; i += 2) {
//			System.out.print(i + " ");
//		}
		
		i = 1;
		while(i <= 10) {
			System.out.print(i + " ");
			i += 2;
		}

		System.out.println();
		System.out.println("--------------------------------");
		
		// 제어변수 i가 1 ~ 10까지 증가하면서 i 값 출력
		// => 출력 예시 : 2 4 6 8 10
//		for(i = 2; i <= 10; i += 2) {
//			System.out.print(i + " ");
//		}

		i = 2;
		while(i <= 10) {
			System.out.print(i + " ");
			i += 2;
		}
		
		System.out.println();
		System.out.println("--------------------------------");
		
		// 제어변수 i가 1 ~ 10까지 1씩 감소하면서 i값 출력(역순으로 출력)
		// => 출력 예시 : 10 9 8 7 6 5 4 3 2 1
//		for(i = 10; i >= 1; i--) {
//			System.out.print(i + " ");
//		}

		i = 10;
		while(i >= 1) {
			System.out.print(i + " ");
			i--;
		}
		
	}

}






