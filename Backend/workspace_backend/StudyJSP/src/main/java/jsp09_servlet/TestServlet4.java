package jsp09_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// urlPatterns 속성값으로 매핑 주소를 지정(urlPatterns 속성만 있을 경우 속성명 생략)
// => urlPatterns 속성값은 배열 형태로, 복수개의 주소 매핑이 가능함
@WebServlet(description = "서블릿4", urlPatterns = { "/myServlet4", "/myServlet4-2" })
public class TestServlet4 extends HttpServlet {
	// /myServlet4 주소와 /myServlet4-2 서블릿 주소 요청 시 모두 매핑됨
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet4 - doGet()");
	}
	
}
