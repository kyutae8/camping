package site.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.semi.dto.SmemberDTO;



public class SmemberDAO extends JdbcDAO {
	private static SmemberDAO _dao;
	
	public SmemberDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new SmemberDAO();		
	}
	
	public static SmemberDAO getDAO() {
		return _dao; 
	}
	
	public SmemberDTO selectIdMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		SmemberDTO smember=null;
		try {
			con=getConnection();
			
			String sql="select * from smember where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
				
			if(rs.next()) {
				smember=new SmemberDTO(); 
				smember.setId(rs.getString("id"));
				smember.setPasswd(rs.getString("passwd"));
				smember.setName(rs.getString("name"));
				smember.setBirthday(rs.getString("birthday"));
				smember.setEmail(rs.getString("email"));
				smember.setMobile(rs.getString("mobile"));
				smember.setZipcode(rs.getString("zipcode"));
				smember.setAddress1(rs.getString("address1"));
				smember.setAddress2(rs.getString("address2"));
				smember.setAddress3(rs.getString("address3"));
				smember.setJoinDate(rs.getString("join_date"));
				smember.setLastLogin(rs.getString("last_login"));
				smember.setStatus(rs.getInt("status"));
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectIdsMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return smember;
	}
	
	//회원정보를 전달받아 MEMBER 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
	// => 아이디, 비밀번호, 이름, 이메일, 전화번호, 우편번호, 기본주소, 상세주소는 입력값을 이용하여 저장
	// => 회원가입일 : 현재(sysdate), 마지막로그인 : null, 회원상태 : 1(일반회원)
	public int insertMember(SmemberDTO smember) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="insert into smember values(?,?,?,?,?,?,?,?,?,?,sysdate,null,1)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, smember.getId());
			pstmt.setString(2, smember.getPasswd());
			pstmt.setString(3, smember.getName());
			pstmt.setString(4, smember.getBirthday());
			pstmt.setString(5, smember.getEmail()); 
			pstmt.setString(6, smember.getMobile()); 
			pstmt.setString(7, smember.getZipcode());
			pstmt.setString(8, smember.getAddress1());
			pstmt.setString(9, smember.getAddress2());
			pstmt.setString(10, smember.getAddress3());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[에러]selectIdsMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 해당 회원의 마지막 로그인 날짜를 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateLastLogin(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update smember set last_login=sysdate where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rows=pstmt.executeUpdate();	
		} catch (SQLException e) {
			System.out.println("[에러]selectIdsMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}


	
	//회원정보를 전달받아 MEMBER 테이블에 저장된 행을 변경하고 변경행의 갯수를 반환하는 메소드
	public int updateMember(SmemberDTO smember) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update smember set passwd=?,name=?,email=?,mobile=?,zipcode=?,address1=?,address2=?,address3=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, smember.getPasswd());
			pstmt.setString(2, smember.getName());
			pstmt.setString(3, smember.getEmail());
			pstmt.setString(4, smember.getMobile());
			pstmt.setString(5, smember.getZipcode());
			pstmt.setString(6, smember.getAddress1());
			pstmt.setString(7, smember.getAddress2());
			pstmt.setString(8, smember.getAddress3());
			pstmt.setString(9, smember.getId()); 
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]updatesMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	//아이디를 전달받아 MEMBER 테이블에 저장된 행을 삭제하고 삭제행의 갯수를 반환하는 메소드
	public int deleteMember(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="delete from smember where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]deletesMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	//MEMBER 테이블에 저장된 모든 회원정보를 검색하여 반환하는 메소드
	public List<SmemberDTO> selectAllMemberList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<SmemberDTO> smemberList=new ArrayList<SmemberDTO>();
		try {
			con=getConnection();
			
			String sql="select * from smember order by id";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				SmemberDTO smember=new SmemberDTO();
				smember.setId(rs.getString("id"));
				smember.setPasswd(rs.getString("passwd"));
				smember.setName(rs.getString("name"));
				smember.setEmail(rs.getString("email"));
				smember.setMobile(rs.getString("mobile"));
				smember.setZipcode(rs.getString("zipcode"));
				smember.setAddress1(rs.getString("address1"));
				smember.setAddress2(rs.getString("address2"));
				smember.setAddress3(rs.getString("address3"));
				smember.setJoinDate(rs.getString("join_date"));
				smember.setLastLogin(rs.getString("last_login"));
				smember.setStatus(rs.getInt("status"));
				smemberList.add(smember);
			}
		} catch (SQLException e) {
			System.out.println("[에러]selectAllMemberList() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return smemberList; 
	}
	
	//아이디와 상태를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 상태를 변경하고 변경행의 
	//갯수를 반환하는 메소드
	public int updateStatus(String id,int status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update smember set status=? where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, status);
			pstmt.setString(2, id);
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]updateStatus() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	public String findIdMember(String email, String birthday) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String id=null;
		try {
			con=getConnection();
			
			String sql="select id from smember where email=? and birthday=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, birthday);
			
			rs=pstmt.executeQuery();
				
			if(rs.next()) {
				id=rs.getString("id");
	
			} 
		} catch (SQLException e) {
			System.out.println("[에러]findIdMember() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return id;
	}
	
	
	public String tempPasswd(SmemberDTO smember) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String passwd=null;
		try {
			con=getConnection();
			
			String sql="update smember set passwd=? where id=? and email=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, smember.getPasswd());
			pstmt.setString(2, smember.getId());
			pstmt.setString(3, smember.getEmail());
			
			rs=pstmt.executeQuery();
				
			if(rs.next()) {
				passwd=rs.getString("passwd");
	
			} 
		} catch (SQLException e) {
			System.out.println("[에러]tempPasswd() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return passwd;
	}
	
	
	public List<SmemberDTO> scL(String category){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<SmemberDTO> smemberList=new ArrayList<SmemberDTO>();
		try {
			con=getConnection();
			
			if(category.equals("ID")) {
				String sql="select * from smember order by id desc";
				pstmt=con.prepareStatement(sql);
			} else if(category.equals("NAME")) {
				String sql="select * from smember order by name desc";
				pstmt=con.prepareStatement(sql);
			} else if(category.equals("JOIN")) {
				String sql="select * from smember order by JOIN_DATE desc";
				pstmt=con.prepareStatement(sql);
			} else if(category.equals("LOGIN")) {
				String sql="select * from smember order by LAST_LOGIN desc";
				pstmt=con.prepareStatement(sql);
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				SmemberDTO smember=new SmemberDTO();
				smember.setId(rs.getString("id"));
				smember.setName(rs.getString("name"));
				smember.setEmail(rs.getString("email"));
				smember.setMobile(rs.getString("mobile"));
				smember.setZipcode(rs.getString("zipcode"));
				smember.setAddress1(rs.getString("address1"));
				smember.setAddress2(rs.getString("address2"));
				smember.setAddress3(rs.getString("address3"));
				smember.setJoinDate(rs.getString("join_date"));
				smember.setLastLogin(rs.getString("last_login"));
				smember.setStatus(rs.getInt("status"));
				smemberList.add(smember);
			}
		} catch (SQLException e) {
			System.out.println("[에러]scL 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return smemberList;
		
	}

	public int udstatus(String id,int status) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update smember set status=2 where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rows=pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("[에러]udstatus() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//페이징처리
	public int sbc(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			//메소드의 매개변수에 저장값에 따른 다른 SQL 명령을 전달하여 실행되도록 설정 - 동적 SQL 
			if(keyword.equals("")) {//검색 기능을 사용하지 않을 경우
				String sql="select count(*) from smember";
				pstmt=con.prepareStatement(sql);
			} else {//검색 기능을 사용한 경우
				String sql="select count(*) from smember where "+search+" like '%'||?||'%' ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[에러]sbc() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	//페이징처리
	public List<SmemberDTO> sbl(int startRow, int endRow, String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<SmemberDTO> memberList=new ArrayList<SmemberDTO>();
		try {
			con=getConnection();
			
			if(keyword.equals("")) {
				String sql="select * from(select rownum rn,temp.* from (select * "
						+ "from smember order by name) temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql="select * from(select rownum rn,temp.* from (select * "
						+ "from smember where "+search+" like '%'||?||'%' and status!=9 order "
						+ "by name) temp) where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				SmemberDTO smember=new SmemberDTO();
				smember.setId(rs.getString("id"));
				smember.setName(rs.getString("name"));
				smember.setEmail(rs.getString("email"));
				smember.setMobile(rs.getString("mobile"));
				smember.setZipcode(rs.getString("zipcode"));
				smember.setAddress1(rs.getString("address1"));
				smember.setAddress2(rs.getString("address2"));
				smember.setAddress3(rs.getString("address3"));
				smember.setJoinDate(rs.getString("join_date"));
				smember.setLastLogin(rs.getString("last_login"));
				smember.setStatus(rs.getInt("status"));
				memberList.add(smember); 
			}
		} catch (SQLException e) {
			System.out.println("[에러]sbl() 메소드의 SQL 오류 = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return memberList;
	}
}





	
	
	
	
	

