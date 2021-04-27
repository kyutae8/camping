package site.semi.dto;
/*
이름         널?       유형            
---------- -------- ------------- 
ID         NOT NULL VARCHAR2(20)  
PASSWD              VARCHAR2(200) 
NAME                VARCHAR2(20)  
BIRTHDAY            VARCHAR2(50)  
EMAIL               VARCHAR2(100) 
MOBILE              VARCHAR2(20)  
ZIPCODE             VARCHAR2(10)  
ADDRESS1            VARCHAR2(200) 
ADDRESS2            VARCHAR2(50)  
ADDRESS3            VARCHAR2(50)  
JOIN_DATE           DATE          
LAST_LOGIN          DATE          
STATUS              NUMBER(4)     
*/
public class SmemberDTO {
	private String id;
	private String passwd;
	private String name;
	private String birthday;
	private String email;
	private String mobile;
	private String zipcode;
	private String address1;
	private String address2;
	private String address3;
	private String joinDate;
	private String lastLogin;
	private int status;
	
	public SmemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}


}
