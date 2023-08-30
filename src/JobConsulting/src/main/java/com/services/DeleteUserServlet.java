package com.services;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.UserBA;


@WebServlet("/delete-user")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteUserServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int appId = Integer.parseInt(request.getParameter("appId"));
		RequestDispatcher dispatcher = null;
		
		try {
			UserBA modelBA = new UserBA();
			int rowCount = modelBA.DeleteUser(appId);

			dispatcher = request.getRequestDispatcher("index.jsp");
			
			if(rowCount > 0) {
				request.setAttribute("status", true);
			}else {
				request.setAttribute("status", false);
			}

			dispatcher.forward(request, response);
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
