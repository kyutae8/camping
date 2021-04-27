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
	
	
	//ī�װ����� ���޹޾� PRODUCT ���̺��� ����� �ش� ī�װ����� ��ǰ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
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
		System.out.println("[����]selectCategoryProductList �޼ҵ��� SQL ���� = "+e.getMessage());
	} finally {
		close(con, pstmt, rs);
	}
	return sproductList;
}
	
	//��ǰ������ ���޹޾� PRODUCT ���̺��� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
				System.out.println("[����]insertSproduct �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		//��ǰ�ڵ带 ���޹޾� PRODUCT ���̺��� ����� �ش� ��ǰ�ڵ��� ��ǰ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
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
				System.out.println("[����]selectCodeSproduct �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return sproduct;
		}
		//��ǰ��ȣ�� ���޹޾� PRODUCT ���̺��� ����� �ش� ��ǰ�ڵ��� ��ǰ������ �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
		// => �����Ŷ� �����ؼ� ���� SQL ���� ����
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
				System.out.println("[����]selectNumProduct �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return sproduct;
		}
		//��ǰ������ ���޹޾� PRODUCT ���̺��� ����� �ش� ��ǰ������ �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
				System.out.println("[����]updateSproduct �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		//��ǰ��ȣ�� ���޹޾� PRODUCT ���̺��� ����� �ش� ��ǰ������ �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
				System.out.println("[����]deleteSproduct �޼ҵ��� SQL ���� = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		

		
		
	}


		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		