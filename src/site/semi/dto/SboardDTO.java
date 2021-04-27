package site.semi.dto;

/*
이름       널?       유형             
-------- -------- -------------- 
NUM      NOT NULL NUMBER(10)     
CATEGORY NOT NULL VARCHAR2(50)   
ID       NOT NULL VARCHAR2(50)   
WRITER            VARCHAR2(50)   
ITEMNUM           NUMBER(10)     
GRADE             VARCHAR2(50)   
TITLE    NOT NULL VARCHAR2(200)  
CONTENT  NOT NULL VARCHAR2(2000) 
REGDATE  NOT NULL DATE           
IMG               VARCHAR2(200)  
ANSWER            VARCHAR2(2000) 
STATUS            NUMBER(2)     
*/
public class SboardDTO {
	private int num;
	private String category;
	private String id;
	private String writer;
	private int itemnum;
	private String grade;
	private String title;
	private String content;
	private String regdate;
	private String img;
	private String answer;
	private int status;
	
	public SboardDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getItemnum() {
		return itemnum;
	}

	public void setItemnum(int itemnum) {
		this.itemnum = itemnum;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
}
