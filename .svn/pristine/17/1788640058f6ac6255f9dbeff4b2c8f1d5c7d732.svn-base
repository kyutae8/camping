package site.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import site.semi.dto.GuestDTO;

public class GuestDAO extends JdbcDAO {
	private static GuestDAO _dao;
	
	public GuestDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new GuestDAO();		
	}
	
	public static GuestDAO getDAO() {
		return _dao; 
	}
	//비회원 구매시 테이블에 저장
	public int insertGuest(GuestDTO guest) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into guest values(guest_seq.nextval,?,?,?,?,?,?,?,1,?,?,sysdate,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			//guest_seq.nextval
			pstmt.setString(1, guest.getPname());
			pstmt.setString(2, guest.getPcolor());
			pstmt.setInt(3, guest.getPqty());
			pstmt.setInt(4, guest.getPprice());
			pstmt.setString(5, guest.getGname());
			pstmt.setString(6, guest.getGmail());
			pstmt.setString(7, guest.getGmobile());
			//status
			pstmt.setString(8, guest.getOmessage());
			pstmt.setString(9, guest.getOname());
			//sysdate
			pstmt.setString(10, guest.getAddress1());
			pstmt.setString(11, guest.getAddress2());
			pstmt.setString(12, guest.getAddress3());
			pstmt.setString(13, guest.getZipcode());
			
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertGuest() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	//주문번호 이메일로 비회원구매 차지
	public GuestDTO FGuest(String num, String gmail) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		GuestDTO guest=null;
		try {
			con=getConnection();
			/*
			이름       널?       유형           
			-------- -------- ------------ 
			이름       널?       유형            
			-------- -------- ------------- 
			NUM      NOT NULL NUMBER(4)      - guest_seq.nextval
			PNAME             VARCHAR2(50)  1
			PCOLOR            VARCHAR2(30)  2
			PQTY              NUMBER(8)     3
			PPRICE            NUMBER(8)     4
			GNAME             VARCHAR2(30)  5
			GMAIL             VARCHAR2(30)  6
			GMOBILE           VARCHAR2(20)  7
			STATUS            NUMBER(1)         1/2
			OMESSAGE          VARCHAR2(50)  8
			ONAME             VARCHAR2(50)  9
			GDATE             DATE          sysdate
			ADDRESS1          VARCHAR2(100) 10
			ADDRESS2          VARCHAR2(100) 11
			ADDRESS3          VARCHAR2(100) 12
			ZIPCODE           VARCHAR2(10)  13


			create sequence guest_seq; 
			 */						
			String sql="select * from guest where num=? and gmail=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.setString(2, gmail);
			
			rs=pstmt.executeQuery();
				
			if(rs.next()) {
				guest=new GuestDTO(); 
				guest.setNum(rs.getInt("num"));
				guest.setPname(rs.getString("pname"));
				guest.setPcolor(rs.getString("pcolor"));
				guest.setPprice(rs.getInt("pprice"));
				guest.setPqty(rs.getInt("pqty"));
				guest.setGname(rs.getString("gname"));
				guest.setGmail(rs.getString("gmail"));
				guest.setGmobile(rs.getString("gmobile"));
				guest.setOmessage(rs.getString("omessage"));
				guest.setOname(rs.getString("oname"));
				guest.setGdate(rs.getString("gdate"));
				guest.setAddress1(rs.getString("address1"));
				guest.setAddress2(rs.getString("address2"));
				guest.setAddress3(rs.getString("address3"));
				guest.setZipcode(rs.getString("zipcode"));
								
	
			} 
		} catch (SQLException e) {
			System.out.println("[에러]FGuest() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return guest;
	}
	
	public int deleteGuest(String num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from guest where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, num);
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]deleteGuest() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	 
	public int fg(String zipcode) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		try {
			con=getConnection();
			
			String sql="select num from smember where zipcode=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, zipcode);
			
			rs=pstmt.executeQuery();
				
			if(rs.next()) {
				num=rs.getInt("num");
	
			} 
		} catch (SQLException e) {
			System.out.println("[에러]findIdMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return num; 
	}
}
