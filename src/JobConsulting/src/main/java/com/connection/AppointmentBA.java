package com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.AppointmentModel;

public class AppointmentBA {
	public int CreateAppointmentRecord(AppointmentModel model) {
	    int rowCount = -1;

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();

	        String query = "INSERT INTO JOC_APPOINTMENT(JOB_ID, US_ID, CON_ID, APP_DATE, APP_TIME,APP_STATE) VALUES (?, ?, ?, ?, ?,?)";
	        PreparedStatement pst = con.prepareStatement(query);

	        pst.setInt(1, model.getJobId());
	        pst.setInt(2, model.getUsId());
	        pst.setInt(3, model.getConId());
	        pst.setString(4, model.getDate());
	        pst.setString(5, model.getTime());
	        pst.setString(6, model.getState());

	        rowCount = pst.executeUpdate();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return rowCount;
	}
	
	public int DeleteApointment(int appId) {
	    int rowCount = -1;

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();

	        String query = "DELETE FROM JOC_APPOINTMENT WHERE APP_ID = ? ";
	        PreparedStatement pst = con.prepareStatement(query);

	        pst.setInt(1, appId);

	        rowCount = pst.executeUpdate();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return rowCount;
	}

	public List<AppointmentModel> GetAppointmentRecords() {
	    List<AppointmentModel> responseModel = new ArrayList<>();

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();

	        String query = "SELECT AP.APP_ID,AP.JOB_ID,JT.JOB_NAME,AP.CON_ID,US.US_NAME AS CON_NAME,AP.US_ID,AUS.US_NAME,AP.APP_DATE,AP.APP_TIME,AP.APP_STATE FROM JOC_APPOINTMENT AS AP INNER JOIN JOC_JOB_TYPE JT ON AP.JOB_ID = JT.JOB_ID INNER JOIN JOC_USERS US ON AP.CON_ID = US.US_ID INNER JOIN JOC_USERS AUS ON AP.US_ID = AUS.US_ID;";
	        PreparedStatement pst = con.prepareStatement(query);

	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            int appId = rs.getInt("APP_ID");
	            int jobId = rs.getInt("JOB_ID");
	            String jobName = rs.getString("JOB_NAME");
	            int conId = rs.getInt("CON_ID");
	            String conName = rs.getString("CON_NAME");
	            int usId = rs.getInt("US_ID");
	            String usName = rs.getString("US_NAME");
	            String date = rs.getString("APP_DATE");
	            String time = rs.getString("APP_TIME");
	            String state = rs.getString("APP_STATE");
	            AppointmentModel appointment = new AppointmentModel(appId, jobId, usId, conId, date, time,jobName,conName,usName,state);
	            responseModel.add(appointment);
	        }

	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return responseModel;
	}

	public boolean DeleteAppointmentRecord(int appId) {
	    boolean deleted = false;

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();

	        String query = "DELETE FROM JOC_APPOINTMENT WHERE APP_ID = ?";
	        PreparedStatement pst = con.prepareStatement(query);
	        pst.setInt(1, appId);

	        int rowsAffected = pst.executeUpdate();

	        if (rowsAffected > 0) {
	            System.out.println("Appointment record with APP_ID " + appId + " has been deleted.");
	            deleted = true;
	        } else {
	            System.out.println("No appointment record found with APP_ID " + appId);
	        }

	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return deleted;
	}

}
