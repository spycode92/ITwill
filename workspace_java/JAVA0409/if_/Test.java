package if_;

public class Test {

	public static void main(String[] args) {
		// "아이티윌로 걸어서 출발!" 출력
		System.out.println("아이티윌로 걸어서 출발!");
		
		// money 변수 선언, 초기값 2000(원)
		int money = 2000;
		
		// 만약, 민경씨가 돈이 5천원 이상있다면 "택시타고 가기!" 출력
		if(money >= 5000) {
			System.out.println("택시타고 가기!");
		}
		
		// 돈이 5천원 미만이라면 "버스타고 가기!" 출력
		if(money < 5000) {
			System.out.println("버스타고 가기!");
		}
		
		// "아이티윌에 도착!" 출력
		System.out.println("아이티윌에 도착!");
		
		System.out.println("======================================");
		
		// if문 조건식에 비교연산자, 논리연산자 등을 조합하여 활용 가능
		int age = 19;

		// 1. 나이(age) 를 입력받아(변수 초기화) 20대인지 판별
		//    => 20대란? 나이(age)가 20 이상이고 나이(age)가 29이하(30미만)
		if(age >= 20 && age <= 29) {
			System.out.println("당신은 20대 입니다!");
		}
		
		// 2. 나이(age)를 입력받아 놀이동산 무료입장 여부 판별
		// => 무료입장 대상: 나이(age)가 5세 미만이거나 나이(age)가 65세 이상
		if(age < 5 || age >= 65) {
			System.out.println("당신은 무료입장 대상입니다!");
		}
		
		

	}

}





