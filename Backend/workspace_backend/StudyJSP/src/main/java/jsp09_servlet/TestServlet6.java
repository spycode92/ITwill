package jsp09_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.funny")
public class TestServlet6 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	// doGet(), doPost() 메서드 모듈화를 통해 공통 작업을 수행하는 doProcess() 메서드 정의
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet6 - doProcess()");
		
		/*
		 * 요청 주소(URL)가 특정 패턴으로 된 주소(현재 패턴 : *.funny)일 경우
		 * 해당 요청 주소를 판별하여 각각 다른 작업을 수행할 수 있다!
		 * ex) studentList.funny => 학생 목록 조회, joinForm.funny : 회원가입 폼 출력 등
		 * 이 때, 요청 주소를 추출하기 위해서는 HttpServletRequest 객체의
		 * getServletPath() 메서드 호출하여 서블릿 주소를 리턴받아 문자열 판별을 통해 주소 구분
		 */
		System.out.println("요청 URL : " + request.getRequestURL());
		// => 요청 URL : http://localhost:8080/StudyJSP/test.funny
		
		// getServletPath() 메서드는 요청 URL 중에서 
		// 컨텍스트 루트(Context Root = 프로젝트명) 까지를 제외한 뒷부분만 추출됨
		System.out.println("요청 서블릿 주소 : " + request.getServletPath());
		// => 요청 서블릿 주소 : /test.funny
		
		
		
	}
	

}












