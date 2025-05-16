package polymorphism;

public class Ex {
	public static void main(String[] args) {
		/*
		 * ���� ���ε�
		 * - ��� ���迡�� ��ĳ���� �� �޼��带 ȣ���� ��
		 *   ������(����) �ܰ迡���� ���� ���� ���� ���� �ܰ迡���� 
		 *   ���� ����� �޶����°�
		 * - ���� ������ Ÿ�԰� �����ϰ� ���� �ν��Ͻ��� �޼��带 �����ϰ� ��
		 */
		
		//����Ŭ���� Ÿ�� �ν��Ͻ� ����
		Parent p = new Parent();
		p.parentPrn();
		
		//���� Ŭ���� Ÿ�� �ν��Ͻ� ����
		Child c= new Child();
		c.parentPrn();
		c.childPrn();
		
		System.out.println("------------------------------------");
		
		//����Ŭ���� Ÿ�� �ν��Ͻ� - > ����Ŭ���� Ÿ������ ��ĳ����
		p = c ; // Child -> Parent
		// Parent p = (Parent) c;
		p.parentPrn(); // child�ν��Ͻ��� �������̵� �� �޼��尡 ȣ���
		
		System.out.println("==============================");
		�ڵ��� car = new �ڵ���();
		car.drive();
		������ dcar = new ������();
		dcar.drive();
		������ ecar = new ������();
		ecar.drive();
		
		System.out.println("-------------------------------------------");
		
		car = dcar; // ��ĳ����, �ڵ��� car = new �𠧶�();
		car.drive();
		car = ecar;
		car.drive();
	}
}
class Parent{
	
	public void parentPrn(){
		System.out.println("����Ŭ������ parentPrn()");
		
	}
}

class Child extends Parent{
	public void childPrn(){
		System.out.println("����Ŭ������ childPrn()");
	}

	@Override
	public void parentPrn() {
		System.out.println("����Ŭ�������� �������̵� �� parentPrn()");
	}
	
	
}

class �ڵ���{
	public void drive() {
		System.out.println("�ڵ����� �����ϴ�");
	}
}
class ������ extends �ڵ���{

	@Override
	public void drive() {
		System.out.println("�������� �����ϴ�");
	}
}

class ������ extends �ڵ���{

	@Override
	public void drive() {
		System.out.println("�������� �����ϴ�!");
	}
	
}