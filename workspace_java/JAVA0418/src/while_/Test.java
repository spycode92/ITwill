package while_;

public class Test {

	public static void main(String[] args) {
		// while문을 사용하여 구구단 2단 출력
		int dan = 2;
		int i = 1;
		
		System.out.println("< " + dan + "단 >");
		
		while(i <= 9) { // 조건식
			// 반복할 문장
			System.out.println(dan + " * " + i + " = " + (dan * i));
			i++; // 증감식
		}
		
		
		System.out.println("============================");
		
		// while문을 사용하여 정수 1 ~ 10까지 합(total)을 계산 후 출력
		
		// 누적변수 선언 및 초기화
		int total = 0;
		
		// 초기식
		int num = 1;
		
		// while문 작성
		while(num <= 10) { // 조건식
			total += num; // total = total + num;
			num++; // 증감식
		}
		
		// total 출력
		System.out.println("1 ~ 10까지 정수의 합 : " + total);
	}

}







