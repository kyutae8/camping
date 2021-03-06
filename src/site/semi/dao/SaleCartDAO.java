package site.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.semi.dto.SaleCartDTO;

public class SaleCartDAO extends JdbcDAO{
	private static SaleCartDAO _dao;
	private SaleCartDAO() {
		// TODO Auto-generated constructor stub
	}
	static {
		_dao = new SaleCartDAO();
	}
	public static SaleCartDAO getDAO() {
		return _dao;
	}
	public int insertSale(SaleCartDTO sale) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = getConnection();
			String sql = "insert into salecart values(?,?,?,?,?,?,?,seq.nextval)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,sale.getItem_buycount());
			pstmt.setString(2,sale.getItem_color());
			pstmt.setInt(3,sale.getItem_price());
			pstmt.setInt(4,sale.getItem_sale());
			pstmt.setString(5,sale.getLogin_id());
			pstmt.setInt(6,sale.getItem_num());
			pstmt.setString(7,sale.getItem_name());
			
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
	public List<SaleCartDTO> selectAllSale(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SaleCartDTO>  list = new ArrayList<SaleCartDTO>();
		try {
			con = getConnection();
			String sql = "select * from salecart where login_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			SaleCartDTO dto = new SaleCartDTO();
			dto.setItem_buycount(rs.getInt(1));
			dto.setItem_color(rs.getString(2));
			dto.setItem_price(rs.getInt(3));
			dto.setItem_sale(rs.getInt(4));
			dto.setLogin_id(rs.getString(5));
			dto.setItem_num(rs.getInt(6));
			dto.setItem_name(rs.getString(7));
			dto.setItem_boxcount(rs.getInt(8));
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
	
	public int deleteSale(int boxcount) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row =0;
		try {
			con = getConnection();
			String sql = "delete from salecart where item_boxcount=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,boxcount);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt);
		}
		return row;
	}
}
