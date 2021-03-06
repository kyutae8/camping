package site.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.semi.dto.ItemBuyDTO;

public class ItemBuyDAO extends JdbcDAO{
	private static ItemBuyDAO _dao;
	private ItemBuyDAO() {
		// TODO Auto-generated constructor stub
	}
	static {
		_dao=new ItemBuyDAO();
	}
	public static ItemBuyDAO getDAO() {
		return _dao;
	}
	public List<ItemBuyDTO> selectAll(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ItemBuyDTO> list = new ArrayList<ItemBuyDTO>();
		try {
			con = getConnection();
			String sql = "select * from item_buy order by item_num";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBuyDTO dto = new ItemBuyDTO();
				dto.setItem_buycount(rs.getInt("item_buycount"));
				dto.setItem_buyreg(rs.getString("item_buyreg"));
				dto.setItem_color(rs.getString("item_color"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_num(rs.getInt("item_num"));
				dto.setItem_price(rs.getInt("item_price"));
				dto.setLogin_id(rs.getString("login_id"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		
		return list;
	}
	/*if(category.equals("ALL")) {
		String sql="select * from sorder order by status";
		pstmt=con.prepareStatement(sql);
	} else {
		String sql="select * from sorder where status like ?||'%' order by status";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, category);
	}*/
	public List<ItemBuyDTO> selectAll2(String category){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ItemBuyDTO> list = new ArrayList<ItemBuyDTO>();
		try {
			con = getConnection();
			if(category.equals("ALL")) {
				String sql="select * from item_buy order by item_num";
				pstmt=con.prepareStatement(sql);
			} else {
				String sql="select * from item_buy where login_id like ?||'%' order by item_num";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, category);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBuyDTO dto = new ItemBuyDTO();
				dto.setItem_buycount(rs.getInt("item_buycount"));
				dto.setItem_buyreg(rs.getString("item_buyreg"));
				dto.setItem_color(rs.getString("item_color"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_num(rs.getInt("item_num"));
				dto.setItem_price(rs.getInt("item_price"));
				dto.setLogin_id(rs.getString("login_id"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		
		return list;
	}
	public int insertBuy(ItemBuyDTO dto) {
		int row = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "insert into item_buy values(?,?,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,dto.getItem_name());
			pstmt.setInt(2,dto.getItem_num());
			pstmt.setString(3,dto.getItem_color());
			pstmt.setInt(4,dto.getItem_price());
			pstmt.setString(5,dto.getLogin_id());
			pstmt.setInt(6,dto.getItem_buycount());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con, pstmt);
		}
		return row;
	}
	public List<ItemBuyDTO> selectId(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ItemBuyDTO> list = new ArrayList<ItemBuyDTO>();
		try {
			con = getConnection();
			String sql = "select * from item_buy where login_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemBuyDTO dto = new ItemBuyDTO();
				dto.setItem_buycount(rs.getInt("item_buycount"));
				dto.setItem_buyreg(rs.getString("item_buyreg"));
				dto.setItem_color(rs.getString("item_color"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_num(rs.getInt("item_num"));
				dto.setItem_price(rs.getInt("item_price"));
				dto.setLogin_id(rs.getString("login_id"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con, pstmt, rs);
		}
		return list;
	}
}
