package catshap.butler.bean;

public class BasketOrder {
    private int userNo;
    private int ordTotalPrice;
    private String ordStatus;

    public BasketOrder() {
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
    
}



