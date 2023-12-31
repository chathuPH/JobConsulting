package com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.JobTypeModel;
import com.model.UserModel;

public class UserBA {
	public int CreateUser(UserModel model) {
		int rowCount = -1;
		try {
			DataAccess dataAccess = new DataAccess();
			dataAccess.LoadDriver();
			Connection con = dataAccess.GetConnecion();
			String query = "insert into JOC_USERS(US_NAME,US_EMAIL,US_PASSWORD,US_MOBILE,US_TYPE) values (?,?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);

			pst.setString(1, model.getName());
			pst.setString(2, model.getEmail());
			pst.setString(3, model.getPassword());
			pst.setString(4, model.getMobile());
			pst.setString(5, model.getUserType());

			rowCount = pst.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return rowCount;

	}

	public UserModel LoginUser(UserModel model) {

		UserModel responceModel = null;

		try {
			DataAccess dataAccess = new DataAccess();
			dataAccess.LoadDriver();
			Connection con = dataAccess.GetConnecion();
			String query = "SELECT US_ID, US_NAME, US_EMAIL, US_MOBILE, US_TYPE FROM JOC_USERS WHERE US_EMAIL = ? AND US_PASSWORD = ?";
			PreparedStatement pst = con.prepareStatement(query);

			pst.setString(1, model.getEmail());
			pst.setString(2, model.getPassword());

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				responceModel = new UserModel(rs.getInt("US_ID"), rs.getString("US_NAME"),rs.getString("US_EMAIL"),"",rs.getString("US_MOBILE"),rs.getString("US_TYPE"));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return responceModel;

	}
	
	public List<UserModel> GetUsers() {

		List<UserModel> responseModel = new ArrayList<>();

		try {
			DataAccess dataAccess = new DataAccess();
			dataAccess.LoadDriver();
			Connection con = dataAccess.GetConnecion();
			String query = "SELECT US_ID, US_NAME, US_EMAIL, US_MOBILE, US_TYPE FROM JOC_USERS";
			PreparedStatement pst = con.prepareStatement(query);

			ResultSet rs = pst.executeQuery();
			
	        while (rs.next()) {
	            UserModel model = new UserModel(rs.getInt("US_ID"), rs.getString("US_NAME"),rs.getString("US_EMAIL"),"",rs.getString("US_MOBILE"),rs.getString("US_TYPE"));
	            responseModel.add(model);
	        }
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return responseModel;

	}
	
	
	public int DeleteUser(int id) {
	    int rowCount = -1;

	    try {
	        DataAccess dataAccess = new DataAccess();
	        dataAccess.LoadDriver();
	        Connection con = dataAccess.GetConnecion();

	        String query = "DELETE FROM JOC_USERS WHERE US_ID = ?";
	        PreparedStatement pst = con.prepareStatement(query);

	        pst.setInt(1, id);

	        rowCount = pst.executeUpdate();
	        con.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return rowCount;
	}

}
