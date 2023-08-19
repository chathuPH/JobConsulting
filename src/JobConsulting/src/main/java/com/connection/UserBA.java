package com.connection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.UserModel;

public class UserBA {
	public int CreateUser(UserModel model) {

		System.out.println("******** CreateUser Method invoked ********\n");
		int rowCount = -1;
		try {
			DataAccess dataAccess = new DataAccess();
			dataAccess.LoadDriver();
			Connection con = dataAccess.GetConnecion();
			String query ="insert into JOC_USERS(US_NAME,US_EMAIL,US_PASSWORD,US_MOBILE) values (?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1,model.getName());
			pst.setString(2,model.getEmail());
			pst.setString(3,model.getPassword());
			pst.setString(4,model.getMobile());

			rowCount = pst.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return rowCount;
		
	}
}
