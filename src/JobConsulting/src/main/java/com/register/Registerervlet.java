package com.register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.UserBA;
import com.model.JSAlert;
import com.model.UserModel;

/**
 * Servlet implementation class Registerervlet
 */
@WebServlet("/register")
public class Registerervlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cPassword = request.getParameter("cpassword");
		String mobile = request.getParameter("contact");
		//String chkBox = request.getParameter("name");
		
		
		RequestDispatcher dispatcher = null;
		
		try {
			if (password.equals(cPassword)) {
				UserModel model = new UserModel(name, email, password, mobile);
				UserBA userBA = new UserBA();
				
				int rowCount = userBA.CreateUser(model);
				
				dispatcher = request.getRequestDispatcher("login.jsp");
				
				if(rowCount > 0) {
					request.setAttribute("status", true);
				}else {

					request.setAttribute("status", false);
				}

				dispatcher.forward(request, response);
			}
			else {
				JSAlert jsAlert = new JSAlert();
				String errorMsg = "Password and Confirm Password do not match";
				jsAlert.AlertWithReload(errorMsg, response,"registration.jsp");
				
				dispatcher = request.getRequestDispatcher("registration.jsp");
				request.setAttribute("status", false);
				//dispatcher.forward(request, response);
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
