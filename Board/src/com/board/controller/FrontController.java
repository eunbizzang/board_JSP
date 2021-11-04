package com.board.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.action.Action;
import com.board.action.ActionForward;

public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, 
				HttpServletResponse response) throws IOException, ServletException {
	
		// 1.Encoding
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
				
		// getRequestURI() : return project's name and file's name.
		// ex) Board/*do
		String uri = request.getRequestURI();
		System.out.println("URI >>> " + uri);
				
		// getContextPath() : returns project's name
		// ex) Board
		String path = request.getContextPath();
		System.out.println("PATH >>> " + path);
				
		// command returns *.do.
		String command = uri.substring(path.length() + 1);
		System.out.println("Command >>> " + command);
				
		Action action = null;
		ActionForward forward = null;
				
		Properties prop = new Properties();
				
		

		FileInputStream fis = 
				new FileInputStream("C:\\NCS\\workspace(jsp)\\Board\\src\\com\\board\\controller\\mapping.properties");
		
		prop.load(fis);
		
		String value = prop.getProperty(command);
		System.out.println("Value >>> " + value);

		if(value.substring(0, 7).equals("execute")) {
			StringTokenizer st = new StringTokenizer(value, "|");
			String url_1 = st.nextToken();   // "execute"
			String url_2 = st.nextToken();   // "패키지명.클래스명"
			
			try {
				Class url = Class.forName(url_2);
				
				// 동적으로 객체 생성하는 방법
				action = (Action)url.newInstance();
				forward = action.execute(request, response);
				System.out.println("FrontController forward 주소 >>> " + forward);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {  // value 값이 "execute"가 아닌 경우
			// view page로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
		}
		
		
		if(forward != null) {
			if(forward.isRedirect()) {  // true인 경우
				response.sendRedirect(forward.getPath());
			}else {  // false는 View Page로 이동
				RequestDispatcher rd = 
						request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}
}
