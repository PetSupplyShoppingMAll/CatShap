package catshap.butler.bean;

public class Delivery {

	private int delNo; // 배송번호
	private int ordNo; // 주문번호
	private String delMailAddress; // 우편번호
	private String delAddress; // 주소
	private String delDetailAddress; // 상세주소
	private String delRecipient; // 수령자이름
	private String delRecPhone; // 수령자 전화번호
	private String delRequest; // 요청사항
	private String delStatus; // 배송상태

	public Delivery() {
	}

	public Delivery(int delNo, int ordNo, String delMailAddress, String delAddress, String delDetailAddress,
			String delRecipient, String delRecPhone, String delRequest, String delStatus) {
		super();
		this.delNo = delNo;
		this.ordNo = ordNo;
		this.delMailAddress = delMailAddress;
		this.delAddress = delAddress;
		this.delDetailAddress = delDetailAddress;
		this.delRecipient = delRecipient;
		this.delRecPhone = delRecPhone;
		this.delRequest = delRequest;
		this.delStatus = delStatus;
	}

	public int getDelNo() {
		return delNo;
	}

	public void setDelNo(int delNo) {
		this.delNo = delNo;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}

	public String getDelMailAddress() {
		return delMailAddress;
	}

	public void setDelMailAddress(String delMailAddress) {
		this.delMailAddress = delMailAddress;
	}

	public String getDelAddress() {
		return delAddress;
	}

	public void setDelAddress(String delAddress) {
		this.delAddress = delAddress;
	}

	public String getDelDetailAddress() {
		return delDetailAddress;
	}

	public void setDelDetailAddress(String delDetailAddress) {
		this.delDetailAddress = delDetailAddress;
	}

	public String getDelRecipient() {
		return delRecipient;
	}

	public void setDelRecipient(String delRecipient) {
		this.delRecipient = delRecipient;
	}

	public String getDelRecPhone() {
		return delRecPhone;
	}

	public void setDelRecPhone(String delRecPhone) {
		this.delRecPhone = delRecPhone;
	}

	public String getDelRequest() {
		return delRequest;
	}

	public void setDelRequest(String delRequest) {
		this.delRequest = delRequest;
	}

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "Delivery [delNo=" + delNo + ", ordNo=" + ordNo + ", delMailAddress=" + delMailAddress + ", delAddress="
				+ delAddress + ", delDetailAddress=" + delDetailAddress + ", delRecipient=" + delRecipient
				+ ", delRecPhone=" + delRecPhone + ", delRequest=" + delRequest + ", delStatus=" + delStatus + "]";
	}

}
