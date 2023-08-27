package com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.JobTypeModel;

public class JobTypeBA {
	public int CreateJobType(JobTypeModel model) {
		int rowCount = -1;
		try {
			DataAccess dataAccess = new DataAccess();
			dataAccess.LoadDriver();
			Connection con = dataAccess.GetConnecion();
			String query = "insert into JOC_JOB_TYPE(JOB_NAME) values (?)";
			PreparedStatement pst = con.prepareStatement(query);

			pst.setString(1, model.getName());

			rowCount = pst.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rowCount;

	}

	public List<JobTypeModel> GetJobTypes() {
	    List<JobTypeModel> responseModel = new ArrayList<>();

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();
	        String query = "SELECT JOB_ID, JOB_NAME FROM JOC_JOB_TYPE";
	        PreparedStatement pst = con.prepareStatement(query);

	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            int jobId = rs.getInt("JOB_ID");
	            String jobName = rs.getString("JOB_NAME");
	            JobTypeModel jobType = new JobTypeModel(jobId, jobName);
	            responseModel.add(jobType);
	        }

	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return responseModel;
	}

	
	public boolean DeleteJobType(int jobId) {
	    boolean deleted = false;

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();

	        String query = "DELETE FROM JOC_JOB_TYPE WHERE JOB_ID = ?";
	        PreparedStatement pst = con.prepareStatement(query);
	        pst.setInt(1, jobId);

	        int rowsAffected = pst.executeUpdate();

	        if (rowsAffected > 0) {
	            System.out.println("Job type with JOB_ID " + jobId + " has been deleted.");
	            deleted = true;
	        } else {
	            System.out.println("No job type found with JOB_ID " + jobId);
	        }

	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return deleted;
	}

}
