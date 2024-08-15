package catshap.butler.bean;

import java.sql.Timestamp;

public class Pay {

	private int payNo; // 구매번호
	private int ordNo; // 주문번호
	private Timestamp payDate; // 구매일시
	private String payStatus; // 구매상태
	private String payCard; // 카드사
	private String payMent; // 할부

	public Pay() {
	}

	public Pay(int payNo, int ordNo, Timestamp payDate, String payStatus, String payCard, String payMent) {
		super();
		this.payNo = payNo;
		this.ordNo = ordNo;
		this.payDate = payDate;
		this.payStatus = payStatus;
		this.payCard = payCard;
		this.payMent = payMent;
	}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}

	public Timestamp getPayDate() {
		return payDate;
	}

	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getPayCard() {
		return payCard;
	}

	public void setPayCard(String payCard) {
		this.payCard = payCard;
	}

	public String getPayMent() {
		return payMent;
	}

	public void setPayMent(String payMent) {
		this.payMent = payMent;
	}

	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", ordNo=" + ordNo + ", payDate=" + payDate + ", payStatus=" + payStatus
				+ ", payCard=" + payCard + ", payMent=" + payMent + "]";
	}

}
