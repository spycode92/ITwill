package data_type;

public class Ex3 {

	public static void main(String[] args) {
		// 2진수, 8진수, 10진수, 16진수 표현 방법
		// 1. 10진수 : 일반적인 정수 그대로 표현
		int num = 10; // 10진수 10을 변수 num에 저장
		System.out.println(num);
		
		// 2. 2진수 : 0 또는 1 숫자만 사용하며, 접두사 0b 붙임
		num = 0b1010; // 2진수 -> 10진수로 변환하여 저장됨
		System.out.println(num);
//		num = 0b1012;
		// => Syntax error on token "2", delete this token
		
		// 3. 8진수 : 0 ~ 7 사이의 숫자만 사용, 접두사 0 붙임
		num = 012; // 8진수 -> 10진수로 변환하여 저장됨
		System.out.println(num);
//		num = 018; // 오류 발생! 8 사용 불가!
		
		// 4. 16진수 : 0 ~ 9 사이의 숫자와 A ~ F 사이의 알파벳(0 ~ 15)
		//             접두사 0x 붙임
		num = 0xA; // 16진수 -> 10진수로 변환하여 저장됨
		num = 0xa; // 16진수 알파벳 대소문자 무관
		System.out.println(num);
//		num = 0xG; // 오류 발생! 16진수 알파벳은 A ~ F 까지만 사용

	}

}




