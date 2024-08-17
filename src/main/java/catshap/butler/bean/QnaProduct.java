package catshap.butler.bean;

public class QnaProduct {
	private int qnaNo;
	private int prodNo;
	private String prodName;
	private String prodImgPath;
	private int prodPrice;

	public QnaProduct() {
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getProdImgPath() {
		return prodImgPath;
	}

	public void setProdImgPath(String prodImgPath) {
		this.prodImgPath = prodImgPath;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	@Override
	public String toString() {
		return "QnaProduct [prodNo=" + prodNo + ", prodName=" + prodName + ", prodImgPath=" + prodImgPath + "]";
	}

	public QnaProduct(int prodNo, String prodName, String prodImgPath) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.prodImgPath = prodImgPath;
	}
}
