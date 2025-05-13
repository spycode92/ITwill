package scanner;

import java.util.Scanner;

public class Test {

	public static void main(String[] args) {
		/*
		 * Scanner 클래스를 활용하여
		 * 사용자의 이름(inputName)을 입력받고 "OOO 님 환영합니다!"
		 * 를 출력해보자!
		 * (사용자의 이름을 입력하지 않고 엔터키를 입력하면
		 *  "이름을 입력하세요!" 출력)
		 * - if 조건식 작성 시 equals() 메서드 사용!
		 *   => 문자열의 비교 시 equals() 메서드를 사용함!!
		 */
		
		Scanner scan = new Scanner(System.in);
		String inputName;
		
		System.out.print("사용자 이름을 입력하세요 : ");
		inputName = scan.nextLine();
		
		if(!inputName.equals("")) {
			System.out.println(inputName + "님 환영합니다!");
		} else {
			System.out.println("이름을 입력해주세요!");
		}

	}

}





