package site.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.semi.dto.ItemDTO;

public class ItemDAO extends JdbcDAO{
	private static ItemDAO _dao;
	private ItemDAO() {
		// TODO Auto-generated constructor stub
	}
	static {
		_dao=new ItemDAO();
	}
	public static ItemDAO getDAO() {
		return _dao;
	}
	public List<ItemDTO> selectAllItem(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ItemDTO> list = new ArrayList<ItemDTO>();
		String sql = "select * from item order by item_num";
		try {
			con=getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ItemDTO dto = new ItemDTO();
				dto.setItem_num(rs.getInt(1));
				dto.setItem_name(rs.getString(2));
				dto.setItem_price(rs.getInt(3));
				dto.setItem_category(rs.getString(4));
				dto.setItem_info(rs.getString(5));
				dto.setItem_reg(rs.getString(6).substring(0,10));
				dto.setItem_img(rs.getString(7));
				dto.setItem_color(rs.getString(8));
				dto.setItem_count(rs.getInt(9));
				dto.setItem_sale(rs.getInt(10));
				dto.setItem_brand(rs.getString(11));
				dto.setItem_buycount(rs.getInt(12));
				dto.setItem_updatereg(rs.getString(13));
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
	public ItemDTO selectItem(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ItemDTO dto = new ItemDTO();
		
		try {
			con = getConnection();
			String sql = "select * from item where item_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setItem_num(rs.getInt(1));
				dto.setItem_name(rs.getString(2));
				dto.setItem_price(rs.getInt(3));
				dto.setItem_category(rs.getString(4));
				dto.setItem_info(rs.getString(5));
				dto.setItem_reg(rs.getString(6).substring(0,10));
				dto.setItem_img(rs.getString(7));
				dto.setItem_color(rs.getString(8));
				dto.setItem_count(rs.getInt(9));
				dto.setItem_sale(rs.getInt(10));
				dto.setItem_brand(rs.getString(11));
				dto.setItem_buycount(rs.getInt(12));
				dto.setItem_updatereg(rs.getString(13));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt, rs);
		}
		return dto;
	}
	public int updateItemColor(String color,int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = getConnection();
			String sql = "update item set item_color=? where item_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,color);
			pstmt.setInt(2,num);
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
	//?????? ?????? ????!
	public int deleteItem(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row=0;
		try {
			con = getConnection();
			String sql = "delete from item where item_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,no);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt);
		}
		return row;
	}
	public int updateItem(ItemDTO item) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = getConnection();
			String sql = "update item set item_name=?,item_price=?,item_count=?,item_brand=?,item_info=?,item_updatereg=sysdate where item_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,item.getItem_name());
			pstmt.setInt(2,item.getItem_price());
			pstmt.setInt(3,item.getItem_count());
			pstmt.setString(4,item.getItem_brand());
			pstmt.setString(5,item.getItem_info());
			pstmt.setInt(6,item.getItem_num());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt);
		}
		
		return row;
	}
	public int insertItem(ItemDTO item) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = getConnection();
			String sql = "insert into item values(?,?,?,?,?,sysdate,?,'????',?,?,?,0,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,item.getItem_num());
			pstmt.setString(2,item.getItem_name());
			pstmt.setInt(3,item.getItem_price());
			pstmt.setString(4,item.getItem_category());
			pstmt.setString(5,item.getItem_info());
			pstmt.setString(6,item.getItem_img());
			pstmt.setInt(7,item.getItem_count());
			pstmt.setInt(8,item.getItem_sale());
			pstmt.setString(9,item.getItem_brand());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt);
		}
		
		return row;
	}
	public int updateBuy(int itemno,int buycount) {
		int row = 0;
		Connection con =null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update item set item_buycount=item_buycount+?,item_count=item_count-item_buycount where item_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,buycount);
			pstmt.setInt(2,itemno);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt);
		}
		
		return row;
	}
	public int maxColumn() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int row = 0;
		try {
			con = getConnection();
			String sql = "select MAX(item_num) item_num from item";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				row = rs.getInt("item_num");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con, pstmt, rs);
		}
		return row;
	}
	
}
