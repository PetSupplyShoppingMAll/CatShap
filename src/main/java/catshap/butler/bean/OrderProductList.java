package catshap.butler.bean;

public class OrderProductList {

	private int prodNo;
	private String prodTitleName;
	private int ordProdAmt;
	private int ordProdPrice;
	private int ordTotalPrice;
	private String prodImgPath;

	public OrderProductList() {
	}

	public OrderProductList(int prodNo, String prodTitleName, int ordProdAmt, int ordProdPrice, int ordTotalPrice,
			String prodImgPath) {
		super();
		this.prodNo = prodNo;
		this.prodTitleName = prodTitleName;
		this.ordProdAmt = ordProdAmt;
		this.ordProdPrice = ordProdPrice;
		this.ordTotalPrice = ordTotalPrice;
		this.prodImgPath = prodImgPath;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdTitleName() {
		return prodTitleName;
	}

	public void setProdTitleName(String prodTitleName) {
		this.prodTitleName = prodTitleName;
	}

	public int getOrdProdAmt() {
		return ordProdAmt;
	}

	public void setOrdProdAmt(int ordProdAmt) {
		this.ordProdAmt = ordProdAmt;
	}

	public int getOrdProdPrice() {
		return ordProdPrice;
	}

	public void setOrdProdPrice(int ordProdPrice) {
		this.ordProdPrice = ordProdPrice;
	}

	public int getOrdTotalPrice() {
		return ordTotalPrice;
	}

	public void setOrdTotalPrice(int ordTotalPrice) {
		this.ordTotalPrice = ordTotalPrice;
	}

	public String getProdImgPath() {
		return prodImgPath;
	}

	public void setProdImgPath(String prodImgPath) {
		this.prodImgPath = prodImgPath;
	}

	@Override
	public String toString() {
		return "OrderProductList [prodNo=" + prodNo + ", prodTitleName=" + prodTitleName + ", ordProdAmt=" + ordProdAmt
				+ ", ordProdPrice=" + ordProdPrice + ", ordTotalPrice=" + ordTotalPrice + ", prodImgPath=" + prodImgPath
				+ "]";
	}

}
