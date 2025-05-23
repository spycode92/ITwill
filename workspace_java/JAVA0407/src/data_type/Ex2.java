package data_type;

public class Ex2 {

	public static void main(String[] args) {
		/*
		 * 문자형 데이터 타입 : char
		 * - 내부적으로 정수형 데이터로 취급됨
		 * - 2Byte(16bit) 크기의 범위로 사용되며
		 *   정수 범위 0 ~ 65535 사이의 값을 가진다. (음수 사용 X)
		 *   (short 정수형 타입은 -32768 ~ +32767)
		 * - 문자 표현 시 1개의 문자를 작은따옴표('')로 둘러싸서 표현
		 *   => 작은따옴표 내의 문자 1개가 정수형으로 변환되어 처리됨
		 *      ex) 'A'는 정수 65로 처리됨
		 * - 유니코드 표현 방법을 사용
		 *   => Unicode(유니코드) : 전 세계의 모든 문자를 표현하기 위한 체계
		 *   => 아스키코드를 기반으로 나머지 문자를 추가하여 만든 코드 체계
		 *      아스키코드(ASCII, 7bit) : 미국 표준 문자 코드
		 *      'A' = 65, 'a' = 97, '0' = 48
		 *   => 10진수로 된 코드값을 사용하지만, 입력 시 16진수 코드 4자리 이용
		 *      '\'기호와 'u'를 쓰고 16진수 XXXX 형태의 유니코드 값 표현 방법 이용
		 *      ex) \uABCD   
		 */
		
		// char 타입 변수 ch를 선언하고 대문자 A를 저장 후 출력
		char ch = 'A';
		System.out.println(ch);
		
		// char 타입 리터럴을 표기하기 위해서 작은따옴표로 둘러싸며
		// 작은따옴표 사이에는 반드시 1개의 문자가 포함되어야 함!
//		ch = 'ABC'; // 두 글자 이상 사용 불가!
//		ch = ''; // 반드시 1개의 문자가 포함되어야 함!
		
		ch = ' '; // 공백 사용 가능
		ch = 65; // 10진수 코드값으로 지정도 가능함(정수 65 = 'A')
		ch = 97;
		System.out.println(ch);
		
		ch = '\u0041'; // 유니코드 표기법
		// => 16진수 0041 = 10진수 65
		System.out.println(ch);
		
		// 한글 등 다른 나라 문자도 표현 가능
		ch = '가';
		System.out.println(ch);
		
		ch = '\uAC00';
		System.out.println(ch);

		ch = '\uAC01';
		System.out.println(ch);
		
		/*
		 * 문자열을 저장하기 위한 데이터타입 : String
		 * - 기본 데이터타입이 아닌 참조 데이터타입(메모리 크기가 모두 4Byte)
		 * - 문자 데이터를 표현하는 char 타입은
		 *   1개의 문자만을 작은따옴표('')로 둘러싸지만
		 *   문자열 데이터를 표현하는 String 타입은
		 *   0개 이상의 문자열을 큰따옴표("")로 둘러싸서 표현함
		 *   => 아무 문자도 표현하지 않는 "" 문자열을
		 *      널스트링(null String)이라고 함.
		 */
		
		String str = "Hello, World!";
		System.out.println(str);
		
		str = ""; // 널스트링(0개의 문자가 포함된 문자열)
		System.out.println(str);
		
		str = "A"; // char 타입 대문자 'A'와 완전히 다른 데이터로 취급됨
		System.out.println(str);
		
		
	}

}








