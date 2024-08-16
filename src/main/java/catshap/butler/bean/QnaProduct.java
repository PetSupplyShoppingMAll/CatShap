package catshap.butler.bean;

public class QnaProduct {
	private int prodNo;
	private String prodName;

	public QnaProduct() {
	}

	public QnaProduct(int prodNo, String prodName) {
		this.prodNo = prodNo;
		this.prodName = prodName;
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

	@Override
	public String toString() {
		return "Product{" + "prodNo=" + prodNo + ", prodName='" + prodName + '\'' + '}';
	}
}