package site.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.semi.dto.CommentDTO;

public class CommentDAO extends JdbcDAO{
	private static CommentDAO _dao;
	private CommentDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new CommentDAO();		
	}
	
	public static CommentDAO getDAO() {
		return _dao; 
	}
	
	//댓글쓰기
	public int insertComment(CommentDTO comment) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into comments values(comment_seq.NEXTVAL, ?, ?, ?, sysdate, ?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, comment.getBnum());
			pstmt.setString(2, comment.getCid());
			pstmt.setString(3, comment.getCwriter());
			pstmt.setString(4, comment.getCcontent());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]insertComment() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
		
	}
	
	//글번호 전달받아 해당글의 댓글리스트 검색
	public List<CommentDTO> selectCommentList(int bnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<CommentDTO> commentList=new ArrayList<CommentDTO>();
		try {
			con=getConnection();
			

			String sql="select * from comments where bnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO comment=new CommentDTO();
				comment.setCnum(rs.getInt("cnum"));
				comment.setBnum(rs.getInt("bnum"));
				comment.setCid(rs.getString("cid"));
				comment.setCwriter(rs.getString("cwriter"));
				comment.setCdate(rs.getString("cdate"));
				comment.setCcontent(rs.getString("ccontent"));
				commentList.add(comment);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCommentList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return commentList;
	}
	//단일행검색
	public CommentDTO selectNumComment(int num) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		CommentDTO comment=null;
		try {
			con=getConnection();
			String sql="select * from comments where cnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				comment=new CommentDTO();
				comment.setCnum(rs.getInt("cnum"));
				comment.setBnum(rs.getInt("bnum"));
				comment.setCid(rs.getString("cid"));;
				comment.setCwriter(rs.getString("cwriter"));				
				comment.setCdate(rs.getString("cdate"));
				comment.setCcontent(rs.getString("ccontent"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNumComment() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return comment;
	}
	
	//댓글 갯수
	public int selectCommentCount(int bnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();

				String sql="select count(*) from comments where bnum=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bnum);

			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectCommentCount() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	//댓글삭제
	public int deleteComment(int cnum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="DELETE FROM comments WHERE cnum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]deleteComment() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
}
