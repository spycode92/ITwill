package reference_type_conversion;

public class Ex2 {

	public static void main(String[] args) {
		/*
		 * instanceof ������
		 * - �º��� ��ü(��������)�� �캯 Ŭ������ Ÿ������ �Ǻ��ϴ� ������
		 * - ���������� �θ� ��ü�� �����ϴ��� �ڽ� ��ü�� �����ϴ����� �Ǻ��� �� ����
		 * - �Ǻ� ����� true �̸� ����ȯ ������ ����(��ĳ���� or �ٿ�ĳ����)
		 *   �Ǻ� ����� false �̸� ����� ����ȯ �Ұ���!
		 * - �캯�� Ŭ���� Ÿ�԰� ���ų� �캯 Ŭ���� Ÿ���� �ڽ� Ÿ�� ��� ����
		 * - A is a B = A instanceof B
		 * - �Ǻ� ����� boolean Ÿ�� ������ �����ϰų�
		 *   if���� �Ǻ��ϴ� ������ ���� ��� ����
		 * 
		 * < �⺻ ���� >
		 * if(A instanceof B) { // A�� ��������(��ü), B�� Ŭ������(Ÿ��)
		 *		// ����ȯ�� ������ �����̹Ƿ� ��ȯ ����
		 * } else {
		 * 		// ����� ����ȯ�� �Ұ����� �����̹Ƿ� ��ȯ ���� X
		 * }
		 */
		
		SmartPhone sp = new SmartPhone("������ s25", "010-1234-5678", "�ȵ���̵�");
		
		// ȣ�� ������ �޼��� : 3��
		sp.call();
		sp.sms();
		sp.kakaoTalk();
		
		// sp�� SmartPhone �Դϱ�? YES
		// sp is a SmartPhone
		if(sp instanceof SmartPhone) {
			System.out.println("sp�� SmartPhone �̴�!");
			// sp�� SmartPhone Ÿ�� ������ ���� �����ϴ�.
			SmartPhone phone = sp;
		} else {
			System.out.println("sp�� SmartPhome�� �ƴϴ�!");
		}
		
		System.out.println("---------------------------------------");
		
		// ��ĳ���� ���� ��� Ȯ��
		// sp�� HandPhone �Դϱ�?
		// sp ia a HandPhone?
		if(sp instanceof HandPhone) {
			System.out.println("sp�� HandPhone �̴�!");
			System.out.println("�׷��Ƿ� sp�� HandPhone���� ����ȯ �����ϴ�!");
			
			// sp -> HandPhone Ÿ��(hp)���� ��ȯ
			HandPhone hp = sp; // ��ĳ���� = ������ ����ȯ
			System.out.println("sp�� HandPhone�� ���� ��� ����� �����Ѵ�!");
			System.out.println("���� ��ĳ���� ���Ŀ��� HandPhone�� ��� ��� ����");
			
			hp.call();		// HandPhone�� ����� ��ȭ ��ɰ�
			hp.sms();		// ���� ����� ����� �� ������
//			hp.kakaoTalk();	// SmartPhone�� ����� ����� �����ؾ� �Ѵ�!
		} else {
			System.out.println("sp�� HandPhone�� �ƴϴ�!");
		}
		
		System.out.println("--------------------------------------");
		
		// �ٿ� ĳ���� ���� ��� Ȯ��
		// ����Ŭ���� Ÿ�� �ν��Ͻ� ����
		HandPhone hp = new HandPhone("�ִ���", "011-222-2222");
		
		// hp�� SmartPhone �Դϱ�?
		if(hp instanceof SmartPhone) {
			System.out.println("hp�� SmartPhone �Դϴ�!");
			SmartPhone s = (SmartPhone)hp; // ���ǽ� false �̹Ƿ� ������� ����!
		} else {
			System.out.println("hp�� SmartPhone�� �ƴϴ�!");
			System.out.println("�׷��Ƿ� SmartPhone ���� ��ȯ �Ұ���!");
			System.out.println("hp�� SmartPhone�� ���� ����� ��� �������� ����!");
		}
		
		System.out.println("---------------------------------------");
		
		// �ٿ�ĳ���� ���� ��� Ȯ��(������ ���)
		// SmartPhone -> HandPhone(hp2)���� ��ĳ����
		HandPhone hp2 = new SmartPhone("������ s25", "010-1111-2222", "�ȵ���̵�");
		
		// ��ĳ���� �Ŀ��� ���� ���� ��ҷ� ���� ������ �پ��� ��
		hp2.call();
		hp2.sms();
//		hp2.kakaoTalk(); // ���� �Ұ�!
		
		// hp2�� SmartPhone �Դϱ�?
		if(hp2 instanceof SmartPhone) {
			System.out.println("hp2�� SmartPhone �̴�!");
			System.out.println("�׷��Ƿ� hp2�� SmartPhone ���� ����ȯ ����!");
			
//			SmartPhone sp2 = hp2; // �ڵ�����ȯ �Ұ���!
			SmartPhone sp2 = (SmartPhone)hp2; // ��������ȯ
			
			System.out.println("sp2�� SmartPhone�� ���� ��� ����� �����Ѵ�!");
			sp2.call();			// HandPhone�� ����� ��ȭ ��ɰ�
			sp2.sms();			// ���� ����� ����� �� ������
			sp2.kakaoTalk();	// SmartPhone�� ��ɵ� �ٽ� ����� ����������!
			
			System.out.println("---------------------------------------------");
			
			// Ex���� ������ Parent�� Child�� ����Ͽ� instanceof ������ ����
			// ��ĳ���ð� �ٿ�ĳ���� �� ����ȯ�� �ٷ� �������� �ʰ�
			// instanceof �����ڸ� ���� �˻� �� ����
			
			// �ڵ� ����ȯ
			Child c = new Child();
			
			// Child -> Parent �ڵ� ����ȯ�� ����������
			// ����ȯ�� �ٷ� �������� �ʰ�, instanceof �����ڸ� ���� �˻� �� ����
			if(c instanceof Parent) {
				System.out.println("c�� Parent �̴�!");
				
				// ����ȯ ����
				Parent p = c; // ��ĳ����
				p.parentPrn();
			} else {
				System.out.println("c�� Parent�� �ƴϴ�!");
			}
			
			System.out.println("------------------------------------");
			
			// ����� ����ȯ
			Parent p2 = new Parent();
			
			// Parent -> Child ��ȯ ���� ���� �Ǻ� �� ��ȯ
			if(p2 instanceof Child) {
				System.out.println("p2�� Child �̴�!");
				
				// ����ȯ ����
//				Child c2 = p2;
				Child c2 = (Child) p2; // �ٿ�ĳ����
				c2.parentPrn();
				c2.childPrn();	
			} else {
				System.out.println("p2�� Child�� �ƴϴ�!");
			}
			
			
			
		}
		
		
	

	}

}

class HandPhone { // = class HandPhone extends Object
	String modelName;
	String phoneNumber;
	
	// �Ķ���� ������ : Alt + Shift + S -> O
	public HandPhone(String modelName, String phoneNumber) {
		super();
		this.modelName = modelName;
		this.phoneNumber = phoneNumber;
	}
	
	public void call() {
		System.out.println("��ȭ ���!");
	}
	
	public void sms() {
		System.out.println("���� ���!");
	}
	
}

class SmartPhone extends HandPhone {
	String osName;
	
	// �𵨸�, ��ȭ��ȣ, �ü���� ���޹޾� �Ķ���� ������ ����
	// => �𵨸�� ��ȭ��ȣ�� ����Ŭ������ �����ڸ� ���� ��� �ʱ�ȭ ����
	public SmartPhone(String modelName, String phoneNumber, String osName) {
		super(modelName, phoneNumber);
		this.osName = osName;
	}
	
	public void kakaoTalk() {
		System.out.println("ī�� ���!");
	}
}














