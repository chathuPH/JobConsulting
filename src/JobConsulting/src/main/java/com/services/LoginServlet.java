package com.services;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.UserBA;
import com.model.UserModel;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				String email = request.getParameter("email");
				String password = request.getParameter("password");
		
				RequestDispatcher dispatcher = null;
				HttpSession session = request.getSession();
		
				try {
		
					UserModel model = new UserModel(0,"", email, password, "","");
					UserBA userBA = new UserBA();
					UserModel rowCount = userBA.LoginUser(model);
		
					
					if (rowCount != null) {
						dispatcher = request.getRequestDispatcher("index.jsp");
						
						//request.setAttribute("status", true);
						//request.setAttribute("massage", "Login sucessfully.");
						
		
						session.setAttribute("status", true);
						session.setAttribute("massage", "Login sucessfully.");
						session.setAttribute("email", rowCount.getEmail());
						session.setAttribute("name", rowCount.getName());
						session.setAttribute("userType", rowCount.getUserType());
						session.setAttribute("userId", rowCount.getId());
						
						
					} else {
						dispatcher = request.getRequestDispatcher("login.jsp");
						session.setAttribute("status", false);
						session.setAttribute("massage", "Login failed.");
						
						LogError logger = LogError.getInstance();
				        logger.LogToConsole("Login failed.!");
		
					}
		
					dispatcher.forward(request, response);
		
				} catch (Exception ex) {
					ex.printStackTrace();
		
					dispatcher = request.getRequestDispatcher("login.jsp");
					session.setAttribute("status", false);
					session.setAttribute("massage", "Login failed.");
					
					LogError logger = LogError.getInstance();
			        logger.LogToConsole("Login failed.!");
				}
	}

}
