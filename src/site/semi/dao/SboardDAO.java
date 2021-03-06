package site.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.semi.dto.ItemDTO;
import site.semi.dto.SboardDTO;
import site.semi.dto.SproductDTO;

public class SboardDAO extends JdbcDAO{
private static SboardDAO _dao;
	
	private SboardDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new SboardDAO();		
	}
	
	public static SboardDAO getDAO() {
		return _dao; 
	}


	public int selectNextNum() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int nextNum=0;
		try {
			con=getConnection();
			
			String sql="select sboard_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				nextNum=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectNextNum() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return nextNum;
	}
	
		//게시글을 전달받아 BOARD 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
		public int testBoard(SboardDTO board) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="insert into sboard values(?,?,?,?,null,null,?,?,sysdate,null,null,0)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, board.getNum());
				pstmt.setString(2, board.getCategory());
				pstmt.setString(3, board.getId());
				pstmt.setString(4, board.getWriter());
				pstmt.setString(5, board.getTitle());
				pstmt.setString(6, board.getContent());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]testBoard() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		/*---------------------------------------------------------------------------------- */
		public int selectBoardCount(String category, String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				
				//메소드의 매개변수에 저장값에 따른 다른 SQL 명령을 전달하여 실행되도록 설정 - 동적 SQL 
				if(keyword.equals("")) {//검색 기능을 사용하지 않을 경우
					String sql="select count(*) from sboard where category=? and status!=9"; 
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, category);
				} else {//검색 기능을 사용한 경우
					String sql="select count(*) from sboard where category=? and "+search+" like '%'||?||'%' and status!=9";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, category);
					pstmt.setString(2, keyword);
				}
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					count=rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectBoardCount() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return count;
		}
		
		public List<SboardDTO> selectBoardList(String category,int startRow, int endRow, String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<SboardDTO> boardList=new ArrayList<SboardDTO>();
			try {
				con=getConnection();
				
				if(keyword.equals("")) {
					String sql="select * from(select rownum rn,temp.* from (select * from sboard where category=? and status!=9 order by num desc) temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, category);
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
				} else {
					String sql="select * from(select rownum rn,temp.* from (select * from sboard where category=? and "+search+" like '%'||?||'%' and status!=9 order by num desc) temp) where rn between ? and ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, category);
					pstmt.setString(2, keyword);
					pstmt.setInt(3, startRow);
					pstmt.setInt(4, endRow);
				}
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					SboardDTO board=new SboardDTO();
					board.setNum(rs.getInt("num"));
					board.setCategory(rs.getString("category"));
					board.setId(rs.getString("id"));
					board.setWriter(rs.getString("writer"));
					board.setItemnum(rs.getInt("itemnum"));
					board.setGrade(rs.getString("grade"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getString("regdate"));
					board.setImg(rs.getString("img"));
					board.setAnswer(rs.getString("answer"));
					board.setStatus(rs.getInt("status"));
					
					
					boardList.add(board);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectBoardList() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardList;
		}
		
		//게시글 등록
		public int insertBoard(SboardDTO board) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="insert into sboard values(sboard_seq.NEXTVAL,?,?,?,?,?,?,?,sysdate,?,null,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, board.getCategory());
				pstmt.setString(2, board.getId());
				pstmt.setString(3, board.getWriter());
				pstmt.setInt(4, board.getItemnum());
				pstmt.setString(5, board.getGrade());
				pstmt.setString(6, board.getTitle());
				pstmt.setString(7, board.getContent());
				pstmt.setString(8, board.getImg());
				pstmt.setInt(9, board.getStatus());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]testBoard() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		//게시글 상세보기 - 단일행검색
		public SboardDTO selectNumBoard(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			SboardDTO board=null;
			try {
				con=getConnection();
				String sql="select * from sboard where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					board=new SboardDTO();
					board.setNum(rs.getInt("num"));
					board.setCategory(rs.getString("category"));
					board.setId(rs.getString("id"));
					board.setWriter(rs.getString("writer"));
					board.setItemnum(rs.getInt("itemnum"));
					board.setGrade(rs.getString("grade"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getString("regdate"));
					board.setImg(rs.getString("img"));
					board.setAnswer(rs.getString("answer"));
					board.setStatus(rs.getInt("status"));
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectNumBoard() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return board;
		}
		
		//글삭제
		public int deleteBoard(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update sboard set status=9 where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]updateReadCount() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		//게시글을 전달받아 BOARD 테이블에 저장된 해당 게시글을 변경하고 변경행의 갯수를 반환하는 메소드
		public int updateBoard(SboardDTO board) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update sboard set title=?, content=?, status=? where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, board.getTitle());
				pstmt.setString(2, board.getContent());
				pstmt.setInt(3, board.getStatus());
				pstmt.setInt(4, board.getNum());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]updateBoard() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		public int updateReview(SboardDTO board) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update sboard set itemnum=?, grade=?, title=?, content=?, img=?, status=? where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, board.getItemnum());			
				pstmt.setString(2, board.getGrade());
				pstmt.setString(3, board.getTitle());
				pstmt.setString(4, board.getContent());
				pstmt.setString(5, board.getImg());
				pstmt.setInt(6, board.getStatus());
				pstmt.setInt(7, board.getNum());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]updateBoard() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		public int updateAnswer(SboardDTO board) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="update sboard set answer=? where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, board.getAnswer());			
				pstmt.setInt(2, board.getNum());
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]updateAnswer() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		
		//상품(팝업에서 검색용)
		public List<ItemDTO> selectSearchItem(String choice){
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<ItemDTO> itemList=new ArrayList<ItemDTO>();
			try {
				con=getConnection();
				
				String sql="select * from item where item_name like '%'||?||'%' order by item_num";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, choice);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ItemDTO item=new ItemDTO();
					item.setItem_num(rs.getInt("item_num"));
					item.setItem_name(rs.getString("item_name"));
					item.setItem_img(rs.getString("item_img"));
					itemList.add(item);
				}
			}catch (SQLException e) {
				System.out.println("[에러]selectSearchItem() 메소드의 SQL 오류 = "+e.getMessage());
			}finally {
				close(con, pstmt, rs);
			}
			return itemList;
		}
		public List<SproductDTO> selectSearchItem2(String choice){
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<SproductDTO> itemList=new ArrayList<SproductDTO>();
			try {
				con=getConnection();
				
				String sql="select * from sproduct where name like '%'||?||'%' order by num";
				
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, choice);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					SproductDTO item=new SproductDTO();
					item.setNum(rs.getInt("num"));
					item.setName(rs.getString("name"));
					item.setImage(rs.getString("image"));
					itemList.add(item);
				}
			}catch (SQLException e) {
				System.out.println("[에러]selectSearchItem() 메소드의 SQL 오류 = "+e.getMessage());
			}finally {
				close(con, pstmt, rs);
			}
			return itemList;
		}
		
		
		//상품선택관련-----------------------------------------------------------------------------------------
		
		//모든상품
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
		//상품 단일행검색
		public ItemDTO selectItem(int no) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ItemDTO dto = null;
			
			try {
				con = getConnection();
				String sql = "select * from item where item_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, no);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto=new ItemDTO();
					dto.setItem_num(rs.getInt(1));
					dto.setItem_name(rs.getString(2));
					dto.setItem_price(rs.getInt(3));
					dto.setItem_category(rs.getString(4));
					dto.setItem_info(rs.getString(5));
					dto.setItem_reg(rs.getString(6).substring(0,10));
					dto.setItem_img(rs.getString(7));
					dto.setItem_color(rs.getString(8));
					dto.setItem_count(rs.getInt(9));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(con, pstmt, rs);
			}
			return dto;
		}
		
		//관리자기능---------------------------------------------------------------------------------------------
		
		//게시글갯수
		public int adminBoardCount(String category, String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			int count=0;
			try {
				con=getConnection();
				
				if(category.equals("ALL")) {
					if(keyword.equals("")) {//검색 기능을 사용하지 않을 경우
						String sql="select count(*) from sboard where status!=9"; 
						pstmt=con.prepareStatement(sql);
					} else {//검색 기능을 사용한 경우
						String sql="select count(*) from sboard where "+search+" like '%'||?||'%' and status!=9";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, keyword);
					}
				}else if(category.equals("1") || category.equals("2") || category.equals("3") || category.equals("4") || category.equals("5")){
					if(keyword.equals("")) {//검색 기능을 사용하지 않을 경우
						String sql="select count(*) from sboard where category=? and status!=9"; 
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, category);
					} else {//검색 기능을 사용한 경우
						String sql="select count(*) from sboard where category=? and "+search+" like '%'||?||'%' and status!=9";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, category);
						pstmt.setString(2, keyword);
					}
				}else if(category.equals("9")) { //삭제된 게시글의 갯수
					if(keyword.equals("")) {//검색 기능을 사용하지 않을 경우
						String sql="select count(*) from sboard where status=9"; 
						pstmt=con.prepareStatement(sql);
					} else {//검색 기능을 사용한 경우
						String sql="select count(*) from sboard where "+search+" like '%'||?||'%' and status=9";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(2, keyword);
					}
				}
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					count=rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectBoardCount() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return count;
		}
		
		//게시판 관리(페이징, 카테고리별검색) 리스트
		public List<SboardDTO> adminBoardList(String category,int startRow, int endRow, String search, String keyword) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<SboardDTO> boardList=new ArrayList<SboardDTO>();
			try {
				con=getConnection();
				
				if(category.equals("ALL")) {
					if(keyword.equals("")) {
						String sql="select * from(select rownum rn,temp.* from (select * from sboard where status!=9 order by num desc) temp) where rn between ? and ?";
						pstmt=con.prepareStatement(sql);
						pstmt.setInt(1, startRow);
						pstmt.setInt(2, endRow);
					} else {
						String sql="select * from(select rownum rn,temp.* from (select * from sboard where "+search+" like '%'||?||'%' and status!=9 order by num desc) temp) where rn between ? and ?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, keyword);
						pstmt.setInt(2, startRow);
						pstmt.setInt(3, endRow);
					}
				}else if(category.equals("1") || category.equals("2") || category.equals("3") || category.equals("4") || category.equals("5")){
					if(keyword.equals("")) {
						String sql="select * from(select rownum rn,temp.* from (select * from sboard where category=? and status!=9 order by num desc) temp) where rn between ? and ?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, category);
						pstmt.setInt(2, startRow);
						pstmt.setInt(3, endRow);
					} else {
						String sql="select * from(select rownum rn,temp.* from (select * from sboard where category=? and "+search+" like '%'||?||'%' and status!=9 order by num desc) temp) where rn between ? and ?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, category);
						pstmt.setString(2, keyword);
						pstmt.setInt(3, startRow);
						pstmt.setInt(4, endRow);
					}	
				}else if(category.equals("9")) { //status가 9인 게시물 - 삭제된 게시글 출력
					if(keyword.equals("")) {
						String sql="select * from(select rownum rn,temp.* from (select * from sboard where status=9 order by num desc) temp) where rn between ? and ?";
						pstmt=con.prepareStatement(sql);
						pstmt.setInt(1, startRow);
						pstmt.setInt(2, endRow);
					} else {
						String sql="select * from(select rownum rn,temp.* from (select * from sboard where "+search+" like '%'||?||'%' and status=9 order by num desc) temp) where rn between ? and ?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, keyword);
						pstmt.setInt(2, startRow);
						pstmt.setInt(3, endRow);
					}
				}

				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					SboardDTO board=new SboardDTO();
					board.setNum(rs.getInt("num"));
					board.setCategory(rs.getString("category"));
					board.setId(rs.getString("id"));
					board.setWriter(rs.getString("writer"));
					board.setItemnum(rs.getInt("itemnum"));
					board.setGrade(rs.getString("grade"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getString("regdate"));
					board.setImg(rs.getString("img"));
					board.setAnswer(rs.getString("answer"));
					board.setStatus(rs.getInt("status"));
					boardList.add(board);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectBoardList() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardList;
		}
		
		//글삭제(DB 테이블에서 삭제)
		public int deleteBoardDB(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			int rows=0;
			try {
				con=getConnection();
				
				String sql="delete from sboard where num=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rows=pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("[에러]deleteBoardDB() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt);
			}
			return rows;
		}
		
		//상품문의 게시판의 미답변 게시글만 출력메소드 (페이징x 검색x)
		public List<SboardDTO> selectAnswerNull() {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<SboardDTO> boardList=new ArrayList<SboardDTO>();
			try {
				con=getConnection();

				String sql="select * from sboard where category=3 and status!=9 and answer is null";
				pstmt=con.prepareStatement(sql);

				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					SboardDTO board=new SboardDTO();
					board.setNum(rs.getInt("num"));
					board.setCategory(rs.getString("category"));
					board.setId(rs.getString("id"));
					board.setWriter(rs.getString("writer"));
					board.setItemnum(rs.getInt("itemnum"));
					board.setGrade(rs.getString("grade"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getString("regdate"));
					board.setImg(rs.getString("img"));
					board.setAnswer(rs.getString("answer"));
					board.setStatus(rs.getInt("status"));
			
					boardList.add(board);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectAnswerNull() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardList;
		}
		
		public List<SboardDTO> selectQA(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<SboardDTO> boardList=new ArrayList<SboardDTO>();
			try {
				con=getConnection();

				String sql="select * from sboard where category=3 and status!=9 and itemnum=? order by num";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs=pstmt.executeQuery();
				
				
				while(rs.next()) {
					SboardDTO board=new SboardDTO();
					board.setNum(rs.getInt("num"));
					board.setCategory(rs.getString("category"));
					board.setId(rs.getString("id"));
					board.setWriter(rs.getString("writer"));
					board.setItemnum(rs.getInt("itemnum"));
					board.setGrade(rs.getString("grade"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getString("regdate"));
					board.setImg(rs.getString("img"));
					board.setAnswer(rs.getString("answer"));
					board.setStatus(rs.getInt("status"));
			
					boardList.add(board);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectQA() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardList;
		}
		
		public List<SboardDTO> selectRV(int num) {
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<SboardDTO> boardList=new ArrayList<SboardDTO>();
			try {
				con=getConnection();

				String sql="select * from sboard where category=2 and status!=9 and itemnum=? order by num";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs=pstmt.executeQuery();
				
				
				while(rs.next()) {
					SboardDTO board=new SboardDTO();
					board.setNum(rs.getInt("num"));
					board.setCategory(rs.getString("category"));
					board.setId(rs.getString("id"));
					board.setWriter(rs.getString("writer"));
					board.setItemnum(rs.getInt("itemnum"));
					board.setGrade(rs.getString("grade"));
					board.setTitle(rs.getString("title"));
					board.setContent(rs.getString("content"));
					board.setRegdate(rs.getString("regdate"));
					board.setImg(rs.getString("img"));
					board.setAnswer(rs.getString("answer"));
					board.setStatus(rs.getInt("status"));
			
					boardList.add(board);
				}
			} catch (SQLException e) {
				System.out.println("[에러]selectQA() 메소드의 SQL 오류 = "+e.getMessage());
			} finally {
				close(con, pstmt, rs);
			}
			return boardList;
		}
	

}
