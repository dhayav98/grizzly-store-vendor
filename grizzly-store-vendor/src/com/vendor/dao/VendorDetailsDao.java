package com.vendor.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import com.vendor.bean.VendorUserDetailsBean;

public class VendorDetailsDao {

	public static Connection connect() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/grizzly";
		conn = DriverManager.getConnection(url, "root", "root");
		return conn;

	}

	public VendorUserDetailsBean loginDetails(String userName) throws Exception {
		Connection conn = connect();
		String sql = "select * from vendor_user_details where user_name='"+userName+"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		VendorUserDetailsBean vendorUser = new VendorUserDetailsBean();
		if (rs.next()) {
			vendorUser.setUserId(rs.getInt(1));
			vendorUser.setUserName(rs.getString(2));
			vendorUser.setPassword(rs.getString(3));
			vendorUser.setAddress(rs.getString(4));
			vendorUser.setContact(rs.getLong(5));
			vendorUser.setRating(rs.getFloat(6));
			vendorUser.setStatus(rs.getInt(7));
		}
		return vendorUser;
	}
	
	public int checkStatus(String userName) throws Exception {
		int check = 0;
		Connection conn = connect();
		String sql = "UPDATE `grizzly`.`vendor_user_details` SET `status`='0' WHERE `user_name`='"+userName+"'";
		Statement stmt = conn.createStatement();
		check = stmt.executeUpdate(sql);
		return check;
	}

}
