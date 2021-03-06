package site.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.semi.dto.ScartDTO;

public class ScartDAO extends JdbcDAO {

	private static ScartDAO _dao;
	private ScartDAO() {
		
	}
	static {
		_dao = new ScartDAO();
	}
	public static ScartDAO getDAO() {
		return _dao;
	}
	public int insertScart(ScartDTO scart) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int row = 0;
		try {
			con = getConnection();
			String sql = "insert into scart values(seq.nextval,?,?,?,?,?,?,?,1)";
			pstmt = con.prepareStatement(sql);
			//seq
			pstmt.setInt(1,scart.getNum());
			pstmt.setInt(2, scart.getQty());
			pstmt.setInt(3,scart.getPrice());
			pstmt.setInt(4,scart.getTotal_price());
			pstmt.setString(5,scart.getId());
			pstmt.setString(6,scart.getName());
			pstmt.setString(7,scart.getColor());
			//image=1
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
	public List<ScartDTO> selectScartList(int scart_num){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ScartDTO>  scartlist = new ArrayList<ScartDTO>();
		try {
			con = getConnection();
			String sql = "select * from scart where scart_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,scart_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			ScartDTO scart = new ScartDTO();
			scart.setScart_num(rs.getInt(1));
			scart.setNum(rs.getInt(2));
			scart.setQty(rs.getInt(3));
			scart.setPrice(rs.getInt(4));
			scart.setTotal_price(rs.getInt(5));
			scart.setId(rs.getString(6));
			scart.setName(rs.getString(7));
			scart.setColor(rs.getString(8));
			scart.setImage(rs.getString(9));
			scartlist.add(scart);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con, pstmt, rs);
		}
		return scartlist;
	}
	public int deleteScart(String scart_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows =0;
		try {
			con = getConnection();
			String sql = "delete from scart where scart_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,scart_num);
			rows = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	public List<ScartDTO> selectAllScart(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ScartDTO>  scartList = new ArrayList<ScartDTO>();
		try {
			con = getConnection();
			String sql = "select * from scart where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
			ScartDTO scart = new ScartDTO();
			scart.setScart_num(rs.getInt("scart_num"));
			scart.setNum(rs.getInt("num"));
			scart.setQty(rs.getInt("qty"));
			scart.setPrice(rs.getInt("price"));
			scart.setId(rs.getString("id"));
			scart.setName(rs.getString("name"));
			scart.setColor(rs.getString("color"));
			scart.setImage(rs.getString("image"));
			scartList.add(scart);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close(con, pstmt, rs);
		}
		return scartList;
	}
	public List<ScartDTO> selectScartAllList(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<ScartDTO> scartList=new ArrayList<ScartDTO>();
		try {
			con=getConnection();
			
			if(id.equals("ALL")) {
				String sql="select * from scart order by status";
				pstmt=con.prepareStatement(sql);
			} else {
				String sql="select * from scarrt where status like ?||'%' order by status";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ScartDTO scart=new ScartDTO();
				scart.setScart_num(rs.getInt("scart_num"));
				scart.setNum(rs.getInt("num"));
				scart.setQty(rs.getInt("qty"));
				scart.setPrice(rs.getInt("price"));
				scart.setTotal_price(rs.getInt("total_price"));
				scart.setId(rs.getString("id"));
				scart.setName(rs.getString("name"));
				scart.setColor(rs.getString("color"));
				scart.setImage(rs.getString("image"));
				scartList.add(scart);
			}
		} catch (SQLException e) {
			System.out.println("[????]selectScartAllList ???????? SQL ???? = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return scartList;
	}
	
	public ScartDTO ssl(int scart_num){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ScartDTO scart=null;
		try {
			con = getConnection();
			
			String sql = "select * from scart where scart_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,scart_num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
			scart=new ScartDTO();
			scart.setScart_num(rs.getInt("scart_num"));
			scart.setNum(rs.getInt("num"));
			scart.setQty(rs.getInt("qty"));
			scart.setPrice(rs.getInt("price"));
			scart.setTotal_price(rs.getInt("total_price"));
			scart.setId(rs.getString("id"));
			scart.setName(rs.getString("name"));
			scart.setColor(rs.getString("color"));
			scart.setImage(rs.getString("image"));
			}
		} catch (SQLException e) {
			System.out.println("[????]ssl() ???????? SQL ???? = "+e.getMessage());
		}
		finally {
			close(con, pstmt, rs);
		}
		return scart;
	}
}
