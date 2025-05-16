package polymorphism;

public class Ex2 {
	public static void main(String[] args) {
		/*
		 * ������(polymorphism)
		 * - �ϳ��� ������Ÿ��(��������)���� ���� �ν��Ͻ� �����ϴ� Ư��
		 * - � �ν��Ͻ��� ��ĳ�����Ͽ� ����Ŭ���� Ÿ�� ������ �ٷ��
		 *   �ϳ��� ����Ŭ���� Ÿ������ ���� ����Ŭ���� Ÿ�� �ν��Ͻ��� �ٷ� �� ����
		 */
		
		//Circle �ν��Ͻ�(c)����
		Circle c = new Circle();
		c.circlePaint();
		
		//Rectangle �ν��Ͻ�(r)����
		Rectangle r = new Rectangle();
		r.draw();
		
		// Triangle �ν��Ͻ�(t)����
		Triangle t = new Triangle();
		t.design();
		
		System.out.println("==============================================");
		
		// ����Ŭ������ �޼��带 ��ӹ޾� �������̵� �ϴ� ���
		// �ڵ��� ���ϼ��� ���� �� �ִ�!
		
		c.draw();
		r.draw();
		t.draw();
		System.out.println("-----------------------------------");
		
		//�ڵ��� ���ϼ��� �� ����Ű�� ��� : ��ĳ���� Ȱ��
		// => Circle, Rectangle, Triangle�� ���� ����Ŭ������
		//    Shape Ÿ�� ��������(s)�� �� �ν��Ͻ� ��Ʈ�� ����
		// Circle -> Shape ��ĳ����
		Shape s = new Circle();
		s.draw(); //���� ���ε��� ���� Circle �ν��Ͻ��� draw() �޼��� ȣ��

		// Rectangle -> Shape ��ĳ����
		s = new Rectangle();
		s.draw(); //���� ���ε��� ���� Rectangle �ν��Ͻ��� draw() �޼��� ȣ��
		
		// Triangle -> Shape ��ĳ����
		s = new Triangle();
		s.draw(); //���� ���ε��� ���� Triangle �ν��Ͻ��� draw() �޼��� ȣ��
		
	}
} // Ex2 Ŭ���� ��

// ���� ������ Ư¡�� ���������� �����ϴ� ����Ŭ���� Shape ����
class Shape {
	// ���� ������ �������� '�׸���' ����� �����ϴ� draw �޼��� ����
	public void draw () {
		System.out.println("���� �׸���!");
	}
}

// Shape Ŭ������ ��ӹ޴� Circle Ŭ���� ����
class Circle extends Shape {
	
	
	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("�� �׸���!");
	}

	public void circlePaint() {
		System.out.println("�� �׸���!");
	}
}

// Shape Ŭ������ ��ӹ޴� Rectangle Ŭ���� ����
class Rectangle extends Shape{

	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("�簢�� �׸���!");
	}

	public void rdraw() {
		System.out.println("�簢�� �׸���!");
	}
}

// Shape Ŭ������ ��ӹ޴� Triangle Ŭ���� ����
class Triangle extends Shape{
	
	@Override
	public void draw() {
		System.out.println("�ﰢ�� �׸���!");
	}

	public void design() {
		System.out.println("�ﰢ�� �׸���!");
	}
}