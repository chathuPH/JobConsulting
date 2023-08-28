package com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.ConsultModel;

public class ConsultBA {

	public int CreateConsultRecord(ConsultModel model) {
	    int rowCount = -1;

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();

	        String query = "INSERT INTO JOC_CONSULTING(JOB_ID, US_ID, CON_DATE, CON_TIME) VALUES (?, ?, ?, ?)";
	        PreparedStatement pst = con.prepareStatement(query);

	        pst.setInt(1, model.getJobId());
	        pst.setInt(2, model.getUsId());
	        pst.setString(3, model.getConDate());
	        pst.setString(4, model.getConTime());

	        rowCount = pst.executeUpdate();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return rowCount;
	}
	
	public List<ConsultModel> GetConsultRecords() {
	    List<ConsultModel> responseModel = new ArrayList<>();

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();

	        String query = "SELECT * FROM JOC_CONSULTING";
	        PreparedStatement pst = con.prepareStatement(query);

	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            int id = rs.getInt("CON_ID");
	            int jobId = rs.getInt("JOB_ID");
	            int usId = rs.getInt("US_ID");
	            String conDate = rs.getString("CON_DATE");
	            String conTime = rs.getString("CON_TIME");
	            ConsultModel consult = new ConsultModel(id, jobId, usId, conDate, conTime);
	            responseModel.add(consult);
	        }

	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return responseModel;
	}

	public boolean DeleteConsultRecord(int recordId) {
	    boolean deleted = false;

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();

	        String query = "DELETE FROM JOC_CONSULTING WHERE CON_ID = ?";
	        PreparedStatement pst = con.prepareStatement(query);
	        pst.setInt(1, recordId);

	        int rowsAffected = pst.executeUpdate();

	        if (rowsAffected > 0) {
	            System.out.println("Consulting record with CON_ID " + recordId + " has been deleted.");
	            deleted = true;
	        } else {
	            System.out.println("No consulting record found with CON_ID " + recordId);
	        }

	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return deleted;
	}


}
