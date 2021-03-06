package site.semi.dao;
/*
이름       널?       유형            
-------- -------- ------------- 
ONUM     NOT NULL NUMBER(4)     
NUM               NUMBER(8)     
QTY               NUMBER(8)     
PRICE             NUMBER(8)     
STATUS            NUMBER(1)     
NAME              VARCHAR2(20)  
COLOR             VARCHAR2(20)  
MESSAGE           VARCHAR2(50)  
ONAME             VARCHAR2(50)  
OPHONE            VARCHAR2(20)  
ADDRESS1          VARCHAR2(100) 
ADDRESS2          VARCHAR2(100) 
ADDRESS3          VARCHAR2(100) 
ZIPCODE           VARCHAR2(10)  
ODATE             DATE  
OID               VARCHAR2(20)  
*/

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.semi.dto.GuestDTO;
import site.semi.dto.SorderDTO;
import site.semi.dto.SproductDTO;

public class SorderDAO extends JdbcDAO{
	private static SorderDAO _dao;
	
	public SorderDAO() {
		// TODO Auto-generated constructor stub
	}
	static {
		_dao=new SorderDAO();
	}
	public static SorderDAO getDAO() {
		return _dao;
	}
	
	public int insertSorder(SorderDTO sorder) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into sorder values(sorder_seq.nextval,?,?,?,1,?,?,?,?,?,?,?,?,?,sysdate,?)";
			pstmt=con.prepareStatement(sql);
			//guest_seq.nextval
			pstmt.setInt(1, sorder.getNum());
			pstmt.setInt(2, sorder.getQty());
			pstmt.setInt(3, sorder.getPrice());
			//status
			pstmt.setString(4, sorder.getName());
			pstmt.setString(5, sorder.getColor());
			pstmt.setString(6, sorder.getMessage());
			pstmt.setString(7, sorder.getOname());
			pstmt.setString(8, sorder.getOphone());
			pstmt.setString(9, sorder.getAddress1());
			pstmt.setString(10, sorder.getAddress2());
			pstmt.setString(11, sorder.getAddress3());
			pstmt.setString(12, sorder.getZipcode());
			//date
			pstmt.setString(13, sorder.getOid());
			
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertSorder() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	public List<SorderDTO>selectAllSorderList(String oid){
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		List<SorderDTO>sorderList=new ArrayList<SorderDTO>();
		try {
			con=getConnection();
			
			String sql="select * from sorder where oid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, oid);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				SorderDTO sorder = new SorderDTO();
				sorder.setOnum(rs.getInt("onum"));
				sorder.setNum(rs.getInt("num"));
				sorder.setQty(rs.getInt("qty"));
				sorder.setPrice(rs.getInt("price"));
				sorder.setStatus(rs.getInt("status"));
				sorder.setName(rs.getString("name"));
				sorder.setColor(rs.getString("color"));
				sorder.setMessage(rs.getString("message"));
				sorder.setOname(rs.getString("oname"));
				sorder.setOphone(rs.getString("ophone"));
				sorder.setAddress1(rs.getString("address1"));
				sorder.setAddress2(rs.getString("address2"));
				sorder.setAddress3(rs.getString("address3"));
				sorder.setZipcode(rs.getString("zipcode"));
				sorder.setOid(rs.getString("oid"));
				sorder.setOdate(rs.getString("odate"));
				sorderList.add(sorder);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllSorderList() 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return sorderList;
	}
	public int deleteSorder(String oid) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from sorder where oid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, oid);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteSorder 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	public int updateStatusSorder(SorderDTO sorder) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update sorder set num=?,oname=?,name=?,color=?,"
					+ " zipcode=?,address1=?, address2=?,address3=?,message=?,"
					+ "qty=?,price=?where oid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, sorder.getNum());
			pstmt.setString(2, sorder.getOname());
			pstmt.setString(3, sorder.getName());
			pstmt.setString(4, sorder.getColor());
			pstmt.setString(5, sorder.getZipcode());
			pstmt.setString(6, sorder.getAddress1());
			pstmt.setString(7, sorder.getAddress3());
			pstmt.setString(8, sorder.getAddress2());
			pstmt.setString(9, sorder.getMessage());
			pstmt.setInt(10, sorder.getQty());
			pstmt.setInt(11, sorder.getPrice());
			pstmt.setString(12, sorder.getOid());
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]updateStatusSorder() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows; 
	}
	 
	
	public List<SorderDTO> sco(String category) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<SorderDTO> sorderList=new ArrayList<SorderDTO>();
		try {
			con=getConnection();
			
			if(category.equals("ALL")) {
				String sql="select * from sorder order by status";
				pstmt=con.prepareStatement(sql);
			} else {
				String sql="select * from sorder where status like ?||'%' order by status";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, category);
			}
			
			rs=pstmt.executeQuery();
		

		while(rs.next()) {
			SorderDTO sorder=new SorderDTO();
			sorder.setOnum(rs.getInt("onum"));
			sorder.setNum(rs.getInt("num"));
			sorder.setQty(rs.getInt("qty"));
			sorder.setPrice(rs.getInt("price"));
			sorder.setStatus(rs.getInt("status"));
			sorder.setName(rs.getString("name"));
			sorder.setColor(rs.getString("color"));
			sorder.setMessage(rs.getString("message"));
			sorder.setOname(rs.getString("oname"));
			sorder.setOphone(rs.getString("ophone"));
			sorder.setAddress1(rs.getString("address1"));
			sorder.setAddress2(rs.getString("address2"));
			sorder.setAddress3(rs.getString("address3"));
			sorder.setZipcode(rs.getString("zipcode"));
			sorder.setOid(rs.getString("oid"));
			sorder.setOdate(rs.getString("odate"));
			sorderList.add(sorder);
		}
	} catch (SQLException e) {
		System.out.println("[에러]selectCategoryProductList 메소드의 SQL 오류 = "+e.getMessage());
	} finally {
		close(con, pstmt, rs);
	}
	return sorderList;
}

	public int updateStatus(String oid,int status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			 
			String sql="update sorder set status=? where oid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setString(2, oid);
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]updateStatus() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		} 
		return rows;
	}
	
	public SorderDTO sns(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		SorderDTO sorder=null;
		try {
			con=getConnection();
			
			String sql="select * from sorder where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				sorder=new SorderDTO();
				sorder.setOnum(rs.getInt("onum"));
				sorder.setNum(rs.getInt("num"));
				sorder.setQty(rs.getInt("qty"));
				sorder.setPrice(rs.getInt("price"));
				sorder.setStatus(rs.getInt("status"));
				sorder.setName(rs.getString("name"));
				sorder.setColor(rs.getString("color"));
				sorder.setMessage(rs.getString("message"));
				sorder.setOname(rs.getString("oname"));
				sorder.setOphone(rs.getString("ophone"));
				sorder.setAddress1(rs.getString("address1"));
				sorder.setAddress2(rs.getString("address2"));
				sorder.setAddress3(rs.getString("address3"));
				sorder.setZipcode(rs.getString("zipcode"));
				sorder.setOid(rs.getString("oid"));
				sorder.setOdate(rs.getString("odate"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]sns 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return sorder;
	}
	
}

















