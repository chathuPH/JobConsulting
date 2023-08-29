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
import com.model.JobTypeModel;

import com.google.gson.Gson;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/get-job-type")
public class GetJobTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public GetJobTypeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		try {

			JobTypeBA userTypeBA = new JobTypeBA();
            List<JobTypeModel> rowCount = userTypeBA.GetJobTypes();

            if (rowCount != null) {
                //request.setAttribute("jobTypeList", rowCount);
                System.out.println("****** Job type founded *******");
                
                response.setCharacterEncoding("UTF-8");
                response.setContentType("application/json");

                Gson gson = new Gson();
                String json = gson.toJson(rowCount);

                
                
                System.out.println("JSON String: " + json); 
                System.out.println("****************************");
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
