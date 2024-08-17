package catshap.butler.bean;

import java.sql.Timestamp;

public class UserQnA {

	private int qnaNo;
	private int prodNo;
	private int userNo;
	private int qnaCatNo;
	private String prodTitleName;
	private String prodImgPath;
	private String unick;
	private String qnaTitle;
	private String qnaText;
	private String qnaCatName;
	private Timestamp qnaRegdate;

	public UserQnA() {
		// TODO Auto-generated constructor stub
	}

	UserQnA(int qnaNo, int prodNo, int userNo, int qnaCatNo, String prodTitleName, String prodImgPath, String unick,
			String qnaTitle, String qnaText, String qnaCatName, Timestamp qnaRegdate) {
		super();
		this.qnaNo = qnaNo;
		this.prodNo = prodNo;
		this.userNo = userNo;
		this.qnaCatNo = qnaCatNo;
		this.prodTitleName = prodTitleName;
		this.prodImgPath = prodImgPath;
		this.unick = unick;
		this.qnaTitle = qnaTitle;
		this.qnaText = qnaText;
		this.qnaCatName = qnaCatName;
		this.qnaRegdate = qnaRegdate;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getQnaCatNo() {
		return qnaCatNo;
	}

	public void setQnaCatNo(int qnaCatNo) {
		this.qnaCatNo = qnaCatNo;
	}

	public String getProdTitleName() {
		return prodTitleName;
	}

	public void setProdTitleName(String prodTitleName) {
		this.prodTitleName = prodTitleName;
	}

	public String getUnick() {
		return unick;
	}

	public void setUnick(String unick) {
		this.unick = unick;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaText() {
		return qnaText;
	}

	public void setQnaText(String qnaText) {
		this.qnaText = qnaText;
	}

	public String getQnaCatName() {
		return qnaCatName;
	}

	public void setQnaCatName(String qnaCatName) {
		this.qnaCatName = qnaCatName;
	}

	public Timestamp getQnaRegdate() {
		return qnaRegdate;
	}

	public void setQnaRegdate(Timestamp qnaRegdate) {
		this.qnaRegdate = qnaRegdate;
	}

	public String getProdImgPath() {
		return prodImgPath;
	}

	public void setProdImgPath(String prodImgPath) {
		this.prodImgPath = prodImgPath;
	}

	@Override
	public String toString() {
		return "UserQnA [qnaNo=" + qnaNo + ", prodNo=" + prodNo + ", userNo=" + userNo + ", qnaCatNo=" + qnaCatNo
				+ ", prodTitleName=" + prodTitleName + ", prodImgPath=" + prodImgPath + ", unick=" + unick
				+ ", qnaTitle=" + qnaTitle + ", qnaText=" + qnaText + ", qnaCatName=" + qnaCatName + ", qnaRegdate="
				+ qnaRegdate + "]";
	}

}
