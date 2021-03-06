package site.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.semi.dto.SproductDTO;

public class SproductDAO extends JdbcDAO{
	private static SproductDAO _dao;
	
	public SproductDAO() {
		// TODO Auto-generated constructor stub
	}
	static {
		_dao=new SproductDAO();
	}
	public static SproductDAO getDAO() {
		return _dao;
	}
	
	
	//카테고리를 전달받아 PRODUCT 테이블에 저장된 해당 카테고리의 제품정보를 검색하여 반환하는 메소드
	public List<SproductDTO> selectCategoryProductList(String category) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<SproductDTO> sproductList=new ArrayList<SproductDTO>();
		try {
			con=getConnection();
			
			if(category.equals("ALL")) {
				String sql="select * from sproduct order by code";
				pstmt=con.prepareStatement(sql);
			} else {
				String sql="select * from sproduct where code like ?||'%' order by code";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, category);
			}
			
			rs=pstmt.executeQuery();
		

		while(rs.next()) {
			SproductDTO sproduct=new SproductDTO();
			sproduct.setNum(rs.getInt("num"));
			sproduct.setCode(rs.getString("code"));
			sproduct.setName(rs.getString("name"));
			sproduct.setImage(rs.getString("image"));
			sproduct.setDetail(rs.getString("detail"));
			sproduct.setColor(rs.getString("color"));
			sproduct.setQty(rs.getInt("qty"));
			sproduct.setPrice(rs.getInt("price"));
			sproduct.setAdd_Date(rs.getString("add_date"));
			sproductList.add(sproduct);
		}
	} catch (SQLException e) {
		System.out.println("[에러]selectCategoryProductList 메소드의 SQL 오류 = "+e.getMessage());
	} finally {
		close(con, pstmt, rs);
	}
	return sproductList;
}
	
	//제품정보를 전달받아 PRODUCT 테이블에 저장하고 저장행의 갯수를 반환하는 메소드
		public int insertSproduct(SproductDTO sproduct) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				String sql="insert into sproduct values(sproduct_seq.nextval,?,?,?,?,?,?,?,sysdate)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, sproduct.getCode());
				pstmt.setString(2, sproduct.getName());
				pstmt.setString(3, sproduct.getImage());
				pstmt.setString(4, sproduct.getDetail());
				pstmt.setString(5, sproduct.getColor());
				pstmt.setInt(6, sproduct.getQty());
				pstmt.setInt(7, sproduct.getPrice());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]insertSproduct 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		//제품코드를 전달받아 PRODUCT 테이블에 저장된 해당 제품코드의 제품정보를 검색하여 반환하는 메소드
		public SproductDTO selectCodeSproduct(String Code) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			SproductDTO sproduct=null;
			try {
				con=getConnection();
				
				String sql="select * from sproduct where code=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, Code);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					sproduct=new SproductDTO();
					sproduct.setNum(rs.getInt("num"));
					sproduct.setCode(rs.getString("code"));
					sproduct.setName(rs.getString("name"));
					sproduct.setImage(rs.getString("image"));
					sproduct.setDetail(rs.getString("detail"));
					sproduct.setColor(rs.getString("color"));
					sproduct.setQty(rs.getInt("qty"));
					sproduct.setPrice(rs.getInt("price"));
					sproduct.setAdd_Date(rs.getString("add_date"));
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectCodeSproduct 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return sproduct;
		}
		//제품번호를 전달받아 PRODUCT 테이블에 저장된 해당 제품코드의 제품정보를 검색하여 반환하는 메소드
		// => 위에거랑 유사해서 동적 SQL 구현 가능
		public SproductDTO selectNumSproduct(int Num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			SproductDTO sproduct=null;
			try {
				con=getConnection();
				
				String sql="select * from sproduct where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, Num);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					sproduct=new SproductDTO();
					sproduct.setNum(rs.getInt("num"));
					sproduct.setCode(rs.getString("code"));
					sproduct.setName(rs.getString("name"));
					sproduct.setColor(rs.getString("color"));
					sproduct.setImage(rs.getString("image"));
					sproduct.setDetail(rs.getString("detail"));
					sproduct.setQty(rs.getInt("qty"));
					sproduct.setPrice(rs.getInt("price"));
					//sproduct.setAdd_Date(rs.getString("add_date"));
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectNumProduct 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return sproduct;
		}
		//제품정보를 전달받아 PRODUCT 테이블에 저장된 해당 제품정보를 변경하고 저장행의 갯수를 반환하는 메소드
		public int updateSproduct(SproductDTO sproduct) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update sproduct set code=?,name=?,color=?,image=?"
						+ ",detail=?,qty=?,price=? where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, sproduct.getCode());
				pstmt.setString(2, sproduct.getName());
				pstmt.setString(3, sproduct.getColor());
				pstmt.setString(4, sproduct.getImage());
				pstmt.setString(5, sproduct.getDetail());
				pstmt.setInt(6, sproduct.getQty());
				pstmt.setInt(7, sproduct.getPrice());
				pstmt.setInt(8, sproduct.getNum());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]updateSproduct 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		//제품번호를 전달받아 PRODUCT 테이블에 저장된 해당 제품정보를 변경하고 저장행의 갯수를 반환하는 메소드
		public int deleteSproduct(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="delete from sproduct where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]deleteSproduct 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		

		
		
	}


		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
