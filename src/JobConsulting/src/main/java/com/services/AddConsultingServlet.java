package com.services;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.ConsultBA;
import com.connection.UserBA;
import com.model.ConsultModel;

/**
 * Servlet implementation class AddConsultingServlet
 */
@WebServlet("/add-consult")
public class AddConsultingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddConsultingServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		
		int jobId = Integer.parseInt(request.getParameter("jobType"));
		//int userId = Integer.parseInt(request.getParameter("userId"));
		int userId = 0;
		
		
		
		RequestDispatcher dispatcher = null;
		
		
		try {

			HttpSession session = request.getSession();
			
			Object uidObj = session.getAttribute("userId");
			String uid = uidObj.toString();
			userId = Integer.parseInt(uid);

			ConsultModel model = new ConsultModel( 0, jobId, userId, date,time,"","");
			ConsultBA userBA = new ConsultBA();
				
				int rowCount = userBA.CreateConsultRecord(model);

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
