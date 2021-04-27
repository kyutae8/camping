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
			System.out.println("[����]selectIdsMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return smember;
	}
	
	//ȸ�������� ���޹޾� MEMBER ���̺��� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
	// => ���̵�, ��й�ȣ, �̸�, �̸���, ��ȭ��ȣ, ������ȣ, �⺻�ּ�, ���ּҴ� �Է°��� �̿��Ͽ� ����
	// => ȸ�������� : ����(sysdate), �������α��� : null, ȸ������ : 1(�Ϲ�ȸ��)
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
			System.out.println("[����]selectIdsMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	
	//���̵� ���޹޾� MEMBER ���̺��� ����� �ش� ȸ���� ������ �α��� ��¥�� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]selectIdsMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}


	
	//ȸ�������� ���޹޾� MEMBER ���̺��� ����� ���� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]updatesMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	//���̵� ���޹޾� MEMBER ���̺��� ����� ���� �����ϰ� �������� ������ ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]deletesMember() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	//MEMBER ���̺��� ����� ��� ȸ�������� �˻��Ͽ� ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]selectAllMemberList() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return smemberList; 
	}
	
	//���̵�� ���¸� ���޹޾� MEMBER ���̺��� ����� �ش� ���̵��� ���¸� �����ϰ� �������� 
	//������ ��ȯ�ϴ� �޼ҵ�
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
			System.out.println("[����]updateStatus() �޼ҵ��� SQL ���� = "+e.getMessage());
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
			System.out.println("[����]findIdMember() �޼ҵ��� SQL ���� = "+e.getMessage());
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
			System.out.println("[����]tempPasswd() �޼ҵ��� SQL ���� = "+e.getMessage());
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
			System.out.println("[����]scL �޼ҵ��� SQL ���� = "+e.getMessage());
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
			System.out.println("[����]udstatus() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//����¡ó��
	public int sbc(String search, String keyword) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			con=getConnection();
			
			//�޼ҵ��� �Ű������� ���尪�� ���� �ٸ� SQL ������ �����Ͽ� ����ǵ��� ���� - ���� SQL 
			if(keyword.equals("")) {//�˻� ����� ������� ���� ���
				String sql="select count(*) from smember";
				pstmt=con.prepareStatement(sql);
			} else {//�˻� ����� ����� ���
				String sql="select count(*) from smember where "+search+" like '%'||?||'%' ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("[����]sbc() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	//����¡ó��
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
			System.out.println("[����]sbl() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt, rs);
		}
		return memberList;
	}
}





	
	
	
	
	
