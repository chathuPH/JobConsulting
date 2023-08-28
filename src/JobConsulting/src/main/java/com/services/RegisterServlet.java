package com.services;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.UserBA;
import com.model.UserModel;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String cPassword = request.getParameter("cpassword");
		String mobile = request.getParameter("contact");
		String userType = request.getParameter("userType");
		
		
		RequestDispatcher dispatcher = null;
		
		try {

			HttpSession session = request.getSession();
			if (password.equals(cPassword)) {
				UserModel model = new UserModel(name, email, password, mobile,userType);
				UserBA userBA = new UserBA();
				
				int rowCount = userBA.CreateUser(model);

				dispatcher = request.getRequestDispatcher("login.jsp");
				
				if(rowCount > 0) {
					//request.setAttribute("status", true);
					//request.setAttribute("massage", "Registation is sucessfully.");
					
					session.setAttribute("status", true);
					session.setAttribute("massage", "Registation sucessfully.");
				}else {

//					request.setAttribute("status", false);
//					request.setAttribute("massage", "Registation failed.");
					
					session.setAttribute("status", false);
					session.setAttribute("massage", "Registation sucessfully.");
				}

				dispatcher.forward(request, response);
			}
			else {
				dispatcher = request.getRequestDispatcher("registration.jsp");
//				request.setAttribute("status", false);
//				request.setAttribute("massage", "Password and Confirm Password do not match");
				
				session.setAttribute("status", false);
				session.setAttribute("massage", "Password and Confirm Password do not match");
				
				LogError logger = LogError.getInstance();
		        logger.LogToConsole("Password and Confirm Password do not match");
				
				dispatcher.forward(request, response);
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
			LogError logger = LogError.getInstance();
	        logger.LogToConsole(ex.toString());
			
		}
	}

}
