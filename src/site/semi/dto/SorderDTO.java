package site.semi.dto;

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
MESSAGE          VARCHAR2(50)  
ONAME             VARCHAR2(50)  
OPHONE            VARCHAR2(20)  
ADDRESS1          VARCHAR2(100) 
ADDRESS2          VARCHAR2(100) 
ADDRESS3          VARCHAR2(100) 
ZIPCODE           VARCHAR2(10)  
ODATE             DATE  
 */

public class SorderDTO {
	private int onum;
	private int num;
	private int  qty;
	private int price;
	private int total_price;
	private int status;
	private String name;
	private String color;
	private String message;
	private String oname;
	private String ophone;
	private String address1;
	private String address2;
	private String address3;
	private String zipcode;
	private String odate;
	private String oid;
	
	public SorderDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOphone() {
		return ophone;
	}

	public void setOphone(String ophone) {
		this.ophone = ophone;
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

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}
	
}
	
	
	
	