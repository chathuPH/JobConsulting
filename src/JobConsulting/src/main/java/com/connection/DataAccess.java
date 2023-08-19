package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataAccess {
	private String dbURL = "jdbc:mysql://localhost:3306/JobConsulting?useSSL=false";
	private String dbUserName = "root";
	private String dbuserPassword = "root";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public DataAccess() {
		super();
	}

	public void  LoadDriver() {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection GetConnecion() {
		Connection con = null;
		try {
			//LoadDriver();
			con = DriverManager.getConnection(dbURL,dbUserName,dbuserPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	
	
}
