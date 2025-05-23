package array;

public class Ex {

	public static void main(String[] args) {
		/*
		 * 배열(array)
		 * - 같은 타입 데이터 여러 개를 하나의 묶음(변수)으로 다루는 메모리 공간
		 * 
		 * [ 특징 ]
		 * 1. 같은 타입 데이터만 저장 가능
		 * 2. 여러 변수에 해당하는 메모리 공간이 연속된 공간에 차례대로 생성됨
		 *    => 한 번 생성된 배열은 크기 변경 불가능
		 * 3. 기본 데이터타입과 참조 데이터타입 모두 배열로 사용 가능
		 * 4. 배열은 선언, 생성, 초기화의 3단계 과정을 거쳐서 사용
		 * 5. 배열 생성 시 각 공간에 해당하는 인덱스(번호)가 자동으로 부여됨
		 *    => 0부터 시작하여 배열 크기 -1까지 부여됨
		 * 6. 배열이 생성될 경우 배열의 데이터 저장 공간은
		 *    배열의 데이터타입에 해당하는 기본값으로 자동으로 초기화
		 *    (byte, short, int = 0, long = 0L, float = 0.0f, double = 0.0
		 *     char = 0 또는 '\u0000', boolean = false, String = null)
		 * 7. 배열의 이름(변수명)을 사용하여 배열에 접근 가능(인덱스 필요)
		 * 8. 배열의 크기는 배열명.length 속성을 통해 알아낼 수 있음
		 * 
		 * < 배열의 선언 기본 문법 >
		 * 데이터타입[] 변수명;
		 * => 변수 선언과 유사하나, 데이터타입 뒤에 [] 기호를 붙여 배열 표시
		 * => 배열 공간이 생성되기 전이므로, 아직 데이터 저장은 불가
		 * => 선언된 배열의 변수는 참조형 변수로 취급됨
		 *    (주의! int는 기본형이지만, int[]는 참조형)
		 *    
		 * < 배열의 생성 기본 문법 >
		 * 변수명 = new 데이터타입[배열크기];
		 * => new 키워드를 사용하여 배열 공간을 생성하는데
		 *    데이터타입 뒤의 대괄호 안에 생성할 배열의 크기를 명시
		 * => 생성되는 배열의 위치(주소값)를 선언된 배열 타입 변수에 저장
		 * => 이제, 실제 메모리 공간이 생성되었으므로 데이터 저장이 가능
		 * => 생성된 배열에는 자동으로 인덱스 번호가 부여됨
		 *    (인덱스 번호는 0 ~ 배열크기 -1까지 자동으로 부여됨)
		 *    
		 * < 배열 선언 및 생성을 하나의 문장으로 결합 >
		 * 데이터타입[] 변수명 = new 데이터타입[배열크기];
		 * 
		 * < 배열 접근 기본 문법 >
		 * 변수명[인덱스]
		 * => 변수명에 해당하는 주소(배열 공간)에 접근한 뒤
		 *    인덱스에 해당하는 데이터 저장 공간에 접근
		 * => 배열에 데이터 초기화(저장) 시
		 *    변수명[인덱스] = 데이터;
		 *    
		 * < 반복문을 통해서 배열의 모든 인덱스 접근 기본 공식 >
		 * for(int i = 0; i < 배열명.length; i++) {
		 * 		// 배열명[i] 형태로 접근
		 * }
		 *   
		 */
		
		// 학생 점수 5개를 별도의 변수에 저장하고 관리하는 경우
		int score1 = 90, score2 = 60, score3 = 80, score4 = 100, score5 = 50;
		int scoreTotal = score1 + score2 + score3 + score4 + score5;
		// ==================================================================
		
		// 학생 점수 5개(정수)를 저장할 배열(score) 선언 및 생성, 초기화
		// 1. 배열 선언 : 데이터타입[] 배열명;
//		int[] score; // int형 정수 여러 개를 저장할 배열 score를 선언
		// => 아직 데이터를 저장할 수 있는 메모리 공간은 생성되기 전
//		score = 90; // 오류 발생! 배열 이름으로 사용되는 변수에 데이터 저장 불가!
		// => Type mismatch: cannot convert from int to int[]
		
		// 2. 배열 생성 : 변수명(배열명) = new 데이터타입[배열크기];
//		score = new int[5];
		// 연속적인 int형 배열 공간 5개를 생성하고
		// 해당 공간의 메모리 주소를 int[] 타입 변수 score에 저장
		// => 이때 5개의 메모리 공간에는 각각의 인덱스 번호가 자동으로 부여됨
		//    인덱스 번호는 0 ~ 4 까지 부여됨
		
		// 배열 선언 및 생성을 하나의 문장으로 결합
		int[] score = new int[5];
		
		// 배열에 접근하여 각 배열 공간의 데이터 출력
		// => 배열명이 score 이므로 score[인덱스] 형식으로 접근
//		System.out.println(score); // 배열명 그대로 출력 시 주소값 출력(데이터 X)
		System.out.println(score[0]); // score 배열의 0번 인덱스 데이터 값 출력
		System.out.println(score[1]); // score 배열의 1번 인덱스 데이터 값 출력
		System.out.println(score[2]); // score 배열의 2번 인덱스 데이터 값 출력
		System.out.println(score[3]); // score 배열의 3번 인덱스 데이터 값 출력
		System.out.println(score[4]); // score 배열의 4번 인덱스 데이터 값 출력
		// => 이때, 배열은 자동으로 기본값으로 초기화 되고, 현재 int 이므로 0 출력됨
		
		/*
		 * 주의! 생성된 배열의 인덱스 범위를 벗어나는 배열 접근 시 오류 발생!
		 * => 단, 문법적으로 오류가 아니기 때문에 코드 상에서는 알 수 없고,
		 *    프로그램 실행 시점에서 오류가 발견됨
		 */
//		System.out.println(score[5]);
		// => java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
		// => ArrayIndexOutOfBoundsException : Index 5 : 5 번 인덱스가 범위를 벗어남
		//    at array.Ex.main(Ex.java:95) : Ex.java 클래스의 95번 라인이 오류!
		
		// 3. 배열에 데이터 저장(초기화) => 90, 60, 80, 100, 50
		score[0] = 90;
		score[1] = 60;
		score[2] = 80;
		score[3] = 100;
		score[4] = 50;
//		score[5] = 100; // 존재하지 않는 인덱스 접근. 실행 시 오류 발생!
		
		System.out.println(score[0]); // score 배열의 0번 인덱스 데이터 값 출력
		System.out.println(score[1]); // score 배열의 1번 인덱스 데이터 값 출력
		System.out.println(score[2]); // score 배열의 2번 인덱스 데이터 값 출력
		System.out.println(score[3]); // score 배열의 3번 인덱스 데이터 값 출력
		System.out.println(score[4]); // score 배열의 4번 인덱스 데이터 값 출력
		
		System.out.println("--------------------------------------------------");
		
		// for문을 사용하여 인덱스 범위(0 ~ 4)까지 반복하면서
		// 출력문을 통해 배열 인덱스에 차례대로 접근하여 데이터 출력
//		for(int i = 0; i < 5; i++) { // for(int i = 0; i <= 4; i++) 동일
//			// 0 ~ 4까지 1씩 증가하면서 제어변수 i를 인덱스 번호로 활용 가능
//			System.out.println(score[i]); // score[0] ~ score[4] 까지 대응
//		}
		// => 배열의 모든 인덱스 접근 시 조건식에 배열 크기를 직접 저장할 겨웅
		//    배열 크기가 변경되면 조건식 코드도 다시 변경해야 한다!
		
		// 배열명.length 속성을 사용하여 배열의 크기(길이)를 알아낼 수 있다.
		System.out.println("배열 score의 크기 : " + score.length);
		// => 배열의 크기값이 반복문의 조건식으로 활용되면
		//    배열 크기가 변경되더라도 동적으로 대응이 가능

		// 배열 전체 전급 시 기본 공식을 사용하여 배열 데이터 모두 출력
		for(int i = 0; i < score.length; i++) { // for(int i = 0; i <= 4; i++) 동일
			// 0 ~ 4까지 1씩 증가하면서 제어변수 i를 인덱스 번호로 활용 가능
			System.out.println(score[i]); // score[0] ~ score[4] 까지 대응
		}
		
		// 배열 선언 시 [] 기호 위치에 따른 차이점
		int[] arr1, arr2; // arr1, arr2는 모두 int[] 타입 변수로 선언됨
		int arr3, arr4[]; // arr3은 int, arr4는 int[] 타입 변수로 선언됨
		// => 따라서, 자바에서는 추천하는 문법(데이터 타입 뒤 [] 명시) 사용 권장
		
	}

}




