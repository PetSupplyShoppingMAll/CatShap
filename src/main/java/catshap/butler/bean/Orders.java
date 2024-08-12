package catshap.butler.bean;

import java.sql.Timestamp;

public class Orders {

	private int ordNo; // 주문번호
	private int userNo; // 회원번호
	private Timestamp ordDate; // 주문일시
	private int ordTotalPrice; // 총주문금액
	private String ordStatus; // 주문상태

	public Orders() {
	}

	public Orders(int ordNo, int userNo, Timestamp ordDate, int ordTotalPrice, String ordStatus) {
		super();
		this.ordNo = ordNo;
		this.userNo = userNo;
		this.ordDate = ordDate;
		this.ordTotalPrice = ordTotalPrice;
		this.ordStatus = ordStatus;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Timestamp getOrdDate() {
		return ordDate;
	}

	public void setOrdDate(Timestamp ordDate) {
		this.ordDate = ordDate;
	}

	public int getOrdTotalPrice() {
		return ordTotalPrice;
	}

	public void setOrdTotalPrice(int ordTotalPrice) {
		this.ordTotalPrice = ordTotalPrice;
	}

	public String getOrdStatus() {
		return ordStatus;
	}

	public void setOrdStatus(String ordStatus) {
		this.ordStatus = ordStatus;
	}

	@Override
	public String toString() {
		return "Orders [ordNo=" + ordNo + ", userNo=" + userNo + ", ordDate=" + ordDate + ", ordTotalPrice="
				+ ordTotalPrice + ", ordStatus=" + ordStatus + "]";
	}

}
