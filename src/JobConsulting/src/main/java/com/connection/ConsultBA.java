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

	        String query = "SELECT JC.*,JT.JOB_NAME,CUS.US_NAME FROM JOC_CONSULTING JC INNER JOIN JOC_JOB_TYPE JT ON JC.JOB_ID = JT.JOB_ID INNER JOIN JOC_USERS CUS ON JC.US_ID = CUS.US_ID;";
	        PreparedStatement pst = con.prepareStatement(query);

	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            int id = rs.getInt("CON_ID");
	            int jobId = rs.getInt("JOB_ID");
	            int usId = rs.getInt("US_ID");
	            String conDate = rs.getString("CON_DATE");
	            String conTime = rs.getString("CON_TIME");
	            String jobName = rs.getString("JOB_NAME");
	            String conName = rs.getString("US_NAME");
	            ConsultModel consult = new ConsultModel(id, jobId, usId, conDate, conTime,jobName,conName);
	            responseModel.add(consult);
	        }

	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return responseModel;
	}
	
	public int DeleteConsultRecord(int recordId) {
	    int rowCount = -1;

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();

	        String query = "DELETE FROM JOC_CONSULTING WHERE CON_ID = ?";
	        PreparedStatement pst = con.prepareStatement(query);

	        pst.setInt(1, recordId);

	        rowCount = pst.executeUpdate();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return rowCount;
	}


}
