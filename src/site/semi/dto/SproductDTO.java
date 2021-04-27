package site.semi.dto;
/*
create table sproduct(num number(4) primary key,code varchar2(20),name varchar2(50),image varchar2(30),detail varchar2(300),color varchar2(10),qty number(8),price number(8),add_date date);

create sequence sproduct_seq;  
 
이름       널?       유형            
-------- -------- ------------- 
NUM      NOT NULL NUMBER(4)     
CODE              VARCHAR2(20)  
NAME              VARCHAR2(50)  
IMAGE             VARCHAR2(30)  
DETAIL            VARCHAR2(300) 
COLOR             VARCHAR2(10)  
QTY               NUMBER(8)     
PRICE             NUMBER(8)     
ADD_DATE          DATE      
   
 */
public class SproductDTO {
	private int Num;
	private String Code;
	private String Name;
	private String Image;
	private String Detail;
	private String Color;
	private int Qty;
	private int Price;
	private String Add_Date;
	
	public SproductDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return Num;
	}

	public void setNum(int num) {
		Num = num;
	}

	public String getCode() {
		return Code;
	}

	public void setCode(String code) {
		Code = code;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public String getDetail() {
		return Detail;
	}

	public void setDetail(String detail) {
		Detail = detail;
	}

	public String getColor() {
		return Color;
	}

	public void setColor(String color) {
		Color = color;
	}

	public int getQty() {
		return Qty;
	}

	public void setQty(int qty) {
		Qty = qty;
	}

	public int getPrice() {
		return Price;
	}

	public void setPrice(int price) {
		Price = price;
	}

	public String getAdd_Date() {
		return Add_Date;
	}

	public void setAdd_Date(String add_date) {
		this.Add_Date = add_date;
	}
	
}







