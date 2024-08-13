package catshap.butler.bean;

public class OrderProduct {

	private int ordProdNo; // 상품주문번호
	private int prodNo; // 상품번호
	private int ordNo; // 주문번호
	private int ordProdAmt; // 수량
	private int ordProdPrice; // 가격

	public OrderProduct() {
	}

	public OrderProduct(int ordProdNo, int prodNo, int ordNo, int ordProdAmt, int ordProdPrice) {
		super();
		this.ordProdNo = ordProdNo;
		this.prodNo = prodNo;
		this.ordNo = ordNo;
		this.ordProdAmt = ordProdAmt;
		this.ordProdPrice = ordProdPrice;
	}

	public int getOrdProdNo() {
		return ordProdNo;
	}

	public void setOrdProdNo(int ordProdNo) {
		this.ordProdNo = ordProdNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
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

	@Override
	public String toString() {
		return "OrderProduct [ordProdNo=" + ordProdNo + ", prodNo=" + prodNo + ", ordNo=" + ordNo + ", ordProdAmt="
				+ ordProdAmt + ", ordProdPrice=" + ordProdPrice + "]";
	}

}
