package com.vendor.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.vendor.bean.Display2Bean;
import com.vendor.bean.DisplayBean;
import com.vendor.bean.ProductDetailsBean;

public class ProductDetailsDao {

	public static Connection connect() throws Exception {
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/grizzly";
		conn = DriverManager.getConnection(url, "root", "root");
		return conn;

	}

	public int insert(ProductDetailsBean product) throws Exception {
		Connection conn = connect();
		String sql = "INSERT INTO `product_details` (`product_id`, `category`, `product_name`, `Description`, `price`) VALUES (?,?,?,?,?)";
		String sql1 = "INSERT INTO `vendor_details` (`product_id`) values (?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		PreparedStatement pstmt1 = conn.prepareStatement(sql1);
		int insertStatus = 0;
		pstmt.setInt(1, product.getProdId());
		pstmt.setString(2, product.getCategory());
		pstmt.setString(3, product.getProdName());
		;
		pstmt.setString(4, product.getDescription());
		pstmt.setInt(5, product.getPrice());
		pstmt1.setInt(1, product.getProdId());
		insertStatus = pstmt.executeUpdate();
		if (insertStatus == 0) {
			System.out.println("Error in insertion of product");
			return insertStatus;
		} else
			pstmt1.executeUpdate();
		return insertStatus;
	}

	public List<DisplayBean> readAll() throws Exception {
		List<DisplayBean> displayList = new ArrayList<DisplayBean>();
		Connection conn = connect();
		String readQuery = "select product_details.product_name,product_details.product_id,brand_table.brand_name,product_details.category,vendor_details.offer,product_details.rating, product_details.Description,product_details.price from product_details inner join brand_table  inner join vendor_details where product_details.brand_id=brand_table.brand_id and product_details.product_id=vendor_details.product_id order by product_id;";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		while (rs.next()) {
			DisplayBean display = new DisplayBean();
			display.setProdName(rs.getString(1));
			display.setProdId(rs.getInt(2));
			display.setBrandName(rs.getString(3));
			display.setCategory(rs.getString(4));
			display.setOffer(rs.getFloat(5));
			display.setRating(rs.getFloat(6));
			display.setDescription(rs.getString(7));
			display.setPrice(rs.getInt(8));
			displayList.add(display);
		}
		return displayList;
	}

	public List<Display2Bean> read2All() throws Exception {
		List<Display2Bean> display2List = new ArrayList<Display2Bean>();
		Connection conn = connect();
		String readQuery = "select product_details.product_name, product_details.product_id, vendor_details.in_stock, IF(vendor_details.buffer > vendor_details.in_stock, (vendor_details.buffer - vendor_details.in_stock), 0) as req,vendor_details.buffer,product_details.price,vendor_details.offer, product_details.rating from product_details inner join vendor_details where product_details.product_id = vendor_details.product_id";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		while (rs.next()) {
			Display2Bean display2 = new Display2Bean();
			display2.setProdName(rs.getString(1));
			display2.setProdId(rs.getInt(2));
			display2.setInStock(rs.getInt(3));
			display2.setReq(rs.getInt(4));
			display2.setBuffer(rs.getInt(5));
			display2.setPrice(rs.getInt(6));
			display2.setOffer(rs.getFloat(7));
			display2.setRating(rs.getFloat(8));
			display2List.add(display2);
		}
		return display2List;
	}

	public Display2Bean readdisplay2(int prodId) throws Exception {
		Connection conn = connect();
		String readQuery = "select product_details.product_name, product_details.product_id, vendor_details.in_stock, IF(vendor_details.buffer > vendor_details.in_stock, (vendor_details.buffer - vendor_details.in_stock), 0) as req,vendor_details.buffer,product_details.price,vendor_details.offer, product_details.rating from product_details inner join vendor_details where product_details.product_id = vendor_details.product_id and product_details.product_id="
				+ prodId;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(readQuery);
		Display2Bean display2 = new Display2Bean();
		if (rs.next()) {
			display2.setProdName(rs.getString(1));
			display2.setProdId(rs.getInt(2));
			display2.setInStock(rs.getInt(3));
			display2.setReq(rs.getInt(4));
			display2.setBuffer(rs.getInt(5));
			display2.setPrice(rs.getInt(6));
			display2.setOffer(rs.getFloat(7));
			display2.setRating(rs.getFloat(8));
		}
		return display2;

	}
	
	public int updateStock(int prodId, int inStock, int buffer, float offer, float rating) throws Exception {
		Connection conn = connect();
		String sql = "UPDATE `vendor_details` SET `in_stock`=?, `buffer`=?, `offer`=? WHERE `product_id`=?";
		String sql1 = "UPDATE `product_details` SET `rating`=? WHERE `product_id`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, inStock);
		pstmt.setInt(2, buffer);
		pstmt.setFloat(3, offer);
		pstmt.setInt(4, prodId);
		PreparedStatement pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setFloat(1, rating);
		pstmt1.setInt(2, prodId);
		if(pstmt.executeUpdate() == 1 && pstmt1.executeUpdate() == 1) {
			return 1;
		} else {
			return 0;
		}
	}

	public int delete(int prodId) throws Exception {
		Connection conn = connect();
		Statement stmt = conn.createStatement();
		Statement stmt1 = conn.createStatement();
		int deleteStatus = 0;
		String deleteQuery1 = "delete from vendor_details where product_id=" + prodId;
		String deleteQuery2 = "delete from product_details where product_id=" + prodId;
		deleteStatus = stmt.executeUpdate(deleteQuery1);
		if (deleteStatus > 0) {
			stmt1.executeUpdate(deleteQuery2);
			return deleteStatus;
		} else {
			System.out.println("Error during deletion of record....");
			return deleteStatus;
		}
	}
}
