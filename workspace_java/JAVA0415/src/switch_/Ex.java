package switch_;

public class Ex {

	public static void main(String[] args) {
		/*
		 * switch문(switch ~ case문)
		 * - if문 처럼 특정 조건에 대해 여러가지 판별을 수행하는 조건문
		 *   => 단, if문과는 달리 범위에 대한 판별 등이 불가능하며
		 *      값에 대한 동등 비교만 가능함
		 * - switch문의 조건식에는 연산식 또는 변수, 리터럴 등이 올 수 있으나
		 *   반드시 정수 또는 문자열(또는 enum 타입 상수)만 사용 가능
		 *   => 이 중 정수는 byte, short, char, int 만 사용 가능
		 * - switch 문에서 지정한 조건에 맞는 값을 case 문에서 탐색하여
		 *   일치하는 값을 갖는 case 문의 문장을 실행함
		 *   이때, case 문에는 조건식 결과를 비교할 리터럴 1개만 명시함
		 * - 일치하는 case 문이 없을 경우 default 문을 찾아서 실행함
		 *   => else 문과 유사하며, 생략도 가능함
		 * - case 문의 문장 실행 후 break 문을 만나면 switch 문을 빠져나감
		 *   단, break 문이 없을 경우 다음 break 문을 만나거나
		 *   switch 문이 종료될 때까지 현재 문장의 아래쪽 모두 실행 문장을 실행
		 *   (다른 case 문과 default 문의 실행문까지 모두 실행)
		 * - case 문 끼리의 순서는 무관함  
		 *   
		 * < 기본 문법 >
		 * switch(조건식) { // 조건식에는 정수, 문자열(또는 enum 타입 상수) 사용
		 * 		case 값1 :
		 * 			// 조건식 결과가 값1과 일치하는 경우 실행할 문장들...
		 * 			[break;]
		 * 		case 값2 :
		 * 			// 조건식 결과가 값2와 일치하는 경우 실행할 문장들...
		 * 			[break;]
		 * 		case 값n :
		 * 			// 조건식 결과가 값n과 일치하는 경우 실행할 문장들...
		 * 			[break;]
		 * 		[default : // case 문 중 일치하는 값이 없을 경우 실행할 문장들...]
		 * }
		 *   
		 *   
		 */

		int num = 2;
		
		switch(num) {
			case 1 : System.out.println("num = 1");
			case 2 : System.out.println("num = 2");
			// num이 2 일 때 case 2의 문장을 실행하고 break 문이 없기 때문에
			// 아래쪽 case 3의 문장도 모두 실행한다!
			case 3 : System.out.println("num = 3");			
		}
		
		System.out.println("----------------------------------");
		
		num = 4;
		
		switch(num) {
			case 1 : System.out.println("num = 1");
			case 2 : System.out.println("num = 2");
			case 3 : System.out.println("num = 3");
			default : System.out.println("일치하는 case 문이 없음!");
		}
		
		System.out.println("----------------------------------");
		
		num = 1;
		switch(num) {
			case 1 :
				System.out.println("num = 1");
				break;
			case 2 :
				System.out.println("num = 2");
				break;
			case 3 :
				System.out.println("num = 3");
				break;
			default : System.out.println("일치하는 case 문이 없음!");
			// default 문 아래쪽에는 다른 실행문이 없으므로 break 문 생략 가능
		}
		
		System.out.println("---------------------------");
		
		// switch 문에 문자열 데이터 전달 시
		switch("KOREA") {
			case "대한민국" : System.out.println("대한민국!"); break;
			case "KOREA" : System.out.println("KOREA!"); break;
			case "한국" : System.out.println("한국!"); break;
			default : System.out.println("다른나라!"); 
		}
		
	}

}






