package catshap.butler.bean;

public class Product {

	private int prodNo;
	private String prodDescript; // 상품명
	private int prodCount; // 조회수
	private int revCount; // 리뷰개수
	private int prodPrice; // 상품가격
	private String prdCatName; // 카테고리이름
	private String prodImgPath;

	public Product() {
	}

	public Product(int prodNo, String prodDescript, int prodCount, int revCount, int prodPrice, String prdCatName,
			String prodImgPath) {
		super();
		this.prodNo = prodNo;
		this.prodDescript = prodDescript;
		this.prodCount = prodCount;
		this.revCount = revCount;
		this.prodPrice = prodPrice;
		this.prdCatName = prdCatName;
		this.prodImgPath = prodImgPath;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdDescript() {
		return prodDescript;
	}

	public void setProdDescript(String prodDescript) {
		this.prodDescript = prodDescript;
	}

	public int getProdCount() {
		return prodCount;
	}

	public void setProdCount(int prodCount) {
		this.prodCount = prodCount;
	}

	public int getRevCount() {
		return revCount;
	}

	public void setRevCount(int revCount) {
		this.revCount = revCount;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public String getPrdCatName() {
		return prdCatName;
	}

	public void setPrdCatName(String prdCatName) {
		this.prdCatName = prdCatName;
	}

	public String getProdImgPath() {
		return prodImgPath;
	}

	public void setProdImgPath(String prodImgPath) {
		this.prodImgPath = prodImgPath;
	}

	@Override
	public String toString() {
		return "Product [prodNo=" + prodNo + ", prodDescript=" + prodDescript + ", prodCount=" + prodCount
				+ ", revCount=" + revCount + ", prodPrice=" + prodPrice + ", prdCatName=" + prdCatName
				+ ", prodImgPath=" + prodImgPath + "]";
	}

}
