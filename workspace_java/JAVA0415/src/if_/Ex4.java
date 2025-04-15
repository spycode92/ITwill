package if_;

public class Ex4 {

	public static void main(String[] args) {
		/*
		 * 중첩 if문
		 * - if문(else if 또는 else 포함) 블록 내에서 
		 *   또 다른 if문을 사용하여 조건식을 판별하는 것
		 *   = if문 블록을 여러 번 중첩시키는 것
		 *   
		 * < 기본 문법 >
		 * if(조건식1) {
		 * 		if(조건식2) {
		 *			// 조건식1이 true이고, 조건식2도 true 일 때 실행 
		 * 		} else {
		 * 			// 조건식1이 true이고, 조건식2가 false 일 때 실행
		 * 		}
		 * } else {
		 * 		// 조건식1이 false 일 때 실행
		 * }
		 */
		
		int score = 85;
		String grade = "";
		
		if(score >= 0 && score <= 100) { // 점수의 범위가 0 ~ 100인지 판별
			if(score >= 90 && score <= 100) {
				grade = "A";
			} else if(score >= 80 && score <= 89) {
				grade = "B";
			} else if(score >= 70 && score <= 79) {
				grade = "C";
			} else if(score >= 60 && score <= 69) {
				grade = "D";
			} else if(score >= 0 && score <= 59) {
				grade = "F";
			}	
			System.out.println(score + "점의 학점 : " + grade);
			
		} else {
			System.out.println(score + " : 점수 입력 오류!");
		}
		
		System.out.println("----------------------------------");
		
		if(score >= 0 && score <= 100) { // 점수의 범위가 0 ~ 100인지 판별
			
			// 이미 0 ~ 100 사이의 점수만 입력 가능하므로
			if(score >= 90) { // 90이상일 때 자동으로 100이하가 적용됨
				grade = "A";
			} else if(score >= 80) {
				// 위의 조건이 거짓이면 자동으로 89이하(80 ~ 89)
				grade = "B";
			} else if(score >= 70) {
				// 위의 조건이 거짓이면 자동으로 79이하(70 ~ 79)
				grade = "C";
			} else if(score >= 60) {
				// 위의 조건이 거짓이면 자동으로 69이하(60 ~ 69)
				grade = "D";
			} else {
				// 위의 조건이 모두 거짓이면 자동으로 59 이하이고,
				// 이미 첫 번재 if문의 조건식에서 0 ~ 100 사이의 점수만 입력
				// 가능하므로 0 이상 59이하의 범위는 모두 else에 포함
				grade = "F";
			}	
			System.out.println(score + "점의 학점 : " + grade);
			
		} else {
			System.out.println(score + " : 점수 입력 오류!");
		}
		
		

	}

}
