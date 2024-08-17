package catshap.butler.bean;

import java.sql.Timestamp;

public class ReviewView {
	
	private int prodNo;
    private int userNo;
    private String unick;
    private int reviewNo;
    private String revTitle;
    private String revText;
    private Timestamp revRegDate;
    private int revScore;
    private String prodTitleName;
    private String prodImgPath;
    
    public ReviewView() {
    	
    }




	ReviewView(int prodNo, int userNo, String unick, int reviewNo, String revTitle, String revText,
			Timestamp revRegDate, int revScore, String prodTitleName, String prodImgPath) {
		super();
		this.prodNo = prodNo;
		this.userNo = userNo;
		this.unick = unick;
		this.reviewNo = reviewNo;
		this.revTitle = revTitle;
		this.revText = revText;
		this.revRegDate = revRegDate;
		this.revScore = revScore;
		this.prodTitleName = prodTitleName;
		this.prodImgPath = prodImgPath;
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

	public String getUnick() {
		return unick;
	}

	public void setUnick(String unick) {
		this.unick = unick;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getRevTitle() {
		return revTitle;
	}

	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}

	public String getRevText() {
		return revText;
	}

	public void setRevText(String revText) {
		this.revText = revText;
	}

	public Timestamp getRevRegDate() {
		return revRegDate;
	}

	public void setRevRegDate(Timestamp revRegDate) {
		this.revRegDate = revRegDate;
	}

	public int getRevScore() {
		return revScore;
	}

	public void setRevScore(int revScore) {
		this.revScore = revScore;
	}


	public String getProdTitleName() {
		return prodTitleName;
	}



	public void setProdTitleName(String prodTitleName) {
		this.prodTitleName = prodTitleName;
	}




	@Override
	public String toString() {
		return "ReviewView [prodNo=" + prodNo + ", userNo=" + userNo + ", unick=" + unick + ", reviewNo=" + reviewNo
				+ ", revTitle=" + revTitle + ", revText=" + revText + ", revRegDate=" + revRegDate + ", revScore="
				+ revScore + ", prodTitleName=" + prodTitleName + ", prodImgPath=" + prodImgPath + "]";
	}

	
    
    
}
