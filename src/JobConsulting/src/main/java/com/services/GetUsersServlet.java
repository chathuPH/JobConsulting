package com.services;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.JobTypeBA;
import com.connection.UserBA;
import com.google.gson.Gson;
import com.model.JobTypeModel;
import com.model.UserModel;

@WebServlet("/getUsers")
public class GetUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetUsersServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		try {

			UserBA modelBA = new UserBA();
            List<UserModel> rowCount = modelBA.GetUsers();
            System.out.println("******  started *******");
            if (rowCount != null) {
                response.setCharacterEncoding("UTF-8");
                response.setContentType("application/json");

                Gson gson = new Gson();
                String json = gson.toJson(rowCount);

                System.out.println("****** Users founded *******");
                System.out.println(json);
                
                response.getWriter().write(json);
                return; 
            }

            dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);

		} catch (Exception ex) {
			ex.printStackTrace();
            dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
		}
	}

}
