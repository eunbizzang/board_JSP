package com.board.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.MemberDTO;

public class SignUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// get form values.
		request.setCharacterEncoding("UTF-8"); 
	    
        // getParameter()를 이용해 넘겨진 파라미터 값을 얻어올 수 있다.
        // 파라미터 값을 얻을때 name= 에 지정해둔 값과 동일한 값을 인자로 지정해야 된다.
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        System.out.println("birthday >>>" +birthday);
        String email1 = request.getParameter("email_1");
        String[] email = request.getParameterValues("email_2");
        String email2 = email[0];
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        MemberDTO dto = new MemberDTO();
        dto.setId(id);
        dto.setPassword(password);
        dto.setName(name);
        dto.setBirthday(birthday);
        dto.setMail1(email1);
        dto.setMail2(email2);
        dto.setPhone(phone);
        dto.setAddress(address);
        

		return null;
	}

}
