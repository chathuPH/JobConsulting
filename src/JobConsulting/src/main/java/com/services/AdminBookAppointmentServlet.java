package com.services;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.AppointmentBA;
import com.model.AppointmentModel;


@WebServlet("/admin-book-appointment")
public class AdminBookAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public AdminBookAppointmentServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		System.out.println(request.getParameter("consultant"));
		int jobId = Integer.parseInt(request.getParameter("jobType"));
		int conId = Integer.parseInt(request.getParameter("consultant"));
		int userId = Integer.parseInt(request.getParameter("appUser"));
	
		RequestDispatcher dispatcher = null;
		
		try {
			AppointmentModel model = new AppointmentModel( 0, jobId, userId,conId, date,time,"","","","Pending");
			AppointmentBA modelBA = new AppointmentBA();
				
				int rowCount = modelBA.CreateAppointmentRecord(model);

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
