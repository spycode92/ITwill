package for_;

public class Test2 {

	public static void main(String[] args) {
		// 정수 1 ~ 100까지의 합을 누적변수 total에 누적 후 출력
		
		// 누적 변수 선언 및 초기화
		int total = 0;
		
		// for문 정의
		for(int i = 1; i <= 100; i++) {
			// total에 i값을 누적
			total = total + i; // total += i;
		}
		
		// 누적변수 출력
		System.out.println("1 ~ 100까지 정수의 합은 : " + total);
		
		System.out.println("================================");
		
		// 1 ~ 10까지 1씩 증가하면서, 정수 중 짝수의 합만 계산
		
		// 누적 변수 초기화
		total = 0;
		
		// for문 정의
		for(int i = 1; i <= 10; i++) {
			if(i % 2 == 0) { // 짝수를 판별
				// 짝수일 때 누적 수행
				total += i; // total = total + i;
				System.out.println("i = " + i + ", total = " + total);
			} else {
				System.out.println(i + " : 홀수이므로 누적 X");
			}
		}
		
		// 1 ~ 10까지 정수 중 짝수의 합 출력
		System.out.println("1 ~ 10까지 정수 중 짝수의 합 : " + total);
		
		System.out.println("================================");

		// 1 ~ 10까지 1씩 증가하면서, 정수 중 홀수의 합만 계산
		
		// 누적 변수 초기화
		total = 0;
		
		// for문 정의
		for(int i = 1; i <= 10; i++) {
			if(i % 2 == 1) { // 홀수를 판별
				// 홀수일 때 누적 수행
				total += i; // total = total + i;
				System.out.println("i = " + i + ", total = " + total);
			} else {
				System.out.println(i + " : 짝수이므로 누적 X");
			}
		}
		
		// 1 ~ 10까지 정수 중 짝수의 합 출력
		System.out.println("1 ~ 10까지 정수 중 홀수의 합 : " + total);
		
	}

}










