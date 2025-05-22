package jsp09_servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * web.xml 파일에 서블릿 매핑 내용을 기술하지 않고 
 * 서블릿 클래스 정의 시 @WebServlet 어노테이션으로 매핑도 가능함
 * => 기본 문법 : @WebServlet("/서블릿주소") 또는 @WebServlet("*.패턴")
 * --------------------------------------------------------------------
 * 서블릿 클래스에서 @WebServlet 어노테이션을 적용 시 처음 한 번 서버 재시작 필요
 */
@WebServlet("/myServlet3")
public class TestServlet3 extends HttpServlet {
	// doGet(), doPost() 메서드 오버라이딩
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3 - doGet()");
		
		// GET 방식 요청으로 전달받은 파라미터(id, name)값 변수에 저장 후 콘솔에 출력하기
//		String id = request.getParameter("id");
//		String name = request.getParameter("name");
//		System.out.println("아이디(GET) : " + id);
//		System.out.println("이름(GET) : " + name);
		// -----------------------------------------------
		// 공통 모듈(메서드)인 doProcess() 메서드 호출(파라미터로 request, response 객체 전달)
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3 - doPost()");
		
		// POST 방식 요청으로 전달받은 파라미터(id, name)값 변수에 저장 후 콘솔에 출력하기
//		String id = request.getParameter("id");
//		String name = request.getParameter("name");
//		System.out.println("아이디(POST) : " + id);
//		System.out.println("이름(POST) : " + name);
		// -----------------------------------------------
		// 공통 모듈(메서드)인 doProcess() 메서드 호출(파라미터로 request, response 객체 전달)
		doProcess(request, response);
	}
	
	// doGet(), doPost() 메서드가 호출될 때 수행하는 작업이 별도로 구분할 필요가 없는 작업일 경우
	// 하나의 메서드로 통합(모듈화)하여 처리할 수 있다!
	// doProcess() 메서드 정의하여 공통 코드를 작성하고, doGet(), doPost() 메서드에서 doProcess() 호출
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3 - doProcess()");
		
		// GET 또는 POST 방식 요청으로 전달받은 파라미터(id, name)값 변수에 저장 후 콘솔에 출력하기
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		System.out.println("아이디 : " + id);
		System.out.println("이름 : " + name);
	}
	
	
}














