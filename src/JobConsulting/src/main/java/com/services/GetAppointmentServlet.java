package com.services;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.AppointmentBA;
import com.google.gson.Gson;
import com.model.AppointmentModel;


@WebServlet("/get-appointment")
public class GetAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetAppointmentServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		try {

			AppointmentBA modelBA = new AppointmentBA();
            List<AppointmentModel> rowCount = modelBA.GetAppointmentRecords();

            if (rowCount != null) {
                response.setCharacterEncoding("UTF-8");
                response.setContentType("application/json");

                Gson gson = new Gson();
                String json = gson.toJson(rowCount);
                System.out.println("********** app list ************");
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
