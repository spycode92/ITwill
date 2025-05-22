package jsp09_servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 현재 클래스(TestServlet1)는 web.xml(배포서술자) 파일에 "/myServlet1" 서블릿 주소와 매핑되어 있음
public class TestServlet1 extends HttpServlet {
	/*
	 * 서블릿 클래스 내에는 GET or POST 방식 요청에 대한 처리를 위해
	 * doGet() or doPost() 메서드 정의해야한다!
	 * => HttpServlet 클래스로부터 상속받아 오버라이딩
	 * => 만약, 두 메서드 중 필요한 요청에 대한 메서드가 정의되지 않았을 경우
	 *    해당 메서드와 일치하는 요청 방식으로 요청이 발생했을 때
	 *    응답 메세지로 HTTP 405(허용되지 않는 메서드) 오류가 발생함!
	 *    (단, 매핑되는 서블릿 주소가 없을 경우 HTTP 404(찾을 수 없는 페이지) 오류 발생)
	 */
	
	// 클라이언트 요청 메서드(HTTP method)가 GET 방식일 경우 doGet() 메서드를 자동으로 호출하고
	// POST 방식일 경우 doPost() 메서드를 자동으로 호출한다!
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// GET 방식 요청이 발생했을 때 자동으로 호출되는 메서드
		System.out.println("TestServlet1 - doGet()");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// POST 방식 요청이 발생했을 때 자동으로 호출되는 메서드
		System.out.println("TestServlet1 - doPost()");
	}
	
	
	
}













