package catshap.butler.bean;

import java.sql.Timestamp;

public class MyOrderProduct {

	private Timestamp ordDate; // 주문일시
	private int ordNo; // 주문번호
	private String ordDescript; // 상품명
	private int ordProdAmt; // 수량
	private int ordProdPrice; // 가격
	private String delStatus; // 배송상태

	public MyOrderProduct() {
	}

	public MyOrderProduct(Timestamp ordDate, int ordNo, String ordDescript, int ordProdAmt, int ordProdPrice,
			String delStatus) {
		super();
		this.ordDate = ordDate;
		this.ordNo = ordNo;
		this.ordDescript = ordDescript;
		this.ordProdAmt = ordProdAmt;
		this.ordProdPrice = ordProdPrice;
		this.delStatus = delStatus;
	}

	public Timestamp getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(Timestamp ordDate) {
		this.ordDate = ordDate;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}

	public String getOrdDescript() {
		return ordDescript;
	}

	public void setOrdDescript(String ordDescript) {
		this.ordDescript = ordDescript;
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

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "MyOrderProduct [ordDate=" + ordDate + ", ordNo=" + ordNo + ", ordDescript=" + ordDescript
				+ ", ordProdAmt=" + ordProdAmt + ", ordProdPrice=" + ordProdPrice + ", delStatus=" + delStatus + "]";
	}

}
