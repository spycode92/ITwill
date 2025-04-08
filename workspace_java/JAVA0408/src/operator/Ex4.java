package operator;

public class Ex4 {

	public static void main(String[] args) {
		/*
		 * 대입연산자(=)
		 * - 우변의 데이터를 좌변의 변수에 대입(저장)
		 *   => 연산의 방향이 우 -> 좌 로 진행됨
		 *   ex) x = y = 3 의 경우에 y에 3을 대입하고 x에 y를 대입
		 * - 모든 연산자 중에서 우선순위가 가장 낮다.
		 *   즉, 다른 모든 연산을 수행한 후 대입연산을 수행
		 *   
		 * 확장(복합) 대입연산자(+=, -=, *=, /=, %=)
		 * - 대입연산자와 산술연산자를 조합한 연산자
		 * - 좌변과 우변의 데이터끼리 산술연산을 먼저 수행하고
		 *   그 결과값을 다시 좌변의 변수에 대입(저장)
		 *   => a = a + b 는 a += b 표현 가능
		 *   
		 */
		
		int a = 10; // 우변의 데이터 10을 좌변의 변수 a에 대입(저장)
		int b;
		
		b = a; // 우변의 변수 a의 값을 좌변의 변수 b에 대입(저장)
		System.out.println(a);
		System.out.println(b);
		
		System.out.println("--------------------------");
		
		// b와 a의 덧셈 결과를 다시 변수 b에 저장
		// => 마치 b에 a의 값을 누적하는 것과 동일
//		b = b + a; // 10 + 10 = 20이 변수 b에 저장됨(b에 a값을 누적)
		b += a; // b = b + a와 동일
		
		System.out.println(b); // 20
		
		// b와 a의 뺄셈 결과를 다시 변수 b에 저장
//		b = b - a; // 20 - 10 = 10이 변수 b에 저장됨
		b -= a; // b = b - a와 동일
		
		System.out.println(b); // 10
		
		// b와 a의 곱셈 결과를 다시 변수 b에 저장
//		b = b * a; // 10 * 10 = 100이 변수 b에 저장됨
		b *= a; // b = b * a와 동일
		
		System.out.println(b); // 100

		// b와 a의 나눗셈 결과(몫)를 다시 변수 b에 저장
//		b = b / a; // 100 / 10 = 10이 변수 b에 저장됨
		b /= a; // b = b / a와 동일
		
		System.out.println(b); // 10

		// b와 a의 나눗셈 결과(나머지)를 다시 변수 b에 저장
//		b = b % a; // 10 % 10 = 0이 변수 b에 저장됨
		b %= a; // b = b % a와 동일
		
		System.out.println(b); // 0
		
	}

}









