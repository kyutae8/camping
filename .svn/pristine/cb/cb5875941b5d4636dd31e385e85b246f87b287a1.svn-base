package site.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.semi.dto.CartDTO;

/*

 이름          널?       유형           
----------- -------- ------------ 
CART_NUM    NOT NULL NUMBER(10)   
ITEM_NUM             NUMBER(10)   
ITEM_NAME            VARCHAR2(20) 
ITEM_STOCK           NUMBER(10)   
ITEM_PRICE           NUMBER(10)   
TOTAL_PRICE          NUMBER(10)   
ID          NOT NULL VARCHAR2(20) 
ADDDATE              DATE    
 
 */
public class CartDAO extends JdbcDAO{
	private static CartDAO _dao;
	
	public CartDAO() {
		// TODO Auto-generated constructor stub
	}
	static {
		_dao=new CartDAO();
	}
	public static CartDAO getDAO() {
		return _dao;
	}
	public List<CartDTO> selectAllCartList(int cart_num){
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CartDTO>cartList=new ArrayList<CartDTO>();
	
		try {
			con=getConnection();
			
			String sql="select * from cart order by cart_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cart_num);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO cart=new CartDTO();
				cart.setCart_num(rs.getInt(1));
				cart.setItem_num(rs.getInt(2));
				cart.setItem_name(rs.getString(3));
				cart.setItem_stock(rs.getInt(4));
				cart.setItem_price(rs.getInt(5));
				cart.setTotal_price(rs.getInt(6));
				cart.setId(rs.getString(7));
				cart.setAddate(rs.getString(8));
				cartList.add(cart);
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllCartList() 메소드의 SQL 오류 = "+e.getMessage());
		}
		finally {
			close(con, pstmt, rs);
		}
		return cartList;
	}
	public int selectCart(int cart_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select * from item where cart_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cart_num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				CartDTO cart=new CartDTO();
				cart.setCart_num(rs.getInt(1));
				cart.setItem_num(rs.getInt(2));
				cart.setItem_name(rs.getString(3));
				cart.setItem_stock(rs.getInt(4));
				cart.setItem_price(rs.getInt(5));
				cart.setTotal_price(rs.getInt(6));
				cart.setId(rs.getString(7));
				cart.setAddate(rs.getString(8));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCartList() 메소드의 SQL 오류 = "+e.getMessage());
		}
		finally {
			close(con, pstmt, rs);
		}
		return cart_num;
	}
	
	public int insertCart(CartDTO cart) {
		
		Connection con = null;
		PreparedStatement pstmt=null;
		
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into cart values(?,?,?,?,?,?,?,sysdate)";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,cart.getCart_num());
			pstmt.setInt(2, cart.getItem_num());
			pstmt.setString(3, cart.getItem_name());
			pstmt.setInt(4, cart.getItem_stock());
			pstmt.setInt(5, cart.getItem_price());
			pstmt.setInt(6, cart.getTotal_price());
			pstmt.setString(7, cart.getId());
			
			rows=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[에러]insertCart() 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	public int updateCart(CartDTO cart) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update cart set cart_num=?,item_num=?,item_name=?,item_stock=?,item_price=?,total_price=?,id=?"
					+ "sysdate=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,cart.getCart_num());
			pstmt.setInt(2, cart.getItem_num());
			pstmt.setString(3, cart.getItem_name());
			pstmt.setInt(4, cart.getItem_stock());
			pstmt.setInt(5, cart.getItem_price());
			pstmt.setInt(6, cart.getTotal_price());
			pstmt.setString(7, cart.getId());
			pstmt.setString(8, cart.getAddate());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]updateCart() 메소드의 SQL 오류 = "+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	public int deleteCart(int cart_num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from cart where cart_num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cart_num);
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]deletesMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	public int addCart(String id, String item_name, int item_stock) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CartDTO cart=null;
		int tcart_num = 0;
		
		try {
			con=getConnection();
			String sql="insert into cart(cartnun,Item_num,Item_stock)";
			pstmt=con.prepareStatement(sql);
			//pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				//cart=new CartDTO();
				tcart_num = rs.getInt(1);
				//cart.setCart_num(rs.getInt("cart_num"));
				
			}
		} catch (SQLException e) {
			System.out.println("[에러]addcart() 메소드의 SQL 오류 = "+e.getMessage());
		}
		finally {
			close(con, pstmt, rs);
		}
		return tcart_num;
	}
}
